namespace TiendaTRIGANE
{
    partial class FrmTraducciones
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.comboBoxIdiomas = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.dataGridViewPalabras = new System.Windows.Forms.DataGridView();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnActualizar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewPalabras)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(328, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(154, 25);
            this.label1.TabIndex = 0;
            this.label1.Tag = "translations";
            this.label1.Text = "Traducciones";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(592, 33);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(167, 17);
            this.progressBar1.TabIndex = 1;
            // 
            // comboBoxIdiomas
            // 
            this.comboBoxIdiomas.FormattingEnabled = true;
            this.comboBoxIdiomas.Location = new System.Drawing.Point(618, 102);
            this.comboBoxIdiomas.Name = "comboBoxIdiomas";
            this.comboBoxIdiomas.Size = new System.Drawing.Size(130, 21);
            this.comboBoxIdiomas.TabIndex = 2;
            this.comboBoxIdiomas.SelectedIndexChanged += new System.EventHandler(this.comboBoxIdiomas_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(614, 79);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 20);
            this.label2.TabIndex = 3;
            this.label2.Tag = "language";
            this.label2.Text = "Idioma";
            // 
            // dataGridViewPalabras
            // 
            this.dataGridViewPalabras.AllowUserToAddRows = false;
            this.dataGridViewPalabras.AllowUserToDeleteRows = false;
            this.dataGridViewPalabras.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridViewPalabras.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewPalabras.Location = new System.Drawing.Point(29, 130);
            this.dataGridViewPalabras.MultiSelect = false;
            this.dataGridViewPalabras.Name = "dataGridViewPalabras";
            this.dataGridViewPalabras.ReadOnly = true;
            this.dataGridViewPalabras.RowHeadersVisible = false;
            this.dataGridViewPalabras.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewPalabras.Size = new System.Drawing.Size(371, 229);
            this.dataGridViewPalabras.TabIndex = 4;
            this.dataGridViewPalabras.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dataGridViewPalabras_CellFormatting);
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(24, 434);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(546, 132);
            this.richTextBox1.TabIndex = 5;
            this.richTextBox1.Text = "";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(25, 411);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(87, 20);
            this.label4.TabIndex = 6;
            this.label4.Tag = "translations";
            this.label4.Text = "Traduccion";
            // 
            // btnActualizar
            // 
            this.btnActualizar.Location = new System.Drawing.Point(37, 596);
            this.btnActualizar.Name = "btnActualizar";
            this.btnActualizar.Size = new System.Drawing.Size(533, 39);
            this.btnActualizar.TabIndex = 7;
            this.btnActualizar.Tag = "update";
            this.btnActualizar.Text = "Actualizar";
            this.btnActualizar.UseVisualStyleBackColor = true;
            this.btnActualizar.Click += new System.EventHandler(this.btnActualizar_Click);
            // 
            // FrmTraducciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 666);
            this.Controls.Add(this.btnActualizar);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.dataGridViewPalabras);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.comboBoxIdiomas);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.label1);
            this.Name = "FrmTraducciones";
            this.Text = "FrmTraducciones";
            this.Load += new System.EventHandler(this.FrmTraducciones_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewPalabras)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.ComboBox comboBoxIdiomas;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dataGridViewPalabras;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnActualizar;
    }
}