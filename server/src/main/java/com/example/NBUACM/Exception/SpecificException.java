package com.example.NBUACM.Exception;
import org.json.JSONObject;

public class SpecificException extends Exception {
    // 构造函数
    public SpecificException(String message) {
        super(message);
    }

    // 可以添加更多的构造函数，比如带有cause的构造函数
    public SpecificException(String message, Throwable cause) {
        super(message, cause);
    }

    public String myGetMessage(Exception e) {
        String message = e.getMessage();
        String ans = message;  //默认返回原原本本的message
        if (message.startsWith("{") && message.endsWith("}")) {
            // 尝试将消息解析为JSON对象
            JSONObject jsonObject = new JSONObject(message);

            // 获取状态
            String status = jsonObject.getString("status");

            // 获取comment字段
            String comment = jsonObject.getString("comment");

            ans = comment;
        } else {
            // 消息不是JSON格式，按需处理
            System.out.println("Unexpected error message format: " + message);
        }
        return ans;
    }
}
