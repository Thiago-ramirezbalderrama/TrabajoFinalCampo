namespace TiendaTRIGANE
{
    partial class FrmCambiarClave
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
            this.ctrlTexto1 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto2 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto3 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.button1 = new System.Windows.Forms.Button();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(254, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(223, 25);
            this.label1.TabIndex = 0;
            this.label1.Tag = "change_password";
            this.label1.Text = "Cambiar contraseña";
            // 
            // ctrlTexto1
            // 
            this.ctrlTexto1.Etiqueta = "Ingrese su contraseña actual";
            this.ctrlTexto1.isPassword = false;
            this.ctrlTexto1.Location = new System.Drawing.Point(51, 119);
            this.ctrlTexto1.MaxLenght = 32767;
            this.ctrlTexto1.Name = "ctrlTexto1";
            this.ctrlTexto1.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto1.TabIndex = 1;
            this.ctrlTexto1.Tag = "input_currentpassword";
            this.ctrlTexto1.Texto = "";
            // 
            // ctrlTexto2
            // 
            this.ctrlTexto2.Etiqueta = "Ingrese su nueva contraseña";
            this.ctrlTexto2.isPassword = false;
            this.ctrlTexto2.Location = new System.Drawing.Point(51, 182);
            this.ctrlTexto2.MaxLenght = 32767;
            this.ctrlTexto2.Name = "ctrlTexto2";
            this.ctrlTexto2.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto2.TabIndex = 2;
            this.ctrlTexto2.Tag = "input_newpassword";
            this.ctrlTexto2.Texto = "";
            // 
            // ctrlTexto3
            // 
            this.ctrlTexto3.Etiqueta = "Repita la nueva contraseña";
            this.ctrlTexto3.isPassword = false;
            this.ctrlTexto3.Location = new System.Drawing.Point(51, 255);
            this.ctrlTexto3.MaxLenght = 32767;
            this.ctrlTexto3.Name = "ctrlTexto3";
            this.ctrlTexto3.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto3.TabIndex = 3;
            this.ctrlTexto3.Tag = "input_repeatpassword";
            this.ctrlTexto3.Texto = "";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(51, 338);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(215, 40);
            this.button1.TabIndex = 4;
            this.button1.Tag = "change_password";
            this.button1.Text = "Cambiar contraseña";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(51, 406);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(215, 32);
            this.progressBar1.TabIndex = 5;
            // 
            // FrmCambiarClave
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.ctrlTexto3);
            this.Controls.Add(this.ctrlTexto2);
            this.Controls.Add(this.ctrlTexto1);
            this.Controls.Add(this.label1);
            this.Name = "FrmCambiarClave";
            this.Text = "FrmCambiarClave";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmCambiarClave_FormClosing);
            this.Load += new System.EventHandler(this.FrmCambiarClave_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private Controles_personalizados.ctrlTexto ctrlTexto1;
        private Controles_personalizados.ctrlTexto ctrlTexto2;
        private Controles_personalizados.ctrlTexto ctrlTexto3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ProgressBar progressBar1;
    }
}