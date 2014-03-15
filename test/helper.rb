# encoding: UTF-8

class RubyARESTestHelper

  def self.subject_xml
<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<are:Ares_odpovedi xmlns:are="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_answer_rzp/v_1.0.4" xmlns:dtt="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_datatypes/v_1.0.4" xmlns:udt="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/uvis_datatypes/v_1.0.1" odpoved_datum_cas="2012-10-05T21:43:57" odpoved_pocet="1" odpoved_typ="Vypis_RZP" vystup_format="XML" xslt="klient" validation_XSLT="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_odpovedi.xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_answer_rzp/v_1.0.4 http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_answer_rzp/v_1.0.4/ares_answer_rzp_v_1.0.4.xsd" Id="ares">
<are:Odpoved>
<dtt:Pomocne_ID>1</dtt:Pomocne_ID>
<dtt:Vysledek_hledani>
<dtt:Kod>1</dtt:Kod>
</dtt:Vysledek_hledani>
<dtt:Pocet_zaznamu>1</dtt:Pocet_zaznamu>
<dtt:Uvod>
<dtt:Nadpis>Výpis z IS rzp</dtt:Nadpis>
<dtt:Aktualizace_DB>2012-10-04</dtt:Aktualizace_DB>
<dtt:Datum_vypisu>2012-10-05</dtt:Datum_vypisu>
<dtt:Cas_vypisu>21:43:59</dtt:Cas_vypisu>
<dtt:Typ_vypisu>zakladni</dtt:Typ_vypisu>
<dtt:Typ_odkazu>0</dtt:Typ_odkazu>
</dtt:Uvod>
<dtt:Vypis_RZP>
<dtt:Zakladni_udaje>
<dtt:Stav>A</dtt:Stav>
<dtt:Datum_zmeny>2012-07-23</dtt:Datum_zmeny>
<dtt:ICO>27074358</dtt:ICO>
<dtt:Obchodni_firma>Asseco Central Europe, a.s.</dtt:Obchodni_firma>
<dtt:Pravni_forma>
<dtt:Kod_PF>121</dtt:Kod_PF>
<dtt:Nazev_PF>Akciová společnost</dtt:Nazev_PF>
<dtt:PF_osoba>P</dtt:PF_osoba>
<dtt:Text>právnická osoba tuzemská</dtt:Text>
</dtt:Pravni_forma>
<dtt:Zivnostensky_urad>
<dtt:Kod_ZU>310009</dtt:Kod_ZU>
<dtt:Nazev_ZU>Úřad městské části Praha 9</dtt:Nazev_ZU>
</dtt:Zivnostensky_urad>
<dtt:Prvni_zivnost>2004-03-22</dtt:Prvni_zivnost>
<dtt:Vsech_zivnosti>26</dtt:Vsech_zivnosti>
<dtt:Aktivnich_zivnosti>5</dtt:Aktivnich_zivnosti>
<dtt:Aktivnich_provozoven>ano</dtt:Aktivnich_provozoven>
</dtt:Zakladni_udaje>
<dtt:Adresy>
<dtt:Adresa kvadres="1">
<dtt:ID_adresy>18785610</dtt:ID_adresy>
<dtt:Nazev_obce>Praha</dtt:Nazev_obce>
<dtt:Nazev_casti_obce>Libeň</dtt:Nazev_casti_obce>
<dtt:Nazev_ulice>Podvinný mlýn</dtt:Nazev_ulice>
<dtt:Cislo_domovni>2178</dtt:Cislo_domovni>
<dtt:Typ_cislo_domovni>1</dtt:Typ_cislo_domovni>
<dtt:Cislo_orientacni>6</dtt:Cislo_orientacni>
<dtt:PSC>19000</dtt:PSC>
</dtt:Adresa>
</dtt:Adresy>
<dtt:Osoby>
<dtt:Osoba>
<dtt:Role>S</dtt:Role>
<dtt:Jmeno>Josef</dtt:Jmeno>
<dtt:Prijmeni>Klein</dtt:Prijmeni>
<dtt:Datum_narozeni>1961-10-21</dtt:Datum_narozeni>
<dtt:Titul_pred>RNDr.</dtt:Titul_pred>
<dtt:Bydliste>
<dtt:ID_adresy>18785611</dtt:ID_adresy>
<dtt:Kod_statu>703</dtt:Kod_statu>
<dtt:Nazev_statu>Slovenská republika</dtt:Nazev_statu>
<dtt:Nazev_obce>Bratislava</dtt:Nazev_obce>
<dtt:Nazev_ulice>Trstínská</dtt:Nazev_ulice>
<dtt:Cislo_domovni>51</dtt:Cislo_domovni>
<dtt:PSC>84106</dtt:PSC>
</dtt:Bydliste>
</dtt:Osoba>
<dtt:Osoba>
<dtt:Role>S</dtt:Role>
<dtt:Jmeno>Radek</dtt:Jmeno>
<dtt:Prijmeni>Levíček</dtt:Prijmeni>
<dtt:Datum_narozeni>1965-06-10</dtt:Datum_narozeni>
<dtt:Titul_pred>Ing.</dtt:Titul_pred>
<dtt:Bydliste>
<dtt:ID_adresy>18785612</dtt:ID_adresy>
<dtt:Nazev_obce>Brno</dtt:Nazev_obce>
<dtt:Nazev_casti_obce>Staré Brno</dtt:Nazev_casti_obce>
<dtt:Nazev_ulice>Pellicova</dtt:Nazev_ulice>
<dtt:Cislo_domovni>656</dtt:Cislo_domovni>
<dtt:Typ_cislo_domovni>1</dtt:Typ_cislo_domovni>
<dtt:Cislo_orientacni>49</dtt:Cislo_orientacni>
<dtt:PSC>60200</dtt:PSC>
</dtt:Bydliste>
</dtt:Osoba>
<dtt:Osoba>
<dtt:Role>S</dtt:Role>
<dtt:Jmeno>David</dtt:Jmeno>
<dtt:Prijmeni>Stoppani</dtt:Prijmeni>
<dtt:Datum_narozeni>1981-08-16</dtt:Datum_narozeni>
<dtt:Titul_pred>Ing.</dtt:Titul_pred>
<dtt:Bydliste>
<dtt:ID_adresy>18785613</dtt:ID_adresy>
<dtt:Nazev_obce>Zlín</dtt:Nazev_obce>
<dtt:Nazev_casti_obce>Zlín</dtt:Nazev_casti_obce>
<dtt:Nazev_ulice>Podlesí IV</dtt:Nazev_ulice>
<dtt:Cislo_domovni>4960</dtt:Cislo_domovni>
<dtt:Typ_cislo_domovni>1</dtt:Typ_cislo_domovni>
<dtt:PSC>76005</dtt:PSC>
</dtt:Bydliste>
</dtt:Osoba>
<dtt:Osoba>
<dtt:Role>S</dtt:Role>
<dtt:Jmeno>Miroslav</dtt:Jmeno>
<dtt:Prijmeni>Řezníček</dtt:Prijmeni>
<dtt:Datum_narozeni>1969-07-16</dtt:Datum_narozeni>
<dtt:Titul_pred>Ing.</dtt:Titul_pred>
<dtt:Bydliste>
<dtt:ID_adresy>18785614</dtt:ID_adresy>
<dtt:Nazev_obce>Praha</dtt:Nazev_obce>
<dtt:Nazev_casti_obce>Prosek</dtt:Nazev_casti_obce>
<dtt:Nazev_ulice>Valečovská</dtt:Nazev_ulice>
<dtt:Cislo_domovni>837</dtt:Cislo_domovni>
<dtt:Typ_cislo_domovni>1</dtt:Typ_cislo_domovni>
<dtt:Cislo_orientacni>1</dtt:Cislo_orientacni>
<dtt:PSC>19000</dtt:PSC>
</dtt:Bydliste>
</dtt:Osoba>
</dtt:Osoby>
<dtt:Zivnosti>
<dtt:Zivnost>
<dtt:Stav>A</dtt:Stav>
<dtt:Druh>L</dtt:Druh>
<dtt:Predmet_podnikani>
Výroba, obchod a služby neuvedené v přílohách 1 až 3 živnostenského zákona
</dtt:Predmet_podnikani>
<dtt:Obory_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Vydavatelské činnosti, polygrafická výroba, knihařské a kopírovací práce
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Zprostředkování obchodu a služeb
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Velkoobchod a maloobchod
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Skladování, balení zboží, manipulace s nákladem a technické činnosti v dopravě
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Zasilatelství a zastupování v celním řízení
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Ubytovací služby
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Poskytování software, poradenství v oblasti informačních technologií,
zpracování dat, hostingové a související činnosti a webové portály
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Poradenská a konzultační činnost, zpracování odborných studií a posudků
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Příprava a vypracování technických návrhů, grafické a kresličské práce
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Projektování elektrických zařízení
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Výzkum a vývoj v oblasti přírodních a technických věd nebo společenských věd
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Testování, měření, analýzy a kontroly
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Reklamní činnost, marketing, mediální zastoupení
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Služby v oblasti administrativní správy a služby organizačně hospodářské povahy
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Mimoškolní výchova a vzdělávání, pořádání kurzů, školení, včetně lektorské
činnosti
</dtt:Text>
</dtt:Obor_cinnosti>
<dtt:Obor_cinnosti>
<dtt:Text>
Výroba, obchod a služby jinde nezařazené
</dtt:Text>
</dtt:Obor_cinnosti>
</dtt:Obory_cinnosti>
<dtt:Vznik>2004-03-22</dtt:Vznik>
</dtt:Zivnost>
<dtt:Zivnost>
<dtt:Stav>A</dtt:Stav>
<dtt:Druh>R</dtt:Druh>
<dtt:Predmet_podnikani>
Výroba, instalace, opravy elektrických strojů a přístrojů, elektronických a
telekomunikačních zařízení
</dtt:Predmet_podnikani>
<dtt:Vznik>2004-03-22</dtt:Vznik>
</dtt:Zivnost>
<dtt:Zivnost>
<dtt:Stav>A</dtt:Stav>
<dtt:Druh>V</dtt:Druh>
<dtt:Predmet_podnikani>
Činnost účetních poradců, vedení účetnictví, vedení daňové evidence
</dtt:Predmet_podnikani>
<dtt:Vznik>2004-04-05</dtt:Vznik>
</dtt:Zivnost>
<dtt:Zivnost>
<dtt:Stav>A</dtt:Stav>
<dtt:Druh>R</dtt:Druh>
<dtt:Predmet_podnikani>
Montáž, opravy, revize a zkoušky elektrických zařízení
</dtt:Predmet_podnikani>
<dtt:Vznik>2004-04-05</dtt:Vznik>
</dtt:Zivnost>
<dtt:Zivnost>
<dtt:Stav>A</dtt:Stav>
<dtt:Druh>K</dtt:Druh>
<dtt:Predmet_podnikani>
Poskytování technických služeb k ochraně majetku a osob
</dtt:Predmet_podnikani>
<dtt:Vznik>2010-04-12</dtt:Vznik>
</dtt:Zivnost>
</dtt:Zivnosti>
</dtt:Vypis_RZP>
</are:Odpoved>
</are:Ares_odpovedi>
EOF
  end

  def self.error_responce_xml
