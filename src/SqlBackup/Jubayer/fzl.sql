PGDMP      1                |            fzl    16.3    16.3 �    ~           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    155864    fzl    DATABASE     ~   CREATE DATABASE fzl WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE fzl;
                postgres    false                        2615    155875 
   commercial    SCHEMA        CREATE SCHEMA commercial;
    DROP SCHEMA commercial;
                postgres    false                        2615    155876    delivery    SCHEMA        CREATE SCHEMA delivery;
    DROP SCHEMA delivery;
                postgres    false                        2615    155865    drizzle    SCHEMA        CREATE SCHEMA drizzle;
    DROP SCHEMA drizzle;
                postgres    false            	            2615    155877    hr    SCHEMA        CREATE SCHEMA hr;
    DROP SCHEMA hr;
                postgres    false            
            2615    155878    lab_dip    SCHEMA        CREATE SCHEMA lab_dip;
    DROP SCHEMA lab_dip;
                postgres    false                        2615    155879    material    SCHEMA        CREATE SCHEMA material;
    DROP SCHEMA material;
                postgres    false                        2615    155880    purchase    SCHEMA        CREATE SCHEMA purchase;
    DROP SCHEMA purchase;
                postgres    false                        2615    155881    slider    SCHEMA        CREATE SCHEMA slider;
    DROP SCHEMA slider;
                postgres    false                        2615    155882    zipper    SCHEMA        CREATE SCHEMA zipper;
    DROP SCHEMA zipper;
                postgres    false            �           1247    155884    slider_starting_section_enum    TYPE     v   CREATE TYPE zipper.slider_starting_section_enum AS ENUM (
    'die_casting',
    'slider_assembly',
    'coloring'
);
 /   DROP TYPE zipper.slider_starting_section_enum;
       zipper          postgres    false    14            �           1247    155892    swatch_status_enum    TYPE     a   CREATE TYPE zipper.swatch_status_enum AS ENUM (
    'pending',
    'approved',
    'rejected'
);
 %   DROP TYPE zipper.swatch_status_enum;
       zipper          postgres    false    14            �            1259    155899    bank    TABLE       CREATE TABLE commercial.bank (
    uuid text NOT NULL,
    name text NOT NULL,
    swift_code text NOT NULL,
    address text,
    policy text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE commercial.bank;
    
   commercial         heap    postgres    false    7            �            1259    155906    lc    TABLE     �  CREATE TABLE commercial.lc (
    uuid text NOT NULL,
    party_uuid text,
    lc_number text NOT NULL,
    lc_date text NOT NULL,
    payment_value numeric(20,4) NOT NULL,
    payment_date timestamp without time zone,
    ldbc_fdbc text NOT NULL,
    acceptance_date timestamp without time zone,
    maturity_date timestamp without time zone,
    commercial_executive text NOT NULL,
    party_bank text NOT NULL,
    production_complete integer DEFAULT 0,
    lc_cancel integer DEFAULT 0,
    handover_date timestamp without time zone,
    shipment_date timestamp without time zone,
    expiry_date timestamp without time zone,
    ud_no text,
    ud_received text,
    at_sight text NOT NULL,
    amd_date timestamp without time zone,
    amd_count integer DEFAULT 0,
    problematical integer DEFAULT 0,
    epz integer DEFAULT 0,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    file_no text NOT NULL
);
    DROP TABLE commercial.lc;
    
   commercial         heap    postgres    false    7            �            1259    155918    pi    TABLE     �  CREATE TABLE commercial.pi (
    uuid text NOT NULL,
    lc_uuid text,
    order_info_ids text NOT NULL,
    marketing_uuid text,
    party_uuid text,
    merchandiser_uuid text,
    factory_uuid text,
    bank_uuid text,
    validity integer NOT NULL,
    payment integer NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE commercial.pi;
    
   commercial         heap    postgres    false    7            �            1259    155925    pi_entry    TABLE     �   CREATE TABLE commercial.pi_entry (
    uuid text NOT NULL,
    pi_uuid text,
    sfg_uuid text,
    pi_quantity numeric(20,4) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
     DROP TABLE commercial.pi_entry;
    
   commercial         heap    postgres    false    7            �            1259    155932    challan    TABLE     "  CREATE TABLE delivery.challan (
    uuid text NOT NULL,
    carton_quantity integer NOT NULL,
    assign_to text,
    created_by text,
    receive_status integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE delivery.challan;
       delivery         heap    postgres    false    8            �            1259    155940    challan_entry    TABLE       CREATE TABLE delivery.challan_entry (
    uuid text NOT NULL,
    challan_uuid text,
    packing_list_uuid text,
    delivery_quantity numeric(20,4) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 #   DROP TABLE delivery.challan_entry;
       delivery         heap    postgres    false    8            �            1259    155948    packing_list    TABLE       CREATE TABLE delivery.packing_list (
    uuid text NOT NULL,
    carton_size text NOT NULL,
    carton_weight text NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 "   DROP TABLE delivery.packing_list;
       delivery         heap    postgres    false    8            �            1259    155955    packing_list_entry    TABLE       CREATE TABLE delivery.packing_list_entry (
    uuid text NOT NULL,
    packing_list_uuid text,
    sfg_uuid text,
    quantity numeric(20,4) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 (   DROP TABLE delivery.packing_list_entry;
       delivery         heap    postgres    false    8            �            1259    155867    migrations_details    TABLE     t   CREATE TABLE drizzle.migrations_details (
    id integer NOT NULL,
    hash text NOT NULL,
    created_at bigint
);
 '   DROP TABLE drizzle.migrations_details;
       drizzle         heap    postgres    false    6            �            1259    155866    migrations_details_id_seq    SEQUENCE     �   CREATE SEQUENCE drizzle.migrations_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE drizzle.migrations_details_id_seq;
       drizzle          postgres    false    225    6            �           0    0    migrations_details_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE drizzle.migrations_details_id_seq OWNED BY drizzle.migrations_details.id;
          drizzle          postgres    false    224            �            1259    155962 
   department    TABLE     U   CREATE TABLE hr.department (
    uuid text NOT NULL,
    department text NOT NULL
);
    DROP TABLE hr.department;
       hr         heap    postgres    false    9            �            1259    155969    designation    TABLE     q   CREATE TABLE hr.designation (
    uuid text NOT NULL,
    department_uuid text,
    designation text NOT NULL
);
    DROP TABLE hr.designation;
       hr         heap    postgres    false    9            �            1259    155976    users    TABLE     1  CREATE TABLE hr.users (
    uuid text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    pass text NOT NULL,
    designation_uuid text,
    can_access text NOT NULL,
    ext text,
    phone text,
    created_at text NOT NULL,
    updated_at text,
    status text NOT NULL,
    remarks text
);
    DROP TABLE hr.users;
       hr         heap    postgres    false    9            �            1259    155983    info    TABLE       CREATE TABLE lab_dip.info (
    uuid text NOT NULL,
    name text NOT NULL,
    order_info_uuid text,
    lab_status text,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    id integer NOT NULL
);
    DROP TABLE lab_dip.info;
       lab_dip         heap    postgres    false    10                       1259    196860    info_id_seq    SEQUENCE     �   CREATE SEQUENCE lab_dip.info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE lab_dip.info_id_seq;
       lab_dip          postgres    false    237    10            �           0    0    info_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE lab_dip.info_id_seq OWNED BY lab_dip.info.id;
          lab_dip          postgres    false    276            �            1259    155991    recipe    TABLE     K  CREATE TABLE lab_dip.recipe (
    uuid text NOT NULL,
    lab_dip_info_uuid text,
    name text NOT NULL,
    approved integer DEFAULT 0,
    created_by text,
    status integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    id integer NOT NULL
);
    DROP TABLE lab_dip.recipe;
       lab_dip         heap    postgres    false    10            �            1259    156000    recipe_entry    TABLE       CREATE TABLE lab_dip.recipe_entry (
    uuid text NOT NULL,
    recipe_uuid text,
    color text NOT NULL,
    quantity numeric(20,4) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 !   DROP TABLE lab_dip.recipe_entry;
       lab_dip         heap    postgres    false    10                       1259    196868    recipe_id_seq    SEQUENCE     �   CREATE SEQUENCE lab_dip.recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE lab_dip.recipe_id_seq;
       lab_dip          postgres    false    10    238            �           0    0    recipe_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE lab_dip.recipe_id_seq OWNED BY lab_dip.recipe.id;
          lab_dip          postgres    false    277            �            1259    156007    info    TABLE     `  CREATE TABLE material.info (
    uuid text NOT NULL,
    section_uuid text,
    type_uuid text,
    name text NOT NULL,
    short_name text,
    unit text NOT NULL,
    threshold numeric(20,4) DEFAULT 0 NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE material.info;
       material         heap    postgres    false    11            �            1259    156015    section    TABLE     y   CREATE TABLE material.section (
    uuid text NOT NULL,
    name text NOT NULL,
    short_name text,
    remarks text
);
    DROP TABLE material.section;
       material         heap    postgres    false    11            �            1259    156022    stock    TABLE     ,  CREATE TABLE material.stock (
    uuid text NOT NULL,
    material_uuid text,
    stock numeric(20,4) DEFAULT 0 NOT NULL,
    remarks text,
    tape_making numeric(20,4) DEFAULT 0 NOT NULL,
    coil_forming numeric(20,4) DEFAULT 0 NOT NULL,
    dying_and_iron numeric(20,4) DEFAULT 0 NOT NULL,
    m_gapping numeric(20,4) DEFAULT 0 NOT NULL,
    v_gapping numeric(20,4) DEFAULT 0 NOT NULL,
    v_teeth_molding numeric(20,4) DEFAULT 0 NOT NULL,
    m_teeth_molding numeric(20,4) DEFAULT 0 NOT NULL,
    teeth_assembling_and_polishing numeric(20,4) DEFAULT 0 NOT NULL,
    m_teeth_cleaning numeric(20,4) DEFAULT 0 NOT NULL,
    v_teeth_cleaning numeric(20,4) DEFAULT 0 NOT NULL,
    plating_and_iron numeric(20,4) DEFAULT 0 NOT NULL,
    m_sealing numeric(20,4) DEFAULT 0 NOT NULL,
    v_sealing numeric(20,4) DEFAULT 0 NOT NULL,
    n_t_cutting numeric(20,4) DEFAULT 0 NOT NULL,
    v_t_cutting numeric(20,4) DEFAULT 0 NOT NULL,
    m_stopper numeric(20,4) DEFAULT 0 NOT NULL,
    v_stopper numeric(20,4) DEFAULT 0 NOT NULL,
    n_stopper numeric(20,4) DEFAULT 0 NOT NULL,
    cutting numeric(20,4) DEFAULT 0 NOT NULL,
    qc_and_packing numeric(20,4) DEFAULT 0 NOT NULL,
    die_casting numeric(20,4) DEFAULT 0 NOT NULL,
    slider_assembly numeric(20,4) DEFAULT 0 NOT NULL,
    coloring numeric(20,4) DEFAULT 0 NOT NULL
);
    DROP TABLE material.stock;
       material         heap    postgres    false    11                       1259    196943    stock_to_sfg    TABLE     =  CREATE TABLE material.stock_to_sfg (
    uuid text NOT NULL,
    material_uuid text,
    order_entry_uuid text,
    trx_to text NOT NULL,
    trx_quantity numeric(20,4) NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 "   DROP TABLE material.stock_to_sfg;
       material         heap    postgres    false    11            �            1259    156030    trx    TABLE     "  CREATE TABLE material.trx (
    uuid text NOT NULL,
    material_uuid text NOT NULL,
    trx_quantity numeric(20,4) NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    trx_to text NOT NULL
);
    DROP TABLE material.trx;
       material         heap    postgres    false    11            �            1259    156037    type    TABLE     v   CREATE TABLE material.type (
    uuid text NOT NULL,
    name text NOT NULL,
    short_name text,
    remarks text
);
    DROP TABLE material.type;
       material         heap    postgres    false    11            �            1259    156044    used    TABLE     S  CREATE TABLE material.used (
    uuid text NOT NULL,
    material_uuid text NOT NULL,
    used_quantity numeric(20,4) NOT NULL,
    wastage numeric(20,4) DEFAULT 0 NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    section text NOT NULL
);
    DROP TABLE material.used;
       material         heap    postgres    false    11            �            1259    156052    buyer    TABLE     u   CREATE TABLE public.buyer (
    uuid text NOT NULL,
    name text NOT NULL,
    short_name text,
    remarks text
);
    DROP TABLE public.buyer;
       public         heap    postgres    false            �            1259    156059    factory    TABLE     �   CREATE TABLE public.factory (
    uuid text NOT NULL,
    party_uuid text,
    name text NOT NULL,
    phone text,
    address text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.factory;
       public         heap    postgres    false            �            1259    156066 	   marketing    TABLE     �   CREATE TABLE public.marketing (
    uuid text NOT NULL,
    name text NOT NULL,
    short_name text,
    user_uuid text,
    remarks text
);
    DROP TABLE public.marketing;
       public         heap    postgres    false            �            1259    156073    merchandiser    TABLE     �   CREATE TABLE public.merchandiser (
    uuid text NOT NULL,
    party_uuid text,
    name text NOT NULL,
    email text,
    phone text,
    address text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
     DROP TABLE public.merchandiser;
       public         heap    postgres    false            �            1259    156080    party    TABLE     �   CREATE TABLE public.party (
    uuid text NOT NULL,
    name text NOT NULL,
    short_name text NOT NULL,
    remarks text NOT NULL
);
    DROP TABLE public.party;
       public         heap    postgres    false            �            1259    156087 
   properties    TABLE     $  CREATE TABLE public.properties (
    uuid text NOT NULL,
    item_for text NOT NULL,
    type text NOT NULL,
    name text NOT NULL,
    short_name text,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE public.properties;
       public         heap    postgres    false            �            1259    156096    section    TABLE     w   CREATE TABLE public.section (
    uuid text NOT NULL,
    name text NOT NULL,
    short_name text,
    remarks text
);
    DROP TABLE public.section;
       public         heap    postgres    false            �            1259    156103    description    TABLE       CREATE TABLE purchase.description (
    uuid text NOT NULL,
    vendor_uuid text,
    is_local integer NOT NULL,
    lc_number text,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 !   DROP TABLE purchase.description;
       purchase         heap    postgres    false    12            �            1259    156111    entry    TABLE     ?  CREATE TABLE purchase.entry (
    uuid text NOT NULL,
    purchase_description_uuid text,
    material_info_uuid text,
    quantity numeric(20,4) NOT NULL,
    price numeric(20,4),
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE purchase.entry;
       purchase         heap    postgres    false    12            �            1259    156118    vendor    TABLE     �   CREATE TABLE purchase.vendor (
    uuid text NOT NULL,
    name text NOT NULL,
    contact_name text NOT NULL,
    email text NOT NULL,
    office_address text NOT NULL,
    contact_number text,
    remarks text
);
    DROP TABLE purchase.vendor;
       purchase         heap    postgres    false    12                       1259    196844    coloring_transaction    TABLE     @  CREATE TABLE slider.coloring_transaction (
    uuid text NOT NULL,
    stock_uuid text NOT NULL,
    order_info_uuid text NOT NULL,
    trx_quantity numeric(20,4) NOT NULL,
    created_by text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 (   DROP TABLE slider.coloring_transaction;
       slider         heap    postgres    false    13                        1259    156128    die_casting    TABLE       CREATE TABLE slider.die_casting (
    uuid text NOT NULL,
    name text NOT NULL,
    item text NOT NULL,
    zipper_number text NOT NULL,
    type text NOT NULL,
    puller text NOT NULL,
    logo_type text NOT NULL,
    body_shape text,
    puller_link text NOT NULL,
    stopper text NOT NULL,
    quantity numeric(20,4) NOT NULL,
    weight numeric(20,4) NOT NULL,
    pcs_per_kg numeric(20,4) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE slider.die_casting;
       slider         heap    postgres    false    13                       1259    156135    die_casting_production    TABLE     �  CREATE TABLE slider.die_casting_production (
    uuid text NOT NULL,
    die_casting_uuid text NOT NULL,
    mc_no integer NOT NULL,
    cavity_goods integer NOT NULL,
    cavity_defect integer NOT NULL,
    push integer NOT NULL,
    weight numeric(20,4) NOT NULL,
    order_info_uuid text,
    created_by text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 *   DROP TABLE slider.die_casting_production;
       slider         heap    postgres    false    13                       1259    156142    die_casting_transaction    TABLE     D  CREATE TABLE slider.die_casting_transaction (
    uuid text NOT NULL,
    die_casting_uuid text NOT NULL,
    stock_uuid text NOT NULL,
    trx_quantity numeric(20,4) NOT NULL,
    created_by text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 +   DROP TABLE slider.die_casting_transaction;
       slider         heap    postgres    false    13                       1259    156149    stock    TABLE     �  CREATE TABLE slider.stock (
    uuid text NOT NULL,
    order_info_uuid text,
    item text NOT NULL,
    zipper_number text NOT NULL,
    end_type text NOT NULL,
    puller text,
    color text NOT NULL,
    order_quantity numeric(20,4) DEFAULT 0,
    body_quantity numeric(20,4) DEFAULT 0,
    cap_quantity numeric(20,4) DEFAULT 0,
    puller_quantity numeric(20,4) DEFAULT 0,
    link_quantity numeric(20,4) DEFAULT 0,
    sa_prod numeric(20,4) DEFAULT 0,
    coloring_stock numeric(20,4) DEFAULT 0,
    coloring_prod numeric(20,4) DEFAULT 0,
    trx_to_finishing numeric(20,4) DEFAULT 0,
    u_top_quantity numeric(20,4) DEFAULT 0,
    h_bottom_quantity numeric(20,4) DEFAULT 0,
    box_pin_quantity numeric(20,4) DEFAULT 0,
    two_way_pin_quantity numeric(20,4) DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE slider.stock;
       slider         heap    postgres    false    13                       1259    196851    transaction    TABLE     /  CREATE TABLE slider.transaction (
    uuid text NOT NULL,
    stock_uuid text NOT NULL,
    section text NOT NULL,
    trx_quantity numeric(20,4) NOT NULL,
    created_by text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
    DROP TABLE slider.transaction;
       slider         heap    postgres    false    13                       1259    156168    batch    TABLE     �   CREATE TABLE zipper.batch (
    uuid text NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    id integer NOT NULL
);
    DROP TABLE zipper.batch;
       zipper         heap    postgres    false    14                       1259    156175    batch_entry    TABLE     b  CREATE TABLE zipper.batch_entry (
    uuid text NOT NULL,
    batch_uuid text,
    sfg_uuid text,
    quantity numeric(20,4) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    production_quantity numeric(20,4) NOT NULL,
    production_quantity_in_kg numeric(20,4) NOT NULL
);
    DROP TABLE zipper.batch_entry;
       zipper         heap    postgres    false    14                       1259    196876    batch_id_seq    SEQUENCE     �   CREATE SEQUENCE zipper.batch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE zipper.batch_id_seq;
       zipper          postgres    false    14    260            �           0    0    batch_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE zipper.batch_id_seq OWNED BY zipper.batch.id;
          zipper          postgres    false    278                       1259    156182    dying_batch    TABLE     �   CREATE TABLE zipper.dying_batch (
    uuid text NOT NULL,
    mc_no integer NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    id integer NOT NULL
);
    DROP TABLE zipper.dying_batch;
       zipper         heap    postgres    false    14                       1259    156189    dying_batch_entry    TABLE     v  CREATE TABLE zipper.dying_batch_entry (
    uuid text NOT NULL,
    dying_batch_uuid text,
    batch_entry_uuid text,
    quantity numeric(20,4) NOT NULL,
    production_quantity numeric(20,4) NOT NULL,
    production_quantity_in_kg numeric(20,4) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 %   DROP TABLE zipper.dying_batch_entry;
       zipper         heap    postgres    false    14                       1259    196884    dying_batch_id_seq    SEQUENCE     �   CREATE SEQUENCE zipper.dying_batch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE zipper.dying_batch_id_seq;
       zipper          postgres    false    14    262            �           0    0    dying_batch_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE zipper.dying_batch_id_seq OWNED BY zipper.dying_batch.id;
          zipper          postgres    false    279                       1259    156196    order_description    TABLE     �  CREATE TABLE zipper.order_description (
    uuid text NOT NULL,
    order_info_uuid text,
    item text,
    zipper_number text,
    end_type text,
    lock_type text,
    puller_type text,
    teeth_color text,
    puller_color text,
    special_requirement text,
    hand text,
    stopper_type text,
    coloring_type text,
    is_slider_provided integer DEFAULT 0,
    slider text,
    slider_starting_section_enum zipper.slider_starting_section_enum,
    top_stopper text,
    bottom_stopper text,
    logo_type text,
    is_logo_body integer DEFAULT 0 NOT NULL,
    is_logo_puller integer DEFAULT 0 NOT NULL,
    description text,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    slider_body_shape text,
    slider_link text,
    end_user text,
    garment text,
    light_preference text,
    garments_wash text,
    puller_link text
);
 %   DROP TABLE zipper.order_description;
       zipper         heap    postgres    false    908    14            	           1259    156208    order_entry    TABLE     ?  CREATE TABLE zipper.order_entry (
    uuid text NOT NULL,
    order_description_uuid text,
    style text NOT NULL,
    color text NOT NULL,
    size text NOT NULL,
    quantity numeric(20,4) NOT NULL,
    company_price numeric(20,4) DEFAULT 0 NOT NULL,
    party_price numeric(20,4) DEFAULT 0 NOT NULL,
    status integer DEFAULT 1,
    swatch_status_enum zipper.swatch_status_enum DEFAULT 'pending'::zipper.swatch_status_enum,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    swap_approval_date text
);
    DROP TABLE zipper.order_entry;
       zipper         heap    postgres    false    911    14    911                       1259    156217 
   order_info    TABLE     4  CREATE TABLE zipper.order_info (
    uuid text NOT NULL,
    id integer NOT NULL,
    reference_order_info_uuid text,
    buyer_uuid text,
    party_uuid text,
    marketing_uuid text,
    merchandiser_uuid text,
    factory_uuid text,
    is_sample integer DEFAULT 0,
    is_bill integer DEFAULT 0,
    marketing_priority text,
    factory_priority text,
    status integer DEFAULT 0 NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    is_cash integer DEFAULT 0
);
    DROP TABLE zipper.order_info;
       zipper         heap    postgres    false    14            
           1259    156216    order_info_id_seq    SEQUENCE     �   CREATE SEQUENCE zipper.order_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE zipper.order_info_id_seq;
       zipper          postgres    false    267    14            �           0    0    order_info_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE zipper.order_info_id_seq OWNED BY zipper.order_info.id;
          zipper          postgres    false    266                       1259    156228    sfg    TABLE     y  CREATE TABLE zipper.sfg (
    uuid text NOT NULL,
    order_entry_uuid text,
    recipe_uuid text,
    dying_and_iron_prod numeric(20,4) DEFAULT 0,
    teeth_molding_stock numeric(20,4) DEFAULT 0,
    teeth_molding_prod numeric(20,4) DEFAULT 0,
    teeth_coloring_stock numeric(20,4) DEFAULT 0,
    teeth_coloring_prod numeric(20,4) DEFAULT 0,
    finishing_stock numeric(20,4) DEFAULT 0,
    finishing_prod numeric(20,4) DEFAULT 0,
    coloring_prod numeric(20,4) DEFAULT 0,
    pi numeric(20,4) DEFAULT 0 NOT NULL,
    warehouse numeric(20,4) DEFAULT 0 NOT NULL,
    delivered numeric(20,4) DEFAULT 0 NOT NULL,
    remarks text
);
    DROP TABLE zipper.sfg;
       zipper         heap    postgres    false    14                       1259    156251    sfg_production    TABLE       CREATE TABLE zipper.sfg_production (
    uuid text NOT NULL,
    sfg_uuid text,
    section text NOT NULL,
    used_quantity numeric(20,4) DEFAULT 0,
    production_quantity numeric(20,4) DEFAULT 0,
    wastage numeric(20,4) DEFAULT 0 NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 "   DROP TABLE zipper.sfg_production;
       zipper         heap    postgres    false    14                       1259    156259    sfg_transaction    TABLE     ]  CREATE TABLE zipper.sfg_transaction (
    uuid text NOT NULL,
    order_entry_uuid text,
    trx_from text NOT NULL,
    trx_to text NOT NULL,
    trx_quantity numeric(20,4) NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text,
    slider_item_uuid text
);
 #   DROP TABLE zipper.sfg_transaction;
       zipper         heap    postgres    false    14                       1259    156266 	   tape_coil    TABLE       CREATE TABLE zipper.tape_coil (
    uuid text NOT NULL,
    type text NOT NULL,
    zipper_number numeric(2,1) NOT NULL,
    quantity numeric(20,4) NOT NULL,
    trx_quantity_in_coil numeric(20,4) NOT NULL,
    quantity_in_coil numeric(20,4) NOT NULL,
    remarks text
);
    DROP TABLE zipper.tape_coil;
       zipper         heap    postgres    false    14                       1259    156273    tape_coil_production    TABLE     _  CREATE TABLE zipper.tape_coil_production (
    uuid text NOT NULL,
    section text NOT NULL,
    tape_coil_uuid text,
    production_quantity numeric(20,4) NOT NULL,
    wastage numeric(20,4) DEFAULT 0 NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
 (   DROP TABLE zipper.tape_coil_production;
       zipper         heap    postgres    false    14                       1259    156281    tape_to_coil    TABLE       CREATE TABLE zipper.tape_to_coil (
    uuid text NOT NULL,
    tape_coil_uuid text,
    trx_quantity numeric(20,4) NOT NULL,
    created_by text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    remarks text
);
     DROP TABLE zipper.tape_to_coil;
       zipper         heap    postgres    false    14            �           2604    221603    migrations_details id    DEFAULT     �   ALTER TABLE ONLY drizzle.migrations_details ALTER COLUMN id SET DEFAULT nextval('drizzle.migrations_details_id_seq'::regclass);
 E   ALTER TABLE drizzle.migrations_details ALTER COLUMN id DROP DEFAULT;
       drizzle          postgres    false    224    225    225            �           2604    221604    info id    DEFAULT     d   ALTER TABLE ONLY lab_dip.info ALTER COLUMN id SET DEFAULT nextval('lab_dip.info_id_seq'::regclass);
 7   ALTER TABLE lab_dip.info ALTER COLUMN id DROP DEFAULT;
       lab_dip          postgres    false    276    237                        2604    221605 	   recipe id    DEFAULT     h   ALTER TABLE ONLY lab_dip.recipe ALTER COLUMN id SET DEFAULT nextval('lab_dip.recipe_id_seq'::regclass);
 9   ALTER TABLE lab_dip.recipe ALTER COLUMN id DROP DEFAULT;
       lab_dip          postgres    false    277    238            (           2604    221606    batch id    DEFAULT     d   ALTER TABLE ONLY zipper.batch ALTER COLUMN id SET DEFAULT nextval('zipper.batch_id_seq'::regclass);
 7   ALTER TABLE zipper.batch ALTER COLUMN id DROP DEFAULT;
       zipper          postgres    false    278    260            )           2604    221607    dying_batch id    DEFAULT     p   ALTER TABLE ONLY zipper.dying_batch ALTER COLUMN id SET DEFAULT nextval('zipper.dying_batch_id_seq'::regclass);
 =   ALTER TABLE zipper.dying_batch ALTER COLUMN id DROP DEFAULT;
       zipper          postgres    false    279    262            E          0    155899    bank 
   TABLE DATA           l   COPY commercial.bank (uuid, name, swift_code, address, policy, created_at, updated_at, remarks) FROM stdin;
 
   commercial          postgres    false    226   �      F          0    155906    lc 
   TABLE DATA           x  COPY commercial.lc (uuid, party_uuid, lc_number, lc_date, payment_value, payment_date, ldbc_fdbc, acceptance_date, maturity_date, commercial_executive, party_bank, production_complete, lc_cancel, handover_date, shipment_date, expiry_date, ud_no, ud_received, at_sight, amd_date, amd_count, problematical, epz, created_by, created_at, updated_at, remarks, file_no) FROM stdin;
 
   commercial          postgres    false    227   �      G          0    155918    pi 
   TABLE DATA           �   COPY commercial.pi (uuid, lc_uuid, order_info_ids, marketing_uuid, party_uuid, merchandiser_uuid, factory_uuid, bank_uuid, validity, payment, created_by, created_at, updated_at, remarks) FROM stdin;
 
   commercial          postgres    false    228   �      H          0    155925    pi_entry 
   TABLE DATA           m   COPY commercial.pi_entry (uuid, pi_uuid, sfg_uuid, pi_quantity, created_at, updated_at, remarks) FROM stdin;
 
   commercial          postgres    false    229         I          0    155932    challan 
   TABLE DATA           �   COPY delivery.challan (uuid, carton_quantity, assign_to, created_by, receive_status, created_at, updated_at, remarks) FROM stdin;
    delivery          postgres    false    230         J          0    155940    challan_entry 
   TABLE DATA           �   COPY delivery.challan_entry (uuid, challan_uuid, packing_list_uuid, delivery_quantity, created_at, updated_at, remarks) FROM stdin;
    delivery          postgres    false    231   ;      K          0    155948    packing_list 
   TABLE DATA           w   COPY delivery.packing_list (uuid, carton_size, carton_weight, created_by, created_at, updated_at, remarks) FROM stdin;
    delivery          postgres    false    232   X      L          0    155955    packing_list_entry 
   TABLE DATA           |   COPY delivery.packing_list_entry (uuid, packing_list_uuid, sfg_uuid, quantity, created_at, updated_at, remarks) FROM stdin;
    delivery          postgres    false    233   u      D          0    155867    migrations_details 
   TABLE DATA           C   COPY drizzle.migrations_details (id, hash, created_at) FROM stdin;
    drizzle          postgres    false    225   �      M          0    155962 
   department 
   TABLE DATA           2   COPY hr.department (uuid, department) FROM stdin;
    hr          postgres    false    234   S      N          0    155969    designation 
   TABLE DATA           E   COPY hr.designation (uuid, department_uuid, designation) FROM stdin;
    hr          postgres    false    235   �      O          0    155976    users 
   TABLE DATA           �   COPY hr.users (uuid, name, email, pass, designation_uuid, can_access, ext, phone, created_at, updated_at, status, remarks) FROM stdin;
    hr          postgres    false    236   �      P          0    155983    info 
   TABLE DATA           y   COPY lab_dip.info (uuid, name, order_info_uuid, lab_status, created_by, created_at, updated_at, remarks, id) FROM stdin;
    lab_dip          postgres    false    237   \"      Q          0    155991    recipe 
   TABLE DATA           �   COPY lab_dip.recipe (uuid, lab_dip_info_uuid, name, approved, created_by, status, created_at, updated_at, remarks, id) FROM stdin;
    lab_dip          postgres    false    238   y"      R          0    156000    recipe_entry 
   TABLE DATA           l   COPY lab_dip.recipe_entry (uuid, recipe_uuid, color, quantity, created_at, updated_at, remarks) FROM stdin;
    lab_dip          postgres    false    239   �"      S          0    156007    info 
   TABLE DATA           �   COPY material.info (uuid, section_uuid, type_uuid, name, short_name, unit, threshold, description, created_at, updated_at, remarks) FROM stdin;
    material          postgres    false    240   �"      T          0    156015    section 
   TABLE DATA           D   COPY material.section (uuid, name, short_name, remarks) FROM stdin;
    material          postgres    false    241   �"      U          0    156022    stock 
   TABLE DATA           �  COPY material.stock (uuid, material_uuid, stock, remarks, tape_making, coil_forming, dying_and_iron, m_gapping, v_gapping, v_teeth_molding, m_teeth_molding, teeth_assembling_and_polishing, m_teeth_cleaning, v_teeth_cleaning, plating_and_iron, m_sealing, v_sealing, n_t_cutting, v_t_cutting, m_stopper, v_stopper, n_stopper, cutting, qc_and_packing, die_casting, slider_assembly, coloring) FROM stdin;
    material          postgres    false    242   �"      {          0    196943    stock_to_sfg 
   TABLE DATA           �   COPY material.stock_to_sfg (uuid, material_uuid, order_entry_uuid, trx_to, trx_quantity, created_by, created_at, updated_at, remarks) FROM stdin;
    material          postgres    false    280   
#      V          0    156030    trx 
   TABLE DATA           w   COPY material.trx (uuid, material_uuid, trx_quantity, created_by, created_at, updated_at, remarks, trx_to) FROM stdin;
    material          postgres    false    243   '#      W          0    156037    type 
   TABLE DATA           A   COPY material.type (uuid, name, short_name, remarks) FROM stdin;
    material          postgres    false    244   D#      X          0    156044    used 
   TABLE DATA           �   COPY material.used (uuid, material_uuid, used_quantity, wastage, created_by, created_at, updated_at, remarks, section) FROM stdin;
    material          postgres    false    245   a#      Y          0    156052    buyer 
   TABLE DATA           @   COPY public.buyer (uuid, name, short_name, remarks) FROM stdin;
    public          postgres    false    246   ~#      Z          0    156059    factory 
   TABLE DATA           a   COPY public.factory (uuid, party_uuid, name, phone, address, created_at, updated_at) FROM stdin;
    public          postgres    false    247   �#      [          0    156066 	   marketing 
   TABLE DATA           O   COPY public.marketing (uuid, name, short_name, user_uuid, remarks) FROM stdin;
    public          postgres    false    248   �#      \          0    156073    merchandiser 
   TABLE DATA           m   COPY public.merchandiser (uuid, party_uuid, name, email, phone, address, created_at, updated_at) FROM stdin;
    public          postgres    false    249   �#      ]          0    156080    party 
   TABLE DATA           @   COPY public.party (uuid, name, short_name, remarks) FROM stdin;
    public          postgres    false    250   $      ^          0    156087 
   properties 
   TABLE DATA           y   COPY public.properties (uuid, item_for, type, name, short_name, created_by, created_at, updated_at, remarks) FROM stdin;
    public          postgres    false    251   -$      _          0    156096    section 
   TABLE DATA           B   COPY public.section (uuid, name, short_name, remarks) FROM stdin;
    public          postgres    false    252   J$      `          0    156103    description 
   TABLE DATA           |   COPY purchase.description (uuid, vendor_uuid, is_local, lc_number, created_by, created_at, updated_at, remarks) FROM stdin;
    purchase          postgres    false    253   g$      a          0    156111    entry 
   TABLE DATA           �   COPY purchase.entry (uuid, purchase_description_uuid, material_info_uuid, quantity, price, created_by, created_at, updated_at, remarks) FROM stdin;
    purchase          postgres    false    254   �$      b          0    156118    vendor 
   TABLE DATA           l   COPY purchase.vendor (uuid, name, contact_name, email, office_address, contact_number, remarks) FROM stdin;
    purchase          postgres    false    255   �$      u          0    196844    coloring_transaction 
   TABLE DATA           �   COPY slider.coloring_transaction (uuid, stock_uuid, order_info_uuid, trx_quantity, created_by, created_at, updated_at, remarks) FROM stdin;
    slider          postgres    false    274   �$      c          0    156128    die_casting 
   TABLE DATA           �   COPY slider.die_casting (uuid, name, item, zipper_number, type, puller, logo_type, body_shape, puller_link, stopper, quantity, weight, pcs_per_kg, created_at, updated_at, remarks) FROM stdin;
    slider          postgres    false    256   �$      d          0    156135    die_casting_production 
   TABLE DATA           �   COPY slider.die_casting_production (uuid, die_casting_uuid, mc_no, cavity_goods, cavity_defect, push, weight, order_info_uuid, created_by, created_at, updated_at, remarks) FROM stdin;
    slider          postgres    false    257   �$      e          0    156142    die_casting_transaction 
   TABLE DATA           �   COPY slider.die_casting_transaction (uuid, die_casting_uuid, stock_uuid, trx_quantity, created_by, created_at, updated_at, remarks) FROM stdin;
    slider          postgres    false    258   %      f          0    156149    stock 
   TABLE DATA           W  COPY slider.stock (uuid, order_info_uuid, item, zipper_number, end_type, puller, color, order_quantity, body_quantity, cap_quantity, puller_quantity, link_quantity, sa_prod, coloring_stock, coloring_prod, trx_to_finishing, u_top_quantity, h_bottom_quantity, box_pin_quantity, two_way_pin_quantity, created_at, updated_at, remarks) FROM stdin;
    slider          postgres    false    259   2%      v          0    196851    transaction 
   TABLE DATA           {   COPY slider.transaction (uuid, stock_uuid, section, trx_quantity, created_by, created_at, updated_at, remarks) FROM stdin;
    slider          postgres    false    275   O%      g          0    156168    batch 
   TABLE DATA           V   COPY zipper.batch (uuid, created_by, created_at, updated_at, remarks, id) FROM stdin;
    zipper          postgres    false    260   l%      h          0    156175    batch_entry 
   TABLE DATA           �   COPY zipper.batch_entry (uuid, batch_uuid, sfg_uuid, quantity, created_at, updated_at, remarks, production_quantity, production_quantity_in_kg) FROM stdin;
    zipper          postgres    false    261   �%      i          0    156182    dying_batch 
   TABLE DATA           c   COPY zipper.dying_batch (uuid, mc_no, created_by, created_at, updated_at, remarks, id) FROM stdin;
    zipper          postgres    false    262   �%      j          0    156189    dying_batch_entry 
   TABLE DATA           �   COPY zipper.dying_batch_entry (uuid, dying_batch_uuid, batch_entry_uuid, quantity, production_quantity, production_quantity_in_kg, created_at, updated_at, remarks) FROM stdin;
    zipper          postgres    false    263   �%      k          0    156196    order_description 
   TABLE DATA           �  COPY zipper.order_description (uuid, order_info_uuid, item, zipper_number, end_type, lock_type, puller_type, teeth_color, puller_color, special_requirement, hand, stopper_type, coloring_type, is_slider_provided, slider, slider_starting_section_enum, top_stopper, bottom_stopper, logo_type, is_logo_body, is_logo_puller, description, status, created_at, updated_at, remarks, slider_body_shape, slider_link, end_user, garment, light_preference, garments_wash, puller_link) FROM stdin;
    zipper          postgres    false    264   �%      l          0    156208    order_entry 
   TABLE DATA           �   COPY zipper.order_entry (uuid, order_description_uuid, style, color, size, quantity, company_price, party_price, status, swatch_status_enum, created_at, updated_at, remarks, swap_approval_date) FROM stdin;
    zipper          postgres    false    265   �%      n          0    156217 
   order_info 
   TABLE DATA           
  COPY zipper.order_info (uuid, id, reference_order_info_uuid, buyer_uuid, party_uuid, marketing_uuid, merchandiser_uuid, factory_uuid, is_sample, is_bill, marketing_priority, factory_priority, status, created_by, created_at, updated_at, remarks, is_cash) FROM stdin;
    zipper          postgres    false    267   &      o          0    156228    sfg 
   TABLE DATA           �   COPY zipper.sfg (uuid, order_entry_uuid, recipe_uuid, dying_and_iron_prod, teeth_molding_stock, teeth_molding_prod, teeth_coloring_stock, teeth_coloring_prod, finishing_stock, finishing_prod, coloring_prod, pi, warehouse, delivered, remarks) FROM stdin;
    zipper          postgres    false    268   7&      p          0    156251    sfg_production 
   TABLE DATA           �   COPY zipper.sfg_production (uuid, sfg_uuid, section, used_quantity, production_quantity, wastage, created_by, created_at, updated_at, remarks) FROM stdin;
    zipper          postgres    false    269   T&      q          0    156259    sfg_transaction 
   TABLE DATA           �   COPY zipper.sfg_transaction (uuid, order_entry_uuid, trx_from, trx_to, trx_quantity, created_by, created_at, updated_at, remarks, slider_item_uuid) FROM stdin;
    zipper          postgres    false    270   q&      r          0    156266 	   tape_coil 
   TABLE DATA           y   COPY zipper.tape_coil (uuid, type, zipper_number, quantity, trx_quantity_in_coil, quantity_in_coil, remarks) FROM stdin;
    zipper          postgres    false    271   �&      s          0    156273    tape_coil_production 
   TABLE DATA           �   COPY zipper.tape_coil_production (uuid, section, tape_coil_uuid, production_quantity, wastage, created_by, created_at, updated_at, remarks) FROM stdin;
    zipper          postgres    false    272   �&      t          0    156281    tape_to_coil 
   TABLE DATA           w   COPY zipper.tape_to_coil (uuid, tape_coil_uuid, trx_quantity, created_by, created_at, updated_at, remarks) FROM stdin;
    zipper          postgres    false    273   �&      �           0    0    migrations_details_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('drizzle.migrations_details_id_seq', 33, true);
          drizzle          postgres    false    224            �           0    0    info_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('lab_dip.info_id_seq', 1, false);
          lab_dip          postgres    false    276            �           0    0    recipe_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('lab_dip.recipe_id_seq', 1, false);
          lab_dip          postgres    false    277            �           0    0    batch_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('zipper.batch_id_seq', 1, false);
          zipper          postgres    false    278            �           0    0    dying_batch_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('zipper.dying_batch_id_seq', 1, false);
          zipper          postgres    false    279            �           0    0    order_info_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('zipper.order_info_id_seq', 1, false);
          zipper          postgres    false    266            H           2606    221903    bank bank_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY commercial.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY commercial.bank DROP CONSTRAINT bank_pkey;
    
   commercial            postgres    false    226            J           2606    221911 
   lc lc_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY commercial.lc
    ADD CONSTRAINT lc_pkey PRIMARY KEY (uuid);
 8   ALTER TABLE ONLY commercial.lc DROP CONSTRAINT lc_pkey;
    
   commercial            postgres    false    227            N           2606    221981    pi_entry pi_entry_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY commercial.pi_entry
    ADD CONSTRAINT pi_entry_pkey PRIMARY KEY (uuid);
 D   ALTER TABLE ONLY commercial.pi_entry DROP CONSTRAINT pi_entry_pkey;
    
   commercial            postgres    false    229            L           2606    221931 
   pi pi_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY commercial.pi
    ADD CONSTRAINT pi_pkey PRIMARY KEY (uuid);
 8   ALTER TABLE ONLY commercial.pi DROP CONSTRAINT pi_pkey;
    
   commercial            postgres    false    228            R           2606    223354     challan_entry challan_entry_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY delivery.challan_entry
    ADD CONSTRAINT challan_entry_pkey PRIMARY KEY (uuid);
 L   ALTER TABLE ONLY delivery.challan_entry DROP CONSTRAINT challan_entry_pkey;
       delivery            postgres    false    231            P           2606    223334    challan challan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY delivery.challan
    ADD CONSTRAINT challan_pkey PRIMARY KEY (uuid);
 @   ALTER TABLE ONLY delivery.challan DROP CONSTRAINT challan_pkey;
       delivery            postgres    false    230            V           2606    223388 *   packing_list_entry packing_list_entry_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY delivery.packing_list_entry
    ADD CONSTRAINT packing_list_entry_pkey PRIMARY KEY (uuid);
 V   ALTER TABLE ONLY delivery.packing_list_entry DROP CONSTRAINT packing_list_entry_pkey;
       delivery            postgres    false    233            T           2606    223374    packing_list packing_list_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY delivery.packing_list
    ADD CONSTRAINT packing_list_pkey PRIMARY KEY (uuid);
 J   ALTER TABLE ONLY delivery.packing_list DROP CONSTRAINT packing_list_pkey;
       delivery            postgres    false    232            F           2606    155874 *   migrations_details migrations_details_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY drizzle.migrations_details
    ADD CONSTRAINT migrations_details_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY drizzle.migrations_details DROP CONSTRAINT migrations_details_pkey;
       drizzle            postgres    false    225            X           2606    223408    department department_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY hr.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (uuid);
 @   ALTER TABLE ONLY hr.department DROP CONSTRAINT department_pkey;
       hr            postgres    false    234            Z           2606    223416    designation designation_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY hr.designation
    ADD CONSTRAINT designation_pkey PRIMARY KEY (uuid);
 B   ALTER TABLE ONLY hr.designation DROP CONSTRAINT designation_pkey;
       hr            postgres    false    235            \           2606    223430    users users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY hr.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uuid);
 6   ALTER TABLE ONLY hr.users DROP CONSTRAINT users_pkey;
       hr            postgres    false    236            ^           2606    223444    info info_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY lab_dip.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (uuid);
 9   ALTER TABLE ONLY lab_dip.info DROP CONSTRAINT info_pkey;
       lab_dip            postgres    false    237            b           2606    223484    recipe_entry recipe_entry_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY lab_dip.recipe_entry
    ADD CONSTRAINT recipe_entry_pkey PRIMARY KEY (uuid);
 I   ALTER TABLE ONLY lab_dip.recipe_entry DROP CONSTRAINT recipe_entry_pkey;
       lab_dip            postgres    false    239            `           2606    223464    recipe recipe_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY lab_dip.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (uuid);
 =   ALTER TABLE ONLY lab_dip.recipe DROP CONSTRAINT recipe_pkey;
       lab_dip            postgres    false    238            d           2606    223513    section section_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY material.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (uuid);
 @   ALTER TABLE ONLY material.section DROP CONSTRAINT section_pkey;
       material            postgres    false    241            f           2606    223521    stock stock_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY material.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY material.stock DROP CONSTRAINT stock_pkey;
       material            postgres    false    242            �           2606    223535    stock_to_sfg stock_to_sfg_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY material.stock_to_sfg
    ADD CONSTRAINT stock_to_sfg_pkey PRIMARY KEY (uuid);
 J   ALTER TABLE ONLY material.stock_to_sfg DROP CONSTRAINT stock_to_sfg_pkey;
       material            postgres    false    280            h           2606    223561    trx trx_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY material.trx
    ADD CONSTRAINT trx_pkey PRIMARY KEY (uuid);
 8   ALTER TABLE ONLY material.trx DROP CONSTRAINT trx_pkey;
       material            postgres    false    243            j           2606    223581    type type_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY material.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (uuid);
 :   ALTER TABLE ONLY material.type DROP CONSTRAINT type_pkey;
       material            postgres    false    244            l           2606    223589    used used_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY material.used
    ADD CONSTRAINT used_pkey PRIMARY KEY (uuid);
 :   ALTER TABLE ONLY material.used DROP CONSTRAINT used_pkey;
       material            postgres    false    245            n           2606    221486    buyer buyer_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (uuid);
 :   ALTER TABLE ONLY public.buyer DROP CONSTRAINT buyer_pkey;
       public            postgres    false    246            p           2606    222002    factory factory_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.factory
    ADD CONSTRAINT factory_pkey PRIMARY KEY (uuid);
 >   ALTER TABLE ONLY public.factory DROP CONSTRAINT factory_pkey;
       public            postgres    false    247            r           2606    222010    marketing marketing_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.marketing
    ADD CONSTRAINT marketing_pkey PRIMARY KEY (uuid);
 B   ALTER TABLE ONLY public.marketing DROP CONSTRAINT marketing_pkey;
       public            postgres    false    248            t           2606    222018    merchandiser merchandiser_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.merchandiser
    ADD CONSTRAINT merchandiser_pkey PRIMARY KEY (uuid);
 H   ALTER TABLE ONLY public.merchandiser DROP CONSTRAINT merchandiser_pkey;
       public            postgres    false    249            v           2606    222026    party party_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.party
    ADD CONSTRAINT party_pkey PRIMARY KEY (uuid);
 :   ALTER TABLE ONLY public.party DROP CONSTRAINT party_pkey;
       public            postgres    false    250            x           2606    222086    properties properties_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (uuid);
 D   ALTER TABLE ONLY public.properties DROP CONSTRAINT properties_pkey;
       public            postgres    false    251            z           2606    156095 !   properties properties_type_unique 
   CONSTRAINT     \   ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_type_unique UNIQUE (type);
 K   ALTER TABLE ONLY public.properties DROP CONSTRAINT properties_type_unique;
       public            postgres    false    251            |           2606    221478    section section_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (uuid);
 >   ALTER TABLE ONLY public.section DROP CONSTRAINT section_pkey;
       public            postgres    false    252            ~           2606    223609    description description_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY purchase.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (uuid);
 H   ALTER TABLE ONLY purchase.description DROP CONSTRAINT description_pkey;
       purchase            postgres    false    253            �           2606    223629    entry entry_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY purchase.entry
    ADD CONSTRAINT entry_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY purchase.entry DROP CONSTRAINT entry_pkey;
       purchase            postgres    false    254            �           2606    223655    vendor vendor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY purchase.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (uuid);
 >   ALTER TABLE ONLY purchase.vendor DROP CONSTRAINT vendor_pkey;
       purchase            postgres    false    255            �           2606    223663 .   coloring_transaction coloring_transaction_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY slider.coloring_transaction
    ADD CONSTRAINT coloring_transaction_pkey PRIMARY KEY (uuid);
 X   ALTER TABLE ONLY slider.coloring_transaction DROP CONSTRAINT coloring_transaction_pkey;
       slider            postgres    false    274            �           2606    223689    die_casting die_casting_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY slider.die_casting
    ADD CONSTRAINT die_casting_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY slider.die_casting DROP CONSTRAINT die_casting_pkey;
       slider            postgres    false    256            �           2606    223745 2   die_casting_production die_casting_production_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY slider.die_casting_production
    ADD CONSTRAINT die_casting_production_pkey PRIMARY KEY (uuid);
 \   ALTER TABLE ONLY slider.die_casting_production DROP CONSTRAINT die_casting_production_pkey;
       slider            postgres    false    257            �           2606    223771 4   die_casting_transaction die_casting_transaction_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY slider.die_casting_transaction
    ADD CONSTRAINT die_casting_transaction_pkey PRIMARY KEY (uuid);
 ^   ALTER TABLE ONLY slider.die_casting_transaction DROP CONSTRAINT die_casting_transaction_pkey;
       slider            postgres    false    258            �           2606    223797    stock stock_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY slider.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (uuid);
 :   ALTER TABLE ONLY slider.stock DROP CONSTRAINT stock_pkey;
       slider            postgres    false    259            �           2606    223835    transaction transaction_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY slider.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY slider.transaction DROP CONSTRAINT transaction_pkey;
       slider            postgres    false    275            �           2606    222319    batch_entry batch_entry_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY zipper.batch_entry
    ADD CONSTRAINT batch_entry_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY zipper.batch_entry DROP CONSTRAINT batch_entry_pkey;
       zipper            postgres    false    261            �           2606    222102    batch batch_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY zipper.batch
    ADD CONSTRAINT batch_pkey PRIMARY KEY (uuid);
 :   ALTER TABLE ONLY zipper.batch DROP CONSTRAINT batch_pkey;
       zipper            postgres    false    260            �           2606    222347 (   dying_batch_entry dying_batch_entry_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY zipper.dying_batch_entry
    ADD CONSTRAINT dying_batch_entry_pkey PRIMARY KEY (uuid);
 R   ALTER TABLE ONLY zipper.dying_batch_entry DROP CONSTRAINT dying_batch_entry_pkey;
       zipper            postgres    false    263            �           2606    222339    dying_batch dying_batch_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY zipper.dying_batch
    ADD CONSTRAINT dying_batch_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY zipper.dying_batch DROP CONSTRAINT dying_batch_pkey;
       zipper            postgres    false    262            �           2606    222158 (   order_description order_description_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY zipper.order_description
    ADD CONSTRAINT order_description_pkey PRIMARY KEY (uuid);
 R   ALTER TABLE ONLY zipper.order_description DROP CONSTRAINT order_description_pkey;
       zipper            postgres    false    264            �           2606    222110    order_entry order_entry_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY zipper.order_entry
    ADD CONSTRAINT order_entry_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY zipper.order_entry DROP CONSTRAINT order_entry_pkey;
       zipper            postgres    false    265            �           2606    222044    order_info order_info_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY zipper.order_info
    ADD CONSTRAINT order_info_pkey PRIMARY KEY (uuid);
 D   ALTER TABLE ONLY zipper.order_info DROP CONSTRAINT order_info_pkey;
       zipper            postgres    false    267            �           2606    222367    sfg sfg_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY zipper.sfg
    ADD CONSTRAINT sfg_pkey PRIMARY KEY (uuid);
 6   ALTER TABLE ONLY zipper.sfg DROP CONSTRAINT sfg_pkey;
       zipper            postgres    false    268            �           2606    222381 "   sfg_production sfg_production_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY zipper.sfg_production
    ADD CONSTRAINT sfg_production_pkey PRIMARY KEY (uuid);
 L   ALTER TABLE ONLY zipper.sfg_production DROP CONSTRAINT sfg_production_pkey;
       zipper            postgres    false    269            �           2606    222395 $   sfg_transaction sfg_transaction_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY zipper.sfg_transaction
    ADD CONSTRAINT sfg_transaction_pkey PRIMARY KEY (uuid);
 N   ALTER TABLE ONLY zipper.sfg_transaction DROP CONSTRAINT sfg_transaction_pkey;
       zipper            postgres    false    270            �           2606    222409    tape_coil tape_coil_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY zipper.tape_coil
    ADD CONSTRAINT tape_coil_pkey PRIMARY KEY (uuid);
 B   ALTER TABLE ONLY zipper.tape_coil DROP CONSTRAINT tape_coil_pkey;
       zipper            postgres    false    271            �           2606    222417 .   tape_coil_production tape_coil_production_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY zipper.tape_coil_production
    ADD CONSTRAINT tape_coil_production_pkey PRIMARY KEY (uuid);
 X   ALTER TABLE ONLY zipper.tape_coil_production DROP CONSTRAINT tape_coil_production_pkey;
       zipper            postgres    false    272            �           2606    222431    tape_to_coil tape_to_coil_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY zipper.tape_to_coil
    ADD CONSTRAINT tape_to_coil_pkey PRIMARY KEY (uuid);
 H   ALTER TABLE ONLY zipper.tape_to_coil DROP CONSTRAINT tape_to_coil_pkey;
       zipper            postgres    false    273            �           2606    222056 (   factory factory_party_uuid_party_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.factory
    ADD CONSTRAINT factory_party_uuid_party_uuid_fk FOREIGN KEY (party_uuid) REFERENCES public.party(uuid);
 R   ALTER TABLE ONLY public.factory DROP CONSTRAINT factory_party_uuid_party_uuid_fk;
       public          postgres    false    4982    247    250            �           2606    222051 2   merchandiser merchandiser_party_uuid_party_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.merchandiser
    ADD CONSTRAINT merchandiser_party_uuid_party_uuid_fk FOREIGN KEY (party_uuid) REFERENCES public.party(uuid);
 \   ALTER TABLE ONLY public.merchandiser DROP CONSTRAINT merchandiser_party_uuid_party_uuid_fk;
       public          postgres    false    4982    249    250            �           2606    222177 F   order_description order_description_order_info_uuid_order_info_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY zipper.order_description
    ADD CONSTRAINT order_description_order_info_uuid_order_info_uuid_fk FOREIGN KEY (order_info_uuid) REFERENCES zipper.order_info(uuid);
 p   ALTER TABLE ONLY zipper.order_description DROP CONSTRAINT order_description_order_info_uuid_order_info_uuid_fk;
       zipper          postgres    false    264    5016    267            �           2606    222182 H   order_entry order_entry_order_description_uuid_order_description_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY zipper.order_entry
    ADD CONSTRAINT order_entry_order_description_uuid_order_description_uuid_fk FOREIGN KEY (order_description_uuid) REFERENCES zipper.order_description(uuid);
 r   ALTER TABLE ONLY zipper.order_entry DROP CONSTRAINT order_entry_order_description_uuid_order_description_uuid_fk;
       zipper          postgres    false    265    5012    264            �           2606    222124 .   order_info order_info_buyer_uuid_buyer_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY zipper.order_info
    ADD CONSTRAINT order_info_buyer_uuid_buyer_uuid_fk FOREIGN KEY (buyer_uuid) REFERENCES public.buyer(uuid);
 X   ALTER TABLE ONLY zipper.order_info DROP CONSTRAINT order_info_buyer_uuid_buyer_uuid_fk;
       zipper          postgres    false    267    4974    246            �           2606    222144 2   order_info order_info_factory_uuid_factory_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY zipper.order_info
    ADD CONSTRAINT order_info_factory_uuid_factory_uuid_fk FOREIGN KEY (factory_uuid) REFERENCES public.factory(uuid);
 \   ALTER TABLE ONLY zipper.order_info DROP CONSTRAINT order_info_factory_uuid_factory_uuid_fk;
       zipper          postgres    false    247    4976    267            �           2606    222134 6   order_info order_info_marketing_uuid_marketing_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY zipper.order_info
    ADD CONSTRAINT order_info_marketing_uuid_marketing_uuid_fk FOREIGN KEY (marketing_uuid) REFERENCES public.marketing(uuid);
 `   ALTER TABLE ONLY zipper.order_info DROP CONSTRAINT order_info_marketing_uuid_marketing_uuid_fk;
       zipper          postgres    false    4978    267    248            �           2606    222139 <   order_info order_info_merchandiser_uuid_merchandiser_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY zipper.order_info
    ADD CONSTRAINT order_info_merchandiser_uuid_merchandiser_uuid_fk FOREIGN KEY (merchandiser_uuid) REFERENCES public.merchandiser(uuid);
 f   ALTER TABLE ONLY zipper.order_info DROP CONSTRAINT order_info_merchandiser_uuid_merchandiser_uuid_fk;
       zipper          postgres    false    4980    267    249            �           2606    222129 .   order_info order_info_party_uuid_party_uuid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY zipper.order_info
    ADD CONSTRAINT order_info_party_uuid_party_uuid_fk FOREIGN KEY (party_uuid) REFERENCES public.party(uuid);
 X   ALTER TABLE ONLY zipper.order_info DROP CONSTRAINT order_info_party_uuid_party_uuid_fk;
       zipper          postgres    false    4982    267    250            E      x������ � �      F      x������ � �      G      x������ � �      H      x������ � �      I      x������ � �      J      x������ � �      K      x������ � �      L      x������ � �      D   �  x�=VIr�:\K�� b�KoH��~��.�~~R*	� z$R���IWr�ƌ}s���j��ٽ"v�<���Mf��1r�| q}�a�%C6�Ŧ:�"�lʺkɩI�F��i��{�v��"�1�&������{��@�X��<�Ǹ{�����2ŷ����;��>@�F�.�>^�����|��I�8�6���7�q}9�3�L��N�s�� OuM�|�SR�����1G�{�3fk��G�/�ˁ�6�wQaP '6Q��=�G�МQy�����s�#�1�9�W��V���k�*M��pNLK����1�)X�Xi��^a�yi�9c]ʵ���c!ٮ���k��}�p{�#�.���4�,�\��uD�rۚ{�ʔ��-=D���}����G�9�X�eb%{Ў�J����b�LzfIs��3dr��5'�@���xdǝ2�՞'�N�&�&�&X֢��n|6�M�0Ε�1�(D2�%z�!��v���5��3���C0䥽Zc�F^;�MLv���!�eΗ��m�&�¡��a��%~Y�\�yC�vN��s7��J�"S)^�'p�W��uoǡ�W��\y���y��r�U�Y��(O��I�Ϥ%n��\��)1�����9�S�:�Ǽ�?��Rzi>��p�wԔkcjW��	�;�ώ�FѸ��Qvr�ƃ�w3
���K�tg��X�����F&Ff�8�pn_���|�q��M4I�CD�8�sp���~t���Y���J�������6Al ?�C�����F�$��R>k,)�k�F��ee�a�5�t�#�c704Ĕ�j�"�� �KBҎg/DW`�s����|f�d���*���0���� 9��(���0� �*\�Ȼ}�8������
�A��]�O�o����/���/�0�pN��#�N�[�1�s�])����[ʫ�������*��!�2Ύt��E!]3F�X���[�hc�x��a�r%̝�~��	������t#�-!��e| S�y?κP�BS�����`��_DFt(8�g����qV���e�&�6h������A}�a���_Dq�6^��O_�3au�aC2��ٕ�t+�K�ԆUlԷxz�D���eG�#�`��n��"��|��7�R*�(�Pt:笁�ćT�_D�N~s�GjTքY>����l²����5j�.���	�X�L;�A���A��|��,%��^�h�h7�Q��M�� ����z�j��~N�'�W���3�8���9!����& � �)�[��P��Š��m�UQ��gv-��wՒ��e�,��Ҁ�]�~�O�Ӡ������*LB;��Q! ����(��6���z��U���s�6Ӊ'	ô��"�ޤ^��P��n7�=.�O�>��-t�x��z���o֘�}QS-z�P�_D���B1����}�� �W��      M   E   x��Lw1(�t��
��JM-�tL�����D�z��Vrz!���sR��R|��SK2�ҹb���� ;]�      N   @   x��Lw1(�t��
��JM-��D�;��f�q!�z��Vr��]+R�KK2�R�U��DU���� Fa(�      O   T  x��Y[o�6~��`�1umwI�<�@�b����h��h�E2$�T��G�n��E��C���w����V���~�~L���RL��ov�d�tv�	.֫�?�VIz����8������������>|Z�����?���כ���-��c���[
�]DP&�"Z�|Y�ŷ�E��L"a�C=��Ⲕ_.2��#DP�!$8�RA���@)���LD�0�1z���"ġP)�j�Z��	�b��X��w c��T@ۦݬ%0T��7aq����I�/����γDP���m�s��#�Q9m1��)��A�G^�u�{!*�Q�@�	�)���k�D�@�\2���\�D��^�)Ӆ� G@���)�´�?]�}���=,���hj���a���ӸGxX���L��TթSf��( 
�H�;]�C\�u@-���kl��z�~��#Q6ܖ�ݡc�Ys
M�ѳ���b�z���ȣK��*4K��v�J5��b�� 	)��ˬ�2{�tC�ö�����S�Ew�BN�$�;��|���BR(�2�Cf��yV�ȝ>�o����#�0:^�-.�5A��/(	H�tPF�m'x�/q!#LTk�Ix�5ok�͘�|���S,��ٹ=oL�u����9�W4'�(j���N�9�=�Ü@���o�`��}�ټ�cY���W��������'��<��>�l�I�˛	��*SH����s����hW�yԹ�MT;�Zv����00����[�j:��ɽs� }ګ���ќ��M��h�{9t�=��f�O����@@���w��C=��j������U�	��`�7�����- ����O�x���ãa�����Y�5D_(�:�ziT�Z>HJ��3m��&H�{d`�M#Z��3e��U=���F5�h}�>ګ�6�)����JN�I �(X`���C����'tr"HG��k�J��l�U� ��*!̑g.�>sx��ɀ��f��|61oNO'��|R:x��7[o^��_���^��mV��֫g�_֛��Ս���ֳ��;?m}D(�5�i���Z��˷���n�iF���r>�����      P      x������ � �      Q      x������ � �      R      x������ � �      S      x������ � �      T      x������ � �      U      x������ � �      {      x������ � �      V      x������ � �      W      x������ � �      X      x������ � �      Y   +   x��Lw1(�t��
��JM-�tL�����p�4426����� �	      Z      x������ � �      [      x������ � �      \      x������ � �      ]      x������ � �      ^      x������ � �      _      x������ � �      `      x������ � �      a      x������ � �      b      x������ � �      u      x������ � �      c      x������ � �      d      x������ � �      e      x������ � �      f      x������ � �      v      x������ � �      g      x������ � �      h      x������ � �      i      x������ � �      j      x������ � �      k      x������ � �      l      x������ � �      n      x������ � �      o      x������ � �      p      x������ � �      q      x������ � �      r      x������ � �      s      x������ � �      t      x������ � �     