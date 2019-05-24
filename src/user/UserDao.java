package user;

import java.sql.*;

public class UserDao {
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public UserDao(){
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://localhost:3306/bbs";
            String id = "root";
            String pw = "asdf";
            connection = DriverManager.getConnection(url,id,pw);
        } catch (Exception e) {
            System.out.println("connection exception : "+e.getMessage());
            e.printStackTrace();
        }
    }

    public int login(String userId, String userPassword){
        try {
            preparedStatement = connection.prepareStatement("select userPassword from user where userId = ?");
            preparedStatement.setString(1,userId);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                if (resultSet.getString(1).equals(userPassword)) {
                    return 1;   //로그인 성공
                }
                else{
                    return 0;   //비밀번호 불일치
                }
            }
            return -1; //아이디가 없음

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2;  //데이터베이스 오
    }

    public int join(User user){
        try {
            preparedStatement = connection.prepareStatement("insert into user values (?, ?, ?, ?, ?)");
            preparedStatement.setString(1,user.getUserID());
            preparedStatement.setString(2,user.getUserPassword());
            preparedStatement.setString(3,user.getUserName());
            preparedStatement.setString(4,user.getUserGender());
            preparedStatement.setString(5,user.getUserEmail());
            return preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("join exception : "+e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }
}
