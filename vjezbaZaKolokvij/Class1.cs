using System;
using System.Collections.Generic;
using System.Text;

namespace forma 
{
    public class Polaznik

    {


        private string ime, prezime, oib;
        private DateTime datumUpisa;
        private double dug;

        public string Ime { get => ime;
            set {
                if (string.IsNullOrEmpty)
                    throw new ArgumentException("Ime ne smije biti prazno.")
                 ime = value;
            }
        }

        public string Prezime { get => prezime;
            set {
                if (string.IsNullOrEmpty)
                    throw new ArgumentException("Prezime ne smije biti prazno.")
                        prezime = value;
            }
        }

        public string Oib { get => oib;
            set {
                if (value.Length != 11)
                    throw new ArgumentException("OIB mora imati 11 znakova.")
                oib = value;
            }
        }
        public DateTime DatumUpisa
        {
            get => datumUpisa;
            set { if (value > DateTime.Now)
                    throw new ArgumentException("Datum ne smije biti u budućnosti.")
                datumUpisa = value;
            }
        }
        public double Dug { get => dug;
            set {
                if (value < 0)
                    throw new ArgumentException("Dug ne smije biti negativan.")
                dug = value;
            }
        }
    }
}
