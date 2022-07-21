namespace TiendaTRIGANE
{
    partial class FrmPermisos
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
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnAgregarPermisoRol = new System.Windows.Forms.Button();
            this.btnRemoverPermisoRol = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.tvPermisosDisponibles = new System.Windows.Forms.TreeView();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(336, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(109, 25);
            this.label1.TabIndex = 0;
            this.label1.Tag = "permissions";
            this.label1.Text = "Permisos";
            // 
            // comboBox1
            // 
            this.comboBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(31, 132);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(186, 24);
            this.comboBox1.TabIndex = 1;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(28, 111);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(31, 18);
            this.label2.TabIndex = 2;
            this.label2.Tag = "role";
            this.label2.Text = "Rol";
            // 
            // btnAgregarPermisoRol
            // 
            this.btnAgregarPermisoRol.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAgregarPermisoRol.Location = new System.Drawing.Point(605, 224);
            this.btnAgregarPermisoRol.Name = "btnAgregarPermisoRol";
            this.btnAgregarPermisoRol.Size = new System.Drawing.Size(129, 66);
            this.btnAgregarPermisoRol.TabIndex = 3;
            this.btnAgregarPermisoRol.Tag = "assign_permission";
            this.btnAgregarPermisoRol.Text = "Asignar permiso al rol";
            this.btnAgregarPermisoRol.UseVisualStyleBackColor = true;
            this.btnAgregarPermisoRol.Click += new System.EventHandler(this.btnAgregarPermisoRol_Click);
            // 
            // btnRemoverPermisoRol
            // 
            this.btnRemoverPermisoRol.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRemoverPermisoRol.Location = new System.Drawing.Point(605, 331);
            this.btnRemoverPermisoRol.Name = "btnRemoverPermisoRol";
            this.btnRemoverPermisoRol.Size = new System.Drawing.Size(129, 58);
            this.btnRemoverPermisoRol.TabIndex = 4;
            this.btnRemoverPermisoRol.Tag = "remove_permission";
            this.btnRemoverPermisoRol.Text = "Remover permiso del rol";
            this.btnRemoverPermisoRol.UseVisualStyleBackColor = true;
            this.btnRemoverPermisoRol.Click += new System.EventHandler(this.btnRemoverPermisoRol_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(10, 448);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(157, 20);
            this.label3.TabIndex = 5;
            this.label3.Text = "Permisos disponibles";
            // 
            // tvPermisosDisponibles
            // 
            this.tvPermisosDisponibles.Location = new System.Drawing.Point(12, 471);
            this.tvPermisosDisponibles.Name = "tvPermisosDisponibles";
            this.tvPermisosDisponibles.Size = new System.Drawing.Size(662, 158);
            this.tvPermisosDisponibles.TabIndex = 6;
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(626, 28);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(149, 27);
            this.progressBar1.TabIndex = 7;
            // 
            // treeView1
            // 
            this.treeView1.Location = new System.Drawing.Point(12, 175);
            this.treeView1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.treeView1.Name = "treeView1";
            this.treeView1.Size = new System.Drawing.Size(512, 247);
            this.treeView1.TabIndex = 8;
            // 
            // FrmPermisos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 640);
            this.Controls.Add(this.treeView1);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.tvPermisosDisponibles);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnRemoverPermisoRol);
            this.Controls.Add(this.btnAgregarPermisoRol);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label1);
            this.Name = "FrmPermisos";
            this.Tag = "";
            this.Text = "FrmPermisos";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmPermisos_FormClosing);
            this.Load += new System.EventHandler(this.FrmPermisos_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnAgregarPermisoRol;
        private System.Windows.Forms.Button btnRemoverPermisoRol;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TreeView tvPermisosDisponibles;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.TreeView treeView1;
    }
}