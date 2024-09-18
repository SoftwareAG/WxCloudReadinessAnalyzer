package WxCloudReadinessAnalyzer;

// -----( IS Java Code Template v1.2

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import com.wm.util.coder.IDataCoder;
import com.wm.util.coder.IDataJSONCoder;
import com.wm.app.b2b.server.ServerAPI;
import com.wm.lang.ns.NSNode;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
// --- <<IS-END-IMPORTS>> ---

public final class util

{
	// ---( internal utility methods )---

	final static util _instance = new util();

	static util _newInstance() { return new util(); }

	static util _cast(Object o) { return (util)o; }

	// ---( server methods )---




	public static final void containsDocList (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(containsDocList)>> ---
		// @sigtype java 3.5
		// [i] record:0:required document
		// [o] field:0:required containsDocList {"true","false"}
		IDataCursor pc = pipeline.getCursor();
		IData document = IDataUtil.getIData( pc, "document" );
		String nodeType = null;
		String containsDocList = "false";
		Object node = null;
		
		if(document !=null) {
			IDataCursor dc = document.getCursor();
			while(dc.next()){
				node = dc.getValue();
				if (node.getClass().getName().endsWith("Lcom.wm.data.IData;") && node.getClass().isArray()){
					containsDocList = "true";
					break;
				}
			}
		}
		IDataUtil.put( pc, "containsDocList", containsDocList);
		pc.destroy();
		
			
		// --- <<IS-END>> ---

                
	}



