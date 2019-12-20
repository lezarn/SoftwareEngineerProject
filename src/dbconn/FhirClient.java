package dbconn;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.parser.IParser;
import ca.uhn.fhir.rest.api.MethodOutcome;
import ca.uhn.fhir.rest.client.api.IGenericClient;
import org.hl7.fhir.r4.model.*;

import java.util.Calendar;
import java.util.Date;


public class FhirClient {

    private FhirContext ctx;
    private IGenericClient client;
    private final String serverBase = "http://hapi.fhir.org/baseR4";

    public FhirClient(){
        ctx = FhirContext.forR4();
        client = ctx.newRestfulGenericClient(serverBase);
    }


    public void test(){
        ServiceRequest serviceRequest = new ServiceRequest();

        serviceRequest.addCategory(new CodeableConcept().set)
    }

    public Patient getPatient(int FHIRid){
        Patient patient = client.read()
                                .resource(Patient.class)
                                .withId(Integer.toString(FHIRid))
                                .execute();
        return patient;
    }

    public Practitioner getPractitioner(int FHIRid){
        Practitioner practitioner = client.read()
                                            .resource(Practitioner.class)
                                            .withId(Integer.toString(FHIRid))
                                            .execute();

        return  practitioner;
    }

    public void DiagnosticReportPrint(){
        Bundle results = client
                .search()
                .forResource(DiagnosticReport.class)
                .where(DiagnosticReport.SUBJECT.hasId("433583"))
                .returnBundle(Bundle.class)
                .execute();
        IParser jsonParser = ctx.newJsonParser();
        jsonParser.setPrettyPrint(true);
        String encode = jsonParser.encodeResourceToString(results);
    }

    public String createPatient(){
        Patient patient = new Patient();


        patient.addName(new HumanName().setText("白庭愷"));
        patient.addAddress(new Address().setText("新北市土城區三寶街88號8樓"));
        patient.addIdentifier().setSystem("身分證").setValue("F123456789");
        patient.setBirthDate(new Date(1997,01,01));
        patient.setGender(Enumerations.AdministrativeGender.MALE);



        MethodOutcome outcome = client.create()
                .resource(patient)
                .prettyPrint()
                .encodedJson()
                .execute();

        String id = outcome.getId().getValue();
        return id;
    }

    public void createDiagnosticReport(){
        DiagnosticReport report = new DiagnosticReport();


        report.setSubject(new Reference("Patient/433583"));
        MethodOutcome outcome = client.create()
                .resource(report)
                .prettyPrint()
                .encodedJson()
                .execute();

    }

    public void createObservation(){
        Observation observation = new Observation();

        observation.setStatus(Observation.ObservationStatus.FINAL);
    }

    public String createDoctor(){
        Practitioner practitioner = new Practitioner();

        practitioner.addName(new HumanName().setText("楊製成"));
        practitioner.addAddress(new Address().setText("高雄市小港區發財街88號8樓"));
        practitioner.addIdentifier().setSystem("身分證").setValue("F987654321");
        Calendar calendar = Calendar.getInstance();
        calendar.set(1997,8-1,8);
        practitioner.setBirthDate(calendar.getTime());
        practitioner.setGender(Enumerations.AdministrativeGender.MALE);
        practitioner.addIdentifier().setValue("耳鼻喉科");

        MethodOutcome outcome = client.create()
                .resource(practitioner)
                .prettyPrint()
                .encodedJson()
                .execute();
        String id = outcome.getId().getValue();
        return id;
    }
}
