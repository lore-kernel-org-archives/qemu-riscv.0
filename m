Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRwfL-0000x1-Ub
	for mharc-qemu-riscv@gnu.org; Wed, 09 Mar 2022 08:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nRwfK-0000um-LU
 for qemu-riscv@nongnu.org; Wed, 09 Mar 2022 08:47:46 -0500
Received: from [2607:f8b0:4864:20::52d] (port=35639
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nRwfI-0008Go-9u
 for qemu-riscv@nongnu.org; Wed, 09 Mar 2022 08:47:46 -0500
Received: by mail-pg1-x52d.google.com with SMTP id e6so2007175pgn.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Mar 2022 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jdX7ckOXbxllGzfT3mnajSAlZxLWw67BGdsP9dKVRKo=;
 b=Q5iEkC8GHn75GrRsikyi6K18xRRKRsKRJkNyYsOzzdSxDVgOUvHjJPzRmLIn4e8O72
 2ecCI3/3Zy1tU1JGP8W1gd7AOEYtrcCxMICHAUczBFJ+r4Z8IRrBkypclco6GX9yF8fU
 Qvo61ZErJvzEtk0tJflYksV/g2YkJybN24ERkbZ7D32BIDoyAo0gL/m76qo0rt1V4xJi
 eksjS0EVs3hTmisN6JekQimkvGLZYE7RtyXzerNV5dcoyzFImhUxbaK2WUzbaIiOR39u
 jL+I0AGOPZoOFUh5QY0Yl5MpPOUCTd2p+IgKwJ6XF0wi2r+skyx9fLeMFBnB7IaCH0bT
 ZlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jdX7ckOXbxllGzfT3mnajSAlZxLWw67BGdsP9dKVRKo=;
 b=f8M1UeTOAuJkCM/AjJ/sewW/pPkETngjpEPIwPDnJWt9iEIf24Axq6mC6dh8xOfdWR
 OcGzG+Tu+gGJIFnwnmVCvCfo4R12SGQNCw1p9owKdSmky/lLyCWfGaMZRCcH3nS+4ZIo
 ghxfE/DjYKzdrMAmAYxm8o89xoCnRNibSmGlx+m9K0VI8OUMV9SnjkJRyQg6elgk/HlL
 hNXeaL8Lh9hRdric+rhDt3zoFhytgcEb4IsDbC3TmvBcM63dq1Ob+2trlhAbuJmzqNS1
 +qAJ3IQ3yK8x2hW///Z4+SLY2vhkrada6Rx9RA6Hqe8Z88sbTnUD8o578g3z/JOi7eMU
 4JRQ==
X-Gm-Message-State: AOAM531ipi+pw0Z7FqrsQjw9yg7ML7AGCQ4RwNRBIs3qysLt8t/AL6hO
 8PQjFHXlj0I5UY7FJafvjHekHJ7R89UvxdBj
X-Google-Smtp-Source: ABdhPJzKc4chZqs68MJPmpsuzgtDQAhqMZDlNcId1BquZG5enNrrWJRfPNUi6o8xPRXkXz3TNY9HEQ==
X-Received: by 2002:a05:6a00:d5b:b0:4f6:bc0b:9b35 with SMTP id
 n27-20020a056a000d5b00b004f6bc0b9b35mr23689659pfv.25.1646833662569; 
 Wed, 09 Mar 2022 05:47:42 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51]) by smtp.gmail.com with ESMTPSA id
 g13-20020a056a000b8d00b004f75395b2b4sm3240484pfj.55.2022.03.09.05.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:47:41 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id
 lj8-20020a17090b344800b001bfaa46bca3so2194897pjb.2; 
 Wed, 09 Mar 2022 05:47:41 -0800 (PST)
X-Received: by 2002:a17:902:e88d:b0:151:ba78:3bc1 with SMTP id
 w13-20020a170902e88d00b00151ba783bc1mr23006445plg.13.1646833660910; Wed, 09
 Mar 2022 05:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20220309005302.315656-1-atishp@rivosinc.com>
In-Reply-To: <20220309005302.315656-1-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 9 Mar 2022 21:47:29 +0800
X-Gmail-Original-Message-ID: <CANzO1D3aM4+fDRbr7KeQm4E=Ghe-QMh=DFZZP-MN46=rmkuqcQ@mail.gmail.com>
Message-ID: <CANzO1D3aM4+fDRbr7KeQm4E=Ghe-QMh=DFZZP-MN46=rmkuqcQ@mail.gmail.com>
Subject: Re: [PATCH v4] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000005ce06705d9c957dd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Wed, 09 Mar 2022 13:47:46 -0000

--0000000000005ce06705d9c957dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B43=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:53=E5=AF=AB=E9=81=93=EF=BC=9A

> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
>
> Generate the extended ISA string by appending  the available ISA extensio=
ns
> to the "riscv,isa" string if it is enabled so that kernel can process it.
>
> [1] https://lkml.org/lkml/2022/2/15/263
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>
> Changes from v3->v4:
> 1. Fixed the order of the extension names.
> 2. Added all the available ISA extensions in Qemu.
>
> Changes from v2->v3:
> 1. Used g_strconcat to replace snprintf & a max isa string length as
> suggested by Anup.
> 2. I have not included the Tested-by Tag from Heiko because the
> implementation changed from v2 to v3.
>
> Changes from v1->v2:
> 1. Improved the code redability by using arrays instead of individual che=
ck
> ---
>  target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ffb7..2521a6f31f9f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,12 @@
>
>  /* RISC-V CPU definitions */
>
> +/* This includes the null terminated character '\0' */
> +struct isa_ext_data {
> +        const char *name;
> +        bool enabled;
> +};
> +
>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] =3D {
> @@ -898,6 +904,42 @@ static void riscv_cpu_class_init(ObjectClass *c, voi=
d
> *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> +#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> +
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
> max_str_len)
> +{
> +    char *old =3D *isa_str;
> +    char *new =3D *isa_str;
> +    int i;
> +    struct isa_ext_data isa_edata_arr[] =3D {
> +        ISA_EDATA_ENTRY(svinval, ext_svinval),
> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> +        ISA_EDATA_ENTRY(zba, ext_zba),
> +        ISA_EDATA_ENTRY(zbb, ext_zbb),
> +        ISA_EDATA_ENTRY(zbc, ext_zbc),
> +        ISA_EDATA_ENTRY(zbs, ext_zbs),
> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> +        ISA_EDATA_ENTRY(zfh, ext_zfhmin),
> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> +    };
>

Hi Atish,

According to RISC-V Unpriviledge spec, Section 28.6:
https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L85
<https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L199>

"The first letter following the =E2=80=9CZ=E2=80=9D conventionally indicate=
s the most
closely
related alphabetical extension category, IMAFDQLCBKJTPV.
For the =E2=80=9CZam=E2=80=9D extension for misaligned atomics,
for example, the letter =E2=80=9Ca=E2=80=9D indicates the extension is rela=
ted to the =E2=80=9CA=E2=80=9D
standard extension.
If multiple =E2=80=9CZ=E2=80=9D extensions are named, they should be ordere=
d first by
category,
then alphabetically within a category=E2=80=94for example, =E2=80=9CZicsr Z=
ifencei Zam=E2=80=9D."

So I think the order of "Z" extensions should be:
zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f, zve64f, zhinx,
zhinxmin

Also, I think "Zifencei" and "Zicsr" should also be covered as well,
and all extensions should follow the order defined in Table 28.11:
https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L141

"The table also defines the canonical order in which extension names must
appear in the name string,
with top-to-bottom in table indicating first-to-last in the name string,
e.g., RV32IMACV is legal, whereas RV32IMAVC is not."

So the overall order would be:
zicsr, zifencei, zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f,
zve64f, zhinx, zhinxmin, svinval, svnapot, svpbmt,

Regards,
Frank Chang


> +
> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_edata_arr[i].enabled) {
> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +            g_free(old);
> +            old =3D new;
> +        }
> +    }
> +
> +    *isa_str =3D new;
> +}
> +
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> @@ -910,6 +952,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p =3D '\0';
> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>
> --
> 2.30.2
>
>
>

