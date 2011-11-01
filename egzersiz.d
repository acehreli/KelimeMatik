module egzersiz;

import std.stdio;
import std.array;
import std.string;
import std.process;

import veri;

class Egzersiz
{
	private string _dosyaAdresi	;
	
	public this(string dosyaAdresi)
	{
		_dosyaAdresi = dosyaAdresi;
	}
	
	public void EgzersizBaslat()
	{
		Veri veriler = new Veri(_dosyaAdresi);
	
		Soru[] soruListe = veriler.VerSoruListesi();
	
		foreach (soru; soruListe)
		{
			EkraniTemizle();
			
			writeln("Soru  : ", soru.soruKelime);
			
			write("Cevap : ");
			string cevap = chomp(readln());

			if (toLower(cevap) == toLower(soru.cevapKelime))
			{
				writeln("Tebrikler! dogru cevap");
			}
			else
			{
				writeln("Uzgunum! yanlis cevap");
			}
		}	
	}
	
	void EkraniTemizle()
	{
		system("clear");
	}
}	
