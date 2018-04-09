package wei.interceptor;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();

		if (session.get("existUser") != null) {

			String result = invocation.invoke();
			// invocation.invoke()表示如果后面还有拦截器，则继续执行后面的拦截器，若没有，则执行Action
			return result;

		} else {

			HttpServletRequest request = (HttpServletRequest) ac.get(StrutsStatics.HTTP_REQUEST);
			HttpServletResponse response = (HttpServletResponse) ac.get(StrutsStatics.HTTP_RESPONSE);
			System.out.println("goodId:" + request.getParameter("goodId"));

			// String formerUrl =
			// "buyGoodsAction_findOneGoodById.action?goodId="+request.getParameter("goodId");
			if (request.getParameter("goodId") == null) {

				request.setAttribute("formerUrl",
						"selectGameType.jsp");

			} else {

				request.setAttribute("formerUrl",
						"buyGoodsAction_findOneGoodById.action?goodId=" + request.getParameter("goodId"));
			}

			// session.put("formerUrl",
			// "buyGoodsAction_findOneGoodById.action?goodId="+request.getParameter("goodId"));
			// System.out.println(request.getAttribute("formerUrl"));
			// ac.getValueStack().push(formerUrl);
			RequestDispatcher rd = request.getRequestDispatcher("loginUser.jsp");
			rd.forward(request, response);
			return null;
		}

	}

}
