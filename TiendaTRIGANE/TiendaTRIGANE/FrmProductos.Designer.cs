namespace TiendaTRIGANE
{
    partial class FrmProductos
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
            this.numPrecioUnitario = new System.Windows.Forms.NumericUpDown();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.numAdvertencia = new System.Windows.Forms.NumericUpDown();
            this.btnModificarAdvertencia = new System.Windows.Forms.Button();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.btnModificar = new System.Windows.Forms.Button();
            this.comboCategorias = new System.Windows.Forms.ComboBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.numPrecioUnitario)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numAdvertencia)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(265, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(104, 24);
            this.label1.TabIndex = 0;
            this.label1.Text = "Productos";
            // 
            // ctrlTexto1
            // 
            this.ctrlTexto1.Etiqueta = "Nombre";
            this.ctrlTexto1.isPassword = false;
            this.ctrlTexto1.Location = new System.Drawing.Point(39, 101);
            this.ctrlTexto1.MaxLenght = 32767;
            this.ctrlTexto1.Name = "ctrlTexto1";
            this.ctrlTexto1.Size = new System.Drawing.Size(266, 57);
            this.ctrlTexto1.TabIndex = 1;
            this.ctrlTexto1.Texto = "";
            // 
            // numPrecioUnitario
            // 
            this.numPrecioUnitario.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numPrecioUnitario.Location = new System.Drawing.Point(347, 138);
            this.numPrecioUnitario.Name = "numPrecioUnitario";
            this.numPrecioUnitario.Size = new System.Drawing.Size(120, 26);
            this.numPrecioUnitario.TabIndex = 2;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(360, 109);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "Precio Unitario";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(535, 101);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Categoria";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(36, 493);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(333, 20);
            this.label5.TabIndex = 5;
            this.label5.Text = "Advertencia de bajo stock para este producto:";
            // 
            // numAdvertencia
            // 
            this.numAdvertencia.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numAdvertencia.Location = new System.Drawing.Point(375, 491);
            this.numAdvertencia.Name = "numAdvertencia";
            this.numAdvertencia.Size = new System.Drawing.Size(120, 26);
            this.numAdvertencia.TabIndex = 6;
            // 
            // btnModificarAdvertencia
            // 
            this.btnModificarAdvertencia.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnModificarAdvertencia.Location = new System.Drawing.Point(512, 483);
            this.btnModificarAdvertencia.Name = "btnModificarAdvertencia";
            this.btnModificarAdvertencia.Size = new System.Drawing.Size(103, 41);
            this.btnModificarAdvertencia.TabIndex = 7;
            this.btnModificarAdvertencia.Tag = "update";
            this.btnModificarAdvertencia.Text = "Modificar";
            this.btnModificarAdvertencia.UseVisualStyleBackColor = true;
            this.btnModificarAdvertencia.Click += new System.EventHandler(this.btnModificarAdvertencia_Click);
            // 
            // btnAgregar
            // 
            this.btnAgregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAgregar.Location = new System.Drawing.Point(39, 204);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(100, 42);
            this.btnAgregar.TabIndex = 8;
            this.btnAgregar.Tag = "add";
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // btnEliminar
            // 
            this.btnEliminar.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEliminar.Location = new System.Drawing.Point(280, 204);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(98, 36);
            this.btnEliminar.TabIndex = 9;
            this.btnEliminar.Tag = "delete";
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // btnModificar
            // 
            this.btnModificar.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnModificar.Location = new System.Drawing.Point(469, 204);
            this.btnModificar.Name = "btnModificar";
            this.btnModificar.Size = new System.Drawing.Size(100, 36);
            this.btnModificar.TabIndex = 10;
            this.btnModificar.Tag = "modify";
            this.btnModificar.Text = "Modificar";
            this.btnModificar.UseVisualStyleBackColor = true;
            this.btnModificar.Click += new System.EventHandler(this.btnModificar_Click);
            // 
            // comboCategorias
            // 
            this.comboCategorias.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboCategorias.FormattingEnabled = true;
            this.comboCategorias.Location = new System.Drawing.Point(548, 132);
            this.comboCategorias.Name = "comboCategorias";
            this.comboCategorias.Size = new System.Drawing.Size(121, 28);
            this.comboCategorias.TabIndex = 11;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.AllowUserToResizeRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(39, 284);
            this.dataGridView1.MultiSelect = false;
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(609, 184);
            this.dataGridView1.TabIndex = 12;
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // FrmProductos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 534);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.comboCategorias);
            this.Controls.Add(this.btnModificar);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.btnModificarAdvertencia);
            this.Controls.Add(this.numAdvertencia);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.numPrecioUnitario);
            this.Controls.Add(this.ctrlTexto1);
            this.Controls.Add(this.label1);
            this.Name = "FrmProductos";
            this.Text = "frmProductos";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmProductos_FormClosing);
            this.Load += new System.EventHandler(this.FrmProductos_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numPrecioUnitario)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numAdvertencia)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private Controles_personalizados.ctrlTexto ctrlTexto1;
        private System.Windows.Forms.NumericUpDown numPrecioUnitario;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.NumericUpDown numAdvertencia;
        private System.Windows.Forms.Button btnModificarAdvertencia;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.Button btnModificar;
        private System.Windows.Forms.ComboBox comboCategorias;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}