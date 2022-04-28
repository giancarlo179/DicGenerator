#!/usr/bin/perl

#######################################################################
# Fichero:                      sgen.pl
# Fecha:			09-02-2011
# Version			1.3
# Autor:                        |FluiD| (migue_lin@msn.com)
# Descripcion:			Generador de diccionarios.
#
# Este programa es software libre; puedes redistribuirlo y/o modificarlo
# bajo los términos de la Licencia Publica General GNU (GPL) publicada
# por la Free Software Foundation; en su versión numero 3, o (bajo tu
# criterio) la ultima versión. Mira http://www.fsf.org/copyleft/gpl.txt
#
# Este programa se distribuye SIN GARANTIA de ningún tipo.
#
##########################################################################

#Variables a mostrar en menu.
$p = "N/A.";
$s = "N/A.";

# Salida estandar de HEX aleatorias
if (($ARGV[0] eq "-h") or ($ARGV[0] eq "-H"))
   {

print <<AQUI;

 StrinGenerator 1.3, by |FluiD| <migue_lin@msn.com>
 usage: perl sgen.pl [ -hxX  <num> ]

   Sin parametro muestra menu.  

  -h Muestra esta ayuda.
  -x HEX aleatorias minusculas en STDOUT.
  -X HEX aleatorias mayusculas en STDOUT.
  <num> Longitud de HEX (para -x -X). Sin <num>, 26 char.

AQUI
      exit;
   }
elsif ($ARGV[0] eq "-X")
   {
      &hex_may_out;
   }
elsif ($ARGV[0] eq "-x")
   {
      &hex_min_out;
   }

################################################################################################################
####################################### SUBRUTINA menu_principal ###############################################

&menu_principal;

sub menu_principal
{

my ($opmenu);

&limpia;
print <<AQUI;
 ===================================================
         StrinGenenator v1.3 by |FluiD| 
 ===================================================
 1.-  Dic. letras minusculas.
 2.-  Dic. letras MAYUSCULAS.
 3.-  Dic. letras minusculas y numeros.
 4.-  Dic. letras MAYUSCULAS y numeros.
 5.-  Dic. numeros.
 6.-  Dic. numeros desde... hasta...
 7.-  Dic. HEX.
 8.-  Dic. HEX aleatorios.
 9.-  Dic. con string y letras minusculas.
 10.- Dic. con string y letras MAYUSCULAS.
 11.- Dic. con string y numeros.
 12.- Dic. con string, letras minusculas y numeros.
 13.- Dic. con string, letras MAYUSCULAS y numeros.
 14.- Dic. a medida.
 15.- Dic. a medida por volumenes.
 16.- Filtrar palabras en archivo de texto.
 17.- Conversor archivos Mayusculas/Minusculas.
 ---------------------------------------------------
 p.-Prefijo : $p
 s.-Sufijo  : $s
 ===================================================
AQUI

print " Opcion: ";

$opmenu = <STDIN>;
chomp $opmenu;

if ($opmenu eq 1)
   {
      &fichero;
      &longitud;
      &let_min;
   }
elsif ($opmenu eq 2)
   {
      &fichero;
      &longitud;
      &let_may;
   }
elsif ($opmenu eq 3)
   {
      &fichero;
      &longitud;
      &let_min_num;
   }
elsif ($opmenu eq 4)
   {
      &fichero;
      &longitud;
      &let_may_num;
   }
elsif ($opmenu eq 5)
   {
      &fichero;
      &longitud;
      &num;
   }
elsif ($opmenu eq 6)
   {
      &fichero;
      &num_def;
   }
elsif ($opmenu eq 7)
   {
      &fichero;
      &longitud;
      &hex;
   }
elsif ($opmenu eq 8)
   {
      &fichero;
      &hex_aleatorio;
   }
elsif ($opmenu eq 9)
   {
      &fichero;
      &longitud;
      &string;
      &string_min;
   }
elsif ($opmenu eq 10)
   {
      &fichero;
      &longitud;
      &string;
      &string_may;
   }
elsif ($opmenu eq 11)
   {
      &fichero;
      &longitud;
      &string;
      &string_num;
   }
elsif ($opmenu eq 12)
   {
      &fichero;
      &longitud;
      &string;
      &string_min_num;
   }
elsif ($opmenu eq 13)
   {
      &fichero;
      &longitud;
      &string;
      &string_may_num;
   }
elsif ($opmenu eq 14)
   {  &fichero;
      &longitud2;
      &medida2;
   }
elsif ($opmenu eq 15)
   {  &menu_volumen;
      &fichero;
      &longitud2;
      &medida;
   }  
elsif ($opmenu eq 16)
   {
      &fichero;
      &cleandic;
   }
elsif ($opmenu eq 17)
   {
      &fichero;
      &conv;
   }
elsif ($opmenu eq "p")
   {
      &prefijo;
   }
elsif ($opmenu eq "s")
   {
      &sufijo;
   }
else
   {
      &menu_principal;
   }

} #SUB


