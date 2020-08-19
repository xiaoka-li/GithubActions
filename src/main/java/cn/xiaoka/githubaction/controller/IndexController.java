package cn.xiaoka.githubaction.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xiaoka
 * @date 2020/8/19 16:58
 * @remark
 */
@RestController
public class IndexController {
    @GetMapping
    public String index(){
        return "Hello,Github!";
    }
}
