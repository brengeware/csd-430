package tags;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.JspException;
import java.io.IOException;


public class HelloTag extends SimpleTagSupport {
	private String name;
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		getJspContext().getOut().write("Hello, " + name + "!");
	}
}