	public static final void getClassName (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getClassName)>> ---
		// @sigtype java 3.5
		// [i] object:0:required object
		// [o] field:0:required className
	IDataCursor pc = pipeline.getCursor();
	Object o = IDataUtil.get(pc, "object");
	IDataUtil.put(pc, "className", o.getClass().getName());
		// --- <<IS-END>> ---

                
	}



	public static final void getISMemDataImplAsDoc (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getISMemDataImplAsDoc)>> ---
		// @sigtype java 3.5
		// [i] object:0:required isMemDataImpl
		// [o] record:0:required doc
  IDataCursor pc = pipeline.getCursor();
  try{
	  ISMemDataImpl imdi  = (ISMemDataImpl)IDataUtil.get(pc, "isMemDataImpl");
	  IDataJSONCoder idc = new IDataJSONCoder();
	  byte[] bytes = idc.encodeToBytes(imdi);
	  IData doc = idc.decodeFromBytes(bytes);
	  IDataUtil.put(pc, "doc", doc);
  }catch (Exception e){
	  throw new ServiceException(e);
  } finally {
	  pc.destroy();
  }
		// --- <<IS-END>> ---

                
	}



	public static final void getNodeAsDoc (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getNodeAsDoc)>> ---
		// @sigtype java 3.5
		// [i] field:0:required node
		// [o] recref:0:required nodeDoc WxCloudReadinessAnalyzer.util.doc:node
  IDataCursor pc = pipeline.getCursor();
  Object node = IDataUtil.get(pc, "node");
  NSNode nsnode = (NSNode)node;
  IData nodeDoc = nsnode.getAsData();
  IDataCursor nc = nodeDoc.getCursor();
  IData irtProperties = IDataUtil.getIData(nc, "IRTNODE_PROPERTIES");
  if (irtProperties != null){
	  IDataUtil.remove(nc, "IRTNODE_PROPERTIES");
	  IDataUtil.put(nc, "IRTNODE_PROPERTIES", irtProperties);
  }
  
  IDataUtil.put(pc, "nodeDoc", nodeDoc);
  nc.destroy();
  pc.destroy();
	
		// --- <<IS-END>> ---

                
	}



	public static final void getPackageConfigDirectory (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getPackageConfigDirectory)>> ---
		// @sigtype java 3.5
		// [o] field:0:required pkgConfigDir
		IDataCursor pc = pipeline.getCursor();
		IDataUtil.put(pc, "pkgConfigDir", ServerAPI.getPackageConfigDir(Service.getPackageName()).getPath());
			
		// --- <<IS-END>> ---

                
	}



	public static final void getWorkingDirectory (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getWorkingDirectory)>> ---
		// @sigtype java 3.5
		// [o] field:0:required workingDirectory
		IDataCursor pc = pipeline.getCursor();
		IDataUtil.put(pc, "workingDirectory", System.getProperty("user.dir"));
		// --- <<IS-END>> ---

                
	}



	public static final void isStringInList (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(isStringInList)>> ---
		// @sigtype java 3.5
		// [i] field:0:required inString
		// [i] field:1:required inStringList
		// [o] field:0:required stringInList
		IDataCursor idc = pipeline.getCursor();
		String inString = IDataUtil.getString(idc,"inString");
		ArrayList<String> inStringArray = new ArrayList<String>(Arrays.asList(IDataUtil.getStringArray(idc,"inStringList")));
		
		IDataUtil.put(idc, "stringInList", String.valueOf(inStringArray.contains(inString)));
		idc.destroy();
		
			
		// --- <<IS-END>> ---

                
	}



	public static final void matchesRegex (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(matchesRegex)>> ---
		// @sigtype java 3.5
		// [i] field:0:required inString
		// [i] field:0:required regex
		// [o] field:0:required matches {"true","false"}
		IDataCursor pc = pipeline.getCursor();
		String inString = IDataUtil.getString(pc, "inString");
		String regex = IDataUtil.getString(pc, "regex");
		if(regex.length()<1){
			IDataUtil.put(pc, "matches", "true");
		} else {
			IDataUtil.put(pc, "matches", Boolean.toString(Pattern.matches(regex, inString)));
		}
		pc.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void stringListToString (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(stringListToString)>> ---
		// @sigtype java 3.5
		// [i] field:1:required stringList
		// [i] field:0:required delimiter
		// [o] field:0:required outString
		IDataCursor pc = pipeline.getCursor();
		String[] stringList = IDataUtil.getStringArray(pc, "stringList");
		String delimiter = IDataUtil.getString(pc, "delimiter");
		StringBuilder outString = new StringBuilder();
		for(String string : stringList){
			outString.append(string+delimiter);
		}
		IDataUtil.put(pc, "outString", outString.toString());
		pc.destroy();
		
			
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
	static String[] splitString(String s){
		ArrayList<String> strList = new ArrayList<String>();
		String sub = new String();
		int start = 0;
		int end = 0;
		int count = 0;
		while(start > -1){
	//			start = s.indexOf("~~pub.");
			end = indexOfByRegex("~~pub\\.[^\\s]+\\s", s);
			if (end < 0){
				sub = s.substring(start);
				break;
			} else {
				sub = s.substring(start, end);
			}
			strList.add(sub);
			s = s.replaceFirst(sub, "");
			if (count++>10){
				break;
			}
		}
		return strList.toArray(new String[0]);
	}
	
	public static int indexOfByRegex(String pattern, String text) {
		Pattern p = Pattern.compile(pattern);
	    Matcher m = p.matcher(text);
	    if ( m.find() ) {
	        return m.start(); 
	    }
	    return -1;
	}
		
	public static class VersionComment{
	  public String version;
	  public String comment; 
	}
	
	public static class VersionCommentComparator implements Comparator<VersionComment> {
	    @Override
	    public int compare(VersionComment vc1, VersionComment vc2) {
	        return new VersionComparator().compare(vc1.version,vc2.version);
	    }
	}
	
	public static class VersionComparator implements Comparator<String> {
	    @Override
		public int compare(String v1, String v2) {
			int cmp = 0;
			String[] v = v1.split("\\.");
			String[] vtc = v2.split("\\.");
			for (int i=0; i<v.length; i++ ){
				if(Integer.valueOf(v[i]) > Integer.valueOf(vtc[i])){
					cmp = -1;
					break;
				} else if(Integer.valueOf(v[i]) < Integer.valueOf(vtc[i])){
					cmp = 1;
					break;
				}
			}
			return cmp;
		}
	}
		
	// --- <<IS-END-SHARED>> ---
}

