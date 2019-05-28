package bbs;

import java.sql.*;
import java.util.*;

public class BbsDao {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public BbsDao() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://localhost:3306/bbs?useUnicode=true& useUnicode=true&characterEncoding=euc_kr";
            String id = "root";
            String pw = "asdf";
            connection = DriverManager.getConnection(url,id,pw);
        } catch (Exception e) {
            System.out.println("connection exception : " + e.getMessage());
            e.printStackTrace();
        }
    }

    public String getDate(){
        String sql = "select now()";
        try{
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return resultSet.getString(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return "";
    }

    public int getNext(){
        String sql = "select bbsID from bbs order by bbsID desc";
        try{
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return resultSet.getInt(1)+1;
            }
            return 1;
        } catch (Exception e){
            System.out.println("getNext exception : "+e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    public int write(String bbsTitle, String userID, String bbsContent){
        String sql = "insert into bbs(bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable) values(?, ?, ?, ?, ?, ?)";
        int bId = getNext();
        String bDate = getDate();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,bId);
            preparedStatement.setString(2,bbsTitle);
            preparedStatement.setString(3,userID);
            preparedStatement.setString(4,bDate);
            preparedStatement.setString(5,bbsContent);
            preparedStatement.setInt(6,1);
            return preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("write exception : "+e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    public List<Bbs> getList(int pageNumber){
        String sql = "select * from bbs where bbsID < ? and bbsAvailable=1 order by bbsID desc limit 10";
        int num = getNext()- ((pageNumber-1)*10);
        List<Bbs> list = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,num);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Bbs bbs = new Bbs();
                bbs.setBbsID(resultSet.getInt(1));
                bbs.setBbsTitle(resultSet.getString(2));
                bbs.setUserID(resultSet.getString(3));
                bbs.setBbsDate(resultSet.getString(4));
                bbs.setBbsContent(resultSet.getString(5));
                bbs.setBbsAvailable(resultSet.getInt(6));
                list.add(bbs);
            }
        } catch (Exception e) {
            System.out.println("getList exception : "+e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public boolean nextPage(int pageNumber){
        String sql = "select * from bbs where bbsID<? and bbsAvailable=1";
        List<Bbs> list = new ArrayList<>();
        int num = getNext() - ((pageNumber-1)*10);
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,num);
            if(resultSet.next()){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Bbs getBbs(int bbsID){
        String sql = "select * from bbs where bbsID=?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,bbsID);

            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                Bbs bbs = new Bbs();
                bbs.setBbsID(resultSet.getInt(1));
                bbs.setBbsTitle(resultSet.getString(2));
                bbs.setUserID(resultSet.getString(3));
                bbs.setBbsDate(resultSet.getString(4));
                bbs.setBbsContent(resultSet.getString(5));
                bbs.setBbsAvailable(resultSet.getInt(6));
                return bbs;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
