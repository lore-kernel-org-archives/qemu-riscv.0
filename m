Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDFFC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 07:30:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLeeS-0001gx-Lz; Fri, 05 Jan 2024 02:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeeO-0001ga-Qp; Fri, 05 Jan 2024 02:29:54 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeeK-000288-S9; Fri, 05 Jan 2024 02:29:52 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-556eadd5904so1392020a12.2; 
 Thu, 04 Jan 2024 23:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704439787; x=1705044587; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tr8KEdizBu2SO8BdHZ3gIbmwLD3EFyUXXozn6S1bsKk=;
 b=fMrmd0iB+HexWaPqW2bC4+mTGluvhrtQgQ6vFE89jhD8XX0AFThyu2tNxFi5CkQmNO
 0YU5CrlwzNNRqN2oeCPuR7QTLVV3RRGHr7R9U+aKPGq07uKGa/OOVKlZxBeJ5CRq10Jw
 k+fPKGORwL4UAghqgHOYALJG3d3ZPDQD64YezlFgl4HfgtkUru/IhKf1ER3SK4Th1dvS
 XNvKZqxhZu1Q/nUTHUCpYzPqCMFpToo9NcJcDQnjhd8dyQV3c5EuU0zBy+vWFnC2otVA
 X3XA4hiAbuc6VLWxVecfa7of6l1XQqGs3hoh8g3eP+kuwTHXyeAqJ7p0RbXg0WgtZHAd
 E2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704439787; x=1705044587;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tr8KEdizBu2SO8BdHZ3gIbmwLD3EFyUXXozn6S1bsKk=;
 b=Zw0SoAIo1y6rDs82htjF4hICvNi4YlbEvS3ky6YA5WA1Jy1E5HNCWjhX3kB9lSVNC7
 3NKYXAh53Su6Hb1FDpR5trRoFhraRcU8IPtsfdZ0qUrLP3IS4uiJ5O/ypP0EpDCF5vbW
 C0YjAm/1RG95NKoaju0lpDm64E3UBFoaa9nzg+gTDTvdiP8EKv2IkVPbyVBAxF6V6vbE
 hhOF39xkHHiKOUy8bstjBqrSiIuZy6E+u4KUM4y412NAV+S0kOtL9zJtug+v0+NkJM55
 ZI4RtBmVYxWGyP5oiZkewiCNCQFCOQv0etsaX0hbVlLKBdfeYR5Hnz//eE+8t7WWGlPV
 TzTA==
X-Gm-Message-State: AOJu0YyqSN1NfwCnt1V6W/4/vbfewbWG3V+QnOpD2m25ocQblBY2rxVq
 h+zJ3OXLRKlyFNDc6zq4Ts1HI6TeLmC41bgOP1w=
X-Google-Smtp-Source: AGHT+IFwj+s289O4N6oALAtwgLAHpjYu60/Jqc0wkhHZptbjXpneuuQJttG4I+WSKWqrtZheOSRjn4raxbcX2b2ISsY=
X-Received: by 2002:a50:c091:0:b0:557:2213:bc4e with SMTP id
 k17-20020a50c091000000b005572213bc4emr139402edf.57.1704439786497; Thu, 04 Jan
 2024 23:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-6-me@deliversmonkey.space>
 <CAKC1njSMAWV_tPru_E04GfhstfPK3gjeF1PuBtx+VaQqws6uVA@mail.gmail.com>
In-Reply-To: <CAKC1njSMAWV_tPru_E04GfhstfPK3gjeF1PuBtx+VaQqws6uVA@mail.gmail.com>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Fri, 5 Jan 2024 10:29:35 +0300
Message-ID: <CAFukJ-B-TorkC4q-a1gVvyJD4w4vUF26Ph+VhPNjQJCDTuOZTw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] target/riscv: Update address modify functions to
 take into account pointer masking
To: Deepak Gupta <debug@rivosinc.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000003ec31060e2dd081"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x536.google.com
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

