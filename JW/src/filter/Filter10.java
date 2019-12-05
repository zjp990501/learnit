package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebFilter(filterName = "Filter 10", urlPatterns = "/*")
public class Filter10 implements Filter {

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("Filter 10 - encoding begin");
        SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
        System.out.println(df.format(new Date()));
        chain.doFilter(req, resp);
        System.out.println("Filters 10 - encoding ends");
    }

}
