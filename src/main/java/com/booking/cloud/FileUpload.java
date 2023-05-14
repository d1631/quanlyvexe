package com.booking.cloud;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;

public class FileUpload {

	public static Cloudinary cloudinaryConfig() {
        Cloudinary cloudinary = null;
        Map config = new HashMap();
        config.put("cloud_name", "vietnam-national-university-of-agricuture");
        config.put("api_key", "836363678844323");
        config.put("api_secret", "MCXWu4LWRWPvao8fA6xi5WPgKH4");
        cloudinary = new Cloudinary(config);
        return cloudinary;
    }
	
	public static String upload(MultipartFile multifile) {
		Cloudinary cloudinaryConfig = cloudinaryConfig();
		File file = null;
		try {
			file = convertMultiPartToFile(multifile);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map uploadResult;
		Map uploadParams = new HashMap<String, String>();
		uploadParams.put("resource_type", "auto");
		try {
			
			uploadResult = cloudinaryConfig.uploader().upload(file, uploadParams);
			return uploadResult.get("url").toString();
		} catch (IOException e) {
			e.printStackTrace();
		}   
		return null;
	}
	
	private static File convertMultiPartToFile(MultipartFile file ) throws IOException {
	    File convFile = new File( file.getOriginalFilename() );
	    FileOutputStream fos = new FileOutputStream( convFile );
	    fos.write( file.getBytes() );
	    fos.close();
	    return convFile;
	}
	
}
