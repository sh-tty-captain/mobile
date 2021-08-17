String spesialitySoap() =>
    '''<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
   <soap:Header/>
   <soap:Body>
      <tem:GetSpesialityList>
         <!--Optional:-->
         <tem:idLpu>1</tem:idLpu>
         <!--Optional:-->
         <tem:idPat></tem:idPat>
         <!--Optional:-->
         <tem:guid></tem:guid>
         <!--Optional:-->
         <tem:idHistory>1</tem:idHistory>
      </tem:GetSpesialityList>
   </soap:Body>
</soap:Envelope>''';

String doctorSoap(String id) =>
    '''<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
   <soap:Header/>
   <soap:Body>
      <tem:GetDoctorList>
         <!--Optional:-->
         <tem:idSpesiality>$id</tem:idSpesiality>
         <!--Optional:-->
         <tem:idLpu>1</tem:idLpu>
         <!--Optional:-->
         <tem:idPat></tem:idPat>
         <!--Optional:-->
         <tem:guid></tem:guid>
         <!--Optional:-->
         <tem:idHistory>1</tem:idHistory>
      </tem:GetDoctorList>
   </soap:Body>
</soap:Envelope>''';

String availableAppointmentsSoap(String id) =>
    '''<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
   <soap:Header/>
   <soap:Body>
      <tem:GetAvaibleAppointments>
         <!--Optional:-->
         <tem:idDoc>$id</tem:idDoc>
         <!--Optional:-->
         <tem:idLpu>1</tem:idLpu>
         <!--Optional:-->
         <tem:idPat></tem:idPat>
         <!--Optional:-->
         <tem:visitStart>2021-01-01</tem:visitStart>
         <!--Optional:-->
         <tem:visitEnd>2021-12-12</tem:visitEnd>
         <!--Optional:-->
         <tem:guid></tem:guid>
         <!--Optional:-->
         <tem:idHistory>1</tem:idHistory>
      </tem:GetAvaibleAppointments>
   </soap:Body>
</soap:Envelope>''';
