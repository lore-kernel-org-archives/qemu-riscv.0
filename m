Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A451ACFA478
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 07:40:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vMLkL-0007z2-J0; Fri, 21 Nov 2025 02:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vMLkK-0007x9-1I
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 02:39:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vMLkG-0004ky-Vb
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 02:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763710792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nsxb1+ZtH/utbUjrw5MXl9iDkbIwPjjaHwBbbnpvgnE=;
 b=HXPBBtLpeun58N/mn40BaVHG0IJl2/iv3grxeVDjnev7CUaqz6auEUY4RFdxrE816l93Hm
 dSm8aAkHRz/vO4VPdznsKHci5hS/PxYvoIGJx8NNB4VMdgtCOvlSt1iFsNsBlqjRc08AkM
 fa8fv6+eHcynub0xLAdhPK17mUmbozM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-4T6prCajOkW0ny80xNwgrw-1; Fri, 21 Nov 2025 02:39:48 -0500
X-MC-Unique: 4T6prCajOkW0ny80xNwgrw-1
X-Mimecast-MFC-AGG-ID: 4T6prCajOkW0ny80xNwgrw_1763710788
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88041f9e686so54777666d6.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 23:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763710788; x=1764315588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nsxb1+ZtH/utbUjrw5MXl9iDkbIwPjjaHwBbbnpvgnE=;
 b=k3r5fAubSt0ZCJ4tNmsLVhSViYNY3Yk1U4J2TgCXHFl/WAtFw9tlbJA0dElOsPpG7V
 uY1iVfCk9y5oc/tgp4dA0klHYmBABW8jeaDQOySoWkWK6wl4emtP+3PbV2YoJ1qISgiw
 RZKchBQA7lGSKKYlEOCJsERPfcGJNDE7hQ2VPEqb/Uy4LmMKvfZHCAmC8dwa8MKS1ucD
 g8Zwe/fPVGkuzoL2W6rP86di6GavSkoQ/3GlhQ2lC0DkZLJTX7GzPA8PD6NvZ4h9it70
 vpv6+swpGyDAR3Rip2IpXaVKqjhsc/RM9n+qTl+HviBxqxSGrTTYnaWLB42bqVccQgFj
 620g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVeBD9CcBd7eJBS1fyYjKeHnrH+SyuTiSC0CC7z0TTcVuKpMByuV8x/TZrigusDf82bV9yT/GarrEX@nongnu.org
X-Gm-Message-State: AOJu0YzRfvdkgkmlUu3FmG9/M0PNdYBv98aWzILnzJQIpbnGkYupqgTV
 /AG4FfWXr5aKM+6JrQJa5DrGH+1UyTd4mnrCosVN4O1EIJYcty//P/Idcn/uYQJhtRJSaLgkXUH
 xtEFzNld+LMhFJo72WYOaGR4kcOlND4/eRB5KXlM9Whs/Ruhd3zq31hN0ZSlkf6xcMmbb8UhTgX
 ShTafrSRtyw6NYzsG7hH3FjCMJMCgCfQ4=
X-Gm-Gg: ASbGnctNweQrM76FuVgsjZwH1Wp0In7VRfip3fgd/rbDjn4qC2jU8VApTzLbt9evH5S
 xp4H1RYsxfUg0rYPgh1EukzDFEHjszllL30kUr4mOmb2W72QjOso73jOJ9prLwLCEqytlmThWaA
 eNT/jIakdZcAkpg+GGAved/N87GSuSEKK0feFVnpyiroOLBX1lvnxAztPSSgvlL/kQNQWd
X-Received: by 2002:a05:622a:118c:b0:4eb:a8ba:947b with SMTP id
 d75a77b69052e-4ee5884991amr17159781cf.24.1763710788156; 
 Thu, 20 Nov 2025 23:39:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLyPkFkG3x0S6uI+xdlOI37nnwdMuiwb0nN0Gl6T/QJxCnm5Mh8QiLNWxZMD4XY2VbeYYHMBdVUMjbZObmN1Y=
X-Received: by 2002:a05:622a:118c:b0:4eb:a8ba:947b with SMTP id
 d75a77b69052e-4ee5884991amr17159341cf.24.1763710787702; Thu, 20 Nov 2025
 23:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-5-armbru@redhat.com>
