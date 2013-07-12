package com.yougou.cms.api.client;

import com.yougou.cms.api.ICMSApi;
import com.yougou.cms.vo.UserVo;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TFastFramedTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: minxr
 * Date: 7/12/13
 * Time: 5:31 PM
 * To change this template use File | Settings | File Templates.
 */
public class Client {
    public static void main(String[] args)  {
        if(args == null || args.length < 2){
            System.out.println("参数不正确，正确的参数为host port ");
            System.exit(-1);
        }
        String host = args[0];
        int port = 0;
            try{
                port = Integer.parseInt(args[1]);
            }catch (Exception e){
                System.out.println("端口应为数字！");
                System.exit(-1);
            }

        //设置调用的服务器为本地，端口为7911
        TTransport transport = new TSocket(host, port);
        transport =  new TFastFramedTransport(transport);
        //设置传输协议为TBinaryProtocol
        TProtocol protocol = new TBinaryProtocol(transport);
        List<UserVo> userList = null;
        try {
            transport.open();
            ICMSApi.Client client = new ICMSApi.Client(protocol);
            System.out.println(client.getUserCount());
            userList = client.getAllUsers();
        } catch (TTransportException e) {
            System.out.println("TTransportException:"+e.getMessage());
        } catch (TException e) {
            System.out.println("TException:"+e.getMessage());
        }

        for (UserVo u:userList){
            System.out.println(u.getUser_name());
        }
        transport.close();
    }

}
