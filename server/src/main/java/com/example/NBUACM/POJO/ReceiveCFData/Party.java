package com.example.NBUACM.POJO.ReceiveCFData;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Party {
    private long contestId; // 可以为空

    private List<Member> members; // 成员列表
    private String participantType; // 参与者类型

    private long teamId; // 可以为空，如果是团队则为唯一团队ID
    private String teamName; // 可以为空，如果是团队或幽灵团队则为团队的本地化名称
    private Boolean ghost; // 如果为true，则该方是一个幽灵，它参加了比赛，但不在Codeforces上
    private long room; // 可以为空，方的房间。如果为空，则该方没有房间
    private long startTimeSeconds; // 可以为空，这个party开始比赛的时间
}
