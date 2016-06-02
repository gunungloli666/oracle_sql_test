-- contoh penggunaan multiset 
Set Serveroutput On; 
Declare 

cursor p_app
is
Select
Ab.Pengarang 
, 
Ab.Jenis 
,
cast(multiset(
Select Tebal  From Mamat.Makan Mt Where Mt.Pengarang = Ab.Pengarang 
  )   as Mamat.T_number  )    Tbl
From Mamat.Makan Ab   Order By Ab.Pengarang 
; 

Type Tebal is Table of  Mamat.T_number; 
Type Pengarang Is Table Of Mamat.Makan.Pengarang%Type;
Type Jenis Is Table Of Mamat.Makan.Jenis%Type; 

V_Pengarang    Pengarang; 
V_Tebal        Tebal ; 
v_Jenis        Jenis; 

My_Number Mamat.T_Number; 
Number_A     Number(5); 
number_B     Number(5); 

my_pengarang   Mamat.Makan.Pengarang%Type ; 

Begin
  Begin
    Open P_App ; 
    Loop Fetch p_App bulk collect Into 
         V_Pengarang
        ,v_Jenis
        ,V_Tebal
      ; 
     If(V_Tebal.Count > 0)Then  
      For i In V_Tebal.First .. V_Tebal.Last 
      Loop 
        My_Number := V_Tebal(I) ; 
        My_Pengarang := V_Pengarang(I); 
        Dbms_Output.Put(my_pengarang || ' ==> '); 
        For J In My_Number.First .. My_Number.Last 
        Loop
          Number_A := My_Number(J); 
          Dbms_Output.Put('j = ' || Number_A ||' | ' );
        End Loop; 
        Dbms_Output.New_Line; 
      end loop; 
      End If;
    Exit When P_App%Notfound;  
    End Loop; 
    close p_app; 
  end; 
end ; 

