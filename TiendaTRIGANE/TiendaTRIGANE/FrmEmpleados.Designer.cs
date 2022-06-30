namespace TiendaTRIGANE
{
    partial class FrmEmpleados
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.ctrlNum1 = new TiendaTRIGANE.Controles_personalizados.ctrlNum();
            this.ctrlTexto1 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto2 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.ctrlTexto3 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto4 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.ctrlTexto5 = new TiendaTRIGANE.Controles_personalizados.ctrlTexto();
            this.label2 = new System.Windows.Forms.Label();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.btnModificar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // ctrlNum1
            // 
            this.ctrlNum1.Etiqueta = "DNI";
            this.ctrlNum1.isPassword = false;
            this.ctrlNum1.Location = new System.Drawing.Point(24, 71);
            this.ctrlNum1.MaxLenght = 32767;
            this.ctrlNum1.Name = "ctrlNum1";
            this.ctrlNum1.Size = new System.Drawing.Size(215, 57);
            this.ctrlNum1.TabIndex = 0;
            this.ctrlNum1.Tag = "dni";
            this.ctrlNum1.Texto = "";
            // 
            // ctrlTexto1
            // 
            this.ctrlTexto1.Etiqueta = "Nombre";
            this.ctrlTexto1.isPassword = false;
            this.ctrlTexto1.Location = new System.Drawing.Point(24, 164);
            this.ctrlTexto1.MaxLenght = 32767;
            this.ctrlTexto1.Name = "ctrlTexto1";
            this.ctrlTexto1.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto1.TabIndex = 1;
            this.ctrlTexto1.Tag = "name";
            this.ctrlTexto1.Texto = "";
            // 
            // ctrlTexto2
            // 
            this.ctrlTexto2.Etiqueta = "Apellido";
            this.ctrlTexto2.isPassword = false;
            this.ctrlTexto2.Location = new System.Drawing.Point(285, 164);
            this.ctrlTexto2.MaxLenght = 32767;
            this.ctrlTexto2.Name = "ctrlTexto2";
            this.ctrlTexto2.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto2.TabIndex = 2;
            this.ctrlTexto2.Tag = "surname";
            this.ctrlTexto2.Texto = "";
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateTimePicker1.Location = new System.Drawing.Point(24, 280);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(256, 22);
            this.dateTimePicker1.TabIndex = 3;
            this.dateTimePicker1.Tag = "birth_date";
            // 
            // ctrlTexto3
            // 
            this.ctrlTexto3.Etiqueta = "Ingrese una contraseña";
            this.ctrlTexto3.isPassword = false;
            this.ctrlTexto3.Location = new System.Drawing.Point(24, 338);
            this.ctrlTexto3.MaxLenght = 32767;
            this.ctrlTexto3.Name = "ctrlTexto3";
            this.ctrlTexto3.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto3.TabIndex = 4;
            this.ctrlTexto3.Tag = "input_password";
            this.ctrlTexto3.Texto = "";
            // 
            // ctrlTexto4
            // 
            this.ctrlTexto4.Etiqueta = "Repita la contraseña";
            this.ctrlTexto4.isPassword = false;
            this.ctrlTexto4.Location = new System.Drawing.Point(285, 338);
            this.ctrlTexto4.MaxLenght = 32767;
            this.ctrlTexto4.Name = "ctrlTexto4";
            this.ctrlTexto4.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto4.TabIndex = 5;
            this.ctrlTexto4.Tag = "repeat_password";
            this.ctrlTexto4.Texto = "";
            // 
            // ctrlTexto5
            // 
            this.ctrlTexto5.Etiqueta = "Email";
            this.ctrlTexto5.isPassword = false;
            this.ctrlTexto5.Location = new System.Drawing.Point(285, 71);
            this.ctrlTexto5.MaxLenght = 32767;
            this.ctrlTexto5.Name = "ctrlTexto5";
            this.ctrlTexto5.Size = new System.Drawing.Size(215, 57);
            this.ctrlTexto5.TabIndex = 6;
            this.ctrlTexto5.Tag = "email";
            this.ctrlTexto5.Texto = "";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(21, 257);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(157, 20);
            this.label2.TabIndex = 7;
            this.label2.Tag = "birth_date";
            this.label2.Text = "Fecha de nacimiento";
            // 
            // btnAgregar
            // 
            this.btnAgregar.Location = new System.Drawing.Point(25, 433);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(75, 23);
            this.btnAgregar.TabIndex = 8;
            this.btnAgregar.Tag = "add";
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // btnModificar
            // 
            this.btnModificar.Location = new System.Drawing.Point(205, 433);
            this.btnModificar.Name = "btnModificar";
            this.btnModificar.Size = new System.Drawing.Size(75, 23);
            this.btnModificar.TabIndex = 9;
            this.btnModificar.Tag = "modify";
            this.btnModificar.Text = "Modificar";
            this.btnModificar.UseVisualStyleBackColor = true;
            this.btnModificar.Click += new System.EventHandler(this.btnModificar_Click);
            // 
            // btnEliminar
            // 
            this.btnEliminar.Location = new System.Drawing.Point(372, 433);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(75, 23);
            this.btnEliminar.TabIndex = 10;
            this.btnEliminar.Tag = "delete";
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(326, 284);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 11;
            this.comboBox1.Tag = "role";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(322, 261);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(33, 20);
            this.label5.TabIndex = 12;
            this.label5.Text = "Rol";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(476, 12);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(172, 23);
            this.progressBar1.TabIndex = 13;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(203, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(128, 25);
            this.label1.TabIndex = 14;
            this.label1.Tag = "employees";
            this.label1.Text = "Empleados";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(24, 463);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dataGridView1.MultiSelect = false;
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersVisible = false;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dataGridView1.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.ShowEditingIcon = false;
            this.dataGridView1.Size = new System.Drawing.Size(667, 251);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dataGridView1_CellFormatting);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // FrmEmpleados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.ClientSize = new System.Drawing.Size(721, 698);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnModificar);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.ctrlTexto5);
            this.Controls.Add(this.ctrlTexto4);
            this.Controls.Add(this.ctrlTexto3);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.ctrlTexto2);
            this.Controls.Add(this.ctrlTexto1);
            this.Controls.Add(this.ctrlNum1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FrmEmpleados";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmEmpleados";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmEmpleados_FormClosing);
            this.Load += new System.EventHandler(this.FrmEmpleados_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Controles_personalizados.ctrlNum ctrlNum1;
        private Controles_personalizados.ctrlTexto ctrlTexto1;
        private Controles_personalizados.ctrlTexto ctrlTexto2;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private Controles_personalizados.ctrlTexto ctrlTexto3;
        private Controles_personalizados.ctrlTexto ctrlTexto4;
        private Controles_personalizados.ctrlTexto ctrlTexto5;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.Button btnModificar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}