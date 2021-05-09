package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2021000117651402";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCm8fiGMn3iCAB1pLZo0gkEM5EICBzTQnEN2KU5QfjT4j5WmGPB+h0nhzLIYmdEEC+sb5uZnCqHFUDYvKpM/YdttpTboUnaaMeZebai+KvQ3U2vP+1QkLTRq13WUJmT+MQwesQyQcMz0HHPhytGu38lHiRW5McXADaWtG8miNpWrrpbCBJPazC4KzjxTEtsQz8knWiEw3RtiVKHYVBEuXCfTa6dGNVG0SZwLmjbTgeWEBpdkFEMyG4MkC7LOA5S3lfTh0knZFQkc+JkfTGt4AnHvJz+oxPYLipTJUn9FTUz+4HFUobGK/zoJDv0O7fFKXCAHIZAe+Yz0KNc0yzvyJixAgMBAAECggEBAIPx2H+P5og/1MUmQnkED9Y/P1A+wTGDYMEVyjg/2P714FkmpimImYRFSbCwfXeA53z81NkKYV5UQOVL77lb466l0G7pweoaSC8X0G5r5bf1QNHSz6iORis0qryZBVi7E6xRS0GBUltgUqM37M9Bn1LhyMzYkjWumHZx8ytcnFxHAVYOZ1gKkpFoaFJjXhjrVn1CIOIjShxQm3OvtkLBRiXqe2gfeONAh7zIDNDc3SptOxlzttxL8pUdOa26Rle5/aVZtZzaoeHzDeoS+acG7tC+GX49JxfpxP71M+mgT4DVs87oGGi0WVGJKsRMw/TGdC4CFiGIdWkns0hRhXCr5zECgYEA6t0IslRLSULGi4E2w09M6DswHDGwBJzdBQQw8evYG9oQiICtVIKET5n8GGGj+7UWWm8OKfi/pGDV6wBJCivRRsg1pWfmUxDTr1ZzieE9lNh3q6NrcjM91bTfMmv6glHig26sIMZUUQk1Qs6haVxPnMKvWpWemLQyaTDmWES12DUCgYEAtfgvJBZMVoYMl0g9gNEYP0EzTbyZgdtTRGHn/N8Wb/jrCidq1K4DT8Uhr22zSdrOODxJlKpXuRV6/6C0zfvxKP0CTMjCCEUW3xLMOmPbvpy3oR2A8KIIienHBPbuTQFge1K2HlnPROv74FLxAlBsdSVHeC/med46td6A/AS55g0CgYBWYYVZUXd/MngjxxqFKx12LI69T+kVSTxhI/F8iOmrFMEP84PMmVRgkpoNvZu6cBgQmtfyx/J0WslS7X/vpb4K8ogIlfY4hu/UhU9pXtZvcE5Tan+SORZ9C1EsElrIo6VUAdh9FXTdeS2FrMnhHnqJhXFJN85lC6Ge3sVZoavgIQKBgQCi6p+yDHCuKnfNXfUKhqnRwBshpxA8rdN/7rQXttfMyiwMvDuuTFlUqua8vFd/cPGecYNjIZtGbs/fW89keANysgrEGh117/1JHPhR8qODpaXWDqcpSbihWPdBH588vFXYM7YvuDKUvz6TmU6DxuNDgmvZU/Fh/K/NsncCq2yQZQKBgQCIVjmo4/TDHs1H+XHV203qoyzOQirpKVTdGtOzrtwTpjyAvIHUV8u6T0pxy8x4qUszZCDLzCrDX9iexAVR/bpSZBBdC6qZLCYcSpFKJ85hiZCg9A8jhRjVzV1CuXbVEjfrLCrCix+o65r+ZAYQii59Ruzl4SiIa1VAlWvrwp4jIQ==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy6rWBKB+mj4ansCP38qfl9iHdxigMGZsolklJ2dVurk6ZY15VIBQifO+9X/mZgzanc7V82Y7bqIYm8/5IsbAx/GW+O4faEidpxCFFkHOa/BJNlVTlJUNdknEzLMRCri84oJZJ6D+SxXucdjugrqStinxXKOkYxJ0qZ/UICHRs9acOsntjSedTN2J+kvUo1LZ3sIFgrStS0YmBVYe9kYo5m5GXDvRGyLxeeLAETxxzqa8z9wCzSVPHJYXb1BYUnxZQNyn9N+K2blX2YjiGH3dQlSzO+E/RiiyocPd56Q02MBCqAyWuoqt7O5BdPiWouEdrGDZ2EZQZpc4lpF5xxiTHQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

