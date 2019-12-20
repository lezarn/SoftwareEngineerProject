package servlet;

import dbconn.FhirClient;
import model.Account;
import org.hl7.fhir.r4.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@WebServlet("/patientData")
public class patientDataServlet extends HttpServlet {
    private FhirClient client;

    @Override
    public void init() throws ServletException {
        client = new FhirClient();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        int fhirid = account.getFHIRid();
        Patient patient = client.getPatient(fhirid);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(patient.getBirthDate());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        if(patient != null){

            request.setAttribute("i", patient);
            request.setAttribute("birthday", simpleDateFormat.format(calendar.getTime()));
        }
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
