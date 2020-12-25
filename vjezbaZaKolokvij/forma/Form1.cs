using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using forma;
using System.IO;

namespace forma
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        List<Polaznik> polaznici = new List<Polaznik>();

        private void btnDodaj_Click(object sender, EventArgs e)
        {
            var ok = DateTime.TryParse(txtDatumUpisa.Text, out DateTime datum);
            if(!ok)
            {
                MessageBox.Show("Pogrešan format datuma.");
                return;
            }
            ok = double.TryParse(txtDug.Text, out double dug);
            if (!ok)
            {
                MessageBox.Show("Pogrešan format duga.");
                return;
            }
            var polaznik = new Polaznik
            {
                Ime = txtIme.Text,
                Prezime=txtPrezime.Text,
                Oib=txtOib.Text,
                DatumUpisa=datum,
                Dug=dug
            
            };
            polaznici.Add(polaznik);
            AzurirajListBox();
        }
        void AzurirajListBox()
        {
            lstPolaznici.DataSource = null;
            lstPolaznici.DataSource = polaznici;
         
            lstPolaznici.DisplayMember = "Prezime";
        }

        private void btnSpremi_Click(object sender, EventArgs e)
        {
            var datoteka = new StreamWriter("polaznici.txt");
            {
                foreach (var polaznik in polaznici)
                {
                    datoteka.WriteLine($"{polaznik.Ime};{polaznik.Prezime};" +
                        $"{polaznik.Oib};{polaznik.DatumUpisa}" +
                        $"{polaznik.Dug}");
                }
                MessageBox.Show("Datoteka spremljena.");
                datoteka.Close();
            }
        }

       

        private void btnUcitaj_Click(object sender, EventArgs e)
        {
            polaznici.Clear();
            var redovi = File.ReadAllLines("polaznici.txt");
            foreach(var red in redovi){
                var stupci = red.Split(";");
                var ok = DateTime.TryParse(stupci[3], out DateTime datum);
                if (!ok)
                {
                    MessageBox.Show("Pogresan format datuma");
                }
                ok = double.TryParse(stupci[4], out double dug);
                if (!ok)
                {
                    MessageBox.Show("Pogresan format duga.");
                }

                var polaznik = new Polaznik
                {
                    Ime = stupci[0],
                    Prezime = stupci[1],
                    Oib = stupci[2],
                    DatumUpisa = datum,
                    Dug = dug
                };
                polaznici.Add(polaznik);
            }
            AzurirajListBox();
        }
    }

    
}
