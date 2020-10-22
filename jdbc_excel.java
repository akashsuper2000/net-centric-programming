package xml_excel;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import com.codoid.products.fillo.Fillo;
import com.codoid.products.fillo.Recordset;
public class jdbc_excel {
public static void main(String[] args) throws Exception {
		Fillo fillo=new Fillo();
		com.codoid.products.fillo.Connection
		connection=fillo.getConnection("D:\\Semester 7\\New folder\\customers.xlsx");
		String strQuery="Select * from Sheet1";
		Recordset recordset=connection.executeQuery(strQuery);
		DocumentBuilderFactory docBuilderFactory =	DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		Document doc = docBuilder.parse (new File("D:\\Semester 7\\New folder\\customers.xml"));
		doc.getDocumentElement().normalize();
		System.out.println ("Root element of the doc is " +	doc.getDocumentElement().getNodeName());
		NodeList listOfPersons = doc.getElementsByTagName("customer");
		for(int s=0; s<listOfPersons.getLength(); s++){
			Node firstPersonNode = listOfPersons.item(s);
			if(firstPersonNode.getNodeType() == Node.ELEMENT_NODE){
				Element firstPersonElement = (Element)firstPersonNode;
				NodeList cust_id=firstPersonElement.getElementsByTagName("cust_id");
				Element custElement =(Element)cust_id.item(0);
				NodeList textKNList = custElement.getChildNodes();
				String cust=((Node)textKNList.item(0)).getNodeValue().trim();
				NodeList datelist=firstPersonElement.getElementsByTagName("date");
				Element nameElement =(Element)datelist.item(0);
				NodeList textFNList = nameElement.getChildNodes();
				String date=((Node)textFNList.item(0)).getNodeValue().trim();
				NodeList billing =firstPersonElement.getElementsByTagName("billing");
				Element emailElement =(Element)billing.item(0);
				NodeList textLNList = emailElement.getChildNodes();
				String bill= ((Node)textLNList.item(0)).getNodeValue().trim();
				NodeList shipping =firstPersonElement.getElementsByTagName("shipping_info");
				Element shipElement =(Element)shipping.item(0);
				NodeList textMNList = shipElement.getChildNodes();
				String ship= ((Node)textMNList.item(0)).getNodeValue().trim();
				int i=connection.executeUpdate("insert into Sheet1(cust_id,date,billing,shipping) values('"+cust+"','"+date+"','"+bill+"','"+ship+"')");
			}
		}
		
		while(recordset.next()){
		System.out.println("Customer ID: "+recordset.getField("cust_id")+"Date: "+recordset.getField("date")+" Bill:	"+recordset.getField("billing")+" Shipping Info:	"+recordset.getField("shipping"));
		}
		recordset.close();
		connection.close();
	}
}