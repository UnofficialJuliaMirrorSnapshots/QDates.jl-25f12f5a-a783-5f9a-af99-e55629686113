# query.jl

# Name functions
mtk = QDates.QDate(2017,1,1) #先勝
ksrg = QDates.QDate(2017,2,1) #友引
yyi = QDates.QDate(2017,3,1) #先負
udk = QDates.QDate(2017,4,1) #仏滅
stk = QDates.QDate(2017,5,1) #大安
lstk = QDates.QDate(2017,5,true,1) #大安
mndk = QDates.QDate(2017,6,1) #赤口
fdk = QDates.QDate(2017,7,1) #先勝
hdk = QDates.QDate(2017,8,1) #友引
ngtk = QDates.QDate(2017,9,1) #先負
kmndk = QDates.QDate(2017,10,1) #仏滅
smtk = QDates.QDate(2017,11,1) #大安
sws = QDates.QDate(2017,12,1) #赤口

monthnames = ["睦月","如月","弥生","卯月","皐月","閏皐月","水無月",
              "文月","葉月","長月","神無月","霜月","師走"]
daysofweek = [QDates.先勝,QDates.友引,QDates.先負,QDates.仏滅,QDates.大安,QDates.大安,QDates.赤口,
              QDates.先勝,QDates.友引,QDates.先負,QDates.仏滅,QDates.大安,QDates.赤口]
dows = ["先勝","友引","先負","仏滅","大安","大安","赤口",
        "先勝","友引","先負","仏滅","大安","赤口"]
daysinmonth = [29,30,29,30,29,29,30,29,30,29,30,30,30]
for (i,qdt) in enumerate([mtk,ksrg,yyi,udk,stk,lstk,mndk,fdk,hdk,ngtk,kmndk,smtk,sws])
    let m = i > 5 ? (i - 1) : i
        @test QDates.month(qdt) == m
        @test QDates.monthname(qdt) == monthnames[i]
        @test QDates.monthname(m) == monthnames[i == 6 ? 5 : i]
        @test QDates.monthabbr(qdt) == monthnames[i]
        @test QDates.monthabbr(m) == monthnames[i == 6 ? 5 : i]
        @test QDates.dayofweek(qdt) == daysofweek[i]
        @test QDates.dayname(qdt) == dows[i]
        @test QDates.dayabbr(qdt) == dows[i]
        @test QDates.daysinmonth(qdt) == daysinmonth[i]
    end
end

@test QDates.is先勝(mtk)

@test QDates.isleapyear(QDates.QDate(2010)) == false
@test QDates.isleapyear(QDates.QDate(2012)) == true
@test QDates.isleapyear(QDates.QDate(2016)) == false
@test QDates.isleapyear(QDates.QDate(2017)) == true

@test QDates.daysinyear(QDates.QDate(2010)) == 354
@test QDates.daysinyear(QDates.QDate(2017)) == 384

@test QDates.dayofyear(2017,1,1) == 1
@test QDates.dayofyear(2017,5,1) == 119
@test QDates.dayofyear(2017,5,true,1) == 148
@test QDates.dayofyear(QDates.QDate(2017,1,1)) == 1
@test QDates.dayofyear(QDates.QDate(2017,5,1)) == 119
@test QDates.dayofyear(QDates.QDate(2017,5,true,1)) == 148
