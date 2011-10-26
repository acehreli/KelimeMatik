import std.stdio;
import std.file;
import std.array;

struct Soru
{
	string soruKelime;
	string cevapKelime;
}

class Egzersiz
{
	private Soru[] _soruListesi; 
	private string _soruDosyasi;
	
	public this(string dosyaAdresi)
	{
		//assert(exists(dosyaAdresi) == false, "hata");
		
		_soruDosyasi = dosyaAdresi;
		SoruListesiHazirla();
	}
	
	private void SoruListesiHazirla()
	{
		File dosya = File(_soruDosyasi, "rb");

		foreach (satir; dosya.byLine())
		{
			string[] soru = cast(string[])split(satir.dup, ":");
		
			_soruListesi ~= Soru(soru[0], soru[1]);
		}
	}
	
	public Soru[] VerSoruListesi()
	{
		return _soruListesi;
	}
}	
