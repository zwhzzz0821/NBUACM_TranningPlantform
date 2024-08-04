package com.example.NBUACM.service.ApiClient.impl;

import com.example.NBUACM.Exception.SpecificException;
import com.example.NBUACM.service.ApiClient.CodeforcesApiClient;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.Map;

@Service
public class CodeforcesApiClientImpl implements CodeforcesApiClient {


    public <T> T exchangeForResponse(String urlTemplate, Map<String, String> uriVariables, Class<T> responseType) throws SpecificException {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        // 替换URL模板中的占位符，即参数处理
        String url = replaceUrlTemplate(urlTemplate, uriVariables);

        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<T> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    responseType
            );

            return responseEntity.getBody();

        } catch (ResourceAccessException e) {
            // 处理网络连接问题
            System.out.println("ResourceAccessException: " + e.getMessage());
            throw new SpecificException("Network connection error", e);
        } catch (HttpClientErrorException e) {
            // 处理客户端错误，如404或400
            System.out.println("ClientError ResponseBodyAsString: " + e.getResponseBodyAsString());   //这里可以给一个JSON对象类型的数据
            throw new SpecificException(e.getResponseBodyAsString(), e);
        } catch (HttpServerErrorException e) {
            // 处理服务器错误，如500或503
            throw new SpecificException("CodeForces Server error: " + e.getStatusText(), e);
        } catch (Exception e) {
            // 处理其他所有异常
            throw new SpecificException("General error: " + e.getMessage(), e);
        }
    }

    private String replaceUrlTemplate(String urlTemplate, Map<String, String> uriVariables) {
        for (Map.Entry<String, String> entry : uriVariables.entrySet()) {
            urlTemplate = urlTemplate.replace("{" + entry.getKey() + "}", entry.getValue());
        }
        return urlTemplate;
    }
}




