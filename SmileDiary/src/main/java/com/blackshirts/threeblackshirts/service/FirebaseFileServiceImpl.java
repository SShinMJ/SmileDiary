package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.Board;
import com.blackshirts.threeblackshirts.utility.Utility;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.tools.cloudstorage.GcsService;
import com.google.appengine.tools.cloudstorage.GcsServiceFactory;
import com.google.appengine.tools.cloudstorage.RetryParams;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.ReadChannel;
import com.google.cloud.storage.*;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.channels.Channels;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;

@Service
public class FirebaseFileServiceImpl implements FirebaseFileService {

    private static final Logger log = LoggerFactory.getLogger(FirebaseFileServiceImpl.class);

    private Storage storage;
    private StorageOptions storageOptions;
    private String bucketName = "similar-7cd69.appspot.com";
    private final String projectId = "smilediary-7cd69";

    @PostConstruct
    public void initFirebase() throws Exception {
        try {
            ClassPathResource serviceAccount = new ClassPathResource("smilediary-firebase-serviceAccountKey.json");
            this.storageOptions = StorageOptions.newBuilder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream()))
                    .setProjectId(projectId).build();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public String[] uploadFile(MultipartFile multipartFile, Board board) throws IOException {
        //log.debug("bucket name====" + bucketName);
        File file = convertMultiPartToFile(multipartFile); //
        Path filePath = file.toPath();

        String boardFolder = "board/";
        String objectName = generateStorageFileName(multipartFile, board);

        storage = storageOptions.getService();

        BlobId blobId = BlobId.of(bucketName, boardFolder + objectName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
        Blob blob = storage.create(blobInfo, Files.readAllBytes(filePath));

        log.info("File " + filePath + " uploaded to bucket " + bucketName + " as " + objectName);
        return new String[]{"fileUrl", objectName};
    }

    private File convertMultiPartToFile(MultipartFile file) throws IOException {
        File convertedFile = new File(Objects.requireNonNull(file.getOriginalFilename()));
        FileOutputStream fos = new FileOutputStream(convertedFile);
        fos.write(file.getBytes());
        fos.close();
        return convertedFile;
    }

    private String generateStorageFileName(MultipartFile multiPart, Board board) {

        // Utility.getLocalTime() 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
        // user_email
        return board.getBoard_datetime() + "-" + board.getUser_email() + "-" + Objects.requireNonNull(multiPart.getOriginalFilename()).replace(" ", "_");
    }

    public String showImage(Board board, HttpServletRequest request, HttpServletResponse resp) throws IOException {

        String boardFolder = "board/";

        String fileName = getStorageFileName(board);

        log.info("showImage : " + fileName);

//        Storage storage = storageOptions.getService();
//
//        Blob blob = storage.get(BlobId.of(bucketName, boardFolder + fileName));
//
//        BlobId blobId = BlobId.of(bucketName, boardFolder + fileName);
//        BlobKey blobKey = blobId.
//                newBuilder(blobId).build();

        ImagesService imagesService = ImagesServiceFactory.getImagesService();

//        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
//        BlobKey blobKey = blobstoreService.createGsBlobKey(
//                "/gs/" + bucketName + "/" + boardFolder + fileName);
//        blobstoreService.serve(blobKey, resp);

        ServingUrlOptions options = ServingUrlOptions.Builder
                .withGoogleStorageFileName("/gs/" + bucketName + boardFolder + fileName)
                .imageSize(150)
                .crop(true)
                .secureUrl(true);
        String imageURL = imagesService.getServingUrl(options);

        log.info("showImage/imageURL : " + imageURL);
        return imageURL;
    }

    public ResponseEntity<Object> downloadFile(Board board, HttpServletRequest request) throws Exception {

        String fileName = getStorageFileName(board);

        log.info("Firebase Service downloadFile fileName : " + fileName);

        Storage storage = storageOptions.getService();

        String boardFolder = "board/";

        Blob blob = storage.get(BlobId.of(bucketName, boardFolder + fileName));
        ReadChannel reader = blob.reader();
        InputStream inputStream = Channels.newInputStream(reader);
        blob.downloadTo(Paths.get("/Users/jules/deploy/TBS/board/storage/" + fileName));
//        String imageURL = blob.getMediaLink();
//        log.info("DownLoadFile!!!!!! now check image URL?" + imageURL);

        byte[] content = null;
        log.info("File downloaded successfully.");

        content = IOUtils.toByteArray(inputStream);

        final ByteArrayResource byteArrayResource = new ByteArrayResource(content);

        return ResponseEntity
                .ok()
                .contentLength(content.length)
                .header("Content-type", "application/octet-stream")
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                .body(byteArrayResource);

    }

    private static String getStorageFileName(Board board) {
        String storageFileName = "";

        storageFileName = board.getBoard_datetime() + "-" + board.getUser_email() + "-" + board.getBoard_file_name();

        return storageFileName;
    }

    public static String getDownloadFileName(Board board) {
        String downloadFileName = "";

        String dateTime = board.getBoard_datetime() + "";
//        dateTime = dateTime.replace(":","/");
        dateTime = dateTime.replace(":", "-");

        downloadFileName = dateTime + "-" + board.getUser_email() + "-" + board.getBoard_file_name();

        return downloadFileName;
    }
}