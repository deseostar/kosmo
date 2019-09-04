package com.spring.helper.method.method;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import org.springframework.stereotype.Component;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

@Component
public class QRImage {


   @Resource(name="chaeUploadPath")
   String chaeDir;
   @Resource(name="songUploadPath")
   String songDir;
   
   // 이미지 경로 넘겨 받기
   public String cropImage(String filePath, String qrName) throws Exception{
      BufferedImage originalImage = ImageIO.read(new File(filePath));
      //x110 y110 부터 380x380픽셀 잘라내기
      
      
      int height = originalImage.getHeight();
      int width = originalImage.getWidth();
      if (height == 900 && width == 600) {
	      System.out.println(height);
	      System.out.println(width);
	      BufferedImage SubImgage = originalImage.getSubimage(110, 110, 380, 380);
	      //잘라내고 난 이미지 경로
	      //String realDir = chaeDir+"/board/onedayclass/";
	      String realDir = songDir+"/board/onedayclass/"; //시연용 서버 주소로
	      File outputfile = new File(realDir + "new" +qrName);
	      //위의 경로에 잘라낸 이미지 적용
	      ImageIO.write(SubImgage, "jpg", outputfile);
	      
	      //이미지 경로 받기
	      BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(new File(realDir + "new" +qrName)))));
	      //qr 경로 리턴
	      Result qrCodeResult = new MultiFormatReader().decode(binaryBitmap);
	      
	      return qrCodeResult.getText();
	      }
      else {

    	  return "ERROR";
      }
   }
}   


