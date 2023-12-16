package cn.bugstack.test;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class ApiTest {

    @Test
    public void test() {
        log.info("测试完成");
    }

    public void test(UserVO userVO) {
        UserDTO userDTO = UserDTO.builder()
                .userId(userVO.getUserId())
                .userName(userVO.getUserName())
                .userAge(userVO.getUserAge())
                .build();
    }

}
