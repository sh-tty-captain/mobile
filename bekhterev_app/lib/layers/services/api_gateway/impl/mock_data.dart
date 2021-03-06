const getProfileRepspose = '''
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
   <soap:Body>
      <m:GetProfileResponse xmlns:m="http://tempuri.org/">
         <m:GetProfileResult xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <Profile>
               <Id>1</Id>
               <FirstName>Владимир</FirstName>
               <LastName>Бехтерев</LastName>
               <Patronymic>Михайлович</Patronymic>
               <Tel>123321</Tel>
            </Profile>
         </m:GetProfileResult>
      </m:GetProfileResponse>
   </soap:Body>
</soap:Envelope>
''';

const getSpesialityListResponse = '''
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
   <soap:Body>
      <m:GetSpesialityListResponse xmlns:m="http://tempuri.org/">
         <m:GetSpesialityListResult xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <IdHistory xmlns="http://schemas.datacontract.org/2004/07/HubService2">1</IdHistory>
            <Success xmlns="http://schemas.datacontract.org/2004/07/HubService2">true</Success>
            <ListSpesiality xmlns="http://schemas.datacontract.org/2004/07/HubService2">
               <Spesiality>
                  <CountFreeParticipantIE>2</CountFreeParticipantIE>
                  <CountFreeTicket>2</CountFreeTicket>
                  <FerIdSpesiality>97</FerIdSpesiality>
                  <IdSpesiality>f7dabaee-e39c-11ea-b855-e8de27c31b75</IdSpesiality>
                  <LastDate>2021-05-03T11:45:00</LastDate>  
                  <NameSpesiality>Психиатрия-наркология</NameSpesiality>
                  <NearestDate>2021-05-03T11:00:00</NearestDate>
                </Spesiality>
            </ListSpesiality>
         </m:GetSpesialityListResult>
      </m:GetSpesialityListResponse>
   </soap:Body>
</soap:Envelope>
''';

const getDoctorListResponse = '''
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
  <soap:Body>
    <m:GetDoctorListResponse xmlns:m="http://tempuri.org/">
      <m:GetDoctorListResult xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <IdHistory xmlns="http://schemas.datacontract.org/2004/07/HubService2">2</IdHistory>
        <Success xmlns="http://schemas.datacontract.org/2004/07/HubService2">true</Success>
        <Docs xmlns="http://schemas.datacontract.org/2004/07/HubService2">
          <Doctor>
            <AriaNumber xsi:nil="true"/>
            <Comment/>
            <CountFreeParticipantIE>2</CountFreeParticipantIE>
            <CountFreeTicket>2</CountFreeTicket>
            <IdDoc>5e1304ea-0815-11eb-a6af-a4db30436e8d</IdDoc>
            <LastDate>2021-05-03T11:45:00</LastDate>
            <Name>Врачов Врач Врачович</Name>
            <NearestDate>2021-05-03T11:00:00</NearestDate>
            <Snils>516-516-516 51</Snils>
          </Doctor>
        </Docs>
      </m:GetDoctorListResult>
    </m:GetDoctorListResponse>
  </soap:Body>
</soap:Envelope>
''';

const getAvailableAppointmentsResponse = '''
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
   <soap:Body>
      <m:GetAvaibleAppointmentsResponse xmlns:m="http://tempuri.org/">
         <m:GetAvaibleAppointmentsResult xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <IdHistory xmlns="http://schemas.datacontract.org/2004/07/HubService2">1</IdHistory>
            <Success xmlns="http://schemas.datacontract.org/2004/07/HubService2">true</Success>
            <ListAppointments xmlns="http://schemas.datacontract.org/2004/07/HubService2">
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000001116</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-05-03T11:15:00</VisitEnd>
                  <VisitStart>2021-05-03T11:00:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000751</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-05-03T12:00:00</VisitEnd>
                  <VisitStart>2021-05-03T11:45:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000864</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-16T12:15:00</VisitEnd>
                  <VisitStart>2021-03-16T12:00:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000869</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-16T13:30:00</VisitEnd>
                  <VisitStart>2021-03-16T13:15:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000898</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-22T12:45:00</VisitEnd>
                  <VisitStart>2021-03-22T12:30:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000902</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-22T13:45:00</VisitEnd>
                  <VisitStart>2021-03-22T13:30:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000928</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-23T12:15:00</VisitEnd>
                  <VisitStart>2021-03-23T12:00:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000932</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-23T13:15:00</VisitEnd>
                  <VisitStart>2021-03-23T13:00:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000935</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-23T14:00:00</VisitEnd>
                  <VisitStart>2021-03-23T13:45:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000959</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-29T12:00:00</VisitEnd>
                  <VisitStart>2021-03-29T11:45:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000962</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-29T12:45:00</VisitEnd>
                  <VisitStart>2021-03-29T12:30:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000964</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-29T13:15:00</VisitEnd>
                  <VisitStart>2021-03-29T13:00:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000966</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-29T13:45:00</VisitEnd>
                  <VisitStart>2021-03-29T13:30:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000993</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-30T12:30:00</VisitEnd>
                  <VisitStart>2021-03-30T12:15:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000995</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-30T13:00:00</VisitEnd>
                  <VisitStart>2021-03-30T12:45:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000000997</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-03-30T13:30:00</VisitEnd>
                  <VisitStart>2021-03-30T13:15:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000001025</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-04-05T12:30:00</VisitEnd>
                  <VisitStart>2021-04-05T12:15:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000001027</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-04-05T13:00:00</VisitEnd>
                  <VisitStart>2021-04-05T12:45:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000001029</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-04-05T13:30:00</VisitEnd>
                  <VisitStart>2021-04-05T13:15:00</VisitStart>
               </Appointment>
               <Appointment>
                  <Address xsi:nil="true"/>
                  <IdAppointment>00000000000000001040</IdAppointment>
                  <Num xsi:nil="true"/>
                  <Room/>
                  <VisitEnd>2021-04-06T12:15:00</VisitEnd>
                  <VisitStart>2021-04-06T12:00:00</VisitStart>
               </Appointment>
            </ListAppointments>
         </m:GetAvaibleAppointmentsResult>
      </m:GetAvaibleAppointmentsResponse>
   </soap:Body>
</soap:Envelope>
''';