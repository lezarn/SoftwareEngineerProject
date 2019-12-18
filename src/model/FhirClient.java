package model;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.rest.api.MethodOutcome;
import ca.uhn.fhir.rest.client.api.IGenericClient;
import org.hl7.fhir.r4.model.Address;
import org.hl7.fhir.r4.model.Enumerations;
import org.hl7.fhir.r4.model.HumanName;
import org.hl7.fhir.r4.model.Patient;

import java.util.Date;


public class FhirClient {

    private FhirContext ctx;
    private IGenericClient client;
    private final String serverBase = "http://hapi.fhir.org/baseR4";

    public FhirClient(){
        ctx = FhirContext.forR4();
        client = ctx.newRestfulGenericClient(serverBase);
    }



    public Patient getPatient(){
        Patient patient = client.read()
                .resource(Patient.class)
                .withId("433583")
                .execute();

        return patient;
    }

    public String createPatient(){
        Patient patient = new Patient();


        patient.addName(new HumanName().setFamily("白").addGiven("庭愷"));
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
}
