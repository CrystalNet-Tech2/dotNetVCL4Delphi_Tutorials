unit uSerialPort;

// This is a simple demonstration on how to use the SerialPort component
// for communicating with your PC's COM Port.

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.SerialPort;

type
  TfrmSerialPort = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cmbPortName: TComboBox;
    cmbBauderate: TComboBox;
    cmbParity: TComboBox;
    cmbDataBits: TComboBox;
    cmbStopBits: TComboBox;
    btnConnect: TButton;
    GroupBox2: TGroupBox;
    rdText: TRadioButton;
    rdHex: TRadioButton;
    Label2: TLabel;
    txtSend: TEdit;
    btnSend: TButton;
    btnClear: TButton;
    CnSerialPort1: TCnSerialPort;
    rtxtDataArea: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CnSerialPort1DataReceived(Sender: TObject;
      E: _SerialDataReceivedEventArgs);
  private
    procedure UpdatePorts();
    procedure Connect();
    procedure Disconnect();
    procedure SendData();
    function HexStringToByteArray(S: String): TArray<Byte>;
  public
    { Public declarations }
  end;

var
  frmSerialPort: TfrmSerialPort;

implementation

{$R *.dfm}

uses CNClrLib.Host, CNClrLib.Host.Utils, CNClrLib.EnumArrays, CNClrLib.Host.Helper;

// Whenever the connect button is clicked, it will check if the port is already open,
// call the disconnect function.
procedure TfrmSerialPort.btnClearClick(Sender: TObject);
begin
  // Clear the screen
  rtxtDataArea.Clear;
  txtSend.Clear;
end;

procedure TfrmSerialPort.btnConnectClick(Sender: TObject);
begin
  if CnSerialPort1.IsOpen then
    Disconnect
  else
    Connect;
end;

procedure TfrmSerialPort.btnSendClick(Sender: TObject);
begin
  SendData;
end;

// When data is received on the port, it will raise this event
procedure TfrmSerialPort.CnSerialPort1DataReceived(Sender: TObject;
  E: _SerialDataReceivedEventArgs);
var
  receivedData: String;
begin
  receivedData := CnSerialPort1.ReadExisting; // Read all available data in the receiving buffer
  rtxtDataArea.Lines.Add(receivedData + 'n');
end;

procedure TfrmSerialPort.Connect;
var
  error: Boolean;
  clrEx: EClrException;
begin
  error := False;

  // Check if all settings have been selected
  if (cmbPortName.ItemIndex <> -1) and (cmbBauderate.ItemIndex <> -1) and
     (cmbParity.ItemIndex <> -1) and (cmbDataBits.ItemIndex <> -1) and
     (cmbStopBits.ItemIndex <> -1) then
  begin
    CnSerialPort1.PortName := cmbPortName.Text;
    CnSerialPort1.BaudRate := StrToInt(cmbBauderate.Text);
    CnSerialPort1.Parity := TParity(OleEnumToOrd(ParityValues, cmbParity.ItemIndex));
    CnSerialPort1.DataBits := StrToInt(cmbDataBits.Text);
    CnSerialPort1.StopBits := TStopBits(OleEnumToOrd(StopBitsValues, cmbStopBits.ItemIndex));

    try
      //Open Port;
      CnSerialPort1.Open;
    except
      on E: Exception do
      begin
        clrEx := EClrException.CreateEx(E);
        try
          if clrEx.IsTypeOf('System.UnauthorizedAccessException') or
             clrEx.IsTypeOf('System.IO.IOException') or
             clrEx.IsTypeOf('System.ArgumentException') then
          begin
            error := True;
          end;
        finally
          clrEx.Free;
        end;
      end;
    end;

    if error then
    begin
      TClrMessageBox.Show(Self, 'Could not open the COM port. Most likely it is '+
        'already in use, has been removed or is unavailable.', 'COM Port unavailable',
        TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiStop);
    end
    else
    begin
      TClrMessageBox.Show(self, 'Please select all the COM Serial Port Settings', 'Serial Port Interface',
        TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiStop);
    end;

    // If the port is open, change the Connect button to disconnect, enable the send button
    if CnSerialPort1.IsOpen then
    begin
      btnConnect.Caption := 'Disconnect';
      btnSend.Enabled := True;
      GroupBox1.Enabled := False;
    end;
  end;
end;

// Call this function to close the port
procedure TfrmSerialPort.Disconnect;
begin
  CnSerialPort1.Close;
  btnConnect.Caption := 'Connect';
  btnSend.Enabled := True;
  GroupBox1.Enabled := True;
end;

procedure TfrmSerialPort.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if CnSerialPort1.IsOpen then
    CnSerialPort1.Close; //Close the port if open when exiting the application
end;

procedure TfrmSerialPort.FormCreate(Sender: TObject);
begin
  UpdatePorts;
end;

// Convert a string of hex digits (example: E1 FF 1B) to a byte array.
// The string containing the hex digits (with or without spaces)
// returns TArray<Byte>
function TfrmSerialPort.HexStringToByteArray(S: String): TArray<Byte>;
var
  I: Integer;
  m_length: Integer;
begin
  S := StringReplace(S, ' ', '', [rfReplaceAll]);
  m_length := Trunc(Length(S)/2);
  SetLength(Result, m_length);
  for I := 0 to Length(S) - 1 do
  begin
    if I mod 2 <> 0 then Continue;

    Result[Trunc(I/2)] := TClrConvert.ToByte(Copy(S, i, 2), 16);            
  end;
end;

// a function to send data to the serial port
procedure TfrmSerialPort.SendData;
var
  error: Boolean;
  data: TArray<Byte>;
  clrEx: EClrException;
begin
  error := False;
  if rdText.Checked then //If text mode is selected, send data has text.
  begin
    // send the user's text straight out the port
    CnSerialPort1.Write(txtSend.Text);

    // show in the terminal window
    rtxtDataArea.Lines.Add(txtSend.Text + 'n');
    txtSend.Clear; //Clear screen after sending data    
  end
  else //If Hex Mode is selecetd, send data in hexidecimal
  begin
    try
      // Convert the user's string to hex digits (example: E1 FF 1B) to a byte array;
      data := HexStringToByteArray(txtSend.Text);

      // Send the binary data out the port
      CnSerialPort1.Write(data, 0, Length(data));

      //Show the hex digits in the terminal window
      rtxtDataArea.Lines.Add(UpperCase(txtSend.Text) + 'n');
      txtSend.Clear; // Clear screen after sending      
    except 
      on E: Exception do
      begin
        clrEx := EClrException.CreateEx(E);
        try
          if clrEx.IsTypeOf('System.FormatException') or // Inform the user if the hex string was not properly formatted
             clrEx.IsTypeOf('System.ArgumentException') then
          begin
            error := True;
          end;
        finally
          clrEx.Free;
        end;
      end;
    end;

    if error then
    begin
      TClrMessageBox.Show(Self, 'Not properly formated hex string: '+ txtSend.Text + 'n', 'Format Error',
        TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiStop);  
    end;
  end;
end;

procedure TfrmSerialPort.UpdatePorts;
var
  port: String;
  ports: TArray<String>;
begin
  ports := TCnSerialPort.GetPortNames;
  for port in ports do
  begin
    cmbPortName.Items.Add(port);
  end;
end;

end.
