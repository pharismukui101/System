package iPlaceKenya;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/")
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// pass the request along the filter chain
		HttpServletRequest request1= (HttpServletRequest) request;
		HttpServletResponse response1= (HttpServletResponse) response;
		HttpSession session=request1.getSession();
		String loginURI=request1.getContextPath()+"/index.jsp";
		
		boolean loggedIn = session.getAttribute(Template.USER_ID)!=null;
		boolean loginRequest= request1.getRequestURI().equals(loginURI);
		
		if (loginRequest||loggedIn) {
			chain.doFilter(request1, response1);
		}
		else {
			 response1.sendRedirect(loginURI);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
