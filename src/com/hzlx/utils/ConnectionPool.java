package com.hzlx.utils;

import java.sql.*;
import java.util.LinkedList;



/*实现自定义连接池的步骤：
*1.确定连接池的大小，以及链接参数
* 2.给链接池初始化
*   根据配置好的最小连接数，创建对应的链接，存放到集合中去
* 3.提供一个公共的获取连接的方法，方便别的类调用（目的：从连接池中获得链接）
* 4.提供一个归还链接的方法
*       归还时  需要判断链接池是否满了
*           如果满了-->归还的链接直接丢弃
*           如果没有满-->添加到连接池的尾部
* */

public class ConnectionPool {
    //最小连接数
   private static int MIN_POOL_NUM;
    //最大连接数
   private static int MAX_POOL_NUM;
   private static String DRIVER  ;
   private static String URL  ;
   private static String USER_NAME  ;
   private static String PASSWORD  ;
    //装链接的容器
    private static LinkedList<Connection> connectionPool=new LinkedList<>();
    static {
        init();
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println("加载数据库驱动异常");
            e.printStackTrace();
        }
        //给连接池填充链接（参照最小连接数）
        initConnection();
    }


    /*
    * 初始化方法，给属性赋值
    * */
    private static void init(){
        //先把jdbc配置文件加载到程序里
        PropertiesUtil.load("jdbc");
        //根据配置文件里的key给我们的连接池中的属性赋值
        DRIVER=PropertiesUtil.getValue("jdbc.driver");
        URL=PropertiesUtil.getValue("jdbc.url");
        USER_NAME=PropertiesUtil.getValue("jdbc.userName");
        PASSWORD=PropertiesUtil.getValue("jdbc.password");
        //链接池相关的属性赋值
        MIN_POOL_NUM=Integer.parseInt(PropertiesUtil.getValue("jdbc.minPoolNum"));
        MAX_POOL_NUM=Integer.parseInt(PropertiesUtil.getValue("jdbc.maxPoolNum"));
    }

    /*
    * 给链接池初始化
    * */
    private static void initConnection(){
        for (int rows = 0; rows < MIN_POOL_NUM; rows++) {
            try {
                //每次创建一个新的链接都往集合的尾部追加
                connectionPool.addLast(  DriverManager.getConnection(URL,USER_NAME,PASSWORD));
            } catch (SQLException e) {
                System.out.println("初始化获取连接异常");
                e.printStackTrace();
            }
        }
    }


    /*
    * 获取连接对象
    * */
    public static Connection getConnection(){
        //判断连接池中是否有可用链接，如果有，取出最顶上的链接，如果没有创建一个返回
        if (connectionPool.size()>0){
            return connectionPool.removeFirst();
        }
        try {
            return  DriverManager.getConnection(URL, USER_NAME, PASSWORD);
        } catch (SQLException e) {
            System.out.println("获取链接异常");
            e.printStackTrace();
        }
        return null;
    }


    /*
    * 归还连接的方法
    * connectionL:还回来的链接对象
    * return：true  归还成功 false 归还失败
    * */
    public static boolean returnConnection(Connection connection){
        //当前连接池集合的size大于等于配置好的最大连接数，说明池子满了，这个链接需要丢弃
        if (connectionPool.size()>=MAX_POOL_NUM){
            try {
                connection.close();
                return true;
            } catch (SQLException e) {
                System.out.println("关闭连接异常");
                e.printStackTrace();
            }
        }else {
            connectionPool.addLast(connection);
            return true;
        }

        return false;

    }
    /*
     * 关闭连接，释放资源的方法
     * */
    public static boolean closeAll(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet){
        if (resultSet!=null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                System.out.println("关闭结果集失败");
                e.printStackTrace();
            }
        }
        if (preparedStatement!=null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                System.out.println("关闭preparedStatement失败");
                e.printStackTrace();
            }
        }
        return returnConnection(connection);
    }







}
