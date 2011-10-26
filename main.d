import std.stdio;
import std.array;
import std.string;

import egzersiz;

void main()
{
	Egzersiz calisma = new Egzersiz("data.txt");
	
	Soru[] soruListe = calisma.VerSoruListesi();
	
	foreach (soru; soruListe)
	{
		writeln("Soru : ", soru.soruKelime);
		
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


