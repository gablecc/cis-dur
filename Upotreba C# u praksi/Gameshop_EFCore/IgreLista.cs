﻿using Gameshop_EFCore.Db;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Gameshop_EFCore
{
	public partial class IgreLista : Form
	{
		List<Game> igre = new List<Game>();
		

		//TODO: Ubaci context u constructor
		public IgreLista()
		{
			InitializeComponent();			
			
		}

		private void KatalogForma_Load(object sender, EventArgs e)
		{
			//TODO: Učitaj sve igre
			dgvIgre.DataSource = igre;
		}

		private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
		{
			if(e.ClickedItem.Name != "tsbObrisi")
			{
				//TODO: pošalji context edit formi
				var editForma = new IgreEdit();
				if(e.ClickedItem.Name == "tsbUredi")
				{
					editForma.Id = Convert.ToInt32(dgvIgre.CurrentRow.Cells[0].Value);
				}
				var result = editForma.ShowDialog();
				if(result == DialogResult.OK)
				{
					if(e.ClickedItem.Name == "tsbNovi")
					{
						igre.Add(editForma.Igra);
						AzurirajGrid();
					}
					else
					{
						var igra = (Game)dgvIgre.CurrentRow.DataBoundItem;
						igra.Title = editForma.Igra.Title;
						igra.Price = editForma.Igra.Price;
						igra.ReleaseDate = editForma.Igra.ReleaseDate;
						igra.IdDeveloper = editForma.Igra.IdDeveloper;
						igra.IdPublisher = editForma.Igra.IdPublisher;
						igra.IdGenre = editForma.Igra.IdGenre;
					}
				}

			}
			else
			{
				var yesno = MessageBox.Show("Obrisati zapis?", "Poruka", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
				if(yesno == DialogResult.Yes)
				{
					//TODO: Obriši zapis
					igre.Remove((Game)dgvIgre.CurrentRow.DataBoundItem);
					AzurirajGrid();
				}
			}
		}

		void AzurirajGrid()
		{
			dgvIgre.DataSource = null;
			dgvIgre.DataSource = igre;
		}
		
	}
}
