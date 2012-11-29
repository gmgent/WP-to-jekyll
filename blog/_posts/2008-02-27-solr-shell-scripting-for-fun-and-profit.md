---
layout: blog
title: solr shell scripting for fun and profit
permalink: 2008/02/solr-shell-scripting-for-fun-and-profit
postday: 02/27 2008
posttime: 08_02
categories: [Code]
---

<p>We love Solr. Yes we do.</p>
<p>#!/bin/bash<br />
#<br />
# Shell script to clean up backups of a Solr Lucene collection.</p>
<p>orig_dir=$(pwd)<br />
cd ${0%/*}/..<br />
solr_root=$(pwd)<br />
cd ${orig_dir}</p>
<p>unset days num data_dir user verbose debug<br />
. ${solr_root}/bin/scripts-util</p>
<p># set up variables<br />
prog=${0##*/}<br />
log=${solr_root}/logs/${prog}.log</p>
<p># define usage string<br />
USAGE="\<br />
usage: $prog -D  | -N  [-d dir] [-u username] [-v]<br />
       -D    cleanup backups more than  days old<br />
       -N     keep the most recent  number of backups and<br />
                   cleanup up the remaining ones that are not being pulled<br />
       -d          specify directory holding index data<br />
       -u          specify user to sudo to before running script<br />
       -v          increase verbosity<br />
       -V          output debugging info<br />
"</p>
<p># parse args<br />
while getopts D:N:d:u:vV OPTION<br />
do<br />
    case $OPTION in<br />
    D)<br />
        days="$OPTARG"<br />
        ;;<br />
    N)<br />
        num="$OPTARG"<br />
        ;;<br />
    d)<br />
        data_dir="$OPTARG"<br />
        ;;<br />
    u)<br />
        user="$OPTARG"<br />
        ;;<br />
    v)<br />
        verbose="v"<br />
        ;;<br />
    V)<br />
        debug="V"<br />
        ;;<br />
    *)<br />
        echo "$USAGE"<br />
        exit 1<br />
    esac<br />
done</p>
<p>[[ -n $debug ]] &amp;&amp; set -x</p>
<p>if [[ -z ${days} &amp;&amp; -z ${num} ]]<br />
then<br />
    echo "$USAGE"<br />
    exit 1<br />
fi</p>
<p>fixUser "$@"</p>
<p># use default value for data_dir if not specified<br />
# relative path starts at ${solr_root}<br />
if [[ -z ${data_dir} ]]<br />
then<br />
    data_dir=${solr_root}/data<br />
elif [[ "`echo ${data_dir}|cut -c1`" != "/" ]]<br />
then<br />
    data_dir=${solr_root}/${data_dir}<br />
fi</p>
<p>function remove<br />
{<br />
    logMessage removing backup $1<br />
    /bin/rm -rf $1<br />
}</p>
<p>start=`date +"%s"`</p>
<p>logMessage started by $oldwhoami<br />
logMessage command: $0 $@</p>
<p># trap control-c<br />
trap &#039;echo "caught INT/TERM, exiting now but partial cleanup may have already occured";logExit aborted 13&#039; INT TERM</p>
<p>if [[ -n ${days} ]]<br />
then<br />
    #is maxdepth supported?<br />
    find ${data_dir} -maxdepth 0 -name foobar &gt;/dev/null 2&gt;&amp;1<br />
    if [ $? = 0 ]; then<br />
      maxdepth="-maxdepth 1"<br />
    else<br />
      unset maxdepth<br />
    fi</p>
<p>    logMessage cleaning up backups more than ${days} days old<br />
    for i in `find ${data_dir} ${maxdepth} -name &#039;backup.*&#039; -mtime +${days} -print`<br />
    do<br />
        remove $i<br />
    done<br />
elif [[ -n ${num} ]]<br />
then<br />
    logMessage cleaning up all backups except for the most recent ${num} ones<br />
    unset backups count<br />
    backups=`ls -cd ${data_dir}/backup.* 2&gt;/dev/null`<br />
    if [[ $? == 0 ]]<br />
    then<br />
        count=`echo $backups|wc -w`<br />
        startpos=`expr $num + 1`<br />
        if [[ $count -gt $num ]]<br />
        then<br />
            for i in `echo $backups|cut -f${startpos}- -d" "`<br />
            do<br />
	        remove $i<br />
	    done<br />
        fi<br />
    fi<br />
fi</p>
<p>logExit ended 0</p>
<p><a href="http://www.digbox.net/index.php/RoR/solr-shell-scripting-for-fun-and-profit">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
