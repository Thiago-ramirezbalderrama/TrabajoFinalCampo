namespace TiendaTRIGANE
{
    partial class FrmPrimerEmpleado
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
            this.ctrlTexto2 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto1 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto5 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto4 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto3 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.btnRegistrarse = new System.Windows.Forms.Button();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // ctrlNum1
            // 
            this.ctrlNum1.Etiqueta = "DNI";
            this.ctrlNum1.isPassword = false;
            this.ctrlNum1.Location = new System.Drawing.Point(12, 67);
            this.ctrlNum1.MaxLenght = 32767;
            this.ctrlNum1.Name = "ctrlNum1";
            this.ctrlNum1.Size = new System.Drawing.Size(215, 57);
            this.ctrlNum1.TabIndex = 0;
            this.ctrlNum1.Tag = "dni";
            this.ctrlNum1.Texto = "";
            // 
            // ctrlTexto2
            // 
            this.ctrlTexto2.Etiqueta = "Apellido";
            this.ctrlTexto2.isPassword = false;
            this.ctrlTexto2.Location = new System.Drawing.Point(355, 146);
            this.ctrlTexto2.MaxLenght = 32767;
            this.ctrlTexto2.Name = "ctrlTexto2";
            this.ctrlTexto2.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto2.TabIndex = 3;
            this.ctrlTexto2.Tag = "surname";
            this.ctrlTexto2.Texto = "";
            // 
            // ctrlTexto1
            // 
            this.ctrlTexto1.Etiqueta = "Nombre";
            this.ctrlTexto1.isPassword = false;
            this.ctrlTexto1.Location = new System.Drawing.Point(12, 146);
            this.ctrlTexto1.MaxLenght = 32767;
            this.ctrlTexto1.Name = "ctrlTexto1";
            this.ctrlTexto1.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto1.TabIndex = 2;
            this.ctrlTexto1.Tag = "name";
            this.ctrlTexto1.Texto = "";
            // 
            // ctrlTexto5
            // 
            this.ctrlTexto5.Etiqueta = "Email";
            this.ctrlTexto5.isPassword = false;
            this.ctrlTexto5.Location = new System.Drawing.Point(12, 234);
            this.ctrlTexto5.MaxLenght = 32767;
            this.ctrlTexto5.Name = "ctrlTexto5";
            this.ctrlTexto5.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto5.TabIndex = 4;
            this.ctrlTexto5.Tag = "email";
            this.ctrlTexto5.Texto = "";
            // 
            // ctrlTexto4
            // 
            this.ctrlTexto4.Etiqueta = "Repita la contraseña";
            this.ctrlTexto4.isPassword = true;
            this.ctrlTexto4.Location = new System.Drawing.Point(355, 318);
            this.ctrlTexto4.MaxLenght = 32767;
            this.ctrlTexto4.Name = "ctrlTexto4";
            this.ctrlTexto4.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto4.TabIndex = 6;
            this.ctrlTexto4.Tag = "repeat_password";
            this.ctrlTexto4.Texto = "";
            // 
            // ctrlTexto3
            // 
            this.ctrlTexto3.Etiqueta = "Contraseña";
            this.ctrlTexto3.isPassword = true;
            this.ctrlTexto3.Location = new System.Drawing.Point(12, 318);
            this.ctrlTexto3.MaxLenght = 32767;
            this.ctrlTexto3.Name = "ctrlTexto3";
            this.ctrlTexto3.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto3.TabIndex = 5;
            this.ctrlTexto3.Tag = "input_password";
            this.ctrlTexto3.Texto = "";
            // 
            // btnRegistrarse
            // 
            this.btnRegistrarse.Location = new System.Drawing.Point(193, 411);
            this.btnRegistrarse.Name = "btnRegistrarse";
            this.btnRegistrarse.Size = new System.Drawing.Size(226, 32);
            this.btnRegistrarse.TabIndex = 7;
            this.btnRegistrarse.Tag = "signup";
            this.btnRegistrarse.Text = "Registrarse";
            this.btnRegistrarse.UseVisualStyleBackColor = true;
            this.btnRegistrarse.Click += new System.EventHandler(this.btnRegistrarse_Click);
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(355, 104);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(200, 20);
            this.dateTimePicker1.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(352, 88);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(106, 13);
            this.label2.TabIndex = 8;
            this.label2.Tag = "birth_date";
            this.label2.Text = "Fecha de nacimiento";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(249, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(140, 25);
            this.label3.TabIndex = 9;
            this.label3.Text = "Form gerente";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(12, 460);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(644, 14);
            this.progressBar1.TabIndex = 10;
            // 
            // FrmPrimerEmpleado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(668, 480);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.btnRegistrarse);
            this.Controls.Add(this.ctrlTexto3);
            this.Controls.Add(this.ctrlTexto4);
            this.Controls.Add(this.ctrlTexto5);
            this.Controls.Add(this.ctrlTexto1);
            this.Controls.Add(this.ctrlTexto2);
            this.Controls.Add(this.ctrlNum1);
            this.Name = "FrmPrimerEmpleado";
            this.Text = "FrmPrimerEmpleado";
            this.Load += new System.EventHandler(this.FrmPrimerEmpleado_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Controles_personalizados.ctrlNum ctrlNum1;
        private Controles_personalizados.ctrlTexto ctrlTexto2;
        private Controles_personalizados.ctrlTexto ctrlTexto1;
        private Controles_personalizados.ctrlTexto ctrlTexto5;
        private Controles_personalizados.ctrlTexto ctrlTexto4;
        private Controles_personalizados.ctrlTexto ctrlTexto3;
        private System.Windows.Forms.Button btnRegistrarse;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ProgressBar progressBar1;
    }
}