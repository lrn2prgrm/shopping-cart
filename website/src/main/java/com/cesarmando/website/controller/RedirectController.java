package com.cesarmando.website.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by jarma on 4/9/2017.
 */

@Slf4j
@Controller
public class RedirectController {

    @GetMapping(value = "/")
    public String home() {
        return "redirect:/store/hello.html";
    }

    @GetMapping(value = "/error")
    public String error() {
        return "redirect:/oops.html";
    }

}
