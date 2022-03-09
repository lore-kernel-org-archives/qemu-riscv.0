Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRx0Z-00062n-0d
	for mharc-qemu-riscv@gnu.org; Wed, 09 Mar 2022 09:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nRx0X-00062V-Ow
 for qemu-riscv@nongnu.org; Wed, 09 Mar 2022 09:09:41 -0500
Received: from [2607:f8b0:4864:20::1032] (port=45867
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nRx0V-0003Ix-CP
 for qemu-riscv@nongnu.org; Wed, 09 Mar 2022 09:09:40 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so2390791pjl.4
 for <qemu-riscv@nongnu.org>; Wed, 09 Mar 2022 06:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ocRY2demCAzQIVm6LYEDtNvfSYvn1oxaKSen0amIgyI=;
 b=D4gU2p96yYW/4rXgtdbmNCsp4ZDgOF81vmUYfWKM/6wtp80NC9qYFJKcuQJB3pT65f
 rcJht8axd7AwUzWjUKQO8FI1DpzNCI8QkjnsZ7zmIA+gfohFBmzqO1VB8M/bagfsCgoG
 ZAV5zgmQZIjCdLuGv2JYOmm/YvFhsXgxqRt1LuuYpUmvh6kpnJsPddq7iaR2K1sLMP62
 dIMODmH36mE/EmkrPplPobFXxrgE/tekxmm32FIijruvN6iPukl4Sa+30zrYxVxZn35T
 /piwJDi289Q/l50zmcGqI+CIGJfFs54iZJ2OlqRBGLengCqE5tImznQEhQNcDFRREYsi
 y2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ocRY2demCAzQIVm6LYEDtNvfSYvn1oxaKSen0amIgyI=;
 b=JVE9rv/rOI1dBdcky+fc77J1JchnVuJbnfD3sPep9k+9jnRn0Ve92nStwepV+KYjBy
 vCHi36w+cJw2Z3fQiqTwDIqt8kvjcfP14P0UM/E2bCJlo8lroPVOV0lTxvm64PtSGby5
 6gZtKAliaxM0eNZ/w171Zzqbk1hjZwt888SXBMGsz3uGU2S98Y9f+22ru84E7VkJ4RAa
 ejCdSHXP+rghlWxKkioRrxatnQVSaWVo2gFhkkTEpqG76XLqm2j1QRfekHVn2+3XOBo7
 Q0n+pFLVwR8WwwuStrikaJ5attja8k+WlnysbAI9Y8mPqxv9klWGMWPpjWnBrp+oT95+
 6kYg==
X-Gm-Message-State: AOAM5329Nn1sJ9k2a8IcANoxP/BRQXTyATKXBEt5+JUrxlzataTfwuDa
 YL2da7xn4VmUMl+NvdGs1GDyq0oPsJ/KZxO8
X-Google-Smtp-Source: ABdhPJys3ehxINisTZ3IwNNFGaLD3ffaXNT5jdlTXVkOw5xelJdyVdFG2xXnOarRu9v/UKKSI+sw7Q==
X-Received: by 2002:a17:90b:1bc3:b0:1bf:7461:7838 with SMTP id
 oa3-20020a17090b1bc300b001bf74617838mr10538899pjb.3.1646834977541; 
 Wed, 09 Mar 2022 06:09:37 -0800 (PST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com.
 [209.85.214.176]) by smtp.gmail.com with ESMTPSA id
 y2-20020a17090a474200b001bf65332d29sm2769025pjg.48.2022.03.09.06.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 06:09:36 -0800 (PST)
Received: by mail-pl1-f176.google.com with SMTP id t19so2038906plr.5;
 Wed, 09 Mar 2022 06:09:36 -0800 (PST)
X-Received: by 2002:a17:90b:4c07:b0:1bf:bb9c:dfeb with SMTP id
 na7-20020a17090b4c0700b001bfbb9cdfebmr1515821pjb.4.1646834976016; Wed, 09 Mar
 2022 06:09:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644664443.git.research_trasio@irq.a4lg.com>
 <66cd3545068a8ab9d67bd4bd1f9a68a2c50cbdab.1644664443.git.research_trasio@irq.a4lg.com>
In-Reply-To: <66cd3545068a8ab9d67bd4bd1f9a68a2c50cbdab.1644664443.git.research_trasio@irq.a4lg.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 9 Mar 2022 22:09:24 +0800
X-Gmail-Original-Message-ID: <CANzO1D1D_M2Qom+pK+NY3c2Bw+hUK1jvMLZMfrFMNHd56nCOFw@mail.gmail.com>
Message-ID: <CANzO1D1D_M2Qom+pK+NY3c2Bw+hUK1jvMLZMfrFMNHd56nCOFw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: misa to ISA string conversion fix
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Emmanuel Blot <emmanuel.blot@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000bfd12b05d9c9a54e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 09 Mar 2022 14:09:42 -0000

--000000000000bfd12b05d9c9a54e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tsukasa OI <research_trasio@irq.a4lg.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=88=
12=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:55=E5=AF=AB=E9=81=93=EF=
=BC=9A

> Some bits in RISC-V `misa' CSR should not be reflected in the ISA
> string.  For instance, `S' and `U' (represents existence of supervisor
> and user mode, respectively) in `misa' CSR must not be copied since
> neither `S' nor `U' are valid single-letter extensions.
>
> This commit restricts which bits to copy from `misa' CSR to ISA string
> with another fix: `C' extension should be preceded by `L' extension.
>
> It also clarifies that RISC-V extension order string is actually a
> single-letter extension order list.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  target/riscv/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1cb0436187..7a8d6ce104 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,7 +34,7 @@
>
>  /* RISC-V CPU definitions */
>
> -static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
> +static const char riscv_single_letter_exts[] =3D "IEMAFDQLCBJTPVNH";
>
>  const char * const riscv_int_regnames[] =3D {
>    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
> @@ -831,12 +831,12 @@ static void riscv_cpu_class_init(ObjectClass *c,
> void *data)
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> -    const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_exts) + 1;
> +    const size_t maxlen =3D sizeof("rv128") +
> sizeof(riscv_single_letter_exts);
>      char *isa_str =3D g_new(char, maxlen);
>      char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d",
> TARGET_LONG_BITS);
> -    for (i =3D 0; i < sizeof(riscv_exts); i++) {
> -        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
> -            *p++ =3D qemu_tolower(riscv_exts[i]);
> +    for (i =3D 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
> +        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> +            *p++ =3D qemu_tolower(riscv_single_letter_exts[i]);
>          }
>      }
>      *p =3D '\0';
> --
> 2.32.0
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

