   M S B A M L   `   `   `  ���� @  <Helio, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:HelioHelio      
Helio.Chat   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     %localclr-namespace:Helio     -     �Name$  wdwChat�� � Title$
 Chat�� � WindowState$ 	Maximized=�$	��984��.��� ����    LightPrimary �� Color# �   .+�]� -    ]�Name$ 	pnlHeader����.  $��52��$	��Top=�����   Primary# �  .+��� -    ��Name$ 	lblHeader��$
��Chat��$	��Top=�
�������$��	Comfortaa)�$��24(�$
��Left=�$��76��$��7,7,0,0q��� -    ��Name$ txtMsg��$��45��$��313,0,94,10q� �� TextWrapping$
 Wrap=�$��Bottom=�$��21(����	#00ABADB3
�������$��5q� �� SelectionOpacity$ 0Q�.��	 � 	Resources	 
 �� 
TargetType �� Property �� Value��%:   '��       �� "
 ��.���  �@��CornerRadius$ 10��.������   DarkPrimary# �  .���� -    ��Name$ btnSend��$
��Send��$��	0,0,10,10q�$��5q�
����������	#00707070$��18(�$��45��$��Bottom=�$��Right=�$��75��	 ��%:   '��       �� "
 ��.���  �@��CornerRadius$ 10������  
 Accent# �  �� -    ��Name$ 
pnlChannel��$��0,52,0,0q�$
��Left=�$	��308������ # �  .+��� -   $ lblHeaderProfile��$��Profile��$	��Top=�
�������$��	Comfortaa)�$��22(�$
��Left=�$	��101��$��7,5,0,0q��� -    ��Name$ imgProfilePicture��$	��128��$
��87,0q��� -	   $ lblProfileUsername��$��Username��$	��Top=�
�������$��	Comfortaa)�$��22(�$��0,5,0,0q�$��Center=��� -
   $ lblProfileScore��$��Score: ��$	��Top=�
�������$��	Comfortaa)�$��16(�$��0,2,0,0q�$��Center=��� -   $ lblHeaderChannel��$��Channel��$	��Top=�
�������$��	Comfortaa)�$��22(�$
��Left=�$	��101��$��7,5,0,0q��� $��70�� �� Orientation$ 
Horizontal=�.+��� -   $ 
txtChannel��$��45��$
 Wrap=�$��21(����	#00ABADB3
�������$��5q�$ 0Q�$
��Left=�$	��194��$��	10,10,0,0q�$	��Top=�.��	 ��%:   '��       �� "
 ��.���  �@��CornerRadius$ 10��.������ # �  .���� -   $ 
btnChannel��$��Go��$��5q�
����������	#00707070$��18(�$��45��$��Right=�$��82��$��10,10,223,0q�$	��Top=�$��1q�	 ��%:   '��       �� "
 ��.���  �@��CornerRadius$ 10������ # �  �� -   $ lblHeaderRecent��$y�	Collapsed=�$��Recent Channels��$	��Top=�
�������$��	Comfortaa)�$��22(�$
��Left=�$	��190��$��7,5,0,0q��� -   $ 
pnlRecents��$y�	Collapsed=�$	��100���� -   $ lblHeaderFav��$y�	Collapsed=�$��Favourite Channels��$	��Top=�
�������$��	Comfortaa)�$��22(�$
��Left=�$	��221��$��7,5,0,0q��� $y�	Collapsed=�$	��100���� $ 
Horizontal=�.+��� -   $ lblHeaderStatus��$��Status��$	��Top=�
�������$��	Comfortaa)�$��22(�$
��Left=�$��78��$��7,5,0,0q��� -   $ 	imgStatus��$��14��$��imgGood.png��$��0,7,0,0q� J� RenderTransformOrigin$ -14.143,4.214&�$
��Fill=� � Cursor$ ScrollS���� $	��100��.+��� -   $ textBox��$
 Wrap=�
������ 
�������$��16(� �� 
IsReadOnly .  �� SelectionBrush
 ���� $	��7,0q����	#00ABADB3$	��Top=�$	��101���� -   $ 
lblVersion��$
��b000��
��������� -   $ pnlMessages��$��313,60,10,60q�$ 0.5,0.5&�$��Bottom=�$
��Auto=