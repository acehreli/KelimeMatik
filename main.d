import std.stdio;
import std.array;

import egzersiz;

void main()
{
	Egzersiz calisma = new Egzersiz("data.txt");
	
	Soru[] soruListe = calisma.VerSoruListesi();
	
	foreach (soru; soruListe)
	{
		writeln("Soru : ", soru.soruKelime);
		
		write("Cevap : ");
		string cevap = readln();
		
		if (cevap == soru.cevapKelime)
		{
			writeln("Tebrikler! dogru cevap");
		}
		else
		{
			writeln("Uzgunum! yanlis cevap");
		}
	}
}


