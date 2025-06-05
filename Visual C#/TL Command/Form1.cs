using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.IO.Ports;

namespace TL_Command
{
    public partial class Form1 : Form
    {
        string TransmitData = string.Empty;
        double rcheck, ycheck, gcheck;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string[] ports = SerialPort.GetPortNames(); //Lay ten cac cong COM dang co trong may tinh
            foreach (string port in ports)
            {
                comboBox_COMPort.Items.Add(port); //Them cac cong COM vao combobox
            }
        }

        private void comboBox_COMPort_SelectedIndexChanged(object sender, EventArgs e)
        {
            serialPort.PortName = comboBox_COMPort.Text; //gan cong COM theo lua chon tuong ung tu combobox
        }

        private void COMConnect_Click(object sender, EventArgs e)
        {
            if (comboBox_COMPort.Text == "") //Kiem tra xem cong COM duoc chon chua
            {
                MessageBox.Show("Select COM Port.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning); //Bao loi
            }
            else
            {
                try
                {
                    if (serialPort.IsOpen) //Kiem tra xem cong COM da duoc su dung chua
                    {
                        MessageBox.Show("COM Port has been connected!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); //Bao loi
                    }
                    else
                    {
                        serialPort.Open(); //Mo cong COM
                        COMStatus.BackColor = Color.Lime; //Thay doi cac thuoc tinh cua o thong bao trang thai
                        COMStatus.Text = "Connecting...";
                        COMStatus.ForeColor = Color.Black;
                        comboBox_COMPort.Enabled = false; //Khong cho phep su dung nut Connect nua
                        MessageBox.Show("COM Port is connected!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information); //Thong bao ket noi thanh cong
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("COM Port is not found. Please check your COM or Cable!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); //Bao loi
                }
            }
        }

        private void COMDisconnect_Click(object sender, EventArgs e)
        {
            try
            {
                if (serialPort.IsOpen)
                {
                    serialPort.Close(); //Dong cong COM lai
                    COMStatus.BackColor = Color.Red;
                    COMStatus.Text = "Disconnected";
                    COMStatus.ForeColor = Color.White;
                    comboBox_COMPort.Enabled = true; //Cho phep su dung lai nut Connect
                    MessageBox.Show("COM Port is disconnected!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("COM Port has been disconnected!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("COM Port is not found. Please check your COM or Cable!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void serialPort_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            string ReceiveData = serialPort.ReadTo("&"); //Doc du lieu gui di tu PIC, khi phat hien ki tu "&" thi dung doc
            if (ReceiveData == "13") //So sanh chuoi du lieu de dieu khien LED tren giao dien
            {
                //PAIR1
                Invoke(new MethodInvoker(() => RP1Status.BackColor = Color.Red));
                Invoke(new MethodInvoker(() => YP1Status.BackColor = Color.DarkGoldenrod));
                Invoke(new MethodInvoker(() => GP1Status.BackColor = Color.DarkGreen));
                //PAIR2
                Invoke(new MethodInvoker(() => RP2Status.BackColor = Color.DarkRed));
                Invoke(new MethodInvoker(() => YP2Status.BackColor = Color.DarkGoldenrod));
                Invoke(new MethodInvoker(() => GP2Status.BackColor = Color.Lime));
            }
            else if (ReceiveData == "12")
            {
                //PAIR1
                Invoke(new MethodInvoker(() => RP1Status.BackColor = Color.Red));
                Invoke(new MethodInvoker(() => YP1Status.BackColor = Color.DarkGoldenrod));
                Invoke(new MethodInvoker(() => GP1Status.BackColor = Color.DarkGreen));
                //PAIR2
                Invoke(new MethodInvoker(() => RP2Status.BackColor = Color.DarkRed));
                Invoke(new MethodInvoker(() => YP2Status.BackColor = Color.Gold));
                Invoke(new MethodInvoker(() => GP2Status.BackColor = Color.DarkGreen));
            }
            else if (ReceiveData == "31")
            {
                //PAIR1
                Invoke(new MethodInvoker(() => RP1Status.BackColor = Color.DarkRed));
                Invoke(new MethodInvoker(() => YP1Status.BackColor = Color.DarkGoldenrod));
                Invoke(new MethodInvoker(() => GP1Status.BackColor = Color.Lime));
                //PAIR2
                Invoke(new MethodInvoker(() => RP2Status.BackColor = Color.Red));
                Invoke(new MethodInvoker(() => YP2Status.BackColor = Color.DarkGoldenrod));
                Invoke(new MethodInvoker(() => GP2Status.BackColor = Color.DarkGreen));
            }
            else if (ReceiveData == "21")
            {
                //PAIR1
                Invoke(new MethodInvoker(() => RP1Status.BackColor = Color.DarkRed));
                Invoke(new MethodInvoker(() => YP1Status.BackColor = Color.Gold));
                Invoke(new MethodInvoker(() => GP1Status.BackColor = Color.DarkGreen));
                //PAIR2
                Invoke(new MethodInvoker(() => RP2Status.BackColor = Color.Red));
                Invoke(new MethodInvoker(() => YP2Status.BackColor = Color.DarkGoldenrod));
                Invoke(new MethodInvoker(() => GP2Status.BackColor = Color.DarkGreen));
            }
        }

        private void TimerSet_Click(object sender, EventArgs e)
        {
            try
            {
                if (serialPort.IsOpen)
                {
                    if (double.TryParse(RTime.Text, out rcheck) && double.TryParse(YTime.Text, out ycheck) && double.TryParse(GTime.Text, out gcheck)) //Kiem tra xem gia tri nhap vao co phai la so khong
                    {
                        if(rcheck > 0 && rcheck <= 99 && ycheck > 0 && ycheck <= 99 && gcheck > 0 && gcheck <= 99 && rcheck == ycheck + gcheck) //Kiem tra xem cac gia tri thoi gian co thoa man dieu kien khong
                        {
                                TransmitData = RTime.Text + YTime.Text + GTime.Text + "!"; //Tao chuoi du lieu
                                serialPort.Write(TransmitData); //Gui chuoi du lieu ve PIC
                                TimerSet.Enabled = false; //Khong cho phep su dung nut OK   
                        }
                        else
                        {
                            MessageBox.Show("Giá trị không hợp lệ. Vui lòng nhập lại!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Giá trị không hợp lệ. Vui lòng nhập lại!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    MessageBox.Show("COM Port is not found. Please check your COM or Cable!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("COM Port is not found. Please check your COM or Cable!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void TimerOFF_Click(object sender, EventArgs e)
        {
            try
            {
                if (serialPort.IsOpen)
                {
                    TransmitData = "!";
                    serialPort.Write(TransmitData); //Gui ki tu "!" ve PIC de thuc hien ngat
                    RP1Status.BackColor = Color.DarkRed; //Dua cac LED ve trang thai OFF
                    YP1Status.BackColor = Color.DarkGoldenrod;
                    GP1Status.BackColor = Color.DarkGreen;
                    RP2Status.BackColor = Color.DarkRed;
                    YP2Status.BackColor = Color.DarkGoldenrod;
                    GP2Status.BackColor = Color.DarkGreen;
                    if (TimerSet.Enabled == false) //Kiem tra xem nut OK co bi khoa khong
                    {
                        TimerSet.Enabled = true; //Cho phep su dung lai nut OK
                    }
                }
                else
                {
                    MessageBox.Show("COM Port is not found. Please check your COM or Cable!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("COM Port is not found. Please check your COM or Cable!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
