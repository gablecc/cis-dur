using System;

namespace Zadatak1
{
    class Program
    {
        static void Izracun(int broj, out int zbrojDjelitelja, out int zbrojDo)
        {
            zbrojDjelitelja = 0;
            zbrojDo = 0;
            if (broj < 1 || broj > 1000)
            {
                throw new ArgumentOutOfRangeException("Broj mora biti izmedu 1 i 1000.");

            }
            for (int i=1; i <= broj; i++)
            {if (broj % i == 0)
                    zbrojDjelitelja += i;
                    zbrojDo += i;
            }
        }
        static void Main(string[] args)
        {
            var nastavi = true;
            do
            {
                try
                {
                    var unos = Console.ReadLine();
                    if (string.IsNullOrEmpty(unos))
                    {
                        nastavi = false;
                    }
                    else
                    {
                        var ok = int.TryParse(unos, out int broj);
                        if (!ok)
                        {
                            Console.WriteLine("Pogresan format.");
                            continue;
                        }
                        Izracun(broj, out int zbrojDjelitelja, out int zbrojDo);
                        Console.WriteLine("Za broj { 0}"
                        +"zbroj djelitelja je { 1}"
                       + "a zbroj svih brojeva do broja { 0}"
                        +"je { 2}", broj, zbrojDjelitelja, zbrojDo);
                    }
                }
                catch(Exception ex)
                {
                    Console.WriteLine("Dogodila se pogreska. Tekst:{0}", ex.Message);
                }
            } while (true);
        }
    }
}
