package servlet;

import model.FhirClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/patientData")
public class patientDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        FhirClient client = new FhirClient();
        request.setAttribute("i", client.getPatient());
        request.getRequestDispatcher("/WEB-INF/view/patient/patientData.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.setAttribute("session", request.getParameter("content"));
        System.out.println(request.getParameter("content"));
        request.setAttribute("content", request.getParameter("content"));
        request.getRequestDispatcher("/WEB-INF/view/patient/patientData.jsp").forward(request, response);
    }
}
