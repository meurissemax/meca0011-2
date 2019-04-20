*******************************************************************
** Instructions pour l'utilisation des fichiers d'initialisation **
*******************************************************************


Conseils pour importer les fichiers dans Matlab:
------------------------------------------------

Utiliser la commande dlmread en pr�cisant que les s�parateurs sont des tabulations (\t)
ex: my_matrix = dlmread('my_file.txt','\t');

La pas de discr�tisation est pr�cis� ci-dessous.


Conventions:
------------

Pour chaque cas � faire passer, 3 matrices sont fournies:
	1) Une matrice repr�sentant le domaine g�om�trique (appel�e dom)
	Elle permet d'identifier
		1) Les noeuds qui ne doivent pas �tre calcul�s (valeur de 0). Une frange de 0 est plac�e
		autour de chaque domaine.
		2) Les noeuds internes prennent une valeur >= 1.
		3) Les noeuds condition limite de Dirichlet sont rep�r�s par une valeur de 2.
		
	2) Une matrice reprenant les valeurs des conditions de Dirichlet (appel�e cl)
	
	5) Une matrice qui donne un num�ro de noeud pour chaque noeud de calcul (appel�e num). Cette num�rotation permet d'ordonner le syst�me � r�soudre. Pour plus d'infos, voir la s�ance introductive ou avec les �tudiants-moniteurs.

	
Informations compl�mentaires:
-----------------------------

1) Canal rectiligne - pas spatial = 0.5 m

2) Superposition �coulement uniforme et source - pas spatial = 0.001 m

3) Ilot - pas spatial = 0.01 m (attention 2 CL de Dirichlet � tester)
