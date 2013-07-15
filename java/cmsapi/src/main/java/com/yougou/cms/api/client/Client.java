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
public class Client extends Thread{

    public Client(String host,int port,int thread) {
        this.host = host;
        this.port = port;
        this.thread = thread;
    }
    private String host;
    private int port ;
    private  int thread;
    public static void main(String[] args) {
        System.out.println(args[0]+":"+args[1]+" "+args[2]);
        if (args == null || args.length < 3) {
            System.out.println("参数不正确，正确的参数为host port threadcount");
            System.exit(-1);
        }
        int remotePort =       Integer.parseInt(args[1]);
        int threadCount =      Integer.parseInt(args[2]);

        for(int i=0;i<threadCount;i++){
        Client client = new Client(args[0],remotePort,threadCount);
            System.out.println("start thread:"+i+" ...");
            client.setName("thread "+i);
            client.start();
        }
    }

    public  void run() {
        int count4Run = 50;
        long start = System.currentTimeMillis();
        TTransport transport = new TSocket(host, port);
        transport = new TFastFramedTransport(transport);
        String threadName = currentThread().getName();
        //设置传输协议为TBinaryProtocol
        TProtocol protocol = new TBinaryProtocol(transport);
        try {
            transport.open();
        }  catch (TTransportException e) {
            System.out.println("TTransportException:" + e.getMessage());
        }
        for(int i=0;i<count4Run;i++){
            List<UserVo> userList = null;
            try {
                ICMSApi.Client client = new ICMSApi.Client(protocol);
                int userCount = client.getUserCount();
                System.out.println(threadName+"~>总共有【"+userCount+"】个用户:");
                userList = client.getAllUsers();
            }catch (TException e) {
                System.out.println("TException:" + e.getMessage());
            }

            for (UserVo u : userList) {
                System.out.println(threadName+u);
            }

        }
        transport.close();
        long total= System.currentTimeMillis() - start;
        String s = String.format("线程:%s,执行了%s次，共计耗时:%s毫秒", threadName,count4Run, total);
        System.out.println(s);
    }

}
