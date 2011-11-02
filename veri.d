module veri;

import std.stdio;
import std.file;
import std.array;
import std.xml;

struct Kelime
{
	string no;
	string soru;
	string cevap;
}

class Veri
{
	private Kelime[] _kelimeListesi; 
	private string _kelimeDosyasi;
	
	public this(string veriDosyasi)
	{
		assert(exists(veriDosyasi), "Hata, dosya bulunamadi!");
		
		_kelimeDosyasi = veriDosyasi;
		KelimeListesiHazirla();
	}

	private void KelimeListesiHazirla()
	{
		string s = cast(string)std.file.read(_kelimeDosyasi); 
	
		// XML formatını kontrol et
		check(s); 
	
		DocumentParser xml = new DocumentParser(s); 
		xml.onStartTag["kelime"] = (ElementParser xml) 
		{ 
			Kelime kelime;
			kelime.no = xml.tag.attr["no"]; 
		
			xml.onEndTag["soru"] = (in Element e) { kelime.soru = e.text; }; 
			xml.onEndTag["cevap"] = (in Element e) { kelime.cevap = e.text; }; 
		
			xml.parse(); 
		
			_kelimeListesi ~= kelime;
		}; 
		
		xml.parse(); 
	}
	
	public Kelime[] VerKelimeListesi()
	{
		return _kelimeListesi;
	}
}

