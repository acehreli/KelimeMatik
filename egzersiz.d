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
	
		Kelime[] kelimeListe = veriler.VerKelimeListesi();
	
		foreach (kelime; kelimeListe)
		{
			EkraniTemizle();
			
			writeln("Soru  : ", kelime.soru);
			
			write("Cevap : ");
			string cevap = chomp(readln());

			if (toLower(cevap) == toLower(kelime.cevap))
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
