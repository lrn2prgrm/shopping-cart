package com.cesarmando.website.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

/**
 * Created by jarma on 5/18/2017.
 */
@Configuration
public class ThymeleafConfig {

    @Bean(name = "textTemplating")
    public TemplateEngine textTemplateEngine() {
        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.addTemplateResolver(textTemplateResolver());
        return templateEngine;
    }

    @Bean(name = "jsTemplating")
    public TemplateEngine jsTemplateEngine() {
        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.addTemplateResolver(jsTemplateResolver());
        return templateEngine;
    }

    private ITemplateResolver textTemplateResolver() {
        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
        templateResolver.setPrefix("/templates/text/");
        templateResolver.setSuffix(".txt");
        // https://github.com/thymeleaf/thymeleaf/issues/395
        templateResolver.setTemplateMode(TemplateMode.TEXT);
        templateResolver.setCharacterEncoding("UTF8");
        templateResolver.setCheckExistence(true);
        templateResolver.setCacheable(false);
        return templateResolver;
    }

    private ITemplateResolver jsTemplateResolver() {
        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
        templateResolver.setPrefix("/templates/js/");
        templateResolver.setSuffix(".js");
        // https://github.com/thymeleaf/thymeleaf/issues/395
        templateResolver.setTemplateMode(TemplateMode.JAVASCRIPT);
        templateResolver.setCharacterEncoding("UTF8");
        templateResolver.setCheckExistence(true);
        templateResolver.setCacheable(false);
        return templateResolver;
    }
}
