package ar.edu.uces.progweb2.springmvc.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import ar.edu.uces.progweb2.springmvc.bussinesException.BackendException;

@Controller
public class ImagenController {
	
	@RequestMapping(value = "/guardarImagen", method = RequestMethod.POST)
	public  @ResponseBody Map<String, Object> guardarImagen (@RequestParam("file") CommonsMultipartFile file){
		Map<String, Object> out = new HashMap<String, Object>();
		if (!file.isEmpty()) {
            try {
				out.put("path",this.cargarImagenes(file));
			} catch(BackendException e){
				out.put("error", true);
				out.put("message", "error al guardar la imagen");
			}
			
        }
		return 	out;
	}
	
	private String cargarImagenes (CommonsMultipartFile file) throws BackendException{
		OutputStream os = null;
		long time = System.currentTimeMillis();
		String fileName = time+"-"+file.getOriginalFilename();
		String ruta="/home/jveron/Downloads/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/springmvc/imagen-temporal/"+fileName;
		try{
			os = new BufferedOutputStream(new FileOutputStream(ruta));
			os.write(file.getBytes());
			os.flush();
		} catch (IOException e) {
			throw new BackendException(e);
		} finally {
			if (os!=null) {
				try {
					os.close();
				} catch (IOException e){
					throw new BackendException(e);
				}
			}
		}
		return "/imagen-temporal/"+fileName;
	}
}
