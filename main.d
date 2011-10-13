import std.stdio;

void main()
{
	File data = File("data.txt", "rb");
	
	while (!data.eof)
	{
		string satir = data.readln();
		
		writeln(satir);
	}
}
