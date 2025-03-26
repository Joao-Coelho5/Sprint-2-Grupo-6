//Davi, Gabriela, Giulia, Guilherme Trevizan.

#include "Ultrasonic.h" // importando a biblioteca " Ultrasonic.h"

// aqui são listadas as variáveis inteiras utilizadas ao decorrer do código
int pinoTrigger = 12; // a variável pinoTrigger está com o valor da entrada 12
int pinoEcho = 13; // a variável pinoEcho está com o valor da entrada 13
HC_SR04 sensor(pinoTrigger, pinoEcho); // para identificação por parte da biblioteca

// pré-configurar o código 
void setup() {
  Serial.begin(9600); // frequência de transmissão em bits do arduino para o SerialUSB
}

// para repetição do comando entre as chaves
void loop() {
  float distancia = sensor.distance(); // cria a variável "distanca" em número decimal, recebendo a distância com base na biblioteca
  Serial.print("Fluxo:"); // para declarar o nome da label no plotter serial
// condição para caso a distância seja maior que 0 e menor que 30cm, executará o print 1, que significa "Tem objeto" e quebrará a linha
  if (distancia > 0 && distancia < 30){
    Serial.println(1);
  } else { // Caso contrário, irá exibir 0, que significa "Não tem objeto"
    Serial.println(0);
  }

  delay(1000); // o intervalo em ms entre as repetições 

}