--00000000000003ec31060e2dd081
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> +    addr =3D addr << pmlen;
> +    if (signext) {
> +        addr =3D (target_long)addr >> pmlen;
> +    } else {
> +        addr =3D addr >> pmlen;
Could you please elaborate a bit more on your concern here?
I believe this code works as intended: https://godbolt.org/z/b9c7na13a

Thanks

=D0=BF=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 04:02, Deep=
ak Gupta <debug@rivosinc.com>:

> > --- a/target/riscv/vector_helper.c
> > +++ b/target/riscv/vector_helper.c
> > @@ -94,6 +94,18 @@ static inline uint32_t vext_max_elems(uint32_t desc,
> uint32_t log2_esz)
> >
> >  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulon=
g
> addr)
> >  {
> > +    RISCVPmPmm pmm =3D riscv_pm_get_pmm(env);
> > +    if (pmm =3D=3D PMM_FIELD_DISABLED)
> > +        return addr;
> > +    int pmlen =3D riscv_pm_get_pmlen(pmm);
> > +    bool signext =3D !riscv_cpu_bare_mode(env);
> > +    addr =3D addr << pmlen;
> > +    /* sign/zero extend masked address by N-1 bit */
> > +    if (signext) {
> > +        addr =3D (target_long)addr >> pmlen;
>
> These look like right shift operations and not sign extensions of N-1 bit
>
> > +    } else {
> > +        addr =3D addr >> pmlen;
>
> Same here.
>
> > +    }
> >      return addr;
> >  }
> >
> > --
> > 2.34.1
> >
> >
>

--00000000000003ec31060e2dd081
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(80,0,80)">&gt; +=C2=A0 =C2=
=A0 addr =3D addr &lt;&lt; pmlen;</span><br></div><div><span style=3D"color=
:rgb(80,0,80)">&gt; +=C2=A0 =C2=A0 if (signext) {</span><br style=3D"color:=
rgb(80,0,80)"><span style=3D"color:rgb(80,0,80)">&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 addr =3D (target_long)addr &gt;&gt; pmlen;</span><span style=3D"col=
or:rgb(80,0,80)"><br></span></div><div><span style=3D"color:rgb(80,0,80)">&=
gt; +=C2=A0 =C2=A0 } else {</span><br style=3D"color:rgb(80,0,80)"><span st=
yle=3D"color:rgb(80,0,80)">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D addr =
&gt;&gt; pmlen;</span><span style=3D"color:rgb(80,0,80)"><br></span></div><=
div>Could you please elaborate a bit more on your concern here?<span style=
=3D"color:rgb(80,0,80)"><br></span></div><div>I believe this code works as =
intended: <a href=3D"https://godbolt.org/z/b9c7na13a">https://godbolt.org/z=
/b9c7na13a</a></div><div><br></div><div>Thanks</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 5 =D1=8F=
=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 04:02, Deepak Gupta &lt;<a href=
=3D"mailto:debug@rivosinc.com">debug@rivosinc.com</a>&gt;:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">&gt; --- a/target/riscv/vector_h=
elper.c<br>
&gt; +++ b/target/riscv/vector_helper.c<br>
&gt; @@ -94,6 +94,18 @@ static inline uint32_t vext_max_elems(uint32_t desc=
, uint32_t log2_esz)<br>
&gt;<br>
&gt;=C2=A0 static inline target_ulong adjust_addr(CPURISCVState *env, targe=
t_ulong addr)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 RISCVPmPmm pmm =3D riscv_pm_get_pmm(env);<br>
&gt; +=C2=A0 =C2=A0 if (pmm =3D=3D PMM_FIELD_DISABLED)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return addr;<br>
&gt; +=C2=A0 =C2=A0 int pmlen =3D riscv_pm_get_pmlen(pmm);<br>
&gt; +=C2=A0 =C2=A0 bool signext =3D !riscv_cpu_bare_mode(env);<br>
&gt; +=C2=A0 =C2=A0 addr =3D addr &lt;&lt; pmlen;<br>
&gt; +=C2=A0 =C2=A0 /* sign/zero extend masked address by N-1 bit */<br>
&gt; +=C2=A0 =C2=A0 if (signext) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D (target_long)addr &gt;&gt; pmlen=
;<br>
<br>
These look like right shift operations and not sign extensions of N-1 bit<b=
r>
<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D addr &gt;&gt; pmlen;<br>
<br>
Same here.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return addr;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000003ec31060e2dd081--

