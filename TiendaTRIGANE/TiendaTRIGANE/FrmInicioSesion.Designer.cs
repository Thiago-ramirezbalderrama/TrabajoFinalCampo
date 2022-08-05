namespace TiendaTRIGANE
{
    partial class FrmInicioSesion
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
            this.ctrlNum1 = new TiendaTRIGANE.Controles_personalizados.ctrlNum();
            this.ctrlTexto1 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ctrlNum1
            // 
            this.ctrlNum1.Etiqueta = "DNI";
            this.ctrlNum1.isPassword = false;
            this.ctrlNum1.Location = new System.Drawing.Point(96, 57);
            this.ctrlNum1.MaxLenght = 32767;
            this.ctrlNum1.Name = "ctrlNum1";
            this.ctrlNum1.Size = new System.Drawing.Size(215, 57);
            this.ctrlNum1.TabIndex = 0;
            this.ctrlNum1.Tag = "dni";
            this.ctrlNum1.Texto = "";
            // 
            // ctrlTexto1
            // 
            this.ctrlTexto1.Etiqueta = "Contraseña";
            this.ctrlTexto1.isPassword = true;
            this.ctrlTexto1.Location = new System.Drawing.Point(96, 158);
            this.ctrlTexto1.MaxLenght = 32767;
            this.ctrlTexto1.Name = "ctrlTexto1";
            this.ctrlTexto1.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto1.TabIndex = 1;
            this.ctrlTexto1.Tag = "password";
            this.ctrlTexto1.Texto = "";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(96, 269);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(215, 23);
            this.progressBar1.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(130, 240);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(133, 23);
            this.button1.TabIndex = 3;
            this.button1.Tag = "login";
            this.button1.Text = "Iniciar sesion";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // FrmInicioSesion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(422, 304);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.ctrlTexto1);
            this.Controls.Add(this.ctrlNum1);
            this.Name = "FrmInicioSesion";
            this.Text = "FrmInicioSesion";
            this.Load += new System.EventHandler(this.FrmInicioSesion_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Controles_personalizados.ctrlNum ctrlNum1;
        private Controles_personalizados.ctrlTexto ctrlTexto1;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.Button button1;
    }
}