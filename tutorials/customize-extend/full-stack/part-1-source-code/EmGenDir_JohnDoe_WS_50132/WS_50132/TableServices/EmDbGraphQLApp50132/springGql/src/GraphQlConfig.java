package emrest.spring;  
  

//graphql
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.graphql.execution.RuntimeWiringConfigurer;
import graphql.scalars.ExtendedScalars;
//import org.springframework.graphql.server.;
import emrest.spring.EmCalendarScalar;

//@EnableDiscoveryClient 
@Configuration
public class GraphQlConfig  {

    @Bean
    public RuntimeWiringConfigurer runtimeWiringConfigurer() {
        return wiringBuilder -> wiringBuilder
                .scalar(EmCalendarScalar.EmCalendar)
                .scalar(EmCalendarScalar.EmDateTime)
                .scalar(EmCalendarScalar.EmDate)
                .scalar(EmCalendarScalar.EmTime)
                .scalar(ExtendedScalars.DateTime);
    }

//    RuntimeWiring.newRuntimeWiring().scalar(Scalars.graphQLObjectScalar("typeN‌​ame"))
} 
