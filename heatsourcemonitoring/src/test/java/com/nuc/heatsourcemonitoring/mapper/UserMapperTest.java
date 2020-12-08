package com.nuc.heatsourcemonitoring.mapper;

import com.nuc.heatsourcemonitoring.pojo.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UserMapperTest {
    @Autowired
    UserMapper userMapper;

    @Test
    public void updatePas() {
        User user = userMapper.selectById(6);
        System.out.println(user);
    }
}
