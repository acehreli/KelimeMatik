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
		SoruListesiDoldur();
	}
	
	private void SoruListesiDoldur()
	{
		File data = File(_soruDosyasi, "rb");
	
		int i = 0;
		while (!data.eof)
		{
			string satir = data.readln();
			string[] soru = split(satir, ":");
		
			if (!data.eof)
			{
				_soruListesi.length = i + 1;
				_soruListesi[i] = Soru(soru[0], soru[1]);
				
				++i;
			}
		}
	}
	
	public Soru[] VerSoruListesi()
	{
		return _soruListesi;
	}
}	
