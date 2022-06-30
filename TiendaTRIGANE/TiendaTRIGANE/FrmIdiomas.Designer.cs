namespace TiendaTRIGANE
{
    partial class FrmIdiomas
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
            this.dataGridViewIdiomas = new System.Windows.Forms.DataGridView();
            this.btnMostrarDefault = new System.Windows.Forms.Button();
            this.btnHabilitar = new System.Windows.Forms.Button();
            this.btnDeshabilitar = new System.Windows.Forms.Button();
            this.separatorLine = new System.Windows.Forms.Label();
            this.ctrlTexto1 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.btnCrearNuevoIdioma = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewIdiomas)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(341, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(93, 25);
            this.label1.TabIndex = 0;
            this.label1.Tag = "languages";
            this.label1.Text = "Idiomas";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(568, 18);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(194, 34);
            this.progressBar1.TabIndex = 1;
            // 
            // dataGridViewIdiomas
            // 
            this.dataGridViewIdiomas.AllowUserToAddRows = false;
            this.dataGridViewIdiomas.AllowUserToOrderColumns = true;
            this.dataGridViewIdiomas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewIdiomas.Location = new System.Drawing.Point(12, 78);
            this.dataGridViewIdiomas.MultiSelect = false;
            this.dataGridViewIdiomas.Name = "dataGridViewIdiomas";
            this.dataGridViewIdiomas.ReadOnly = true;
            this.dataGridViewIdiomas.RowHeadersVisible = false;
            this.dataGridViewIdiomas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewIdiomas.Size = new System.Drawing.Size(373, 217);
            this.dataGridViewIdiomas.TabIndex = 2;
            this.dataGridViewIdiomas.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dataGridViewIdiomas_CellFormatting);
            this.dataGridViewIdiomas.SelectionChanged += new System.EventHandler(this.dataGridViewIdiomas_SelectionChanged);
            // 
            // btnMostrarDefault
            // 
            this.btnMostrarDefault.Location = new System.Drawing.Point(26, 314);
            this.btnMostrarDefault.Name = "btnMostrarDefault";
            this.btnMostrarDefault.Size = new System.Drawing.Size(101, 35);
            this.btnMostrarDefault.TabIndex = 3;
            this.btnMostrarDefault.Tag = "show_by_default";
            this.btnMostrarDefault.Text = "Mostrar por defecto";
            this.btnMostrarDefault.UseVisualStyleBackColor = true;
            this.btnMostrarDefault.Click += new System.EventHandler(this.btnMostrarDefault_Click);
            // 
            // btnHabilitar
            // 
            this.btnHabilitar.Location = new System.Drawing.Point(26, 355);
            this.btnHabilitar.Name = "btnHabilitar";
            this.btnHabilitar.Size = new System.Drawing.Size(101, 36);
            this.btnHabilitar.TabIndex = 4;
            this.btnHabilitar.Tag = "enable";
            this.btnHabilitar.Text = "Habilitar";
            this.btnHabilitar.UseVisualStyleBackColor = true;
            this.btnHabilitar.Click += new System.EventHandler(this.btnHabilitar_Click);
            // 
            // btnDeshabilitar
            // 
            this.btnDeshabilitar.Location = new System.Drawing.Point(26, 397);
            this.btnDeshabilitar.Name = "btnDeshabilitar";
            this.btnDeshabilitar.Size = new System.Drawing.Size(101, 32);
            this.btnDeshabilitar.TabIndex = 5;
            this.btnDeshabilitar.Tag = "disable";
            this.btnDeshabilitar.Text = "Deshabilitar";
            this.btnDeshabilitar.UseVisualStyleBackColor = true;
            this.btnDeshabilitar.Click += new System.EventHandler(this.btnDeshabilitar_Click);
            // 
            // separatorLine
            // 
            this.separatorLine.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.separatorLine.Location = new System.Drawing.Point(26, 466);
            this.separatorLine.Name = "separatorLine";
            this.separatorLine.Size = new System.Drawing.Size(333, 2);
            this.separatorLine.TabIndex = 20;
            this.separatorLine.Text = "label1";
            // 
            // ctrlTexto1
            // 
            this.ctrlTexto1.Etiqueta = "Nuevo idioma";
            this.ctrlTexto1.isPassword = false;
            this.ctrlTexto1.Location = new System.Drawing.Point(25, 502);
            this.ctrlTexto1.MaxLenght = 32767;
            this.ctrlTexto1.Name = "ctrlTexto1";
            this.ctrlTexto1.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto1.TabIndex = 21;
            this.ctrlTexto1.Tag = "new_language";
            this.ctrlTexto1.Texto = "";
            // 
            // btnCrearNuevoIdioma
            // 
            this.btnCrearNuevoIdioma.Location = new System.Drawing.Point(26, 581);
            this.btnCrearNuevoIdioma.Name = "btnCrearNuevoIdioma";
            this.btnCrearNuevoIdioma.Size = new System.Drawing.Size(184, 34);
            this.btnCrearNuevoIdioma.TabIndex = 22;
            this.btnCrearNuevoIdioma.Tag = "create_new_language";
            this.btnCrearNuevoIdioma.Text = "Crear nuevo idioma";
            this.btnCrearNuevoIdioma.UseVisualStyleBackColor = true;
            this.btnCrearNuevoIdioma.Click += new System.EventHandler(this.btnCrearNuevoIdioma_Click);
            // 
            // FrmIdiomas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 731);
            this.Controls.Add(this.btnCrearNuevoIdioma);
            this.Controls.Add(this.ctrlTexto1);
            this.Controls.Add(this.separatorLine);
            this.Controls.Add(this.btnDeshabilitar);
            this.Controls.Add(this.btnHabilitar);
            this.Controls.Add(this.btnMostrarDefault);
            this.Controls.Add(this.dataGridViewIdiomas);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.label1);
            this.Name = "FrmIdiomas";
            this.Text = "FrmIdiomas";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmIdiomas_FormClosing);
            this.Load += new System.EventHandler(this.FrmIdiomas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewIdiomas)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.DataGridView dataGridViewIdiomas;
        private System.Windows.Forms.Button btnMostrarDefault;
        private System.Windows.Forms.Button btnHabilitar;
        private System.Windows.Forms.Button btnDeshabilitar;
        private System.Windows.Forms.Label separatorLine;
        private Controles_personalizados.ctrlTexto ctrlTexto1;
        private System.Windows.Forms.Button btnCrearNuevoIdioma;
    }
}