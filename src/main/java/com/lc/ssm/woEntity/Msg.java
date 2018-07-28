package com.lc.ssm.woEntity;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: lichao
 * @Description: 通用返回数据
 * @Date: 2018/7/28 10:17
 */
public class Msg {

    // 状态码,100:success,200:fail
    private Integer code;

    // 提示信息
    private String msg;

    // 返回的数据
    private Map<String, Object> extend = new HashMap<String, Object>();

    // 成功
    public static Msg success() {
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功!");
        return result;
    }

    // 失败
    public static Msg fail() {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败!");
        return result;
    }

    // 添加数据
    public Msg add(String key, Object value) {
        this.extend.put(key, value);
        return this;
    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
