   M S B A M L   `   `   `  ����D  @Helio WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:HelioHelio  5   	       
Helio.Chat   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Helio     5   	   -   5          �Name$  wdwChat��5   	    � Title$
 Chat��5   	    � WindowState$ 	Maximized=�6   $	��984��6.   .��5	      � ��5
   
   �� 5         LightPrimary �� Color# �   6   .+�5   
   ]� -   5         ]�Name$ 	pnlHeader��5      ��.  $��52��6=   $	��Top=�6I   ��5      �� 5        Primary# �  6"   .+�5      �� -   5         ��Name$ 	lblHeader��5      $
��Chat��6'   $	��Top=�66   
�������$��	Comfortaa)�6a   $��24(�6x   $
��Left=�6�   $��76��6�   $��7,7,0,0q�6�   5      �� 5   
   -   5         ��Name$ txtMsg��5      $��45��6"   $��313,0,94,10q�6.    �� TextWrapping$
 Wrap=�6C   $��Bottom=�6W   $��21(�6r   ���	#00ABADB3
�������$��5q�6�    �� SelectionOpacity$ 0Q�6�   .��6�   	 � 	Resources	 5      
 �� 
TargetType �� Property �� Value��%_   '��       �� 5      "
 ��6   .�5      ��  �@��CornerRadius$ 10��65   5      5      .��6!   ��5      �� 5        DarkPrimary# �  6"   .��5   "   5      �� 5   
   -   5         ��Name$ btnSend��5      $
��Send��6"   $��	0,0,10,10q�61   $��5q�6D   
����������	#00707070$��18(�6{   $��45��6�   $��Bottom=�6�   $��Right=�6�   $��75��6�   	 5      ��%_   '��       �� 5      "
 ��6   .�5       ��  �@��CornerRadius$ 10��65   5!      5"      ��5#      �� 5$       
 Accent# �  6"   5&      �� 5'   
   -   5         ��Name$ 
pnlChannel��5'      $��0,52,0,0q�6)   $
��Left=�6;   $	��308��6V   ��5(      �� 5)      # �  6"   .+�5+      �� -   5        $ lblHeaderProfile��5+      $��Profile��6.   $	��Top=�6@   
�������$��	Comfortaa)�6k   $��22(�6�   $
��Left=�6�   $	��101��6�   $��7,5,0,0q�6�   �� 5,      -   5         ��Name$ imgProfilePicture��5,      $	��128��6/   $
��87,0q�6<   6L   �� 5-      -	   5        $ lblProfileUsername��5-      $��Username��60   $	��Top=�6C   
�������$��	Comfortaa)�6n   $��22(�6�   $��0,5,0,0q�6�   $��Center=�6�   �� 5.      -
   5        $ lblProfileScore��5.      $��Score: ��6-   $	��Top=�6?   
�������$��	Comfortaa)�6j   $��16(�6�   $��0,2,0,0q�6�   $��Center=�6�   �� 5/      -   5        $ lblHeaderChannel��5/      $��Channel��6.   $	��Top=�6@   
�������$��	Comfortaa)�6k   $��22(�6�   $
��Left=�6�   $	��101��6�   $��7,5,0,0q�6�   �� 50      $��70��6    �� Orientation$ 
Horizontal=�6%   .+�51      �� -   5        $ 
txtChannel��51      $��45��6.   $
 Wrap=�6:   $��21(�6N   ���	#00ABADB3
�������$��5q�6�   $ 0Q�6�   $
��Left=�6�   $	��194��6�   $��	10,10,0,0q�6�   $	��Top=�6�   .��6�   	 52      ��%_   '��       �� 53      "
 ��6    .�54      ��  �@��CornerRadius$ 10��6=   55      56      .��6)   ��57      �� 58      # �  6*   .��59   *   5:      �� 5;      -   5        $ 
btnChannel��5;      $��Go��6-   $��5q�6:   
����������	#00707070$��18(�6q   $��45��6   $��Right=�6�   $��82��6�   $��10,10,223,0q�6�   $	��Top=�6�   $��1q�6�   	 5<      ��%_   '��       �� 5=      "
 ��6    .�5>      ��  �@��CornerRadius$ 10��6=   5?      5@      ��5A      �� 5B      # �  6*   5D      5E      �� 5F      -   5        $ lblHeaderRecent��5F   +   $y�	Collapsed=�6   $��Recent Channels��6D   $	��Top=�6^   
�������$��	Comfortaa)�6�   $��22(�6�   $
��Left=�6�   $	��190��6�   $��7,5,0,0q�6�   �� 5G      -   5        $ 
pnlRecents��5G   0   $y�	Collapsed=�6   $	��100��6D   �� 5H      -   5        $ lblHeaderFav��5H   +   $y�	Collapsed=�6   $��Favourite Channels��6A   $	��Top=�6^   
�������$��	Comfortaa)�6�   $��22(�6�   $
��Left=�6�   $	��221��6�   $��7,5,0,0q�6�   �� 5I      $y�	Collapsed=�6   $	��100��60   �� 5J      $ 
Horizontal=�6   .+�5K      �� -   5        $ lblHeaderStatus��5K      $��Status��61   $	��Top=�6B   
�������$��	Comfortaa)�6m   $��22(�6�   $
��Left=�6�   $��78��6�   $��7,5,0,0q�6�   �� 5L      -   5        $ 	imgStatus��5L      $��14��6+   $��imgGood.png��67   $��0,7,0,0q�6L    J� RenderTransformOrigin$ -14.143,4.214&�6]   $
��Fill=�6�    � Cursor$ ScrollS��6�   5M      �� 5N      $	��100��6   .+�5O      �� -   5        $ textBox��5O      $
 Wrap=�6+   
������ 
�������$��16(�6k    �� 
IsReadOnly .  �� SelectionBrush
 ���� $	��7,0q�6�   ���	#00ABADB3$	��Top=�6�   $	��101��6�   5P      5Q      �� 5S   
   -   5        $ pnlMessages��5S      $��313,60,10,60q�6*   $ 0.5,0.5&�6@   $��Bottom=�6`   $
��Auto=�6{   5U      5V      