<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<are:Ares_odpovedi xmlns:are="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_answer_rzp/v_1.0.4" xmlns:dtt="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_datatypes/v_1.0.4" xmlns:udt="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/uvis_datatypes/v_1.0.1" odpoved_datum_cas="2012-12-02T23:05:21" odpoved_pocet="1" odpoved_typ="Vypis_RZP" vystup_format="XML" xslt="klient" validation_XSLT="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_odpovedi.xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_answer_rzp/v_1.0.4 http://wwwinfo.mfcr.cz/ares/xml_doc/schemas/ares/ares_answer_rzp/v_1.0.4/ares_answer_rzp_v_1.0.4.xsd" Id="ares">
<are:Odpoved>
<dtt:Pomocne_ID>1</dtt:Pomocne_ID>
<dtt:Error>
<dtt:Error_kod>1</dtt:Error_kod>
<dtt:Error_text>
Chyba 31 - nezadán žádný vyhledávací klíč
</dtt:Error_text>
</dtt:Error>
<dtt:Vysledek_hledani>
<dtt:Kod>2</dtt:Kod>
</dtt:Vysledek_hledani>
<dtt:Pocet_zaznamu>0</dtt:Pocet_zaznamu>
</are:Odpoved>
</are:Ares_odpovedi>
EOF
  end
end
