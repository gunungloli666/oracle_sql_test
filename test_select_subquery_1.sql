Select
Ab.Pengarang 
,Ab.Jenis 
,(
Select Tebal  From Mamat.Makan Mt Where Mt.Pengarang = Ab.Pengarang 
And Jenis = 2 
)  Tbl
From Mamat.Makan Ab   Order By Ab.Pengarang
; 