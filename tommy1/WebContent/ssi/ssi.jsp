<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="board.*" %>
<%@ page import="memo.*" %>
<%@ page import="member.*" %>
<%@ page import="guest.*" %>
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%  request.setCharacterEncoding("utf-8");
    String root = request.getContextPath();
    
    String tempDir = "/test/temp";
    String upDir = "/test/storage";
    
    tempDir = application.getRealPath(tempDir);
    upDir = application.getRealPath(upDir);
    
%> 
  