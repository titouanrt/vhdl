<h1><b><span style="color: #72d4de">Code des différentes parties du uP développé en VHDL</span></b></h1>

<h2><u><b>Arithmetic and Logic Unit (ALU)</b></u></h2>
Le code <a href ="design/alu.vhd">alu.vhd</a> contient le design associé à l'image ci-dessous :<br>
<img src="readme_content/ALU_IMAGE.png" style="width:200px;"></img>

Il permet de réaliser différents types d'opérations sur 8 bits :<br>
**ARITHMÉTIQUES :** 
> additions <br>
 soustractions <br>
 multiplications <br>

**LOGIQUES :**
> or<br>
and<br>
xor<br>
not<br>

Cette unité peut activer différents flags :<br>
> _Carry_ : Dépassement sur l'addition<br>
> _Negative_ : Valeur négative retournée<br>
> _Overflow_ : Dépassement sur la multiplication<br>

<h2><u><b>Banc de registres à double ports de lecture</b></u></h2>
Le code <a href ="design/banc2registres.vhd">banc2registres.vhd</a> contient le design associé à l'image ci-dessous :<br>
<img src="readme_content/BANC2REGISTRES_IMAGE.png" style="width:200px;"></img>

Il permet de stocker de la donnée dans 16 registres 8 bits. <br>Il est possible d'écrire 1 valeur dans un registre pour chaque cycle d'horloge, de lire le contenu de 2 registres simultanément et de réinitialiser l'entièreté des registres avec le reset.<br>

<h2><u><b>Mémoire de données</b></u></h2>
Le code <a href ="design/donnees.vhd">donnees.vhd</a> contient le design associé à l'image ci-dessous :<br>
<img src="readme_content/DONNEES_IMAGE.png" style="width:200px;"></img>

Cette mémoire permet de stocker 256 octets de données, il est possible de lire et d'écrire à l'intérieur.

<h2><u><b>Mémoire d'instructions</b></u></h2>
Le code <a href ="design/instructions.vhd">instructions.vhd</a> contient le design associé à l'image ci-dessous :<br>
<img src="readme_content/INSTRUCTIONS_IMAGE.png" style="width:200px;"></img>

Cette mémoire permet de stocker 256 instructions encodées sur 32 bits.
Cet exemple dispose d'une série d'instructions élémentaires comme la copie de registres ou un addition.

<h2><u><b>Portes de pipeline</b></u></h2>
Le code <a href="design/pipe_gate.vhd">pipe_gate.vhd</a> permet de faire le lien entre les différents étages du microprocesseur RISC.

<h2><u><b>Design global</b></u></h2>
Le code <a href="design/global.vhd">global.vhd</a> lie tous les composants entre eux en ajoutant une logique combinatoire permettant d'avoir un code d'instruction choisi.<br>
Ce code intègre aussi l'ajout de multiplexeurs permettant de réaliser des instructions comme des additions, multiplications, manipulation de la mémoire de données et des registre.