--0000000000005ce06705d9c957dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Atish Patra &lt;<a href=3D"mailto:atishp@=
rivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; =E6=96=BC 2022=
=E5=B9=B43=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:53=E5=
=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">The Linux kernel parses the ISA extensi=
ons from &quot;riscv,isa&quot; DT<br>
property. It used to parse only the single letter base extensions<br>
until now. A generic ISA extension parsing framework was proposed[1]<br>
recently that can parse multi-letter ISA extensions as well.<br>
<br>
Generate the extended ISA string by appending=C2=A0 the available ISA exten=
sions<br>
to the &quot;riscv,isa&quot; string if it is enabled so that kernel can pro=
cess it.<br>
<br>
[1] <a href=3D"https://lkml.org/lkml/2022/2/15/263" rel=3D"noreferrer" targ=
et=3D"_blank">https://lkml.org/lkml/2022/2/15/263</a><br>
<br>
Reviewed-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Suggested-by: Heiko Stubner &lt;<a href=3D"mailto:heiko@sntech.de" target=
=3D"_blank">heiko@sntech.de</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
<br>
Changes from v3-&gt;v4:<br>
1. Fixed the order of the extension names.<br>
2. Added all the available ISA extensions in Qemu.<br>
<br>
Changes from v2-&gt;v3:<br>
1. Used g_strconcat to replace snprintf &amp; a max isa string length as<br=
>
suggested by Anup.<br>
2. I have not included the Tested-by Tag from Heiko because the<br>
implementation changed from v2 to v3.<br>
<br>
Changes from v1-&gt;v2:<br>
1. Improved the code redability by using arrays instead of individual check=
<br>
---<br>
=C2=A0target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++<b=
r>
=C2=A01 file changed, 43 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index ddda4906ffb7..2521a6f31f9f 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -34,6 +34,12 @@<br>
<br>
=C2=A0/* RISC-V CPU definitions */<br>
<br>
+/* This includes the null terminated character &#39;\0&#39; */<br>
+struct isa_ext_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool enabled;<br>
+};<br>
+<br>
=C2=A0static const char riscv_exts[26] =3D &quot;IEMAFDQCLBJTPVNSUHKORWXYZG=
&quot;;<br>
<br>
=C2=A0const char * const riscv_int_regnames[] =3D {<br>
@@ -898,6 +904,42 @@ static void riscv_cpu_class_init(ObjectClass *c, void =
*data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, riscv_cpu_properties);<br>
=C2=A0}<br>
<br>
+#define ISA_EDATA_ENTRY(name, prop) {#name, cpu-&gt;cfg.prop}<br>
+<br>
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_st=
r_len)<br>
+{<br>
+=C2=A0 =C2=A0 char *old =3D *isa_str;<br>
+=C2=A0 =C2=A0 char *new =3D *isa_str;<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct isa_ext_data isa_edata_arr[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zba, ext_zba),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbb, ext_zbb),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbc, ext_zbc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbs, ext_zbs),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zdinx, ext_zdinx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfhmin),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve32f, ext_zve32f),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f),<br>
+=C2=A0 =C2=A0 };<br></blockquote><div><br></div><div>Hi Atish,</div><div><=
br></div><div>According to RISC-V Unpriviledge spec, Section 28.6:</div><di=
v><a href=3D"https://github.com/riscv/riscv-isa-manual/blob/master/src/nami=
ng.tex#L199" target=3D"_blank">https://github.com/riscv/riscv-isa-manual/bl=
ob/master/src/naming.tex#L85</a><br></div><div><br></div><div>&quot;The fir=
st letter following the =E2=80=9CZ=E2=80=9D conventionally indicates the mo=
st closely</div><div>related alphabetical
extension category, IMAFDQLCBKJTPV.</div><div>For the =E2=80=9CZam=E2=80=9D=
 extension for misaligned atomics,</div><div>for
example, the letter =E2=80=9Ca=E2=80=9D indicates the extension is related =
to the =E2=80=9CA=E2=80=9D standard extension.</div><div>If multiple =E2=80=
=9CZ=E2=80=9D extensions are named, they should be ordered first by categor=
y,</div><div>then alphabetically within a
category=E2=80=94for example, =E2=80=9CZicsr Zifencei Zam=E2=80=9D.&quot;<b=
r></div><div><br></div><div>So I think the order of &quot;Z&quot; extension=
s should be:</div><div>zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32=
f, zve64f, zhinx, zhinxmin<br></div><div><br></div><div>Also, I think &quot=
;Zifencei&quot; and &quot;Zicsr&quot; should also be covered as well,</div>=
<div>and all extensions should follow the order defined in Table 28.11:</di=
v><div><a href=3D"https://github.com/riscv/riscv-isa-manual/blob/master/src=
/naming.tex#L141" target=3D"_blank">https://github.com/riscv/riscv-isa-manu=
al/blob/master/src/naming.tex#L141</a><br></div><div><br></div><div>&quot;T=
he table also defines the canonical order in which
extension names must appear in the name string,</div><div>with top-to-botto=
m in table indicating first-to-last
in the name string,</div><div>e.g., RV32IMACV is legal, whereas RV32IMAVC i=
s not.&quot;</div><div><br></div><div>So the overall order would be:</div><=
div>zicsr, zifencei, zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f,=
 zve64f, zhinx, zhinxmin, svinval, svnapot, svpbmt,=C2=A0</div><div><br></d=
iv><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(isa_edata_arr); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D g_strconcat(old, &quot;_=
&quot;, isa_edata_arr[i].name, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(old);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old =3D new;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *isa_str =3D new;<br>
+}<br>
+<br>
=C2=A0char *riscv_isa_string(RISCVCPU *cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -910,6 +952,7 @@ char *riscv_isa_string(RISCVCPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0*p =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 riscv_isa_string_ext(cpu, &amp;isa_str, maxlen);<br>
=C2=A0 =C2=A0 =C2=A0return isa_str;<br>
=C2=A0}<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000005ce06705d9c957dd--

