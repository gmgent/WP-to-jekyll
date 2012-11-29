---
layout: blog
title: A really clean dynamic insert proc for PL SQL ETL packages
permalink: 2007/11/a-really-clean-dynamic-insert-proc-for-pl-sql-etl-packages
postday: 11/19 2007
posttime: 07_01
categories: [code]
---

<p>A really clean dynamic insert proc for PL/SQL ETL packages. Pass in the table name, an array of field names and an array of values. Done.</p>
<p>PROCEDURE insert_row( p_tblname in varchar2, p_colname in v_array, p_value in v_array)<br />
IS<br />
--This procedure dynamically builds an insert string and executes.<br />
v_stmt clob;<br />
v_ret  number;<br />
v_cntflag number := 1; --default start counter<br />
no_parse_error exception;<br />
pragma exception_init(no_parse_error,-1003); -- no parse error</p>
<p>BEGIN</p>
<p>-- VALIDATION CHECK<br />
 IF p_tblname IS NULL THEN RETURN;<br />
 ELSIF p_colname IS NULL OR p_colname.COUNT = 0 THEN RETURN;<br />
 END IF;</p>
<p>--Build SQL statement for insert<br />
v_stmt := &#039;insert into &#039; || p_tblname ||&#039;@optional_dblink.server.xxx&#039;|| &#039; ( &#039; || p_colname(1);</p>
<p>    for i in 2 .. p_colname.count<br />
    loop<br />
      v_stmt := v_stmt || &#039;, &#039; || p_colname(i);<br />
    end loop;</p>
<p>if upper(p_colname(1)) = &#039;ID&#039; and p_value(1) = &#039;-999&#039; then<br />
  v_cntflag := 2;<br />
  v_stmt := v_stmt || &#039;) values (&#039;||p_tblname||&#039;_SEQ.NEXTVAL@optional_dblink.server.xxx&#039;;<br />
else<br />
  v_cntflag := 1;<br />
  v_stmt := v_stmt || &#039;) values ( :bv1&#039;;<br />
end if;</p>
<p>    for i in 2 .. p_colname.count<br />
    loop<br />
      v_stmt := v_stmt || &#039;, :bv&#039; || i;<br />
    end loop;</p>
<p>v_stmt := v_stmt || &#039;)&#039;;<br />
--dbms_output.put_line(v_stmt);</p>
<p>        -- this check is done to ensure that there is no hard parse by storing previously<br />
        -- parsed queries into a global array variable within this session<br />
        -- Using dbms_sql instead of execute immediate because the number of bind variables is unknown.<br />
        p_cursor := parse_tbl.first;<br />
        while ( p_cursor IS NOT NULL and (parse_tbl(p_cursor) != v_stmt) )<br />
        loop<br />
            p_cursor := parse_tbl.next(p_cursor);<br />
        end loop;</p>
<p>        if ( p_cursor IS NULL or (parse_tbl(p_cursor) != v_stmt) )<br />
        then<br />
            p_cursor := dbms_sql.open_cursor;<br />
            dbms_sql.parse(  p_cursor, v_stmt, dbms_sql.native );<br />
            parse_tbl(p_cursor) := v_stmt;<br />
        end if;</p>
<p>    for i in v_cntflag .. p_value.count<br />
    loop<br />
      --dbms_output.put_line(&#039;val&#039;||i||&#039;-&#039;||p_value(i));<br />
      dbms_sql.bind_variable( p_cursor, &#039;:bv&#039; || i, p_value(i) );<br />
    end loop;</p>
<p>    v_ret := dbms_sql.execute( p_cursor );</p>
<p>EXCEPTION<br />
WHEN no_parse_error then<br />
            p_cursor := dbms_sql.open_cursor;<br />
            dbms_sql.parse(p_cursor, v_stmt, dbms_sql.native );<br />
            parse_tbl(p_cursor) := v_stmt;<br />
            for i in v_cntflag .. p_value.count<br />
            loop<br />
              dbms_sql.bind_variable( p_cursor, &#039;:bv&#039; || i, p_value(i) );<br />
            end loop;<br />
            v_ret := dbms_sql.execute( p_cursor );</p>
<p>WHEN OTHERS THEN<br />
log_exception(&#039;insert_row:&#039; || p_tblname,   p_tblname,   SQLCODE || sqlerrm,   SUBSTR(query_text,   1,   400));<br />
END insert_row;<br />
</p>
