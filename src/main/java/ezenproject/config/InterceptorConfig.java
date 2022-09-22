/*
 * package ezenproject.config;
 * 
 * import org.springframework.context.annotation.Configuration; import
 * org.springframework.web.servlet.config.annotation.InterceptorRegistry; import
 * org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 * 
 * import ezenproject.interceptor.Login_Intereceptor;
 * 
 * 
 * @Configuration //public class InterceptorConfig extends
 * WebMvcConfigurerAdapter{
 * 
 * public class InterceptorConfig implements WebMvcConfigurer{
 * 
 * @Override public void addInterceptors(InterceptorRegistry registry) {
 * Login_Intereceptor login_Intereceptor = new Login_Intereceptor();
 * registry.addInterceptor(login_Intereceptor)
 * .addPathPatterns(login_Intereceptor.loginEssential)
 * .excludePathPatterns(login_Intereceptor.loginInessential); } }
 */