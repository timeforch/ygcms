package com.yougou.cms.api;

import com.yougou.cms.vo.UserVo;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TFastFramedTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: minxr
 * Date: 7/2/13
 * Time: 2:38 PM
 * To change this template use File | Settings | File Templates.
 */
public class CMSApiClient {
    public static void main(String[] args) throws TException {
        //设置调用的服务器为本地，端口为7911
        TTransport transport = new TSocket("10.10.10.244", 9090);
        transport =  new TFastFramedTransport(transport);
        //设置传输协议为TBinaryProtocol
        TProtocol protocol = new TBinaryProtocol(transport);
//        Hello.com.yougou.cms.api.client.Client client = new Hello.com.yougou.cms.api.client.Client(protocol);
        transport.open();

        ICMSApi.Client client = new ICMSApi.Client(protocol);
        System.out.println(client.getUserCount());
        List<UserVo> userList = client.getAllUsers();
        for (UserVo u:userList){
            System.out.println(u.getUser_name());
        }
        transport.close();
    }


}
