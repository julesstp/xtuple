CREATE OR REPLACE VIEW cust AS
  SELECT cust_id, cust_active, cust_custtype_id, cust_salesrep_id,
        cust_commprcnt, cust_name,
        m.addr_line1 AS cust_address1,
        m.addr_line2    AS cust_address2,
        m.addr_line3    AS cust_address3,
        m.addr_city     AS cust_city,
        m.addr_state    AS cust_state,
        m.addr_postalcode AS cust_zipcode,
        trim(mc.cntct_first_name || ' ' || mc.cntct_last_name) AS cust_contact,
        mc.cntct_phone  AS cust_phone,
        mc.cntct_fax    AS cust_fax,
        mc.cntct_email  AS cust_email,
        c.addr_line1    AS cust_corraddress1,
        c.addr_line2    AS cust_corraddress2,
        c.addr_line3    AS cust_corraddress3,
        c.addr_city     AS cust_corrcity,
        c.addr_state    AS cust_corrstate,
        c.addr_postalcode AS cust_corrzipcode,
        trim(cc.cntct_first_name || ' ' || cc.cntct_last_name) AS cust_corrcontact,
        cc.cntct_phone  AS cust_corrphone,
        cc.cntct_fax    AS cust_corrfax,
        cc.cntct_email  AS cust_corremail,
        cust_creditlmt,
        cust_creditrating,
        cust_financecharge,
        cust_backorder,
        cust_partialship,
        cust_terms_id,
        cust_discntprcnt,
        cust_taxzone_id,
        cust_balmethod,
        cust_ffshipto,
        cust_shipform_id,
        cust_shipvia,
        cust_blanketpos,
        cust_shipchrg_id,
        cust_creditstatus,
        cust_comments,
        cust_ffbillto,
        m.addr_country  AS cust_country,
        c.addr_country  AS cust_corrcountry,
        cust_usespos,
        cust_number,
        cust_dateadded,
        cust_exported,
        cust_emaildelivery,
        cust_ediemail,
        cust_edisubject,
        cust_edifilename,
        cust_ediemailbody,
        cust_autoupdatestatus,
        cust_autoholdorders,
        cust_edicc,
        cust_ediprofile_id,
        cust_preferred_warehous_id,
        cust_curr_id,
        cust_creditlmt_curr_id
FROM custinfo LEFT OUTER JOIN cntct mc  ON (cust_cntct_id=mc.cntct_id)
          LEFT OUTER JOIN addr m    ON (mc.cntct_addr_id=m.addr_id)
          LEFT OUTER JOIN cntct cc  ON (cust_corrcntct_id=cc.cntct_id)
          LEFT OUTER JOIN addr c    ON (cc.cntct_addr_id=c.addr_id);

REVOKE ALL ON TABLE cust FROM PUBLIC;
GRANT  ALL ON TABLE cust TO GROUP xtrole;