BTW, could you please send this patchset again to both
qemu-devel@nongnu.org and qemu-riscv@nongnu.org
just like what Atish suggested?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg874776.html

--000000000000bfd12b05d9c9a54e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Tsukasa OI &lt;<a href=3D"mailto:research=
_trasio@irq.a4lg.com">research_trasio@irq.a4lg.com</a>&gt; =E6=96=BC 2022=
=E5=B9=B42=E6=9C=8812=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:55=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Some bits in RISC-V `misa&#39; CSR s=
hould not be reflected in the ISA<br>
string.=C2=A0 For instance, `S&#39; and `U&#39; (represents existence of su=
pervisor<br>
and user mode, respectively) in `misa&#39; CSR must not be copied since<br>
neither `S&#39; nor `U&#39; are valid single-letter extensions.<br>
<br>
This commit restricts which bits to copy from `misa&#39; CSR to ISA string<=
br>
with another fix: `C&#39; extension should be preceded by `L&#39; extension=
.<br>
<br>
It also clarifies that RISC-V extension order string is actually a<br>
single-letter extension order list.<br>
<br>
Signed-off-by: Tsukasa OI &lt;<a href=3D"mailto:research_trasio@irq.a4lg.co=
m" target=3D"_blank">research_trasio@irq.a4lg.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 1cb0436187..7a8d6ce104 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -34,7 +34,7 @@<br>
<br>
=C2=A0/* RISC-V CPU definitions */<br>
<br>
-static const char riscv_exts[26] =3D &quot;IEMAFDQCLBJTPVNSUHKORWXYZG&quot=
;;<br>
+static const char riscv_single_letter_exts[] =3D &quot;IEMAFDQLCBJTPVNH&qu=
ot;;<br>
<br>
=C2=A0const char * const riscv_int_regnames[] =3D {<br>
=C2=A0 =C2=A0&quot;x0/zero&quot;, &quot;x1/ra&quot;,=C2=A0 &quot;x2/sp&quot=
;,=C2=A0 &quot;x3/gp&quot;,=C2=A0 &quot;x4/tp&quot;,=C2=A0 &quot;x5/t0&quot=
;,=C2=A0 =C2=A0&quot;x6/t1&quot;,<br>
@@ -831,12 +831,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)<br>
=C2=A0char *riscv_isa_string(RISCVCPU *cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 const size_t maxlen =3D sizeof(&quot;rv128&quot;) + sizeof(r=
iscv_exts) + 1;<br>
+=C2=A0 =C2=A0 const size_t maxlen =3D sizeof(&quot;rv128&quot;) + sizeof(r=
iscv_single_letter_exts);<br>
=C2=A0 =C2=A0 =C2=A0char *isa_str =3D g_new(char, maxlen);<br>
=C2=A0 =C2=A0 =C2=A0char *p =3D isa_str + snprintf(isa_str, maxlen, &quot;r=
v%d&quot;, TARGET_LONG_BITS);<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; sizeof(riscv_exts); i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;env.misa_ext &amp; RV(riscv_exts[i=
])) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p++ =3D qemu_tolower(riscv_exts=
[i]);<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; sizeof(riscv_single_letter_exts) - 1; i=
++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;env.misa_ext &amp; RV(riscv_single=
_letter_exts[i])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p++ =3D qemu_tolower(riscv_sing=
le_letter_exts[i]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0*p =3D &#39;\0&#39;;<br>
-- <br>
2.32.0<br><br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt=
;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;</=
div><div><br></div><div>BTW, could you please send this patchset again to b=
oth</div><div><a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.or=
g</a> and=C2=A0<a href=3D"mailto:qemu-riscv@nongnu.org">qemu-riscv@nongnu.o=
rg</a></div><div>just like what Atish suggested?</div><div><a href=3D"https=
://www.mail-archive.com/qemu-devel@nongnu.org/msg874776.html">https://www.m=
ail-archive.com/qemu-devel@nongnu.org/msg874776.html</a></div></div></div>

--000000000000bfd12b05d9c9a54e--

