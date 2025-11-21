Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DECFA478
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 07:43:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vMLng-0001zM-V7; Fri, 21 Nov 2025 02:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vMLne-0001yn-Uw
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 02:43:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vMLnb-0005uT-Tp
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 02:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763710999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UaRrR/bSI9ifC9leQ59k3dsXaJNuvD/OvOK7ugPKPuQ=;
 b=LSgbZsLOnNrIR0y1Wpp6QLTKqmgDj24bRbePt8ROkGMXwPwL7Le3luILLQQaK9HhPoAZgf
 DNrm0fcOmJ6UyiO0xjVMXe17CwjrMT4ZYtWw8GS2ckYV+cd9WFOTjqsAFs6u/vlZV08hPd
 vl+f3IJ0x1Is73SgqsDXUKwkmvLM7KA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-ijJVWklxP0W3WIAXK97JBg-1; Fri, 21 Nov 2025 02:43:16 -0500
X-MC-Unique: ijJVWklxP0W3WIAXK97JBg-1
X-Mimecast-MFC-AGG-ID: ijJVWklxP0W3WIAXK97JBg_1763710996
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e9b2608dso146539985a.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 23:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763710996; x=1764315796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaRrR/bSI9ifC9leQ59k3dsXaJNuvD/OvOK7ugPKPuQ=;
 b=UV6KqkiXOYNK9DGqWPhA2I6je9Tez00ekEBjk/i4z/8V9cgRNRdSsOV6QQEucqbIcf
 VLBHODe/9lLIiUFCMHTVBZ4uWUqAZgnH+q4faBv2pQq6IKM6iHEt4OkY7JPyLWXOKuQp
 cizycHxCBEBJhudLePiI9LQWM/Vvia1bvKx59ArHzALMm5alF7qpPNoJYOlwoO41F6Y/
 dmBSFH8zORkzCeSoy6FOaJWOY25tjEshj7sr8UUriOWbv+XCpqttpd3CEZIJQsuxUcFe
 gLUwIgepoYuuBghngF98NrgkyoJHOIK+gc/FHiy2650MicPlGJ2NR0GQOAp7ghKkU+n9
 /Hqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT7UBCVDtoJimIRVlGYEHx3+f993WgD+F5eHwAkcmtuEm3Xl5qmrhjYP6Nkr+viWoT7ofqSHcNng2l@nongnu.org
X-Gm-Message-State: AOJu0Yw830ImgE7NdnrcwFKT6UyzERB4Y4w7FYAEFQi4vBFZfsq8YTi2
 aknLObVl10aDkydhRTlxt+L9P1Acu6pMiwwkhYC3s/j+UgHUG8mzYekA2boLmOotFQ4fqwIExXC
 6zy7ujE0JG6pvSUo/QRtzdH5isXKS6fh+aERvrBJuf3XhhuxrUoos/rXg/xhqKuhG+5hINLPwPW
 9em8qeND/X6qB4WpaThIMdYbQ9DjdM3Ng=
X-Gm-Gg: ASbGncvIIPqMqZeYergQ5t59goi4fEJXeL4B3JdS2njsmnuxTFbkYanNpfBYi3tCoYM
 2Xrw8UbzYGc3+xNSeddGy8Cl1jjGUpJv5KXzMYf0gebuERfeQAUMKTUcGkI+0S4YXmvvt/4jgJu
 Q93taDoYOLnGuCdRYfXAYxtLCsQyLHwOvAzdJBLcxsE1dFOliZxpQT/VNFpKBtSXOsCB1X
X-Received: by 2002:a05:622a:199b:b0:4ed:ae38:6592 with SMTP id
 d75a77b69052e-4ee589409f9mr19048251cf.79.1763710996256; 
 Thu, 20 Nov 2025 23:43:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETP0cHXZT3TQIN11rmLao5OEegQ9+57ZsItOyprELi91KV6ANui+OB+j0cbxmwyqlkyxoABL6wqmfFCHzvktk=
X-Received: by 2002:a05:622a:199b:b0:4ed:ae38:6592 with SMTP id
 d75a77b69052e-4ee589409f9mr19047861cf.79.1763710995835; Thu, 20 Nov 2025
 23:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-14-armbru@redhat.com>
