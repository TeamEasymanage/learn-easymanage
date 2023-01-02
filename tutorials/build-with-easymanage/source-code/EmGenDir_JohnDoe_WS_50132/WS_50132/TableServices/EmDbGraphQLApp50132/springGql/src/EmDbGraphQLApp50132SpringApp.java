package emrest.spring;   
 
import org.springframework.boot.SpringApplication;  
import org.springframework.boot.autoconfigure.SpringBootApplication;  
//import org.springframework.cloud.client.discovery.EnableDiscoveryClient;  
 
//graphql 
import java.time.Duration; 
import reactor.core.publisher.Mono; 
import org.springframework.context.annotation.Bean; 
import org.springframework.graphql.server.WebGraphQlInterceptor; 
 
@SpringBootApplication  
public class EmDbGraphQLApp50132SpringApp  { 
 
public static void main(String[] args) {  
SpringApplication.run(EmDbGraphQLApp50132SpringApp.class, args);  
} 
 
/* 
@Bean 
public WebGraphQlInterceptor interceptor() { 
		return (webInput, interceptorChain) -> { 
		// Switch threads to prove ThreadLocal context propagation works 
			return Mono.delay(Duration.ofMillis(10)).flatMap(aLong -> interceptorChain.next(webInput)); 
		}; 
} 
*/ 
 
}  
 
