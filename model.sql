-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    user_id bigint NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;
    
    -- Table: public.account

-- DROP TABLE IF EXISTS public.account;

CREATE TABLE IF NOT EXISTS public.account
(
    account_id bigint NOT NULL DEFAULT nextval('account_account_id_seq'::regclass),
    amount bigint,
    user_id bigint NOT NULL,
    CONSTRAINT account_pkey PRIMARY KEY (account_id),
    CONSTRAINT account_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.account
    OWNER to postgres;
    
    -- Table: public.transfer

-- DROP TABLE IF EXISTS public.transfer;

CREATE TABLE IF NOT EXISTS public.transfer
(
    transfer_id bigint NOT NULL DEFAULT nextval('transfer_transfer_id_seq'::regclass),
    from_account bigint NOT NULL,
    to_account bigint NOT NULL,
    summa bigint NOT NULL,
    CONSTRAINT transfer_pkey PRIMARY KEY (transfer_id),
    CONSTRAINT transfer_from_account_fkey FOREIGN KEY (from_account)
        REFERENCES public.account (account_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT transfer_to_account_fkey FOREIGN KEY (to_account)
        REFERENCES public.account (account_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.transfer
    OWNER to melchior;
