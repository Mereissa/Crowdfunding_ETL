PGDMP  9    !                |           crowdfunding_db    16.3    16.3 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    crowdfunding_db    DATABASE     �   CREATE DATABASE crowdfunding_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE crowdfunding_db;
                postgres    false            �            1259    16426 	   campaigns    TABLE     �  CREATE TABLE public.campaigns (
    cf_id integer NOT NULL,
    contact_id integer,
    company_name character varying(255) NOT NULL,
    description text,
    goal numeric(15,2),
    pledged numeric(15,2),
    outcome character varying(50),
    backers_count integer,
    country character varying(100),
    currency character varying(10),
    launched_date date,
    end_date date,
    category_id integer,
    subcategory_id integer
);
    DROP TABLE public.campaigns;
       public         heap    postgres    false            �            1259    16425    campaigns_cf_id_seq    SEQUENCE     �   CREATE SEQUENCE public.campaigns_cf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.campaigns_cf_id_seq;
       public          postgres    false    222            �           0    0    campaigns_cf_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.campaigns_cf_id_seq OWNED BY public.campaigns.cf_id;
          public          postgres    false    221            �            1259    16400 
   categories    TABLE     s   CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category character varying(255) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16399    categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public          postgres    false    216            �           0    0    categories_category_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;
          public          postgres    false    215            �            1259    16419    contacts    TABLE     �   CREATE TABLE public.contacts (
    contact_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(255)
);
    DROP TABLE public.contacts;
       public         heap    postgres    false            �            1259    16418    contacts_contact_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contacts_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.contacts_contact_id_seq;
       public          postgres    false    220            �           0    0    contacts_contact_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts.contact_id;
          public          postgres    false    219            �            1259    16407    subcategories    TABLE     �   CREATE TABLE public.subcategories (
    subcategory_id integer NOT NULL,
    subcategory character varying(255) NOT NULL,
    category_id integer
);
 !   DROP TABLE public.subcategories;
       public         heap    postgres    false            �            1259    16406     subcategories_subcategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subcategories_subcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.subcategories_subcategory_id_seq;
       public          postgres    false    218            �           0    0     subcategories_subcategory_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.subcategories_subcategory_id_seq OWNED BY public.subcategories.subcategory_id;
          public          postgres    false    217            ,           2604    16429    campaigns cf_id    DEFAULT     r   ALTER TABLE ONLY public.campaigns ALTER COLUMN cf_id SET DEFAULT nextval('public.campaigns_cf_id_seq'::regclass);
 >   ALTER TABLE public.campaigns ALTER COLUMN cf_id DROP DEFAULT;
       public          postgres    false    221    222    222            )           2604    16403    categories category_id    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    216    215    216            +           2604    16422    contacts contact_id    DEFAULT     z   ALTER TABLE ONLY public.contacts ALTER COLUMN contact_id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);
 B   ALTER TABLE public.contacts ALTER COLUMN contact_id DROP DEFAULT;
       public          postgres    false    219    220    220            *           2604    16410    subcategories subcategory_id    DEFAULT     �   ALTER TABLE ONLY public.subcategories ALTER COLUMN subcategory_id SET DEFAULT nextval('public.subcategories_subcategory_id_seq'::regclass);
 K   ALTER TABLE public.subcategories ALTER COLUMN subcategory_id DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    16426 	   campaigns 
   TABLE DATA           �   COPY public.campaigns (cf_id, contact_id, company_name, description, goal, pledged, outcome, backers_count, country, currency, launched_date, end_date, category_id, subcategory_id) FROM stdin;
    public          postgres    false    222   �+       �          0    16400 
   categories 
   TABLE DATA           ;   COPY public.categories (category_id, category) FROM stdin;
    public          postgres    false    216   �+       �          0    16419    contacts 
   TABLE DATA           L   COPY public.contacts (contact_id, first_name, last_name, email) FROM stdin;
    public          postgres    false    220   ,       �          0    16407    subcategories 
   TABLE DATA           Q   COPY public.subcategories (subcategory_id, subcategory, category_id) FROM stdin;
    public          postgres    false    218   w�       �           0    0    campaigns_cf_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.campaigns_cf_id_seq', 1, false);
          public          postgres    false    221            �           0    0    categories_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);
          public          postgres    false    215            �           0    0    contacts_contact_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.contacts_contact_id_seq', 1, false);
          public          postgres    false    219            �           0    0     subcategories_subcategory_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.subcategories_subcategory_id_seq', 1, false);
          public          postgres    false    217            4           2606    16433    campaigns campaigns_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (cf_id);
 B   ALTER TABLE ONLY public.campaigns DROP CONSTRAINT campaigns_pkey;
       public            postgres    false    222            .           2606    16405    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    216            2           2606    16424    contacts contacts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (contact_id);
 @   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
       public            postgres    false    220            0           2606    16412     subcategories subcategories_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (subcategory_id);
 J   ALTER TABLE ONLY public.subcategories DROP CONSTRAINT subcategories_pkey;
       public            postgres    false    218            6           2606    16439 $   campaigns campaigns_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 N   ALTER TABLE ONLY public.campaigns DROP CONSTRAINT campaigns_category_id_fkey;
       public          postgres    false    4654    216    222            7           2606    16434 #   campaigns campaigns_contact_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(contact_id);
 M   ALTER TABLE ONLY public.campaigns DROP CONSTRAINT campaigns_contact_id_fkey;
       public          postgres    false    4658    222    220            8           2606    16444 '   campaigns campaigns_subcategory_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategories(subcategory_id);
 Q   ALTER TABLE ONLY public.campaigns DROP CONSTRAINT campaigns_subcategory_id_fkey;
       public          postgres    false    4656    218    222            5           2606    16413 ,   subcategories subcategories_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 V   ALTER TABLE ONLY public.subcategories DROP CONSTRAINT subcategories_category_id_fkey;
       public          postgres    false    216    4654    218            �      x������ � �      �   h   x��I�0е�)X��ԁw�&����8ʀ��۷~W��V�(����x�d���5a׸`�MC��ЕO�}ZE�ǋ��\�,����ćv�%����^ � �O!�      �      x�m}Y��F��_J ���z�v/v��}g���@*���T~�����Py^f�Հ��s⬙�f��_�E�?}�u��O��������M��I�i��չ+]��(�&:�=��i�w����<�Qms�UU�&jx?�:����>^W�_�e:�>yW���ѯ�,��ͣ� �� ��n_U�'��r�p����z��K�ƍ�lwty�?�Φ#�պ��*���7� �W�˟.�譫�"ǟ}��ڝ�u��Q8;��n��O_���;��*�/�#.Ï��_��b��m�>o��x'�ծ�����"z����G_�Ư�&�Κ�+��U1�/�h�F?]�W�s_O~Ik���lߕ��>]�R�c�W�_��|��#p��qVw���x�G]nj}t��M�	�g�3��t6�D_�޾��bYx�7w�_��i}�y�ϋ��>�[�{?gOU�����i����9��Z<����qO�z���={�~ju�c�ݗm����0v3�t_7��~2�̸��=^L^�~����Ps��t�h�i��}��]��0> fk_?�;�I���h��e��8�:rB��D�&�`���&��(���v_�%�H+��:{����Mgx��< �����\� W~����.�E�{�t���|t[C�z��ȟl�g����\Fo+,�����gخ�|��Lf�i�=��zr�h���u���-��|�͋�=p��*�a��n
���[<��8�OU���(�x#��`�b���;�M���C�e���*Kl���U�Y��M�SJ�c<%�� ��Ey@x���^O'ػTe��:No_�\(���w�i�"�z���X����3~V#�ި�)�D�'�T�/'z2� Y��x_m��n|S�9�M:����kf����`�6���
;4�=u�$�q¥F����%��ب��g��;�_�$3�u��/V�/�����,�)��36C�z��� �	{�*�Tm���/�t>�j�ƽv�%��2�q�w_�a��bX�b��U���+�YյEUl�Mh��\���a���{I�l�]���y�����`=�G\Aib�����{n#���|��TO��q��|]�����1l��m��]]b��q������d���7���=q�:\�]g���HE&5}��jН�X��]���]u�Q�5o
�X6x�n�ox�u��u�X���[u�C���jG����./��:�B=EOA��#A�T��+ÖN���³����`	�*�z�[�
���?_�8>d����d�?i�������@������^�:�o�V����.o��w��G
e�������Ee��^t]���3<�]�sI�%�1�7`��0;��4Mx��9���x��c].�i-q}ܮ���}��
_�0G ����5P*��YD�lo���ێmo3��]�_�(Ie�Jl�|E���Df[�O0�;ZL�\j���P�� �	 ���E���ޙ�����j��B��m�}�\,�~K@@�>���P3o��>ћ����u��u��])e7����&���'ո�^�`�L��nչo��7a��6n���L�����\U�[�� ���ۻc��#���T�iq!o���2X�+�X.i�Xp�Araq���.Q.�?V�h��z.�N ^d�"4�>��y�-<U��i�x�@/'c��W�6��Հ����?NqG�l-m{-?�����/G��[��R�ٴ�2:	���e�3�Ű�?^�Wd�=~!d/op�%��/����5-ԮJ����L���UR�'KB�Dp���08_A�H"�8�V>:���h�`X,U�i��O&�1L�����[視�h#�ܼH@�V�K�������9G����C^�\gp%N�	�eW��4�}�]�}�����s�{i��IwBq+��v�ٵ��t<^F�|Y��P��h�k�N\gE(A)��|"�%��⣭9
�yެ*��Q�
�Q�|�`��Z86Pz~�ђJi_�|t�v�?7u ��Ԓ?���,��+z�~��}T���!8�s�й�f��8hxx��o0޹��U�L6�#$�o�p�jW����V({��X�,���Z�6����k��f���W��u��~	��/ ����_��^*����<��]���,�Ӥ��ϻ�D�t>��W���:��6Z�w�����a���5��c����ف)��kO��T�
{	���s8Kѷ�Y.�CWw�'��«����sO������~�xA��`Qd�*ݡ;�"�2�1^�`ĺ��M�/D#�@)�a�l��1X���u��_zQ �@�VM{����/�R��g�A^cw���ܙ�
�|:J��h&=w��]��o�a�u�U�\�t�9��\�ns�G�9-l�7_�\�5Q|2t�Ӓy���'n���5�|�S]���8L������~5@��xrp���U1��v��{Xhbƀ�uW�D��sL&��6�.��A��&���E�����#��P��q�|�{\�,^��n�Wʍ���S]�+/�3���A �L��IF0G�؅<�g�h" 8)�N�;���[�!v�uU�qp�������^�b��9��p�>E~t��%�>�d`�9nƈʌ�G^<���Y�i�I�zI��O��p�g��m�S�������_D���J�s�����da�<T}܉�0���Rt`/
ӈ�c1��h��r��:��3?��c}�@q�g0�ݦ���;�n;��h0����۷���V`\�9�h��>G���ޘ�)}��O�����v=���7�FPR�sPh���A��D��,&�����4�K��=���ܪ^k¹�V�j}���J�F�T^������4�����q���=�b��{�Ng�p� ��~��I5�7������>�dW�7M�v��_� ����	�C2����Q�Hh�\!�������GG~�W�x���-Xr�Wl�_AS�����)�.��d�F�®1�����QN� oڈ̯���Fq?$~��͂�	�{M����M�ZP9��̸������w.��7�qm��>��t|��h��K�I�P8�v1ܧ ���zʊ݈}�����Vl ��4%��{S��'�z^\�Xc���>(� ~���ZBX�|�_Z���l��4�HcQ��+>|/���>@�.�����Uc�v�^��n2#i�و�"_��tǼ�rU���}7�{�U�շx���u�A<���2��c$������\R_4�w̸X���V����.<�2\)�v"%Y	�-g�-l�۪f�5��7t6�u��_@==֨�u���潏�ϲ��;O�V��{ähį(�d>a}���J����^,P-oQ�)	,���_�����aCv�=�K�K.�M�I����Z�v���}:c������<��b]/��4Q�l���I:���K�����6������6F��%���*�2�=�I���o��W<
Sh�BJ�eػO�gFH���&��ڀ�����O&����(
��w���%qa��2S1�C�s��U�/:��pv��3bZm�p%Ag� ҿB3�����.��J ����h�\�t�R��d6�'�q��ņ$�m�g'���C����V�:���
]gXO���%��GUy��`m ƻ �q\�%0+{�o6��^gV�ǯ�S���PE��J�U�<� �t�������瞼ZD0noV�x>KBȫ���$P��Ox�'i2a�.��<�2Þ@x|�V�-(	g<ˊt���}SC��hz	�5�d[�	��������ˈ�(׶Qe(>]��|��_���T�S��i����8��~��'ow;Fj���xg?�{#-s��^9.���h@�[�LnusǄ��-ʛ.�N~�k�z�kF;��Xa;s	h�N��<�AG�\4X�A?�X�Bk�����KlC~*�O�O    ��Ȭ0��HYa~͍����g~�Z�\�hM��+AF�Ow�΃+4��gPZ0�%�`X��W��2���J��
��2f�$ˎ�53#�T^�;�A����A\h�(��}�:A�� ��NUW��,g�w����N�
�O��t��������Ʒ<a�x�.��g����'�������v���>�$�]����g�I���Q�^�Mg����J�����701E1�������,�����a��&���E�2�pr�k�79����A��ÄK:��+w�:+F�Ш��=�Φ�
����^�c��ݞ�H��U��.�/�E�73�RЅ�$�AB�{��ѓ�6��+>��.��R�ۀ����>u���h��X����آ�̒�&��{f7��p5�Cx+����k=<\bQ�~�{À����*�֐��
���,�C�6Ê����3r������'u��[�3'������=W�٦���O�̣���3s�F�`pon
$�Ђ�a��Ü�T��Iap=X`�1^���>1�_�!'^f}"L~	������<X��⾇ٺz���nv!v6�1w������?�F~2A�te	M��*��L`0��
W4���$0$Ar��ݽc��{�m��cVX��ޏ�S���h�JQ��)]I�t��ܭ��B��)�į��=� X�9c�2��%,��`6X�N�d��$�.H^��x����Fe��sIq��Ԣ�	�#����B�/z4S���5���	O��-�<_L����%����hpl	\f!�����ǎ%J!��BR9k�\*��4cw�+��1 �{��b����H�`���*���@|&��pIʜ�k��ɒYW��wd+Zt����+���-�H����J*}�v��x��8����uG&�����^*63a��~Õ���7�ⓡ��9�-����+��e�?�[�t�*X��'^=x����;�'lmΧ�{�Q�*�qʜ>������י���x�X��P�Obq�s���&�d�����4��"H ֻ^������&X��U;���G!�6�lUwk�\_K����B��3]ߋ��n�%S����1M�Z�a2���O_�:�ߗ��H�oo:]�#<�'��o���O�8>�墦>�l��0�MK�[��"/H�K���'ØLӐX9���Z/�T� ���^�Uy׺muvA��sjS���p��8VM��
�� �E�f�Uc2�0:Q+����F��/f�
b����ݹ/f��SU�������˨LE"�p��Ƽ��$\�ޓҕP`PA�dY~�X&p:�뎤�LN����L��Z�:��X%��}�BwU�O{4��G}ēܝ�7<�2	oc`˱�c6X��i�H���g�y�fO������	�{���)T�7�2?Ln��d�yk7�r�#��x��pODqa({���6h�$��I��F�5,�qi c�Z����o6y�RL@��Y�`�/�FY0gV�$;�.[��UN�-�:�� �a�Rp��S����{��;�Vdpa�������E(�M�R!R�"�G��꧳	�v�!����[���cG��;[�1��jX�"������{����@#�p�d�`#� X,Ӑ������l4g�	WFMa6�@��'��Ηr�.�Y�Z��`M�@�|/`
�4��ښ����,ˑ�~>S,7Ks9V�~W��`o�@ag��C%
�=KIa���"7v�b�B+�y�g��K���䥊���t�n���"l�zC�r��ؙ 3_���X�X�W���p~����O�ڰ���}�9>8?�!�}/�'C��U�2��|
���Ŕ��]���3(ή�n4M�#�얅�߫}9]��m�x�+��4c����8� �aI<
g8^~	���ɒ)I�4��{�+OWA���	��,;�)�L��ڄ�2�B��͡�f��z�ӿ�S#�K5��Cի�Ij�Zb���R�*	K���r�yz6��tk^����CP| �N���P_�N�_�`�A��dN0v��M:Z�=�#����c�@K�����@>���0q�U�r��Et��PEXԪcu��.���9е1��������(�CQHT�3�\�k|[�fr5
U5I�(q�_fxb���f���xZ-A�zA���C^��8�S�Q�gخ]�zޠаXt�\� �9�D��C!�~�����b��f#�/��Pul(�&V�,Mέ+4��E�$Z�D�NhP�8Y��k�Pc���}{Mh��Ge�]��v>j��࠸�J��ugA�ϑ��ܟ�9[	vJfQ�+d�ܸ`ؘ>a0#o+݄bNd��~b�Z�(~4��d���|sG�i��¤c+��Dj+����O
%��%�p�
ђ{�9u�B��k��2q�/����}px�3��d��
 �N�,&��.g��lc(�~�"Ƴ��4�<`镬Y�5H��97���/��Q*��}��M����Ÿ6�x�0s��`S&�O�6�8NY�j~{�Vя3c�ǫ n(��~���"��F�a��I�#ل/oj������k���_����z���:��n)��#�!<�֫�d+|�3W�G�Xu�p��AK#�j�	��\s�r�_A��H����0M:�=�x�x����1��O8(�T�څ�L�"TJ�ӑ
8��	L|�`��1#��0�SB�|)m�"a��g���B�@fD� }-I��%Ü<T�m�9)U��?�;~B�!�}N�	{3�����|��4��VK3���������.$��b��P���T,?�0�
�d�b�9����e�;^Q�0�_�+��^��P���5�s��N��'��8q�ّ�d�'U�}:]ڇca�Mm��:_)ؙ��|N�P�F��'��0������}��߶Z��~�j�Y���O��pT���݋�z��`Ʒ�)��[���)�k"Ru�,�����ܿ���V?�]m�[��#�$k�V�F��p(��L��[�Ί�߭��:�Lm��WG�ҩ��&�(����;�6���Ě/�[�V����&�E���&�����6@%=7X�̹�ae
Z��UIM ~p�b�eje�%��K+q���YH��9�T��lNW�|�34 �O8k�]�3�^�"H���*�T�XmX^?IAϾ��.E�p�eg��]vau�G6}bG Q�J��(��1�U�sF��UZ��;�Y�j�z���5�B��|��ʉ����EhQ�Xf�z������ڻ#�o>��������*Z](���#�ͧ��FK�' +�6�����6��G�p|
xPB���A�"�5��*��
��LJ���4�_��X��M/4�$��s��k���u��cw{�>|��3����&$��b%����3ڲ��o�g`{��$0��p�Z��Ҵ�8[ؘ�ו��^�4�X3+��<P�k�pf�^�a�Ϫ�&P�� �"Ⱦ8v�����7�2~�Kx�#;Y|��n��H�T$���]��^��u�8IG�vƇ�z@�H�n��l>��6L�C���ˎ�g��e�$Y�T ��\�vON�t� 9]�fi�'���|����I=ٚ�X�ԓ��`��_�m�TO�x��=e��$��L���|6#��d̎U,�Z���rdC�0�;]L'��+��֎��y��۫$c��|�ˋ����G�ώ����Y
��lUt�h��5�e� K�}����g�\,ZnB6~6ǖ��j�;jcy^g
����4�Y�T�L����dد��dĘN�4Nk6�U�:�J�� �Vv�/�/�>L�'�'Hp%�#}Z�|���J�V��G8Ő�.�)�}q����&���K��k�{sD�[-�����|����JIM�+������n���P��ǘ0:��sIv^V��*f��U�ܠ�r��.o��p�^��3�4$��d���
l�U���L~�u[l�,���$��(Կ�Ó$���3�s�GB�tf��4r1��U�
;�VA0��p@?wuK������G���:��'3������    h_�[��J	���`���;`��n�(���Gn�O���M�迫\�?c�T�����5;�(�r�nJ��б\�ՙl�z�K�#�$g��C��U�p_�7�`䋼k`�����Vd{�5W9Ko:�{w�0��꩞N��̴�tfp���k�F�JO������U�Y/����z5}�z2�3J�w*ήZ�W/�_޺��e+q˔M`����?�6,r�*�V�ס�'M��-͛�E���A䈳#5{��-����T��*�^	g�M�NeJ��2c���;X+�V�j�u/�B[Y(��L���Ƈ�F��Cǵ\*aE�7Њ�i�3��I >�J�Dp z��֝!��Y�c5?�����%P��cut�w�X0g�_��>=1�N�Z���P	 ��ot�׾����R� :���yT�?[.=��]d� �Z�2���*k���^.��ƕ�P�-�f���E'(,aޖ�׶ #@�єYQ0Fv�?$_dk�Ka��Bu�jf��]AGaC�mAj�#��_�+�}�繁�8�U%�B������5Y���j�+�X����rȪ�;,JKF�T�p<i����J�]�Ѕ�$;�Eo���1{��mX�α����c��%�ݞ��;p�9�l��n�~����F~�ƿ�ҁ� [�';�H�<�*��^��J��-�Y8��i�*/�\f�v
����(cdߌ<M�.�
�m������lu���ॻ�Z��Kw�����#{���J�M a��Z�ʾ��v:ׂ��kA�*��迎�qBx��/�xgoiH�4I�@�q�һ�A(b!�_��Mؤ�R�q��f6�u#{�I�"�����G��U�`���['��~�g�/�u�#���u�tr�lw���Ҳ�|G��e���(���g�'~]Iz��v�S� O����:1n` SY/��}g8sJ����|�I.�̂1�kL��[��ѣ�ր��'p&7* ��2Ө�Usj�wT�c�ү�(��u�hu�A�0�K�+4Y@�~ױye(�eP)�s,��9�9��Ul�GhĦ8��nCTOO(�k3���D���L��~*{k�`�����U`ԏ�"�� �xG7�3	��ʅw���f6Q�>�,�b+�a���"4�˓	4+͢�ЋXg7���g/���}��r>:��߲�:�����$�es�Φ�	Ɲ�������/em<�/��0IOh>+�5�j� �C��J�.!._X�����r=���\���5d֖Q�fld���/Ҹ쥸82��d�z��U|�cu�Of�QPV	n�SsP��䔳v��HO���~��+���|�9�7}�h���\�j����������c��6��'�yk�N�w��V���!{ U�^w�)k�<$X4)Fmȿ�@��J�UV/Iq?]��*�ҫH��S@�a���4Y�Z������ea�٪ۄ�Bc��8Z��G�0�:C�(��{ZƗ!F5d��2�(�3�1#�j�;8�Ut[O��š����5�*����n�h3��L2��}�A�/r���]E`0�Zv����iC�a��M��W2Ql�R7����Wt��F+mYg�[+�R�K�o0�����Ӌl���c�s�����ǵ��>g�|	��@���e(Á_��X4����0�t�;&�W}l?I&A�S��7�ff��D%�0e4�)[�T���}l���U�g�2�D��7Ѡ�%n��`��W��%6�pad���t��\��%�L��>�Fe���'�B>��
v��L�.:�����c�V͉Cm/Y���0�%]�0R�3�6a��ʉF5d{�S��yʭ��N�U�>`��%��%�m6�1�.o�&p��=�dW����M/�UZ�f�)"���I��ܜn(�u�����U�\J�����+�u	pP44�Hф�a�Hф�a���[w=��w��k�5)d�5򿴒9��F^~��kpRw�ɠ�um��;s�B�1���1��j�e:�`8�~a� �)��S[���s�I��/��$<��|�/��p��E
��'_�{nBo��s躋�2�'�H6����飃�r�D��B�36����!pP|RD�WŴ�)����H\�h������n�8�&�r&ܾ��e��3��%��3>�ȁ���p��E�s�s���I����D�]���9L���Լ�#���M6�3��R�H��|.?zǥ��kւ�=+�y���f�b��@�0���r2�7��?+	�3���'�[�O�oT�k�>m��[�;6IAMf�a%q�.6W��� �>�K���(j|�Z='u�_q�Q��J=%�/�t��_�u_3��-N�`Z��T>v̩���/��[�Ƃ�/��P`J{�Lx۟�`C�F�����`��k��@�XC�����^��~Zr5	��|g+�����3#�}!jY�wT�N���{����|�o���&z&�W�m^)J:�p]��:
�z���X|���mq]�s5�s6������Ø4��fɅ�
����s�������٩g��s:[Hݳ��(��>��2����%�1$o:�7����М�gMF�ZV��x��]C{]�I�j����ͳ<�n��.�
���H����i�kѨ7��E���3�AɌ��� �g����|�6ө���I��w�(�_�LZ�a7!�>�$�ݰ�0���*��u4��E.����`��l���\�8�r��=Are��w&tޝ����j�_�@���ΤK&�r��9�2�s>��Ep!NǓ�J��t�!��kh�+�{����n����L,b��AS��c�,~tS�fK�br��E;X�2#�/iX�~�N:������Ă��"`N,h�n��M�,G	�2t'#�>�"}��^Lr�F���utX�m�Y�83�&
� <|��Xh�syl�R}�`���k��GP+�1�T�ӿ�J���c���p��}����L���-C��C'�%d�����SBV(�q.�YU�La��\�}Mau��+q��J|~�H(��*|�d��:R�(�-�lqwE݁���ue�����8��k�vQ.�C@��$.SN �kuz��ݳvb$�:HU�K����9p��s��hҍ��3֞�_�i1#�m̼�u�63�-3�qF�*d�t�����l2�v���Mp*ު�xKC�NW<�A��%7���=_Aa�������M�n����P���}c�0g]3%��c�^�ж6jUm�� /F�"bۓ��f����-�O�CÑ{9;��_�����3,�޻�>nL2`��.~ᄅn�aK|�PU��]�
��d�sޢ�oԕ�U�~��a��`hx��}-���q!L^�%�C�5���:u��q9l&���-�\�y,t1		�I2<���0�ٯ�;z-�:)��
^�g�sNo*Vx��ۦ�MD$�D����5�i�l�6�=0�x"���]^W�>H��͑�؄��a�]��)g������j_����V P��^�Y=N�ٰ13���0c��U~��xCa{Σ����P�� �kd�u���聁��*�ؙG��lsmd{�&nn�'Q�M#7�q�j�����{иڦT�$v�$#����Tp��r���чJ�$<[9�V0nGܧcP+uX�p���/�blJ�"�|�&T��/���R[�z]Ij)��|������cA6�@1�O��S���F�%�����76�	{�0��n�L���v}�����O>l�g���;0��ԁf�Aw�u/�L�*��aQF����+l1|�n��jf��Y��C�ʑ�?�X:AmA���-�n�]�������������S/�l��x�!;�v�P�j�xK��@�m�S��["�l4AFH�B7���8��ҹ�#�\�K�{Z?!�xWY/�;}��m�+�2Mfя�ͽQ�h��VG:&1A���:_���V�ؠ]d2b�e���I�*��wp4�������фqAP��^�B���毢6�<���<G��88���S�����N��    ���UIN$�.H^���VO�~��:���|� ���5�Z������$t�YB%n�E�0G�5��4�]�
2�e���W�q5�h�r/�� ���o���X�kˁ�{�GM� ��c�ɫ;��Sh?�/'���N��ɲ�,^�m�P�h��Y"���_F�-7��^�<�
�\)kU觼/f%N����r�����2���q����n�o ��`"��*-���͋���N�������)��G��:�<e���{��r-��.B�����nxF��4QŞw8�Qžwn�gq~�5��f�[Ĭd�2p�L8��ތ�׮q2�f��{����� �J��р�ӆ��TA�cM�M.��Ռ��*8�᧞����Z=���L3��Z��/Y�Q����7�/n�1':��PMk>�R��'5c���[x�%�Ax��A	g(j���]��ׂ�5B�vN�����&��M���2&�o�ew���mR
<�����,��$�w��r]*��<��
�\��6}��5��CW0�V,4�
ae�L���s�>_9����0ߚD�<ԯf��&6�˅�?�O	B���H[��L�W,|�.��be־e�TUc}� h��k� Ȅ$Y?H�'�ӥ̲M����"�l"k~n/`![��IƓ�;/�± �*�`8[	-!����pvI��V坧���)�>�:YB�i����@�NRi�6��8�K���M2�^�#i:al9����Ng�{h�k�a|`�����siib���c�I��׆���}J��RTc�Ѯ�F-_�]$K��3a��䨎x��H��*\p�'����e0f�)�x�����>�����V�I�`q��_U�3��ϞY,�)��>с�/JP�����b�@\
�Pu`���*���'���b�ڜ)�� ��^�Z|�ąI��!0���ş����Ǆ�����4ѩ(�5�ꠊ,Go�zf�|9R���z�Pk����1(�ʙ%��A'tT}4��	���^8�Po�%v���p*P5Aܗ\2V�&���V��栯�c�e��N@��;%EJ{�S6�37�/��,u��>V�X�O�aȊŕ���a�J(��OĠ�V���׬��ľ �/W�Si�	y��k(��3��+Җ��r�1"��;�{���\g��O�;R��{�]6�	� �$�ΡE���^I:��f�7s0<�������[�j� nM c��NN�sDz`��5��M ~n�,�Էz��xN�,r�;�be(�K-i:�[�.��;)W*i����Tc�4����|j/!PF5��	Q8�u�a�k�ik�q����Wx�o�Ջ�5�p�Ó3t���3TE�����> �1q� Uu��wL��(ߘ�i�;��J[��!�O��RY{����o�sb�o���

<��Ͱ�����47a��[�U!�� EX�V���Ȃ,�cQ^���3NJR��[���T����z:Y��L��:�TuM��	?��¦[Ē����x߶���QP3^(vB�|9�nN��'�a;�m�0-,�fޕ���cn�c�������W/,;����De�%�at��R��pۚ�U�)�'��F_o�1� q<ۖ���bPl��]ɤ�[o�
�`�68�s!n����cjb!�=ρ�*�;�s�,y�G����*�A���@�dM~T�;{6Xg[u,�5�lq��?8�
�:��F�b��A��o�+2��(������<���:�f����c��ϱ��"�O)�9BfQM��,S~���0��]�q����;�Cy�
Lh��C�����Eg��Vי�������+�h8լ*�y�!�]��ʃF�|�L��e*���������.�i�;��|`�H\��>[��߆Ѱ�F
4�B
��9䢀��d����)�aA��`�2ȃ��Y4t9��=%/�E_��)���.J��5
�\[�[T�=�Χ���fORp����wU��&l���6����.�P1|>���P��Xb�O;syّ�\}jg���ٵS�+~�Ԝ˜�d�N�Bt�n��<� �Iזӟ�7��N K�m�m���h(u�2�&a<�Ϧ���n��l���*4'#E���3\p	V�W5)�4��E��{v��LK_����r��}WS�ҵW��	˻W���C�%m��B
1�߇\q�[z�Y(��<S��D6�i"��Ԝ뭁|;C����:V�m*�,ŷ3���R}�4�.���,$2�VJcOg��8�4�z� H�	��h4a\i��m�0Gyp��[=��	�'���)�QN�uD��?/�G&����	㞪G�i`� �.�@���k��<����Q�elq���	�pD�7޳�.�X��n��*����)��6Z	ZYJ�f��j������=�К��@G\.5H���Y��Ѱ^#9	^�.�<��ΔS����ک��ЫS��:�oΛc���L_dq�`�BYt�U�<M#��=�xݴ���8�uܲe��M�&���1D=��3����|�_��=[(r�Ǭs��$cֽF����}�CZ~VǼ)�-���9m��Kr{���|��ύ*���[�+&�]d!ۧ�L�n��$�꣈6B�uUg��ɵ(SU:XP}M�*u�J�-t"%D�Ԥ`���d��mA�l���nz�4Y+�����鄉�Wro��X��W7�Q~�SFZ�8qS�/4���� ��f���� �@�:�a�k�W��,i�BƁ�9K�l\9�Ѡ���t}Į1����n�_�c�>��
fURw!3�v��4�k��R���ZM��,_��d>S�l�����������i�l�K1OR����r�ߜgʳ�8`N(_{gI�����u@�\��qaq	o�M�s�8"�o��O�����Da�������b��_��_N���tN]X{,>�>�2u�-��/v��ߑ7A���{xhꨟ�TY��#��F��������y����_q�`�%��A������=���a<Pt$m���l"7jW�T��5G	�p�ڎ��,�,�U~e�<�P���L�S��gK�,Cy+Q�X��g؍a�>��i@���SщT��1[�k+JN�x�J��y���M8-�pB:ӓV�_l�,{?ۙ����!�T���2�����̎m%C�ݖG�f~2�h'��B���=WJ�m��l��Ʃ}�d�T�k�X������<"�V���^N�y����\Y�#+=�7�Y��Wa��N��Y	��PbDkB��9���Q������K|}o����� ��YIO/���¤�u
ŏD�v'5��\����ߍ0Gz���~�5s��(T�ʞ��' ���� 5�C]�NЦF��#HS�S:RO��Y��f7A&�̫�sq�j-X%��b�Q��)3��ϐK_.e��]é�V�M{!��#c��*Rj/^�&��h|�Y/�cof}*�|r�u���S��thͦ�tvmFS��c՟}��
�K���}~踰8�_*L8�wd��<��=��k��1s���G�1�7�'<l�`4�:C��8g/��Yg�*o*��0��XԿW7S���Zggd8�{�A�!	�2�cF
��F�li0�~41z�p��$�)�d����B	�q}�o3�l�e+�Dr�_�C�؋��,�[��
U�m��n�s���d�Yo~+��k�4�@����PɈ���H��K�(�oڸt�K,��ZU�W\s
P�3vA�jN�d�L�A�]���h&��5��;6Z}�X6���������>��)+\��F���������1�Y��º�X1#X�~Wi�`����;^��Q'3A��Ď8^�8�a0�<X�u{f�����4.qN�y]�An��1��M��ױ��a��S)��A!��M����yk\�S�MT��w<�(�ka<=�Y��ν��I�o�@��òWa�׎(Dr���k����J�d�tf!�Y3v�-9=�c)�d�6��*��Y�%�-����^�O�\�����m����>�*��+��Q���l`¦=�1{g͌�a    l<��$�Yl��L&|r�ع&�׍�k�1184_?�!e��K��M,�QkK0��VX��g��8�zv���5^�0��u
�1��6�k.�<����fXga��倃�$��nu�H{Zk c���rYsr��=���T��'A�z�����:�����N(�l�pS���jwћ��z�hpl'��h&-im_<KQZ��Qz�O}�T2�Д���:S�����0��O�-|DBS��#�k3)�ϔ�C��	~�	1D��~3s4fǥf�S�@�{�^@1��)RV��Ц�_0�M�<�L��`�_f�Y����\��z��*t>��eK;���5Q�x8c0���S���\��;���K���*�C�F��
|�]������ê<�.���i`�I�;{$Y�,���e�D���)���Ƃ(�k�yu�3�l֒c쨀��81�!���Uol��"*:'Q��A]�B�E�S�G��;�~$�^���6���OF�$����i �����`;K����p7;m~$<��Λ?��ڋ5�bJ��̯��?Q=;��%aD��8�cg
����u��v�*��o4�����!!�*!l!��mpȩ"V��[��9�#H��y��#K&x s���Q�����Ԭ�Ǿ���j���OȮ{��㢧�U+X	��2�F�8����8����G0\#DX�B�6Y����:[)�K�����\�&X�lI�y힉�Z(>	"8�$}��H���,U���AZ.:r�3�8�B�mr����|,g%?��������vp:a�J%Ǯe�1K&Yrl��~J��:J��Fυ����&͔-?0��N���ˮ�ln�� ���Ө�3-�Q%��Vq&����L�ً}f���vn�8�Ȭ��ҵ�虥���0��.ӫ_8�H��k<ON�⽒1�w�no��&|��P\�ؓ1�:d�,�� ����K��а�3O�����U��q�/P\��[��â�?_� ���Cݙ�E��C�;L��jN-;E��{�WeU�������#Z��j�L�c�/��1�����������;Y�GWp���b�7��36tP�Ƽ� c����G`�O-�R1��K�-�R1�k��&���7��J5��co�J�y��۠����*�e�3hYp��3` ���0��z� �N��^��i�7���=5J
�= ��HJ�q����*����h�V��r�|�2�'8t<C��P���Of!Α�.��,�Iܷ�d�A�v�瘁j���A8������N&82�ɛ)�g+@(�*uzKd�e��io�\���"%#ka�|JN�S�\�QV���Wُ��P��~���<������+�?06��H�;gv���n���4�o�V@�N���	2�����I��k�,�9�r5�5/�.�A3�+��0ŘGD�4��⾖�Z����1��_s��O�r`�-��>�kj:�)F+���_,�!��|����ҫ����`:쿵a5� gù&S�[��(Q�[Fq�@�Ｊ�c�ά댇��6��7���<��p��W$ZAb������.kkrˣ?v�<���1Z~���k�s4� �&�5ԍ��V
��E��Ɠ.��ȹ`Mа�s��t�k�&gTr��Mgܘ�#������\��b̑��y��.g,��N[��HɖMz��,��@��0�*�+�����|�$�/W�f����%�pRnv���;�?//I�d9U��3�"� ���l�-�fGmLf��lN���B�n[s�^���g�:�Z�b�NzFƊ��	޾�	Y��7���&�i�_bU]��4��@%/�u�{�A��1?v�u��3�
UH�'tm��K:fU���g�My��:W��T森U8HB�f��~�;,�B*�!��wUm-��O�@c	����9[2�?O��tЖRO�	n���s�;�ng�4��3��������gY�}-g������	_�d���Cũ���~�=Ѷ���>��){Ɍg)�{���-9a�`���a�`y�	n��N�����Z�_���.Fih�fG-�5n������]��B�̨��Ho�. �q�� �#n=q0KK�3�_�a/�c�[9mH *.��
�:2`�b-B�i)e��	�6-�f��h�\(��7�(�/�����FW��lL�������
��uL
��f��&��A�wu��1J�"�3J�	"��%Q/�Mb�N{[��f�N[W�d�$�C��a�ߺ��ߩ*��ؚJ�_���s�����Q��X�|�U3KH��FT0țoIK�Xm����x�o�rܗv&�� vW��K�g*��}Ƒ�4�o�PG�MQ[���k���k�=zlm*��X�A�pQ}<V��s��>P��#/uF�A#ZSܹǢ�x	���V6Z�(��g��p�d�a����<�����FhXjÁ;��5�l�>�љ��� �4T������ӊ�=V<lZ�A�}���v�Ku\Q�y"fǈ���*[�)�"Zԡ�u�hQ���t:٪�{�	��P�ua(K��XU��L�Q6<���ۇ�Us]mh��tq=\7��L�����\�4�ϓ6�G�4�:��&|��$�p^����N`a��
����B
��m z�0�'����KD(�F,�bSU������;���M
��H�N��sJ�X=�(�a��m��JW�H��-C�"=�'�sѭ�N�p�-|W�CS)v��j�h|�U�A�">��[1}n��H����P)��9�*(� ��/����������+�ߗ�Y��$F�%Ɇ#��U�N��ɻh��Dދ���A�:���Ɋ�t<1��%�8eC��<��ǃ|7��:�n��	�Ed���?�8Vŭ�W�z�IJW�C�r�R���噅\�52�~���Bp1��G�_Aň�"2�ц��y��e����R�y<W�`��W��]������zc��/&3�1�i��6?��X��"��!x��JB�I�%�2��yz��͊��5�qe`�Y4�,h�~���-�A�g�[�c��n�1��Nwv^��`�Y7�6�v��k�EU"��m������=Kd��@3�C���QO��&ᗿ�tOH��	b˝��3��V�9�{�x8���2y��7�c��y��'�0�����
�6;��Y����i�����z�|�<l;�V��ö�ɵ�:�F�fp����b�Mᜋp�
u��.[��+�At�7�<_5OU���K�f�5O��z�2Na�T�ţf�g���1��sƉ���%3�A��)I�<nG�~�H2!Ǟ����&��f`(��g`(���m)�d�ب4#k��f$
������-�	{b!�X����g'�"�G.կ�q#�l(���
��R*D����
��b���
u�T��Y��C!G��V�(�Úg,Y��������Y]{?�&��3���팗	�6,`m'4�[����
B��.�g&�T����He�&bH$��G��l9��ϧz����ϧ"f����tj9�Z�=�&�0�L�^�j xn����FGV��O��K }��ױ��"Ý߱{��a7�:�p��M8�!������-�o#��k��A��,Q_��Z�����V��5��y{_^d�����A{nL��A"�&��6����3y6�ᬉղ�J�q�
+��>�&�^dV�r����m&�z���%jM��I)Ȯq^�/�[>;
؀~�VY�	� 3� ��(��&6��Ä���y#�_��˅+� �@��g D $ɞ筬yr2�)�������/��5a0����zm+v$�:�A<ڎ�[bN����w��Q"��}�sƤ�B5�F�b�9��w1שT�#|��y���t��;�S��.�%�^��,��T�IKx��Of�@�n�jZٵ%l;������F�����*���x��ݖ�c��o����
�l"lP�o�Wݳ�t�f2zI��5���M�Q����Y��8�2^�ݥ^a;�H	C�GB;p���U�CΪ�1��Ux���F-���Kz�����R�߼�2+ 2  /��Kz�|��4V��|��&��3BY�T�>�ǜ�q=g��~��8���dwv��.��K�g�n(�d��m�u��&&��n��N6R�j�HC���'}��r'C�.e��f��6�N�c��n`؝Cyr�l�2�J����穳
�����,G!M��z,���V�emڛ@�)�,{��*6��C�����K[��:����zx�^�(�u��J�`�_�!Y_�4�Fnƅ`ְ8��ν8��眭���em�u))g{��B�J:�ʫC�J6��_�&�c��9��/����Z�"��`0e{�]q��۞Y\��8Tq`�G���C��B���!q�_� {U�Aw���!r��-Ww��7<�T�)��)A0E�r���ɿ:���h|�6݄Igly���vF�_n��P[!��*�T�ݣ�fhp���ð���ang#-�s�9��)����9�$a��O6�y<��fJ��)��0��������B'�i�y���B�Af�fXY��ǮR����vU�����.����[��&�삷�#PH*���	x�`����Gg���:�t����/f���YG��F���6_�Y�X\�q�=�i���8֥�߸��a�t�F}b��=��zjg%�9��*��*s0yV�x���U����C_n#��N�ER�Pҽ�K	X�����?��yWq=��M5����b����YN��Y7���8�H����_�A>�j?[��>���F�W���l����E؂}O�l�c;�p�DJ��7%�K�]N��D:Q��ɷ6��jP��-����L��l�[���uŜ��G����������Z����X=|�i��/���YoC����ࠂe>��c�O=Hv�J�)ԤaO$!g[t��ٱ�&LĶ�;,�ʲ�Ф !:þ�d��{S�޷-+�L �OAV�K+B�ʘ��1(v��_L����L�֗�6�D��x�W+��,u�Q�٪��}c���k�y�l5�Y�l�xP�=���PQ���<������kC4��*c��3���2V���d>�\>T�?G�'�柒��=&�w�T��ܭ�j�YB��~�N�X�&w󸌕f����''�(x��iϳ���
;48���L6�bSv��z:9	�D�2r�ʈ�C��˹�O���NH�x�o�o~�qL�Yd�/��,)!�����e��)���l7��u���O��u���7?d�F]~�7�61xI�q��6��ֲ�/9�i�;^�+�8�0g������Xx�}eN3�d�����F�Ӡ򯓷� Z_a"��K��`P@s����,���;)[��X��S/�������c��0ɣ��z���ye֖I`Y�;���a�T�������	nO�]����x,��+��p|)I��$��qƇ^Lѝ����0�a8>3�P��ݞ��/Ux �i��>o�K�^��>8p�����l���8��&��v�]/��W![ÆJYP�d�{w��䌒��&�3Z�l=���W�4�5���Z�V�܏N�^ϲg+D����#���F�p{3���/�����`]      �   �   x�M�K�� D��)X�r*�w�� H�	 जӏ��IvOMuӒ�+�9����rnD��B[xڮ@�é������T�=Xgu�����D�X�Y�y�31b�l����3q����V� cY�Я�-��c^�>�;z�|�8��蘗��"b�%6�j>��]�#���U�9bH��Xn��<������$x���w/���љ���T�ڊ����2�/�M��߄u     