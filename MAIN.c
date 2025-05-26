unsigned short i, j, num, dk, x, y, a;
unsigned char readbuff[7], data1[1], data2[1], data3[1], data4[1], data5[1], data6[1];
int value1, value2, value3, value4, value5, value6, rtime, ytime, gtime;

//Ham giai ma LED 7 doan
unsigned short mask(unsigned short num){
    switch (num){
        case 0: return 0xC0;
        case 1: return 0xF9;
        case 2: return 0xA4;
        case 3: return 0xB0;
        case 4: return 0x99;
        case 5: return 0x92;
        case 6: return 0x82;
        case 7: return 0xF8;
        case 8: return 0x80;
        case 9: return 0x90;
    }
}
//Cac ham khai bao trang thai den
void dendo_xanh1(int time, int plustime){
    for(i = time; i >= 1; i--){
        PORTC.F0 = 1;
        PORTC.F1 = 0;
        PORTC.F2 = 0;
        PORTC.F3 = 0;
        PORTC.F4 = 0;
        PORTC.F5 = 1;
        UART1_Write_Text("13&");
        for( j = 20; j >= 1; j--){
            PORTD = mask((i + plustime) % 10);
            PORTA.F0 = 1;
            delay_ms(10);
            PORTA.F0 = 0;
            PORTD = mask((i + plustime) / 10);
            PORTA.F1 = 1;
            delay_ms(10);
            PORTA.F1 = 0;
            PORTB = mask(i % 10);
            PORTA.F2=1;
            delay_ms(10);
            PORTA.F2=0;
            PORTB = mask(i / 10);
            PORTA.F3=1;
            delay_ms(10);
            PORTA.F3=0;
            delay_ms(10);
            if(UART1_Data_Ready() == 1){
                return;
            }
        }
    }
}
void dendo_vang1(int plustime){
    for(i = plustime; i >= 1; i--){
        PORTC.F0 = 1;
        PORTC.F1 = 0;
        PORTC.F2 = 0;
        PORTC.F3 = 0;
        PORTC.F4 = 1;
        PORTC.F5 = 0;
        UART1_Write_Text("12&");
        for( j = 20; j >= 1; j--){
            PORTD = mask(i % 10);
            PORTA.F0 = 1;
            delay_ms(10);
            PORTA.F0 = 0;
            PORTD = mask(i / 10);
            PORTA.F1 = 1;
            delay_ms(10);
            PORTA.F1 = 0;
            PORTB = mask(i % 10);
            PORTA.F2=1;
            delay_ms(10);
            PORTA.F2=0;
            PORTB = mask(i / 10);
            PORTA.F3=1;
            delay_ms(10);
            PORTA.F3=0;
            delay_ms(10);
            if(UART1_Data_Ready() == 1){
                return;
            }
        }
    }
}

void dendo_xanh2(int time, int plustime){
    for(i = time; i >= 1; i--){
        PORTC.F0 = 0;
        PORTC.F1 = 0;
        PORTC.F2 = 1;
        PORTC.F3 = 1;
        PORTC.F4 = 0;
        PORTC.F5 = 0;
        UART1_Write_Text("31&");
        for( j = 20; j >= 1; j--){
            PORTD = mask((i + plustime) % 10);
            PORTA.F0 = 1;
            delay_ms(10);
            PORTA.F0 = 0;
            PORTD = mask((i + plustime) / 10);
            PORTA.F1 = 1;
            delay_ms(10);
            PORTA.F1 = 0;
            PORTB = mask(i % 10);
            PORTA.F2=1;
            delay_ms(10);
            PORTA.F2=0;
            PORTB = mask(i / 10);
            PORTA.F3=1;
            delay_ms(10);
            PORTA.F3=0;
            delay_ms(10);
            if(UART1_Data_Ready() == 1){
                return;
            }
        }
    }
}
void dendo_vang2(int plustime){
    for(i = plustime; i >= 1; i--){
        PORTC.F0 = 0;
        PORTC.F1 = 1;
        PORTC.F2 = 0;
        PORTC.F3 = 1;
        PORTC.F4 = 0;
        PORTC.F5 = 0;
        UART1_Write_Text("21&");
        for(j = 20; j >= 1; j--){
            PORTD = mask(i % 10);
            PORTA.F0 = 1;
            delay_ms(10);
            PORTA.F0 = 0;
            PORTD = mask(i / 10);
            PORTA.F1 = 1;
            delay_ms(10);
            PORTA.F1 = 0;
            PORTB = mask(i % 10);
            PORTA.F2=1;
            delay_ms(10);
            PORTA.F2=0;
            PORTB = mask(i / 10);
            PORTA.F3=1;
            delay_ms(10);
            PORTA.F3=0;
            delay_ms(10);
            if(UART1_Data_Ready() == 1){
                return;
            }
        }
    }
}


////////////////////////////////////////////////////////////////////////////////

//TESTING ONLY
void run_programs(int time) {
    while (time >= 1) {
        time--; // Decrease time for the next iteration
    }
}


void delayms(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 1000; j++) {
            // Perform a simple operation to consume CPU cycles
            // You may need to adjust the number of iterations
            // depending on your microcontroller's clock frequency
            // to achieve an accurate delay of 1 millisecond.
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
//Chuong trinh chinh
void main(){
    PORTA = 0x00;
    PORTB = 0x00;
    PORTD = 0x00;
    TRISA = 0x00;
    TRISB = 0x00;
    TRISD = 0x00;
    TRISC = 0b11000000;
    PORTA.F0 = 0;
    PORTA.F1 = 0;
    PORTA.F2 = 0;
    PORTA.F3 = 0;

    UART1_Init(9600);
    delay_ms(100);

    while(1){
        UART1_Read_Text(readbuff, "!", 7);
        UART1_Write(readbuff[0]);
        UART1_Write(readbuff[1]);
        UART1_Write(readbuff[2]);
        UART1_Write(readbuff[3]);
        UART1_Write(readbuff[4]);
        UART1_Write(readbuff[5]);
        data1[0] = readbuff[0];
        data2[0] = readbuff[1];
        data3[0] = readbuff[2];
        data4[0] = readbuff[3];
        data5[0] = readbuff[4];
        data6[0] = readbuff[5];
        data1[1] = '\0';
        data2[1] = '\0';
        data3[1] = '\0';
        data4[1] = '\0';
        data5[1] = '\0';
        data6[1] = '\0';
        delay_ms(10);
        value1 = atoi(data1);
        delay_ms(10);
        value2 = atoi(data2);
        delay_ms(10);
        value3 = atoi(data3);
        delay_ms(10);
        value4 = atoi(data4);
        delay_ms(10);
        value5 = atoi(data5);
        delay_ms(10);
        value6 = atoi(data6);
        delay_ms(10);
        rtime = 0;
        ytime = (value3 * 10) + value4;
        delay_ms(10);
        gtime = (value5 * 10) + value6;
        delay_ms(10);
        dendo_xanh1(gtime, ytime);
        dendo_vang1(ytime);
        dendo_xanh2(gtime, ytime);
        dendo_vang2(ytime);
    }
}