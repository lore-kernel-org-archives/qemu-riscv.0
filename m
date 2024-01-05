Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70716C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 07:23:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLeYO-0007rf-Aa; Fri, 05 Jan 2024 02:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeYN-0007rP-3A; Fri, 05 Jan 2024 02:23:39 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeYL-0005XU-6m; Fri, 05 Jan 2024 02:23:38 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e7c6e3c63so1396233e87.3; 
 Thu, 04 Jan 2024 23:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704439415; x=1705044215; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RO36d7cgVQrY2ajPgN647GkcXdV8QMKeXYAu4h1+O8Y=;
 b=bg14x0RrnUegXgHPHH0m0BzWjfY45C8yxOVPLwVBxcEqSyLo1jytnP3nfs1VThooL6
 hwrjx+TV+/g7m7h8tk96D1W5FTJFRVBcljLAyqyCwwCvOZ9Dk0ZNI3c46JzljOdEEM21
 0jJcZxUNO5BOV0LgECOZhfV7rVC8ZJj/rvEOPcXz9SGwAZ8V/evYPhSx37q+/OSHNjw8
 RrhstsX7FF6BTPSGlHvxdVYmw6+CatEYz9zQoyzzsrZZsp1+o7TL7P7ILL/Z7r0rkUBC
 XvbSlRGZfJZflC3U3OdAgrNTWEHvGftYElzmMnNM++ABVdQRHfdCLAvThYu/wQCTRKWS
 mvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704439415; x=1705044215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RO36d7cgVQrY2ajPgN647GkcXdV8QMKeXYAu4h1+O8Y=;
 b=fXdQAEj56wNoeYuuE1U7Qfy/aQclUvOohhyX/KUPyVsJAFvE52bW+fMG4PCdxDzusG
 2sE7wgclZZipUlzSIUA8agPW7xf0nM6f0GqMLcV4aB/pPDSgCGLQiGrxyNzLcRE7123U
 h6KKzOkQkLaCl1ni+musozCwRIJ7MV0I8Rq0wElp+qZcg/ii8IeNfZ4fX8hTYaPKMHFr
 B/kB8qiLLE94Tg/xGqZtZqwIdpNWgMMDUwDBt+YFGp/xcVSnFAlGbgf6TuhYLj9mzYw+
 qEKkPKbjLfKhAxOsR65x0TFouwKeQ77Dm3aq5K2vv3G1jxOAW09zR+9F16Orwb/M4cLS
 ShPQ==
X-Gm-Message-State: AOJu0Yw5iI6+xuUWAeufYX7AToyk35JIuQ0FGgqkWiy00LrKqIUkzpJR
 T+Om5OPHULhf4blSAiMXo2NImQuPUtdo6x1i360=
X-Google-Smtp-Source: AGHT+IEvPM41qLQ0Z6+kIg5OZJTrbGMOtGLn9z+r2gypWwqhaBya58BB2IEirCDsLg9s/3KbNpzff3r5II+eXV64i+4=
X-Received: by 2002:a05:6512:3995:b0:50e:4fcb:dc28 with SMTP id
 j21-20020a056512399500b0050e4fcbdc28mr522332lfu.35.1704439414445; Thu, 04 Jan
 2024 23:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-7-me@deliversmonkey.space>
 <CAKmqyKMbYg2baDXRfzLCMajGJ-DL9Kjm2sot2wD8rNHERbNSJQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMbYg2baDXRfzLCMajGJ-DL9Kjm2sot2wD8rNHERbNSJQ@mail.gmail.com>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Fri, 5 Jan 2024 10:23:23 +0300
Message-ID: <CAFukJ-A4mO=4XPpwyYHadBXcosaSMCoDSjiOR0_Pj0+nRWM6eg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
To: Alistair Francis <alistair23@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d6db41060e2db9c6"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000d6db41060e2db9c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I might be wrong here, but right now J in MISA is unused.
I think the J-letter extension is still a thing, but current extensions
like Zjpm and Zjid follow the Z ext scheme.
Do you think it should be removed?


=D0=BF=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 08:28, Alis=
tair Francis <alistair23@gmail.com>:

> On Thu, Jan 4, 2024 at 4:58=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail=
.com>
> wrote:
> >
> > From: Alexey Baturo <baturo.alexey@gmail.com>
> >
> > Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> > ---
> >  target/riscv/cpu.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 1e6571ce99..13389ddc55 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -153,6 +153,9 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> >      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> >      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> > +    ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_12_0, ext_ssnpm),
> > +    ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_12_0, ext_smnpm),
> > +    ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_12_0, ext_smmpm),
> >      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
> >      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
> >      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> > @@ -1337,6 +1340,11 @@ const RISCVCPUMultiExtConfig
> riscv_cpu_extensions[] =3D {
> >
> >      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
> >
> > +    /* Zjpm v0.8 extensions */
> > +    MULTI_EXT_CFG_BOOL("ssnpm", ext_ssnpm, false),
> > +    MULTI_EXT_CFG_BOOL("smnpm", ext_smnpm, false),
> > +    MULTI_EXT_CFG_BOOL("smmpm", ext_smmpm, false),
>
> What happens to the existing J property?
>
>
> Alistair
>
> > +
> >      MULTI_EXT_CFG_BOOL("zca", ext_zca, false),
> >      MULTI_EXT_CFG_BOOL("zcb", ext_zcb, false),
> >      MULTI_EXT_CFG_BOOL("zcd", ext_zcd, false),
> > --
> > 2.34.1
> >
> >
>

--000000000000d6db41060e2db9c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I might be wrong here, but right now J in MISA is unused.<=
div>I think the J-letter extension is still a thing, but current extensions=
 like Zjpm and Zjid follow the Z ext scheme.</div><div>Do you think it shou=
ld be removed?<br><div><br></div></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 5 =D1=8F=D0=BD=D0=B2. =
2024=E2=80=AF=D0=B3. =D0=B2 08:28, Alistair Francis &lt;<a href=3D"mailto:a=
listair23@gmail.com">alistair23@gmail.com</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, Jan 4, 2024 at 4:58=E2=80=AFAM A=
lexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail.com" target=3D"_blan=
k">baturo.alexey@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail.com" tar=
get=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail=
.com" target=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 1e6571ce99..13389ddc55 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -153,6 +153,9 @@ const RISCVIsaExtData isa_edata_arr[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, e=
xt_svinval),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, e=
xt_svnapot),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ex=
t_svpbmt),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_12_0, ext_ssnp=
m),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_12_0, ext_smnp=
m),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_12_0, ext_smmp=
m),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, =
ext_xtheadba),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, =
ext_xtheadbb),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, =
ext_xtheadbs),<br>
&gt; @@ -1337,6 +1340,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensio=
ns[] =3D {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;zmmul&quot;, ext_zmmul, f=
alse),<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 /* Zjpm v0.8 extensions */<br>
&gt; +=C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;ssnpm&quot;, ext_ssnpm, false)=
,<br>
&gt; +=C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;smnpm&quot;, ext_smnpm, false)=
,<br>
&gt; +=C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;smmpm&quot;, ext_smmpm, false)=
,<br>
<br>
What happens to the existing J property?<br>
<br>
<br>
Alistair<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;zca&quot;, ext_zca, false=
),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;zcb&quot;, ext_zcb, false=
),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MULTI_EXT_CFG_BOOL(&quot;zcd&quot;, ext_zcd, false=
),<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000d6db41060e2db9c6--

