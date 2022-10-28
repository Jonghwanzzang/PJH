<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="vo.BookVO"%>
<%@page import="dao.BookRepository"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<%!BookVO vo = new BookVO();%>

<%
	BookRepository bookRepository = BookRepository.getinstance();

request.setCharacterEncoding("UTF-8");
String fileuploadPath = "E:\\A_TeachingMaterial\\6.JspSpring\\workspace\\BookMarket\\WebContent\\resources\\images";

DiskFileUpload dfu = new DiskFileUpload();
dfu.setSizeMax(1000000);
dfu.setSizeThreshold(4096);
dfu.setRepositoryPath(fileuploadPath);

List list = dfu.parseRequest(request);

Iterator iter = list.iterator();

String bookId = "";
String name = "";
String unitPrice = "";
String description = "";
String author = "";
String publisher = "";
String category = "";
String unitsInStock = "";
String releaseDate = "";
String condition = "";
String filename = "";
int price = 0;
int stock = 0;

while (iter.hasNext()) {
	FileItem fit = (FileItem) iter.next();

	if (fit.isFormField()) {
		//6-6-1) 파라미터의 이름 가져오기
		if (fit.getFieldName().equals("bookId")) {
	bookId = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("name")) {
	name = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("unitPrice")) {
	unitPrice = fit.getString("UTF-8");
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.parseInt(unitPrice);
		} else if (fit.getFieldName().equals("description")) {
	description = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("author")) {
	author = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("publisher")) {
	publisher = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("category")) {
	category = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("unitsInStock")) {
	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Integer.parseInt(unitsInStock);
	unitsInStock = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("releaseDate")) {
	releaseDate = fit.getString("UTF-8");
		} else if (fit.getFieldName().equals("condition")) {
	condition = fit.getString("UTF-8");
		}
	} else {
		String fileFieldName = fit.getFieldName(); // 요청 파라미터 이름
		String contentType = fit.getContentType(); // 파일 콘텐츠 유형
		long fileSize = fit.getSize(); // 파일 사ㅣㅇ즈
		filename = fit.getName(); // 파일 이름
		filename = filename.substring(filename.lastIndexOf("\\") + 1); // 파일이름

		File file = new File(fileuploadPath + "/" + filename);
		fit.write(file);
	}
}

vo.setBookId(bookId);
vo.setName(name);
vo.setUnitPrice(Integer.parseInt(unitPrice));
vo.setDescription(description);
vo.setAuthor(author);
vo.setPublisher(publisher);
vo.setCategory(category);
vo.setUnitsInStock(Integer.parseInt(unitsInStock));
vo.setReleaseDate(releaseDate);
vo.setCondition(condition);
vo.setFilename(filename);
bookRepository.addBook(vo);
response.sendRedirect("books.jsp");
%>


<p></p>
<body>

</body>
</html>