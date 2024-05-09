package com.example.NBUACM.POJO;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response {
    private String status;
    private List<DataBean> result;
}
