
namespace TL_Command
{
    partial class Form1
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
            this.components = new System.ComponentModel.Container();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.COMStatus = new System.Windows.Forms.TextBox();
            this.comboBox_COMPort = new System.Windows.Forms.ComboBox();
            this.COMDisconnect = new System.Windows.Forms.Button();
            this.COMConnect = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.GP2Status = new System.Windows.Forms.TextBox();
            this.YP2Status = new System.Windows.Forms.TextBox();
            this.RP2Status = new System.Windows.Forms.TextBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.GP1Status = new System.Windows.Forms.TextBox();
            this.YP1Status = new System.Windows.Forms.TextBox();
            this.RP1Status = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.TimerOFF = new System.Windows.Forms.Button();
            this.TimerSet = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.GTime = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.YTime = new System.Windows.Forms.TextBox();
            this.RTime = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.serialPort = new System.IO.Ports.SerialPort(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.COMStatus);
            this.groupBox1.Controls.Add(this.comboBox_COMPort);
            this.groupBox1.Controls.Add(this.COMDisconnect);
            this.groupBox1.Controls.Add(this.COMConnect);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(368, 193);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "COM Connection Setup";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(92, 20);
            this.label2.TabIndex = 5;
            this.label2.Text = "COM Port";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // COMStatus
            // 
            this.COMStatus.BackColor = System.Drawing.Color.Red;
            this.COMStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.COMStatus.ForeColor = System.Drawing.Color.White;
            this.COMStatus.Location = new System.Drawing.Point(92, 99);
            this.COMStatus.Name = "COMStatus";
            this.COMStatus.ReadOnly = true;
            this.COMStatus.Size = new System.Drawing.Size(183, 26);
            this.COMStatus.TabIndex = 4;
            this.COMStatus.Text = "Disconnected";
            this.COMStatus.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // comboBox_COMPort
            // 
            this.comboBox_COMPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox_COMPort.FormattingEnabled = true;
            this.comboBox_COMPort.Location = new System.Drawing.Point(115, 36);
            this.comboBox_COMPort.Name = "comboBox_COMPort";
            this.comboBox_COMPort.Size = new System.Drawing.Size(183, 28);
            this.comboBox_COMPort.TabIndex = 3;
            this.comboBox_COMPort.SelectedIndexChanged += new System.EventHandler(this.comboBox_COMPort_SelectedIndexChanged);
            // 
            // COMDisconnect
            // 
            this.COMDisconnect.ForeColor = System.Drawing.Color.Red;
            this.COMDisconnect.Location = new System.Drawing.Point(215, 148);
            this.COMDisconnect.Name = "COMDisconnect";
            this.COMDisconnect.Size = new System.Drawing.Size(147, 39);
            this.COMDisconnect.TabIndex = 2;
            this.COMDisconnect.Text = "Disconnect";
            this.COMDisconnect.UseVisualStyleBackColor = true;
            this.COMDisconnect.Click += new System.EventHandler(this.COMDisconnect_Click);
            // 
            // COMConnect
            // 
            this.COMConnect.ForeColor = System.Drawing.Color.Green;
            this.COMConnect.Location = new System.Drawing.Point(6, 148);
            this.COMConnect.Name = "COMConnect";
            this.COMConnect.Size = new System.Drawing.Size(147, 39);
            this.COMConnect.TabIndex = 1;
            this.COMConnect.Text = "Connect";
            this.COMConnect.UseVisualStyleBackColor = true;
            this.COMConnect.Click += new System.EventHandler(this.COMConnect_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.Color.Black;
            this.groupBox3.Controls.Add(this.groupBox5);
            this.groupBox3.Controls.Add(this.groupBox4);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.groupBox3.Location = new System.Drawing.Point(12, 211);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(742, 263);
            this.groupBox3.TabIndex = 10;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Traffic Light Status";
            // 
            // groupBox5
            // 
            this.groupBox5.BackColor = System.Drawing.Color.Black;
            this.groupBox5.Controls.Add(this.GP2Status);
            this.groupBox5.Controls.Add(this.YP2Status);
            this.groupBox5.Controls.Add(this.RP2Status);
            this.groupBox5.ForeColor = System.Drawing.Color.White;
            this.groupBox5.Location = new System.Drawing.Point(487, 26);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(156, 227);
            this.groupBox5.TabIndex = 3;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Pair 2";
            // 
            // GP2Status
            // 
            this.GP2Status.BackColor = System.Drawing.Color.DarkGreen;
            this.GP2Status.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GP2Status.Location = new System.Drawing.Point(53, 150);
            this.GP2Status.Name = "GP2Status";
            this.GP2Status.ReadOnly = true;
            this.GP2Status.Size = new System.Drawing.Size(48, 45);
            this.GP2Status.TabIndex = 2;
            // 
            // YP2Status
            // 
            this.YP2Status.BackColor = System.Drawing.Color.DarkGoldenrod;
            this.YP2Status.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.YP2Status.Location = new System.Drawing.Point(53, 99);
            this.YP2Status.Name = "YP2Status";
            this.YP2Status.ReadOnly = true;
            this.YP2Status.Size = new System.Drawing.Size(48, 45);
            this.YP2Status.TabIndex = 1;
            // 
            // RP2Status
            // 
            this.RP2Status.BackColor = System.Drawing.Color.DarkRed;
            this.RP2Status.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.RP2Status.Location = new System.Drawing.Point(53, 48);
            this.RP2Status.Name = "RP2Status";
            this.RP2Status.ReadOnly = true;
            this.RP2Status.Size = new System.Drawing.Size(48, 45);
            this.RP2Status.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.BackColor = System.Drawing.Color.Black;
            this.groupBox4.Controls.Add(this.GP1Status);
            this.groupBox4.Controls.Add(this.YP1Status);
            this.groupBox4.Controls.Add(this.RP1Status);
            this.groupBox4.ForeColor = System.Drawing.Color.White;
            this.groupBox4.Location = new System.Drawing.Point(92, 26);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(156, 227);
            this.groupBox4.TabIndex = 0;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Pair 1";
            // 
            // GP1Status
            // 
            this.GP1Status.BackColor = System.Drawing.Color.DarkGreen;
            this.GP1Status.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GP1Status.Location = new System.Drawing.Point(53, 150);
            this.GP1Status.Name = "GP1Status";
            this.GP1Status.ReadOnly = true;
            this.GP1Status.Size = new System.Drawing.Size(48, 45);
            this.GP1Status.TabIndex = 2;
            // 
            // YP1Status
            // 
            this.YP1Status.BackColor = System.Drawing.Color.DarkGoldenrod;
            this.YP1Status.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.YP1Status.Location = new System.Drawing.Point(53, 99);
            this.YP1Status.Name = "YP1Status";
            this.YP1Status.ReadOnly = true;
            this.YP1Status.Size = new System.Drawing.Size(48, 45);
            this.YP1Status.TabIndex = 1;
            // 
            // RP1Status
            // 
            this.RP1Status.BackColor = System.Drawing.Color.DarkRed;
            this.RP1Status.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.RP1Status.Location = new System.Drawing.Point(53, 48);
            this.RP1Status.Name = "RP1Status";
            this.RP1Status.ReadOnly = true;
            this.RP1Status.Size = new System.Drawing.Size(48, 45);
            this.RP1Status.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.TimerOFF);
            this.groupBox2.Controls.Add(this.TimerSet);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.GTime);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.YTime);
            this.groupBox2.Controls.Add(this.RTime);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Controls.Add(this.label13);
            this.groupBox2.Controls.Add(this.label14);
            this.groupBox2.Controls.Add(this.label16);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.groupBox2.Location = new System.Drawing.Point(393, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(361, 193);
            this.groupBox2.TabIndex = 20;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Timer Set (Red = Green + Yellow)";
            // 
            // TimerOFF
            // 
            this.TimerOFF.BackColor = System.Drawing.Color.Red;
            this.TimerOFF.ForeColor = System.Drawing.Color.White;
            this.TimerOFF.Location = new System.Drawing.Point(6, 148);
            this.TimerOFF.Name = "TimerOFF";
            this.TimerOFF.Size = new System.Drawing.Size(94, 39);
            this.TimerOFF.TabIndex = 22;
            this.TimerOFF.Text = "OFF";
            this.TimerOFF.UseVisualStyleBackColor = false;
            this.TimerOFF.Click += new System.EventHandler(this.TimerOFF_Click);
            // 
            // TimerSet
            // 
            this.TimerSet.BackColor = System.Drawing.Color.Lime;
            this.TimerSet.ForeColor = System.Drawing.Color.Black;
            this.TimerSet.Location = new System.Drawing.Point(138, 148);
            this.TimerSet.Name = "TimerSet";
            this.TimerSet.Size = new System.Drawing.Size(94, 39);
            this.TimerSet.TabIndex = 20;
            this.TimerSet.Text = "OK";
            this.TimerSet.UseVisualStyleBackColor = false;
            this.TimerSet.Click += new System.EventHandler(this.TimerSet_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.ForeColor = System.Drawing.Color.White;
            this.label4.Location = new System.Drawing.Point(278, 105);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(41, 20);
            this.label4.TabIndex = 19;
            this.label4.Text = "Sec";
            // 
            // GTime
            // 
            this.GTime.Location = new System.Drawing.Point(107, 102);
            this.GTime.Name = "GTime";
            this.GTime.Size = new System.Drawing.Size(155, 27);
            this.GTime.TabIndex = 19;
            this.GTime.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(278, 72);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(41, 20);
            this.label5.TabIndex = 18;
            this.label5.Text = "Sec";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.Color.White;
            this.label11.Location = new System.Drawing.Point(278, 39);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(41, 20);
            this.label11.TabIndex = 17;
            this.label11.Text = "Sec";
            // 
            // YTime
            // 
            this.YTime.Location = new System.Drawing.Point(107, 69);
            this.YTime.Name = "YTime";
            this.YTime.Size = new System.Drawing.Size(155, 27);
            this.YTime.TabIndex = 18;
            this.YTime.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // RTime
            // 
            this.RTime.Location = new System.Drawing.Point(107, 36);
            this.RTime.Name = "RTime";
            this.RTime.Size = new System.Drawing.Size(155, 27);
            this.RTime.TabIndex = 17;
            this.RTime.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.Color.White;
            this.label12.Location = new System.Drawing.Point(34, 105);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(60, 20);
            this.label12.TabIndex = 10;
            this.label12.Text = "Green";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.ForeColor = System.Drawing.Color.White;
            this.label13.Location = new System.Drawing.Point(34, 72);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(63, 20);
            this.label13.TabIndex = 9;
            this.label13.Text = "Yellow";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.ForeColor = System.Drawing.Color.White;
            this.label14.Location = new System.Drawing.Point(34, 39);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(48, 20);
            this.label14.TabIndex = 8;
            this.label14.Text = "RED";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(6, 23);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(0, 20);
            this.label16.TabIndex = 2;
            // 
            // serialPort
            // 
            this.serialPort.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort_DataReceived);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 72);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(156, 20);
            this.label1.TabIndex = 6;
            this.label1.Text = "BAUS Rate: 9600";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.MenuHighlight;
            this.ClientSize = new System.Drawing.Size(766, 486);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox1);
            this.Name = "Form1";
            this.Text = "Traffic Light Controller";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox COMStatus;
        private System.Windows.Forms.ComboBox comboBox_COMPort;
        private System.Windows.Forms.Button COMDisconnect;
        private System.Windows.Forms.Button COMConnect;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.TextBox GP2Status;
        private System.Windows.Forms.TextBox YP2Status;
        private System.Windows.Forms.TextBox RP2Status;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox GP1Status;
        private System.Windows.Forms.TextBox YP1Status;
        private System.Windows.Forms.TextBox RP1Status;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox GTime;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox YTime;
        private System.Windows.Forms.TextBox RTime;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Button TimerSet;
        private System.IO.Ports.SerialPort serialPort;
        private System.Windows.Forms.Button TimerOFF;
        private System.Windows.Forms.Label label1;
    }
}

