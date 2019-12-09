package Statistics;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Database.DBConnect;
import Forms.ViewStatistics;

public class Statistics implements StatisticsInterface {
	public Statistics(){}
	public void viewStat(int storeID) {
		try {
			Connection connection;
		    Statement stmt = null;
		    ResultSet resultset = null;
		    ArrayList<String> output =new ArrayList<>();
		    int size = 0;
       		connection = DBConnect.DBConnect();
       		stmt = connection.createStatement();
            resultset = stmt.executeQuery("select ProductName, InitialQuantity, Quantity from Product where StoreID = '"+storeID+"' ");
            while(resultset.next()) {
				if (resultset.getInt(2) - resultset.getInt(3) != resultset.getInt(2))
					output.add(resultset.getString(1) +"			"+Integer.toString(resultset.getInt(2)-resultset.getInt(3))+"\n"); 
				else 
					output.add(resultset.getString(1) +"			"+"Sold out \n"); 
				
				size++;
            }
            
            new ViewStatistics().appendOutput(output, size); 
		} catch (SQLException e) {
			e.printStackTrace();
	   }
		
	}
}
