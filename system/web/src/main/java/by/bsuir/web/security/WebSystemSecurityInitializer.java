package by.bsuir.web.security;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class WebSystemSecurityInitializer extends AbstractSecurityWebApplicationInitializer {

    protected WebSystemSecurityInitializer() {
        super(WebSystemSecurityConfig.class);
    }
}