In-Reply-To: <20251120191339.756429-14-armbru@redhat.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Fri, 21 Nov 2025 09:43:04 +0200
X-Gm-Features: AWmQ_bmdKUn6ydK6C5Q1jdfMet69rDLS9kOEgzlcXdE8rv6sRstOoduZH2Z6aYY
Message-ID: <CAPMcbCqzp9BwUvRF1kt1CoeftAL3jiVWoWE_3DyrkBx+dyKabQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] qga/commands-win32: Use error_setg_win32() for
 better error messages
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, arei.gonglei@huawei.com, pizhenwei@bytedance.com, 
 alistair.francis@wdc.com, stefanb@linux.vnet.ibm.com, kwolf@redhat.com, 
 hreitz@redhat.com, sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com, 
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com, 
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org, 
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com, 
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, philmd@linaro.org, 
 alex@shazbot.org, clg@redhat.com, peterx@redhat.com, farosas@suse.de, 
 lizhijian@fujitsu.com, dave@treblig.org, jasowang@redhat.com, 
 samuel.thibault@ens-lyon.org, michael.roth@amd.com, zhao1.liu@intel.com, 
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 marcandre.lureau@redhat.com, qemu-block@nongnu.org, qemu-ppc@nongnu.org, 
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m1KopLMYILkSdK9jAdgYVkTrFS0zvKq3lUJygmwoeus_1763710996
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000064bbee064415f7a2"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--00000000000064bbee064415f7a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

On Thu, Nov 20, 2025 at 9:14=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> We include numeric GetLastError() codes in error messages in a few
> places, like this:
>
>     error_setg(errp, "GRIPE: %d", (int)GetLastError());
>
> Show text instead, like this:
>
>     error_setg_win32(errp, GetLastError(), "GRIPE");
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/commands-win32.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index acc2c11589..0fd0c966e4 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -1798,8 +1798,8 @@ void qmp_guest_set_time(bool has_time, int64_t
> time_ns, Error **errp)
>      tf.dwHighDateTime =3D (DWORD) (time >> 32);
>
>      if (!FileTimeToSystemTime(&tf, &ts)) {
> -        error_setg(errp, "Failed to convert system time %d",
> -                   (int)GetLastError());
> +        error_setg_win32(errp, GetLastError(),
> +                         "Failed to convert system time");
>          return;
>      }
>
> @@ -1810,7 +1810,8 @@ void qmp_guest_set_time(bool has_time, int64_t
> time_ns, Error **errp)
>      }
>
>      if (!SetSystemTime(&ts)) {
> -        error_setg(errp, "Failed to set time to guest: %d",
> (int)GetLastError());
> +        error_setg_win32(errp, GetLastError(),
> +                         "Failed to set time to guest");
>          return;
>      }
>  }
> @@ -1834,13 +1835,12 @@ GuestLogicalProcessorList
> *qmp_guest_get_vcpus(Error **errp)
>          (length > sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION))) {
>          ptr =3D pslpi =3D g_malloc0(length);
>          if (GetLogicalProcessorInformation(pslpi, &length) =3D=3D FALSE)=
 {
> -            error_setg(&local_err, "Failed to get processor information:
> %d",
> -                       (int)GetLastError());
> +            error_setg_win32(&local_err, GetLastError(),
> +                             "Failed to get processor information");
>          }
>      } else {
> -        error_setg(&local_err,
> -                   "Failed to get processor information buffer length:
> %d",
> -                   (int)GetLastError());
> +        error_setg_win32(&local_err, GetLastError(),
> +                         "Failed to get processor information buffer
> length");
>      }
>
>      while ((local_err =3D=3D NULL) && (length > 0)) {
> --
> 2.49.0
>
>

--00000000000064bbee064415f7a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Nov 20, 2025 at 9:14=E2=80=AFPM Markus Armbruster &lt;<a h=
ref=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">We include numeric GetLas=
tError() codes in error messages in a few<br>
places, like this:<br>
<br>
=C2=A0 =C2=A0 error_setg(errp, &quot;GRIPE: %d&quot;, (int)GetLastError());=
<br>
<br>
Show text instead, like this:<br>
<br>
=C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(), &quot;GRIPE&quot;);<br=
>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 16 ++++++++--------<br>
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index acc2c11589..0fd0c966e4 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -1798,8 +1798,8 @@ void qmp_guest_set_time(bool has_time, int64_t time_n=
s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0tf.dwHighDateTime =3D (DWORD) (time &gt;&gt; 32);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!FileTimeToSystemTime(&amp;tf, &amp;ts)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Failed to convert syste=
m time %d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int)=
GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Failed to convert system time&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1810,7 +1810,8 @@ void qmp_guest_set_time(bool has_time, int64_t time_n=
s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!SetSystemTime(&amp;ts)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Failed to set time to g=
uest: %d&quot;, (int)GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Failed to set time to guest&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -1834,13 +1835,12 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(length &gt; sizeof(SYSTEM_LOGICAL_PROCES=
SOR_INFORMATION))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D pslpi =3D g_malloc0(length);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (GetLogicalProcessorInformation(pslpi,=
 &amp;length) =3D=3D FALSE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err, &quot=
;Failed to get processor information: %d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(int)GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(&amp;local_err,=
 GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to get processor information&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Failed to get processor information buffer length: %d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int)=
GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(&amp;local_err, GetLastError(=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Failed to get processor information buffer length&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0while ((local_err =3D=3D NULL) &amp;&amp; (length &gt; =
0)) {<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--00000000000064bbee064415f7a2--