################################################################################################################
####################################### SUBRUTINA hex_may_out ##################################################

######################################################
# Ejecutando el script con perl sgen.pl -X <num>
# genera por la salida estandar Hex aleatorias en
# mayusculas con la longitud <num>.
# Sin <num> genera con longitud 26
######################################################

sub hex_may_out
{
   my($long,@hex,$cont,$num,$hex);

   $long = $ARGV[1];

   if (($long eq "") or ($long !~ /\b\d+\b/)) {$long= 26};


   @hex = (0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F);
   $cont = 0;

while(1)
   {

      $num =  int(rand(16));
      $hex = $hex.$hex[$num];

      $cont++;

         if ($cont == $long)
            {
               $cont=0;
               print "$hex\n";
               $hex = "";
            }
   }
}


################################################################################################################
####################################### SUBRUTINA hex_min_out ##################################################

######################################################
# Ejecutando el script con perl sgen.pl -x <num>
# genera por la salida estandar Hex aleatorias en
# minusculas con la longitud <num>
# Sin <num> genera con longitud 26.
######################################################


sub hex_min_out
{
   my($long,@hex,$cont,$num,$hex);

   $long = $ARGV[1];

  if (($long eq "") or ($long !~ /\b\d+\b/)) {$long= 26};

   @hex = (0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f);
   $cont = 0;

while(1)
   {
      $num =  int(rand(16));
      $hex = $hex.$hex[$num];

      $cont++;

         if ($cont == $long)
            {
               $cont=0;
               print "$hex\n";
               $hex = "";
            }
   }
}

################################################################################################################
####################################### SUBRUTINA prefijo #####################################################

sub prefijo
{
   print "\n Este prefijo se aplicara a TODOS los diccionarios.\n";
   print " A excepcion de las opciones 16 y 17.\n";
   print " Pulsa solo enter para no usar ningun prefijo.\n\n";
   print " Prefijo: ";
   $pref = <STDIN>;
   chomp $pref;

   if ($pref eq "")
      {
         $p = "N/A.";
      }
   else
      {
         $p = $pref;
      }

   &menu_principal;
}


################################################################################################################
####################################### SUBRUTINA sufijo #####################################################

sub sufijo
{
   print "\n Este sufijo se aplicara a TODOS los diccionarios.\n";
   print " A excepcion de las opciones 16 y 17.\n";
   print " Pulsa solo enter para no usar ningun prefijo.\n\n";
   print " Sufijo: ";
   $suf = <STDIN>;
   chomp $suf;

   if ($suf eq "")
      {
         $s = "N/A.";
      }
   else
      {
         $s = $suf;
      }

   &menu_principal;
}


################################################################################################################
####################################### SUBRUTINA cleandic #####################################################

# Extrae palabras de archivos de texto

