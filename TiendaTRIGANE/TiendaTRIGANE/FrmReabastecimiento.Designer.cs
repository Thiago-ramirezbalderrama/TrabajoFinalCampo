namespace TiendaTRIGANE
{
    partial class FrmReabastecimiento
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
            this.comboBoxCategoria = new System.Windows.Forms.ComboBox();
            this.checkBoxCategoria = new System.Windows.Forms.CheckBox();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.label2 = new System.Windows.Forms.Label();
            this.btnTerminarSolicitud = new System.Windows.Forms.Button();
            this.btnSolicitarReabastecimiento = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.btnVerDetallesSolicitud = new System.Windows.Forms.Button();
            this.btnVerDetallesEntrega = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // comboBoxCategoria
            // 
            this.comboBoxCategoria.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxCategoria.FormattingEnabled = true;
            this.comboBoxCategoria.Location = new System.Drawing.Point(38, 175);
            this.comboBoxCategoria.Name = "comboBoxCategoria";
            this.comboBoxCategoria.Size = new System.Drawing.Size(213, 21);
            this.comboBoxCategoria.TabIndex = 30;
            this.comboBoxCategoria.SelectedIndexChanged += new System.EventHandler(this.comboBoxCategoria_SelectedIndexChanged);
            this.comboBoxCategoria.Format += new System.Windows.Forms.ListControlConvertEventHandler(this.comboBoxCategoria_Format);
            // 
            // checkBoxCategoria
            // 
            this.checkBoxCategoria.AutoSize = true;
            this.checkBoxCategoria.Location = new System.Drawing.Point(38, 144);
            this.checkBoxCategoria.Name = "checkBoxCategoria";
            this.checkBoxCategoria.Size = new System.Drawing.Size(116, 17);
            this.checkBoxCategoria.TabIndex = 29;
            this.checkBoxCategoria.Tag = "filter_by_category";
            this.checkBoxCategoria.Text = "Filtrar por categoria";
            this.checkBoxCategoria.UseVisualStyleBackColor = true;
            this.checkBoxCategoria.CheckedChanged += new System.EventHandler(this.checkBoxCategoria_CheckedChanged);
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(563, 15);
            this.progressBar1.MarqueeAnimationSpeed = 1;
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(201, 23);
            this.progressBar1.Step = 1;
            this.progressBar1.Style = System.Windows.Forms.ProgressBarStyle.Marquee;
            this.progressBar1.TabIndex = 28;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(35, 106);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(265, 25);
            this.label2.TabIndex = 27;
            this.label2.Tag = "replenishment_reports";
            this.label2.Text = "Informes de Reabastecimiento";
            // 
            // btnTerminarSolicitud
            // 
            this.btnTerminarSolicitud.Location = new System.Drawing.Point(565, 163);
            this.btnTerminarSolicitud.Name = "btnTerminarSolicitud";
            this.btnTerminarSolicitud.Size = new System.Drawing.Size(201, 41);
            this.btnTerminarSolicitud.TabIndex = 26;
            this.btnTerminarSolicitud.Tag = "end_request";
            this.btnTerminarSolicitud.Text = "Terminar solicitud";
            this.btnTerminarSolicitud.UseVisualStyleBackColor = true;
            this.btnTerminarSolicitud.Click += new System.EventHandler(this.btnTerminarSolicitud_Click);
            // 
            // btnSolicitarReabastecimiento
            // 
            this.btnSolicitarReabastecimiento.Location = new System.Drawing.Point(40, 53);
            this.btnSolicitarReabastecimiento.Name = "btnSolicitarReabastecimiento";
            this.btnSolicitarReabastecimiento.Size = new System.Drawing.Size(726, 33);
            this.btnSolicitarReabastecimiento.TabIndex = 25;
            this.btnSolicitarReabastecimiento.Tag = "request_to_a_supplier";
            this.btnSolicitarReabastecimiento.Text = "Solicitar a un proveedor";
            this.btnSolicitarReabastecimiento.UseVisualStyleBackColor = true;
            this.btnSolicitarReabastecimiento.Click += new System.EventHandler(this.btnSolicitarReabastecimiento_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(39, 210);
            this.dataGridView1.MultiSelect = false;
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(727, 375);
            this.dataGridView1.TabIndex = 24;
            this.dataGridView1.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dataGridView1_CellFormatting);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 15.75F);
            this.label1.Location = new System.Drawing.Point(306, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(177, 30);
            this.label1.TabIndex = 23;
            this.label1.Tag = "replenishment";
            this.label1.Text = "Reabastecimiento";
            // 
            // btnVerDetallesSolicitud
            // 
            this.btnVerDetallesSolicitud.Location = new System.Drawing.Point(37, 617);
            this.btnVerDetallesSolicitud.Name = "btnVerDetallesSolicitud";
            this.btnVerDetallesSolicitud.Size = new System.Drawing.Size(358, 41);
            this.btnVerDetallesSolicitud.TabIndex = 32;
            this.btnVerDetallesSolicitud.Tag = "view_replenishment_request_details";
            this.btnVerDetallesSolicitud.Text = "Ver los detalles de la solicitud";
            this.btnVerDetallesSolicitud.UseVisualStyleBackColor = true;
            this.btnVerDetallesSolicitud.Click += new System.EventHandler(this.btnVerDetallesSolicitud_Click);
            // 
            // btnVerDetallesEntrega
            // 
            this.btnVerDetallesEntrega.Location = new System.Drawing.Point(401, 617);
            this.btnVerDetallesEntrega.Name = "btnVerDetallesEntrega";
            this.btnVerDetallesEntrega.Size = new System.Drawing.Size(363, 41);
            this.btnVerDetallesEntrega.TabIndex = 31;
            this.btnVerDetallesEntrega.Tag = "view_replenishment_delivery_details";
            this.btnVerDetallesEntrega.Text = "Ver los detalles de la entrega";
            this.btnVerDetallesEntrega.UseVisualStyleBackColor = true;
            this.btnVerDetallesEntrega.Click += new System.EventHandler(this.btnVerDetallesEntrega_Click);
            // 
            // FrmReabastecimiento
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 670);
            this.Controls.Add(this.btnVerDetallesSolicitud);
            this.Controls.Add(this.btnVerDetallesEntrega);
            this.Controls.Add(this.comboBoxCategoria);
            this.Controls.Add(this.checkBoxCategoria);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnTerminarSolicitud);
            this.Controls.Add(this.btnSolicitarReabastecimiento);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label1);
            this.Name = "FrmReabastecimiento";
            this.Text = "FrmReabastecimiento";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmReabastecimiento_FormClosing);
            this.Load += new System.EventHandler(this.FrmReabastecimiento_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox comboBoxCategoria;
        private System.Windows.Forms.CheckBox checkBoxCategoria;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnTerminarSolicitud;
        private System.Windows.Forms.Button btnSolicitarReabastecimiento;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnVerDetallesSolicitud;
        private System.Windows.Forms.Button btnVerDetallesEntrega;
    }
}