package com.hzlx.utils;

import com.google.gson.Gson;
import lombok.Data;

/**
 * Description:
 *
 * @author: Corgi Cheul
 * @Date: 2023/5/24 16:46
 * Created with Intellij IDEA
 * To change this template use File|Settings|Flie And Code Templates
 */
@Data
public class BaseResult<T> {
    private Integer code;
    private String msg;
    private T data;

    private BaseResult() {
    }

    private BaseResult(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static String success() {
        Gson gson = new Gson();
        return gson.toJson(new BaseResult(200, "success", null));
    }

    public static <T> String success(T data) {
        Gson gson = new Gson();
        return gson.toJson(new BaseResult(200, "success", data));
    }

    public static String error(Integer code, String msg) {
        Gson gson = new Gson();
        return gson.toJson(new BaseResult(code, msg, null));
    }
}