sub cleandic
{

# Declaramos las variables como local
my ($longitud, $archivo, @matriz1, @matriz2, $opcion);

@matriz1=();
@matriz2=();
$longitud=();
$opcion=();

# El nombre del diccionario a crear se obtiene en una llamada en la subrutina menu_principal

# Obtenemos el nombre del archivo de texto a filtar
print " Nombre del archivo de texto a filtrar: ";
$archivo = <STDIN>;
chomp $archivo;

# Abrimos el archivo a filtrar
if (not open (ARCHIVOAFILTRAR, "$archivo"))
   {
      print " No se ha podido abrir el archivo!";
      $null = (<STDIN>);
      &menu_principal
   }

# Agregamos a la matriz2 cada linea del archivo de texto
while (<ARCHIVOAFILTRAR>)
   {
      @matriz1 = split(/\s+/, $_);
      splice(@matriz2, $#matriz2+1, 0, @matriz1);
   }

ETI3:
print <<AQUI;

 ===================================================

 1.-    Extrae todo, no filtra longitud.

 2.-    Extrae longitud indicada.

 3.-    Todas las longitudes menores o igual que...

 4.-    Todas las longitudes mayores o igual que...

 ===================================================

AQUI

print " Opcion: ";
$opcion = (<STDIN>);
chomp $opcion;
if ($opcion !~ /\b[1-4]\b/) {goto ETI3;}

if ($opcion ne 1)
   {
      ETI4:
      print " Longitud en caracteres de las palabras a extraer: ";
      $longitud = <STDIN>;
      chomp $longitud;
      if ($longitud !~ /\b[1-9]+\b/) {goto ETI4;}
   }

# Opcion menu 1
if ($opcion eq 1)
   {
      foreach (@matriz2)
         {
            print DICC "$_\n";
         }

      close ARCHIVOAFILTRAR;
      &generando;
      &generado;      
   }

# Opcion menu 2
elsif ($opcion eq 2 )
   {
      foreach (@matriz2)
         {
            if (length($_) eq $longitud) 
               {
                  print DICC "$_\n";
               }
         }

      close ARCHIVOAFILTRAR;
      &generando;
      &generado;      

   }

# Opcion menu 3
elsif ($opcion eq 3 )
   {
      foreach (@matriz2)
         {
            if (length($_) <= $longitud) 
               {
                  print DICC "$_\n";
               }
         }

      close ARCHIVOAFILTRAR;
      &generando;
      &generado;      

   }

# Opcion menu 4
elsif ($opcion eq 4 )
   {
      foreach (@matriz2)
         {
            if (length($_) >= $longitud) 
               {
                  print DICC "$_\n";
               }
         }

      close ARCHIVOAFILTRAR;
      &generando;
      &generado;      

   }

print " Opciones no validas!";
$null = <STDIN>;
&menu_principal;

} # Fin sub cleandic

################################################################################################################
####################################### SUBRUTINA menu_volumen #################################################

sub menu_volumen
{

# De aqui obtenemos la variable $tamano

print " Generar el diccionario en varios volumenes? (s/n): ";
$sino = <STDIN>;

if ($sino =~ /\bs\b/i)
   {
   
      $fijaerror = 1;
      ETI1:
      print " Cuantos Mb por volumen: ";
      $tamano = <STDIN>;
      chomp $tamano;

      if (($tamano !~ /\b\d\d*\b/) or ($tamano eq 0)) {goto ETI1;}

# De aqui obtenemos la variable $stop que nos servira en la subrutina comprueba
      
      ETI2:
      print " Esperar y preguntar despues de cada volumen? (s/n): ";
      $stop = <STDIN>;
      chomp $stop;

      if ($stop =~ /\bs\b/i)
         {
            $stop = 1;
         }
   
      elsif ($stop =~ /\bn\b/i)
         {
            $stop = 0;
         }
      else {goto ETI2;}

   }
elsif ($sino =~ /\bn\b/i)
   {
      #Esto es necesario para fijar el error de $tamano cuando no tiene valor, ya que entra en el 
      #condicional if de la subrutina &comprueba y hace "true" la sentencia

      $fijaerror = 0; 
   }
else
   {
      &menu_volumen;
   }

} #SUB


################################################################################################################
####################################### SUBRUTINA comprueba ####################################################

sub comprueba
{
   $size = (-s DICC);
   $size = (($size / 1024) / 1024);
   if (($size >= $tamano) and ($fijaerror eq 1))
   {

      close DICC;
      $sumavol++;
      open (DICC, ">$diccionario$sumavol");

      if ($stop eq 1)
         {
            print "\n";
            print " Volumen $sumavol con $tamano Mb creado\n";
            print " Pulsa ENTER para continuar";
            $null = <STDIN>;
            &generando2
         }
   } 
}



################################################################################################################
####################################### SUBRUTINA limpia #######################################################

sub limpia
{
$platform = `uname -o`;
chomp $platform;

   if ($platform eq "GNU/Linux")
      {
         system clear;
      }
   else
      {
         system cls;
      }
}


################################################################################################################
####################################### SUBRUTINA fichero ######################################################

sub fichero
{

   #Obtenemos el nombre del diccionario y lo abrimos con el gestor
   
   print " Nombre del diccionario a crear: ";
   $diccionario = <STDIN>;
   if ($diccionario eq "\n"){&fichero;}
   chomp $diccionario;
   if ( -e $diccionario)
      {
         print "\n";
         print " ---------------------------------------------\n";
         print " El diccionario a crear ya existe.\n";
         print " Las palabras nuevas seran agregadas al final.\n";
         print " ---------------------------------------------\n";
      }

   open (DICC, ">>$diccionario");

}


################################################################################################################
####################################### SUBRUTINA logitud ######################################################

sub longitud
{
      print " Logitud de la cadena (num. de variables(2-13)): ";
      $longitud = <STDIN>;
      chomp $longitud;
      if (($longitud ne 2) and 
          ($longitud ne 3) and
          ($longitud ne 4) and
          ($longitud ne 5) and
          ($longitud ne 6) and
          ($longitud ne 7) and
          ($longitud ne 8) and
          ($longitud ne 9) and
          ($longitud ne 10) and
          ($longitud ne 11) and
          ($longitud ne 12) and
          ($longitud ne 13))
            {
               &longitud;
            }
}   



################################################################################################################
####################################### SUBRUTINA logitud2 #####################################################

# Esta subrutina es solo para  &medida y $medida2, para poder ampliar la longitud maxima a 15
sub longitud2
{
      print " Logitud de la cadena (num. de variables(2-15)): ";
      $longitud = <STDIN>;
      chomp $longitud;
      if (($longitud ne 2) and 
          ($longitud ne 3) and
          ($longitud ne 4) and
          ($longitud ne 5) and
          ($longitud ne 6) and
          ($longitud ne 7) and
          ($longitud ne 8) and
          ($longitud ne 9) and
          ($longitud ne 10) and
          ($longitud ne 11) and
          ($longitud ne 12) and
          ($longitud ne 13) and
          ($longitud ne 14) and
          ($longitud ne 15))
          
            {
               &longitud2;
            }
}   

################################################################################################################
####################################### SUBRUTINA string #######################################################

sub string
{
   print " Cadena o string a intercalar entre las variables: ";
   $string =<STDIN>;
   chomp $string;
   @string = ();
   unshift (@string,$string);
}

################################################################################################################
####################################### SUBRUTINA generando ####################################################

sub generando
{
print <<AQUI;

 ===================================================
 Generando diccionario...
 Nombre del diccionario : $diccionario
 CONTROL + C cancela diccionario.
 ===================================================
AQUI
}
################################################################################################################
####################################### SUBRUTINA generando2 ###################################################

sub generando2
{
print <<AQUI;

 ===================================================
 Generando diccionario...
 CONTROL + C cancela diccionario.
 ===================================================
AQUI
}

################################################################################################################
###################################### SUBRUTINA generado ######################################################

sub generado
{
close DICC;
print <<AQUI;

 ===================================================
 Diccionario creado con exito.
 Pulsa ENTER para volver a menu.
 ===================================================
AQUI

$null =  <STDIN>;
&menu_principal;
}


################################################################################################################
####################################### SUBRUTINA agrega #######################################################

sub agrega
{
print <<AQUI;

 ===================================================
 Introduce los atajos con los corchetes.
 Para mas ayuda consulta el LEEME.txt
 ---------------------------------------------------

 [a-z] Agrega abecedario completo en min.
 [A-Z] Agrega abecedario completo en MAY.
 [0-9] Agrega todos los numeros.
 [a-f] Agrega todos los caracteres HEX en min.
 [A-F] Agrega todos los caracteres HEX en MAY.

 ===================================================
 Introduce cualquier caracter, palabra o signo de
 puntuacion y pulsa ENTER.
 Se generaran todas las combinaciones de los
 caracteres que introduzcas.
 ---------------------------------------------------
 Para comenzar a generar el diccionario 
 escribe .exit en minusculas (Con el punto).
 ===================================================

AQUI
}

################################################################################################################
####################################### SUBRUTINA let_min ######################################################

sub let_min
{

##############################################
#   Genera combinaciones de la "a" a la "z"  
#   de letras minusculas de longitud de entre
#   2 y 13 caracteres.
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,@matriz);

@matriz=("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10      
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11      
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12      
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13      
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB

################################################################################################################
####################################### SUBRUTINA let_may ######################################################

sub let_may
{

##############################################
#   Genera combinaciones de la "a" a la "z"  
#   de letras MAYUSCULAS de longitud de entre
#   2 y 13 caracteres.
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,@matriz);

@matriz=("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10      
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11      
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12      
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13      
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB

####################################################################################################################
####################################### SUBRUTINA let_min_num ######################################################

sub let_min_num
{

##############################################
#   Genera combinaciones de letras minusculas
#   y numeros (en ese orden) de entre 2 y 
#   13 caracteres.
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,@matriz);

@matriz=("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9");

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10      
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11      
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12      
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13      
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB

####################################################################################################################
####################################### SUBRUTINA let_may_num ######################################################

sub let_may_num
{
##############################################
#   Genera combinaciones de letras MAYUSCULAS
#   y numeros (en ese orden) de entre 2 y 
#   13 caracteres.
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,@matriz);

@matriz=("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9");

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB

################################################################################################################
####################################### SUBRUTINA num ##########################################################

sub num
{

##############################################
#   Genera combinaciones de numeros de entre
#   2 y 13 caracteres.
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,@matriz);

@matriz=("0","1","2","3","4","5","6","7","8","9");

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB 


################################################################################################################
####################################### SUBRUTINA num_def ######################################################
sub num_def
{

#################################################
# Genera diccionarios de numeros desde... 
# hasta... de longitud indeterminada
#################################################

$primero="";
$ultimo="";

while ($primero !~ /\b\d+\b/)
   {
      print " Numero de comienzo: ";
      $primero = <STDIN>;
      chomp $primero;
    }

while ($ultimo !~ /\b\d+\b/)
   {
      print " Numero final: ";
      $ultimo = <STDIN>;
      chomp $ultimo;
   }

# Activa modulo para manejar numeros grandes
require Math::BigInt;

my $primero = Math::BigInt->new($primero);
my $ultimo  = Math::BigInt->new($ultimo);

my $largo_primero = $primero->length;
my $largo_ultimo  = $ultimo ->length;

&generando;

if ($primero < $ultimo) {

   my $largo_ceros = $largo_ultimo - $largo_primero;
   my $ceros = '0' x $largo_ceros;

   while ($primero->bcmp($ultimo) < 1) {
       print  DICC $pref;
       print  DICC substr "$ceros$primero", -$largo_ultimo;
       print  DICC $suf;
       print  DICC "\n";

       # Aumentamos $primero en una unidad
       $primero->binc();
      }
}

else {
   my $largo_ceros = $largo_primero - $largo_ultimo;
   my $ceros = '0' x $largo_ceros;

   while ($primero != $ultimo-1) {
       print  DICC $pref;
       print  DICC substr "$ceros$primero", -$largo_primero;
       print  DICC $suf;
       print  DICC "\n";

       # decrementamos $primero en una unidad
       $primero->bdec();
      }
}

close DICC;
&generado;

}

################################################################################################################
####################################### SUBRUTINA hex ##########################################################

sub hex
{

##############################################
#   Genera combinaciones de caracteres 
#   hexadecimales de longitud entre
#   2 y 13 caracteres.
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,@matriz,$dat);

while ($dat !~ /\b[1]\b|\b[2]\b/)
{
   print "\n 1.-HEX en mayusculas.\n";
   print " 2.-HEX en minusculas.\n\n";
   print " Opcion: ";
   $dat = <STDIN>;
   chomp $dat;
}

if ($dat eq 1)
   {
      @matriz=("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");
   }
else
   {
      @matriz=("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");
   }

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10      
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11      
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12      
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13      
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB



###################################################################################################################
####################################### SUBRUTINA hex_aleatorio ###################################################
sub hex_aleatorio
{
my ($dat,$long,$cont,$hex,$num);

print "\n El diccionario se generara de forma infinita.\n";

while ($long !~ /\b\d+\b/)
{
   print "\n Longitud: ";
   $long = <STDIN>;
   chomp $long;
}

while ($dat !~ /\b[1]\b|\b[2]\b/)
{
   print "\n 1.-HEX en mayusculas.\n";
   print " 2.-HEX en minusculas.\n\n";
   print " Opcion: ";
   $dat = <STDIN>;
   chomp $dat;
}


if ($dat eq 1)
   {
      @hex=("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");
   }
else
   {
      @hex=("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");
   }

&generando;

$cont = 0;

while(1)
   {
      $num =  int(rand(16));
      $hex = $hex.$hex[$num];

      $cont++;

         if ($cont == $long)
            {
               $cont=0;
               print DICC "$pref$hex$suf\n";
               $hex = "";
            }
   }

}


###################################################################################################################
####################################### SUBRUTINA string_min ######################################################

sub string_min
{

#################################################
# Alterna una cadena o string entre un numero de 
# letras minusculas de la a-z.
#################################################

#DEFINIMOS LAS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$cont,@matriz,@guarda);

@matriz=("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");

&generando;

foreach $cont (0..$longitud) #Bucle principal del contador ($cont) para mover el string
{

#VARIABLE 1
foreach $var1(@matriz)
{
         if ($longitud == 1)
         {
         @guarda = ($var1);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         }

#VARIABLE 2
      foreach $var2(@matriz)
      {
         if ($longitud == 2)
         {
         @guarda = ($var1,$var2);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         @guarda = ($var1,$var2,$var3);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         @guarda = ($var1,$var2,$var3,$var4);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BBUCLE 1
} #Bucle principal del contador ($cont) para mover el string

&generado;

} #SUB

###################################################################################################################
####################################### SUBRUTINA string_may ######################################################

sub string_may
{

#################################################
# Alterna una cadena o string entre un numero de 
# letras MAYUSCULAS de la A-Z.
#################################################

#DEFINIMOS LAS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$cont,@matriz,@guarda);

@matriz=("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");

&generando;

foreach $cont (0..$longitud) #Bucle principal del contador ($cont) para mover el string
{

#VARIABLE 1
foreach $var1(@matriz)
{
         if ($longitud == 1)
         {
         @guarda = ($var1);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         }

#VARIABLE 2
      foreach $var2(@matriz)
      {
         if ($longitud == 2)
         {
         @guarda = ($var1,$var2);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         @guarda = ($var1,$var2,$var3);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         @guarda = ($var1,$var2,$var3,$var4);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BBUCLE 1
} #Bucle principal del contador ($cont) para mover el string

generado;

} #SUB

###################################################################################################################
####################################### SUBRUTINA string_num ######################################################

sub string_num
{

#################################################
# Alterna una cadena o string entre numeros 
#################################################

#DEFINIMOS LAS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$cont,@matriz,@guarda);

@matriz=("0","1","2","3","4","5","6","7","8","9");

&generando;

foreach $cont (0..$longitud) #Bucle principal del contador ($cont) para mover el string
{

#VARIABLE 1
foreach $var1(@matriz)
{
         if ($longitud == 1)
         {
         @guarda = ($var1);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         }

#VARIABLE 2
      foreach $var2(@matriz)
      {
         if ($longitud == 2)
         {
         @guarda = ($var1,$var2);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         @guarda = ($var1,$var2,$var3);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         @guarda = ($var1,$var2,$var3,$var4);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BBUCLE 1
} #Bucle principal del contador ($cont) para mover el string

&generado;

} #SUB

#######################################################################################################################
####################################### SUBRUTINA string_min_num ######################################################

sub string_min_num
{

#################################################
# Alterna una cadena o string entre un numero de 
# letras minusculas de la a-z y numeros (0-9).
#################################################

#DEFINIMOS LAS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$cont,@matriz,@guarda);

@matriz=("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9");

&generando;

foreach $cont (0..$longitud) #Bucle principal del contador ($cont) para mover el string
{

#VARIABLE 1
foreach $var1(@matriz)
{
         if ($longitud == 1)
         {
         @guarda = ($var1);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         }

#VARIABLE 2
      foreach $var2(@matriz)
      {
         if ($longitud == 2)
         {
         @guarda = ($var1,$var2);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         @guarda = ($var1,$var2,$var3);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         @guarda = ($var1,$var2,$var3,$var4);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 11
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 12
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var12,$var12);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }
#VARIABLE 13
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BBUCLE 1
} #Bucle principal del contador ($cont) para mover el string

&generado;

} #SUB

#######################################################################################################################
####################################### SUBRUTINA string_may_num ######################################################

sub string_may_num
{

#################################################
# Alterna una cadena o string entre un numero de 
# letras MAYUSCULAS de la A-Z y numeros (0-9).
#################################################

#DEFINIMOS LAS VARIABLES COMO LOCAL
my ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$cont,@matriz,@guarda);

@matriz=("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9");

&generando;

foreach $cont (0..$longitud) #Bucle principal del contador ($cont) para mover el string
{

#VARIABLE 1
foreach $var1(@matriz)
{
         if ($longitud == 1)
         {
         @guarda = ($var1);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         }

#VARIABLE 2
      foreach $var2(@matriz)
      {
         if ($longitud == 2)
         {
         @guarda = ($var1,$var2);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         @guarda = ($var1,$var2,$var3);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         @guarda = ($var1,$var2,$var3,$var4);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 11
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 12
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 13
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         @guarda = ($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13);
         splice (@guarda,$cont,0,@string);
         print DICC $pref,@guarda,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BBUCLE 1
} #Bucle principal del contador ($cont) para mover el string

&generado;

} #SUB


################################################################################################################
####################################### SUBRUTINA medida #######################################################

sub medida
{

##############################################
#   Genera diccionario a medida agregando
#   elementos a la matriz y comprobando tamano
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my 
($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$var14,$var15,@matriz,$introduce,@num,@abc,@ABC,@HEX,@hex,$cont,$divisor);

$sumavol = 0;
$cont = 0;
$divisor = 1000;

@num=("0","1","2","3","4","5","6","7","8","9");

@HEX=("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");
@hex=("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");

@abc=("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
@ABC=("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
@matriz=();

&agrega;

while ($introduce ne ".exit")
   {
      print " Nuevo caracter, palabra o signo de puntuacion: ";
      $introduce = <STDIN>;
      chomp $introduce;
      
      next if ($introduce eq ".exit");

      if ($introduce eq "[a-z]")
         {
            splice(@matriz,$#matriz+1,0,@abc);
            print " Agregado abecedario en minusculas\n";
         }

      elsif ($introduce eq "[A-Z]")
         {            
            splice(@matriz,$#matriz+1,0,@ABC);
            print " Agregado abecedario en MAYUSCULAS\n";
         }
      elsif ($introduce eq "[0-9]")
         {            
            splice(@matriz,$#matriz+1,0,@num);
            print " Agregados todos los numeros.\n";
         }
       elsif ($introduce eq "[a-f]")
         {
            splice(@matriz,$#matriz+1,0,@hex);
            print " Agregados todos los caracteres HEX en minusculas.\n";
         }
       elsif ($introduce eq "[A-F]")
         {
            splice(@matriz,$#matriz+1,0,@HEX);
            print " Agregados todos los caracteres HEX en MAYUSCULAS.\n";
         }

      else
         {
            print " Agregado: $introduce\n";
            push (@matriz, $introduce);
         }

   }

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 10      
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 11      
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 12      
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 13      
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 14      
      foreach $var14(@matriz)
      {
         if ($longitud == 14)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$var14,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

#VARIABLE 15      
      foreach $var15(@matriz)
      {
         if ($longitud == 15)
         {
            unless($cont % $divisor)
               {
                  &comprueba;
               }

         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$var14,$var15,$suf;
         print DICC "\n";
         $cont++;
         next;
         }

      } #BUCLE 15
      } #BUCLE 14
      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB

################################################################################################################
####################################### SUBRUTINA medida2 ######################################################

sub medida2
{

##############################################
#   Genera diccionario a medida agregando
#   elementos a la matriz.
##############################################

#DEFINIMOS VARIABLES COMO LOCAL
my 
($var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$var14,$var15,@matriz,$introduce,@num,@abc,@ABC,@HEX,@hex);

@num=("0","1","2","3","4","5","6","7","8","9");

@HEX=("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");
@hex=("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");

@abc=("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
@ABC=("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
@matriz=();

&agrega;

while ($introduce ne ".exit")
   {
      print " Nuevo caracter, palabra o signo de puntuacion: ";
      $introduce = <STDIN>;
      chomp $introduce;
      
      next if ($introduce eq ".exit");

      if ($introduce eq "[a-z]")
         {
            splice(@matriz,$#matriz+1,0,@abc);
            print " Agregado abecedario en minusculas\n";
         }

      elsif ($introduce eq "[A-Z]")
         {            
            splice(@matriz,$#matriz+1,0,@ABC);
            print " Agregado abecedario en MAYUSCULAS\n";
         }
      elsif ($introduce eq "[0-9]")
         {            
            splice(@matriz,$#matriz+1,0,@num);
            print " Agregados todos los numeros.\n";
         }
       elsif ($introduce eq "[a-f]")
         {
            splice(@matriz,$#matriz+1,0,@hex);
            print " Agregados todos los caracteres HEX en minusculas.\n";
         }
       elsif ($introduce eq "[A-F]")
         {
            splice(@matriz,$#matriz+1,0,@HEX);
            print " Agregados todos los caracteres HEX en MAYUSCULAS.\n";
         }

      else
         {
            print " Agregado: $introduce\n";
            push (@matriz, $introduce);
         }

   }

&generando;

#VARIABLE 1
foreach $var1(@matriz)
{

#VARIABLE 2
      foreach $var2(@matriz)
      {
	if ($longitud == 2)
         {
         print DICC $pref,$var1,$var2,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 3      
      foreach $var3(@matriz)
      {
         if ($longitud == 3)
         {
         print DICC $pref,$var1,$var2,$var3,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 4      
      foreach $var4(@matriz)
      {
         if ($longitud == 4)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 5
      foreach $var5(@matriz)
      {
         if ($longitud == 5)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 6      
      foreach $var6(@matriz)
      {
         if ($longitud == 6)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 7      
      foreach $var7(@matriz)
      {
         if ($longitud == 7)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 8      
      foreach $var8(@matriz)
      {
         if ($longitud == 8)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 9      
      foreach $var9(@matriz)
      {
         if ($longitud == 9)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 10      
      foreach $var10(@matriz)
      {
         if ($longitud == 10)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 11      
      foreach $var11(@matriz)
      {
         if ($longitud == 11)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 12      
      foreach $var12(@matriz)
      {
         if ($longitud == 12)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 13      
      foreach $var13(@matriz)
      {
         if ($longitud == 13)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 14      
      foreach $var14(@matriz)
      {
         if ($longitud == 14)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$var14,$suf;
         print DICC "\n";
         next;
         }

#VARIABLE 15      
      foreach $var15(@matriz)
      {
         if ($longitud == 15)
         {
         print DICC $pref,$var1,$var2,$var3,$var4,$var5,$var6,$var7,$var8,$var9,$var10,$var11,$var12,$var13,$var14,$var15,$suf;
         print DICC "\n";
         next;
         }

      } #BUCLE 15
      } #BUCLE 14
      } #BUCLE 13
      } #BUCLE 12
      } #BUCLE 11
      } #BUCLE 10
      } #BUCLE 9
      } #BUCLE 8
      } #BUCLE 7
      } #BUCLE 6
      } #BUCLE 5
      } #BUCLE 4
      } #BUCLE 3
      } #BUCLE 2

} #BUCLE 1

&generado;

} #SUB


################################################################################################################
####################################### SUBRUTINA conv #########################################################

#####################################
# Convierte archivos de texto de
# mayusculas a minusculas y veceversa
#####################################

sub conv
{

# Declaramos las variables como local
my ($archivo,$dat,$conv);

# El nombre del diccionario a crear se obtiene en una llamada en la subrutina menu_principal

# Obtenemos el nombre del archivo de texto a convertir
print " Nombre del archivo de texto a convertir: ";
$archivo = <STDIN>;
chomp $archivo;

# Abrimos el archivo a convertir
if (not open (CONV, "$archivo"))
   {
      print " No se ha podido abrir el archivo!";
      $null = (<STDIN>);
      &menu_principal
   }


while ($dat !~ /\b[1]\b|\b[2]\b/)
   {
      print "\n 1.-Minusculas => Mayusculas.";
      print "\n 2.-Mayusculas => Minusculas.\n\n";
      print " Opcion: ";
      $dat = <STDIN>;
      chomp $dat;
   }

&generando;

if ($dat eq 1)
   {
      while (<CONV>)
         {
            $conv = uc($_);
            print DICC $conv;
         }
   }
else
   {
      while (<CONV>)
         {
            $conv = lc($_);
            print DICC $conv;
         }
 
   }

close CONV;
&generado;

}

