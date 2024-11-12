Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554FBD41D4E
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 03:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tAhYS-0001W8-Fn; Mon, 11 Nov 2024 22:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tAhYN-0001VT-6L
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2024 22:26:55 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tAhYJ-0001fu-8W
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2024 22:26:53 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2e30116efc9so4207096a91.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Nov 2024 19:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731382008; x=1731986808; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HUwetLWY7PFCaRoIHjjC2NnzUVtVs1JnyA/QpMotXTo=;
 b=GNjYtaSYoM/sQNLbPl6wioFdmjDOZnFpOUv1ONTUUaq/zLu785kG+kHDxR5LIszImY
 g7cKKsbnwwlGOzJYII2tZhLmIIleYy7lP3uYluValq8bjK3R0yuZUjB/MaezMvM55gBH
 gKzoysDZO4GMw9F+UaaI+ktZyN1Xs3SzN0Mz2ySjCS9KNMtGSa99EKT4mwQ/HgAPfHiu
 8sY3AbHelRqDHHKPhGsogg3U9BZTueztCpTJ8UAdQ5sPc9NtHbeHN2/cdB7psfZqlU1m
 c6ILbjK9DjV8DltCAWy4rgVPD5bLBmSOiPGj8H4n8ucRUsMKmXS+Z3shwEMG9zFH9+sB
 XkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731382008; x=1731986808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HUwetLWY7PFCaRoIHjjC2NnzUVtVs1JnyA/QpMotXTo=;
 b=HgauUh0QGIOTAc3O/s9+mEzdxAXtux5rbkeshkUzlHsK0GYCjgNOd2Fj3Fd0ZgGD30
 N8R7NAeQ+QR1vYnB0iUJu1rFDvwfsW4zG099vjic0eO83qPk8AwGcg1rONsvjbXZAPL8
 5+Df+PtsqZE1crIoGwSpx7Xu3dfEvkpTYsR++crEOQe86vGWmXhnMiQhMwHxyi8niBHY
 4Zy9Hg/xSRM1tXPHFv3zo8nb37vMhJmxU1gb3LE9Fi0Ve3dW/S+rNVy2wokACXxZCiCE
 l0Xp5R5VTZJ0vn7nCyicfjkodRHy0vXogGgdiqigBRoi4AtVHKqpQQ5uM+jGsOJExe02
 O+RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLZXdi5ygzaCyRI0956UR4iLVUj4+hjydodeXyHm/RYKmPsQNb4gjeqkYUUCyGIThrsll8czg7o5j5@nongnu.org
X-Gm-Message-State: AOJu0YxU7AEYAPKpSvU9KiFKw57hqand5/08yBd0axhQgTDyvrEAqcgw
 EqjYpk0GUIr+prPwX4J/TOADyiJECGFoTGyex/mEFuwDwIEwsmtx0qMElqWzmiigaoOoDrbay9I
 nJkeDA4HBco806Z/8YunId5MOrX8OM8s+lHyD9w==
X-Google-Smtp-Source: AGHT+IH8EE9ZgF7abZFMRYaLHlSzRhoXaA3QcvI+9Cdw3xY4qjIHFp46CzKu5xZdWkZznNeknbtyDYA9Q2DqAmZd6Jg=
X-Received: by 2002:a17:90b:1a92:b0:2e2:cd22:b092 with SMTP id
 98e67ed59e1d1-2e9b171f93amr21749167a91.16.1731382008692; Mon, 11 Nov 2024
 19:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20241108085239.2927152-1-fea.wang@sifive.com>
 <20241108085239.2927152-6-fea.wang@sifive.com>
 <39b5cf42-4b35-4c69-825c-e813c55577f3@ventanamicro.com>
In-Reply-To: <39b5cf42-4b35-4c69-825c-e813c55577f3@ventanamicro.com>
From: Fea Wang <fea.wang@sifive.com>
Date: Tue, 12 Nov 2024 11:26:37 +0800
Message-ID: <CAKhCfsdnuGYaZvfRJqd7agNbdKYePQeSDrxRj0hNZ7ZO6KH-9A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] target/riscv: Expose svukte ISA extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000009967310626aec96a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=fea.wang@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000009967310626aec96a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it, thank you.

Sincerely,
Fea

On Tue, Nov 12, 2024 at 2:33=E2=80=AFAM Daniel Henrique Barboza <
dbarboza@ventanamicro.com> wrote:

>
>
> On 11/8/24 5:52 AM, Fea.Wang wrote:
> > Add "svukte" in the ISA string when svukte extension is enabled.
> >
> > Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >   target/riscv/cpu.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index f219f0c3b5..69187c9aa1 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -200,6 +200,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> >       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> >       ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
> > +    ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
>
> We need to stick with the riscv,isa order, i.e. svukte must go before
> svvptc:
>
>
> >       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> >       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> > +    ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
> >       ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
>
>
>
> Thanks,
>
> Daniel
>
>
> >       ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
> >       ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
> >       ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> > @@ -1595,6 +1596,7 @@ const RISCVCPUMultiExtConfig
> riscv_cpu_vendor_exts[] =3D {
> >
> >   /* These are experimental so mark with 'x-' */
> >   const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
> > +    MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> >
>

--0000000000009967310626aec96a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it, thank you.<div><br></div><div>Sincerely,<br>Fea</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Nov 12, 2024 at 2:33=E2=80=AFAM Daniel Henrique Barboza &lt;<a h=
ref=3D"mailto:dbarboza@ventanamicro.com">dbarboza@ventanamicro.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/8/24 5:52 AM, Fea.Wang wrote:<br>
&gt; Add &quot;svukte&quot; in the ISA string when svukte extension is enab=
led.<br>
&gt; <br>
&gt; Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" tar=
get=3D"_blank">fea.wang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.com" target=
=3D"_blank">jim.shu@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.c | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index f219f0c3b5..69187c9aa1 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -200,6 +200,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_1=
2_0, ext_svnapot),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12=
_0, ext_svpbmt),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13=
_0, ext_svvptc),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svu=
kte),<br>
<br>
We need to stick with the riscv,isa order, i.e. svukte must go before<br>
svvptc:<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_1=
2_0, ext_svnapot),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12=
_0, ext_svpbmt),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svu=
kte),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13=
_0, ext_svvptc),<br>
<br>
<br>
<br>
Thanks,<br>
<br>
Daniel<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_=
11_0, ext_xtheadba),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_=
11_0, ext_xtheadbb),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_=
11_0, ext_xtheadbs),<br>
&gt; @@ -1595,6 +1596,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_ex=
ts[] =3D {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* These are experimental so mark with &#39;x-&#39; */<br>
&gt;=C2=A0 =C2=A0const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[]=
 =3D {<br>
&gt; +=C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;x-svukte&quot;, ext_svukte, fa=
lse),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
</blockquote></div>

--0000000000009967310626aec96a--