In-Reply-To: <20251120191339.756429-5-armbru@redhat.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Fri, 21 Nov 2025 09:39:36 +0200
X-Gm-Features: AWmQ_bkbTDRklsFcwFvNMZRSvPNhhVVXvsEkVWTHdAglGa310j_mRubzsRFOFH4
Message-ID: <CAPMcbCrQvuCf_zqgB7HkQd+VoP3Kha73EwTXjVqKcVEqPFz1Lg@mail.gmail.com>
Subject: Re: [PATCH 04/14] qga: Use error_setg_file_open() for better error
 messages
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
X-Mimecast-MFC-PROC-ID: NP3kIv_L2jXJ1Et2C4Fx3TApiG6kcdgJMAwMRlzDCPo_1763710788
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fce1ef064415ea4e"
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

--000000000000fce1ef064415ea4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

On Thu, Nov 20, 2025 at 9:13=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> Error messages change from
>
>     open("FNAME"): REASON
>
> to
>
>     Could not open 'FNAME': REASON
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/commands-linux.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
> index 4a09ddc760..5cf76ca2d9 100644
> --- a/qga/commands-linux.c
> +++ b/qga/commands-linux.c
> @@ -1502,14 +1502,15 @@ static void transfer_vcpu(GuestLogicalProcessor
> *vcpu, bool sys2vcpu,
>
>      dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
>      if (dirfd =3D=3D -1) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +        error_setg_file_open(errp, errno, dirpath);
>          return;
>      }
>
>      fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
>      if (fd =3D=3D -1) {
>          if (errno !=3D ENOENT) {
> -            error_setg_errno(errp, errno, "open(\"%s/%s\")", dirpath, fn=
);
> +            error_setg_errno(errp, errno, "could not open %s/%s",
> +                             dirpath, fn);
>          } else if (sys2vcpu) {
>              vcpu->online =3D true;
>              vcpu->can_offline =3D false;
> @@ -1711,7 +1712,7 @@ static void transfer_memory_block(GuestMemoryBlock
> *mem_blk, bool sys2memblk,
>      dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
>      if (dirfd =3D=3D -1) {
>          if (sys2memblk) {
> -            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +            error_setg_file_open(errp, errno, dirpath);
>          } else {
>              if (errno =3D=3D ENOENT) {
>                  result->response =3D
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
> @@ -1936,7 +1937,7 @@ static GuestDiskStatsInfoList
> *guest_get_diskstats(Error **errp)
>
>      fp =3D fopen(diskstats, "r");
>      if (fp  =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        error_setg_file_open(errp, errno, diskstats);
>          return NULL;
>      }
>
> @@ -2047,7 +2048,7 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error
> **errp)
>
>      fp =3D fopen(cpustats, "r");
>      if (fp  =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
> +        error_setg_file_open(errp, errno, cpustats);
>          return NULL;
>      }
>
> --
> 2.49.0
>
>

--000000000000fce1ef064415ea4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Nov 20, 2025 at 9:13=E2=80=AFPM Markus Armbruster &lt;<a h=
ref=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Error messages change fro=
m<br>
<br>
=C2=A0 =C2=A0 open(&quot;FNAME&quot;): REASON<br>
<br>
to<br>
<br>
=C2=A0 =C2=A0 Could not open &#39;FNAME&#39;: REASON<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-linux.c | 11 ++++++-----<br>
=C2=A01 file changed, 6 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
index 4a09ddc760..5cf76ca2d9 100644<br>
--- a/qga/commands-linux.c<br>
+++ b/qga/commands-linux.c<br>
@@ -1502,14 +1502,15 @@ static void transfer_vcpu(GuestLogicalProcessor *vc=
pu, bool sys2vcpu,<br>
<br>
=C2=A0 =C2=A0 =C2=A0dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
=C2=A0 =C2=A0 =C2=A0if (dirfd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, dirpath);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);=
<br>
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno !=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s/%s\&quot;)&quot;, dirpath, fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;could not open %s/%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirpath, fn);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (sys2vcpu) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu-&gt;online =3D true;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu-&gt;can_offline =3D fa=
lse;<br>
@@ -1711,7 +1712,7 @@ static void transfer_memory_block(GuestMemoryBlock *m=
em_blk, bool sys2memblk,<br>
=C2=A0 =C2=A0 =C2=A0dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
=C2=A0 =C2=A0 =C2=A0if (dirfd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno=
, dirpath);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D ENOENT) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result-&gt;re=
sponse =3D GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;<br>
@@ -1936,7 +1937,7 @@ static GuestDiskStatsInfoList *guest_get_diskstats(Er=
ror **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fp =3D fopen(diskstats, &quot;r&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (fp=C2=A0 =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, diskstats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, diskstats);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -2047,7 +2048,7 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **err=
p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fp =3D fopen(cpustats, &quot;r&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (fp=C2=A0 =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, cpustats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, cpustats);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000fce1ef064415ea4e--


