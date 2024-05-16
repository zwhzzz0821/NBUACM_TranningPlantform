package com.example.NBUACM.POJO.ReceiveCFData;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private String handle;  //Codeforces user handle
    private String name;    //Can be absent. User's name if available.
}
