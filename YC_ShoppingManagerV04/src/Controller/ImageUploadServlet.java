package Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.security.sasl.digest.FactoryImpl;

import Bean.UserInfo;
import Dao.DAOUserInfo;

/**
 * Servlet implementation class ImageUploadServlet
 */
@WebServlet("/ImageUploadServlet")
public class ImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	 HttpSession session=request.getSession();
	 Object obj=session.getAttribute("CurrentUser");
	 if(obj==null)
	 {
		 System.out.println("没有登录用户");
		 return ;
	 }
	 Bean.UserInfo m=(UserInfo)obj;
	
		response.setContentType("text/html;charset=UTF-8");
		DiskFileItemFactory factory=new DiskFileItemFactory();
		File f=new java.io.File("D:\\images");
//		if(!f.exists()) {
//			f.mkdir();
//		}
		factory.setRepository(f);
		
		ServletFileUpload fileUpload=new ServletFileUpload(factory);
		fileUpload.setHeaderEncoding("UTF-8");
		
		List<FileItem> fileItems;
		try {
			fileItems = fileUpload.parseRequest(request);
			//PrintWriter out=response.getWriter();
			
			
			for(FileItem fi:fileItems)
			{
				if(fi.isFormField())
				{//过滤普通字段
					
				}else {
					String filename=fi.getName();
					System.out.println(filename);
					if(filename!=null && !filename.equals(""))
					{
						filename=filename.substring(filename.lastIndexOf("\\")+1);
						filename=m.getAccount()+"_"+filename;
						//String filePath=this.getServletContext().getRealPath("/UploadImage/"+filename);
						String filePath="D:/UpLoadImage/"+filename;//换一个上传路径，以获得权限
						//写入用来回传的图片名称
						session.setAttribute("ImageFilePath", filePath);
						
						//在服务器上创建同名文件
						File file=new File(filePath);
						file.getParentFile().mkdirs();
						file.createNewFile();
						
						//写入到服务器端
						InputStream in=fi.getInputStream();
						FileOutputStream fos=new FileOutputStream(file);
						byte[] buf=new byte[1024];
						int len;
						while((len=in.read(buf))>0)
						{
							fos.write(buf, 0, len);
						}
						in.close();
						fos.close();
						
						
						//将文件名写入数据库
						DAOUserInfo ado=new DAOUserInfo();
						m.setImageUrl(filePath);
						ado.Modify(m);
						
						request.getRequestDispatcher("SelfModify.jsp").forward(request, response);
					}
				}
			}
			
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
