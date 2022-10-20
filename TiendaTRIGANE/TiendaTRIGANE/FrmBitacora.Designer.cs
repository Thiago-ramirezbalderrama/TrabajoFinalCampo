
namespace TiendaTRIGANE
{
    partial class FrmBitacora
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
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.comboBoxEmpleados = new System.Windows.Forms.ComboBox();
            this.checkBoxEmpleados = new System.Windows.Forms.CheckBox();
            this.comboBoxSeveridad = new System.Windows.Forms.ComboBox();
            this.checkBoxSeveridad = new System.Windows.Forms.CheckBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.checkBoxFecha = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.dtpDesde = new System.Windows.Forms.DateTimePicker();
            this.dtpHasta = new System.Windows.Forms.DateTimePicker();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(573, 12);
            this.progressBar1.MarqueeAnimationSpeed = 30;
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(190, 27);
            this.progressBar1.Step = 1;
            this.progressBar1.Style = System.Windows.Forms.ProgressBarStyle.Marquee;
            this.progressBar1.TabIndex = 13;
            // 
            // comboBoxEmpleados
            // 
            this.comboBoxEmpleados.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxEmpleados.FormattingEnabled = true;
            this.comboBoxEmpleados.Location = new System.Drawing.Point(551, 122);
            this.comboBoxEmpleados.Name = "comboBoxEmpleados";
            this.comboBoxEmpleados.Size = new System.Drawing.Size(213, 21);
            this.comboBoxEmpleados.TabIndex = 12;
            this.comboBoxEmpleados.SelectedIndexChanged += new System.EventHandler(this.comboBoxEmpleados_SelectedIndexChanged);
            this.comboBoxEmpleados.Format += new System.Windows.Forms.ListControlConvertEventHandler(this.comboBoxEmpleados_Format);
            // 
            // checkBoxEmpleados
            // 
            this.checkBoxEmpleados.AutoSize = true;
            this.checkBoxEmpleados.Location = new System.Drawing.Point(551, 73);
            this.checkBoxEmpleados.Name = "checkBoxEmpleados";
            this.checkBoxEmpleados.Size = new System.Drawing.Size(118, 17);
            this.checkBoxEmpleados.TabIndex = 11;
            this.checkBoxEmpleados.Tag = "filter_by_employee";
            this.checkBoxEmpleados.Text = "Filtrar por empleado";
            this.checkBoxEmpleados.UseVisualStyleBackColor = true;
            this.checkBoxEmpleados.CheckedChanged += new System.EventHandler(this.checkBoxEmpleados_CheckedChanged);
            // 
            // comboBoxSeveridad
            // 
            this.comboBoxSeveridad.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxSeveridad.FormattingEnabled = true;
            this.comboBoxSeveridad.Location = new System.Drawing.Point(36, 122);
            this.comboBoxSeveridad.Name = "comboBoxSeveridad";
            this.comboBoxSeveridad.Size = new System.Drawing.Size(213, 21);
            this.comboBoxSeveridad.TabIndex = 10;
            this.comboBoxSeveridad.SelectedIndexChanged += new System.EventHandler(this.comboBoxSeveridad_SelectedIndexChanged);
            this.comboBoxSeveridad.Format += new System.Windows.Forms.ListControlConvertEventHandler(this.comboBoxSeveridad_Format);
            // 
            // checkBoxSeveridad
            // 
            this.checkBoxSeveridad.AutoSize = true;
            this.checkBoxSeveridad.Location = new System.Drawing.Point(36, 73);
            this.checkBoxSeveridad.Name = "checkBoxSeveridad";
            this.checkBoxSeveridad.Size = new System.Drawing.Size(118, 17);
            this.checkBoxSeveridad.TabIndex = 9;
            this.checkBoxSeveridad.Tag = "filter_by_severity";
            this.checkBoxSeveridad.Text = "Filtrar por severidad";
            this.checkBoxSeveridad.UseVisualStyleBackColor = true;
            this.checkBoxSeveridad.CheckedChanged += new System.EventHandler(this.checkBoxSeveridad_CheckedChanged);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(36, 155);
            this.dataGridView1.MultiSelect = false;
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(727, 410);
            this.dataGridView1.TabIndex = 8;
            this.dataGridView1.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dataGridView1_CellFormatting);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(338, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 30);
            this.label1.TabIndex = 7;
            this.label1.Tag = "system_logs";
            this.label1.Text = "Bitácora";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(35, 581);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(108, 13);
            this.label2.TabIndex = 15;
            this.label2.Tag = "related_info";
            this.label2.Text = "Información asociada";
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(38, 605);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.Size = new System.Drawing.Size(727, 68);
            this.richTextBox1.TabIndex = 14;
            this.richTextBox1.Text = "";
            // 
            // checkBoxFecha
            // 
            this.checkBoxFecha.AutoSize = true;
            this.checkBoxFecha.Location = new System.Drawing.Point(330, 73);
            this.checkBoxFecha.Name = "checkBoxFecha";
            this.checkBoxFecha.Size = new System.Drawing.Size(99, 17);
            this.checkBoxFecha.TabIndex = 16;
            this.checkBoxFecha.Tag = "filter_by_employee";
            this.checkBoxFecha.Text = "Filtrar por fecha";
            this.checkBoxFecha.UseVisualStyleBackColor = true;
            this.checkBoxFecha.CheckedChanged += new System.EventHandler(this.checkBoxFecha_CheckedChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(313, 107);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(38, 13);
            this.label3.TabIndex = 19;
            this.label3.Text = "Desde";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(431, 106);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(35, 13);
            this.label4.TabIndex = 20;
            this.label4.Text = "Hasta";
            // 
            // dtpDesde
            // 
            this.dtpDesde.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDesde.Location = new System.Drawing.Point(286, 123);
            this.dtpDesde.Name = "dtpDesde";
            this.dtpDesde.Size = new System.Drawing.Size(101, 20);
            this.dtpDesde.TabIndex = 21;
            this.dtpDesde.ValueChanged += new System.EventHandler(this.dtpDesde_ValueChanged);
            // 
            // dtpHasta
            // 
            this.dtpHasta.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpHasta.Location = new System.Drawing.Point(402, 123);
            this.dtpHasta.Name = "dtpHasta";
            this.dtpHasta.Size = new System.Drawing.Size(103, 20);
            this.dtpHasta.TabIndex = 22;
            this.dtpHasta.Value = new System.DateTime(2022, 10, 18, 20, 47, 38, 0);
            this.dtpHasta.ValueChanged += new System.EventHandler(this.dtpHasta_ValueChanged);
            // 
            // FrmBitacora
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 749);
            this.Controls.Add(this.dtpHasta);
            this.Controls.Add(this.dtpDesde);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.checkBoxFecha);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.comboBoxEmpleados);
            this.Controls.Add(this.checkBoxEmpleados);
            this.Controls.Add(this.comboBoxSeveridad);
            this.Controls.Add(this.checkBoxSeveridad);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label1);
            this.Name = "FrmBitacora";
            this.Text = "FrmBitacora";
            this.Load += new System.EventHandler(this.FrmBitacora_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.ComboBox comboBoxEmpleados;
        private System.Windows.Forms.CheckBox checkBoxEmpleados;
        private System.Windows.Forms.ComboBox comboBoxSeveridad;
        private System.Windows.Forms.CheckBox checkBoxSeveridad;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.CheckBox checkBoxFecha;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DateTimePicker dtpDesde;
        private System.Windows.Forms.DateTimePicker dtpHasta;
    }
}