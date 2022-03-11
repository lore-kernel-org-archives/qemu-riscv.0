Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSTQm-0007iK-TB
	for mharc-qemu-riscv@gnu.org; Thu, 10 Mar 2022 19:46:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nSTQj-0007hp-CY
 for qemu-riscv@nongnu.org; Thu, 10 Mar 2022 19:46:53 -0500
Received: from [2a00:1450:4864:20::62a] (port=44889
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nSTQg-0001Zl-G5
 for qemu-riscv@nongnu.org; Thu, 10 Mar 2022 19:46:52 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qt6so15778045ejb.11
 for <qemu-riscv@nongnu.org>; Thu, 10 Mar 2022 16:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChR2C10SD9fxJfcusGvvTGmu3JRxnZPf1C8418GBhw4=;
 b=kxDGuNcQe/FUzwvcW4LBeBVT3DgmozmaH7o5sud4UpVt/T/kzc6Ryd1DR9hDrlMdkT
 5ormReMHoFEpTITn6V2i/vWoZ+wkqXOW2iTA/pIPKUxY8zQJICWJkZ3JrHIitPZ+z4JJ
 mdE+lDv+x8obn1kNQ21RzhE6KKWjhMjKcLwv/MlLP7XHgujfRtJeWv0gMX/MyQFPRULb
 XmYHKXwWJha9T5iiZh1ZMGMBiww8usITBG2h5NagZu0nJ9bCi3OgF2moUwb2muAceikK
 6bcbwyQt6jEkz8Q4WFoYRo55I4P9joD65QJQH4oApiv62S775Ggec057gODla2wI6/Y2
 yeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChR2C10SD9fxJfcusGvvTGmu3JRxnZPf1C8418GBhw4=;
 b=Q1pnNfBodtpku9W0uDCjFLIxkbu/Yf3WQ6VIhWv+M+Eu0SZAi2QusmhbWg+6MdK0bm
 lx6k9Xu1d8r14RwCKTR8QDaGb0ygJ3lJJJZn5E5Fx6L3vyrCffzDk0hJIRkh9h/09n5v
 MmxvqAod2cpAuuY9xuKHvvm5IlwfzamOcMtH43QZyoL9cZ1OmoJOVR9RYmhUiX2P2Gtz
 J+fXyvMg1Al35g9NCHTppuO40n1EAW+dQn3swjGUaRWvadBRRY4tSQqtlAWwXP+luCpj
 8KkHWaClGRoMvKhtYRGULIHcV3R5XUmdWWtUXAEFtBF9dX8I6Rjmo22ZxJHaGyN7gzFY
 C7iQ==
X-Gm-Message-State: AOAM530OJ6TPX/J/A2EZ36EQr2HuYySz3FB0pV7HfODlMN6ouxw6N4yp
 36nZpzUiJUks69D2XangztpAVbuoMrx+tgR5K6ny1w==
X-Google-Smtp-Source: ABdhPJyMdRcqC6Moob3XtOo9eK6sDLHq1FVNCdM1uhdB/h+NfmGjM+P6P2xijlgKROkmllNU2smONGMKPUoHbTOkQU0=
X-Received: by 2002:a17:906:2486:b0:6cf:ced9:e4cc with SMTP id
 e6-20020a170906248600b006cfced9e4ccmr6631438ejb.201.1646959608044; Thu, 10
 Mar 2022 16:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20220309005302.315656-1-atishp@rivosinc.com>
 <CANzO1D3aM4+fDRbr7KeQm4E=Ghe-QMh=DFZZP-MN46=rmkuqcQ@mail.gmail.com>
 <CAHBxVyEmTthJdArjgdmmtyD31UWhtcXr+4zTkZ9-dZO9QXkYjQ@mail.gmail.com>
In-Reply-To: <CAHBxVyEmTthJdArjgdmmtyD31UWhtcXr+4zTkZ9-dZO9QXkYjQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 11 Mar 2022 08:46:37 +0800
Message-ID: <CAE_xrPi+n5YEhLQbe5p0epcCWsS=L6o8_MB2cArJBLJ8SEKyfQ@mail.gmail.com>
Subject: Re: [PATCH v4] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="00000000000065b23105d9e6aa34"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Fri, 11 Mar 2022 00:46:54 -0000

--00000000000065b23105d9e6aa34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2022 at 2:42 AM Atish Kumar Patra <atishp@rivosinc.com>
wrote:

> On Wed, Mar 9, 2022 at 5:47 AM Frank Chang <frank.chang@sifive.com> wrote=
:
> >
> > Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B43=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:53=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> >> property. It used to parse only the single letter base extensions
> >> until now. A generic ISA extension parsing framework was proposed[1]
> >> recently that can parse multi-letter ISA extensions as well.
> >>
> >> Generate the extended ISA string by appending  the available ISA
> extensions
> >> to the "riscv,isa" string if it is enabled so that kernel can process
> it.
> >>
> >> [1] https://lkml.org/lkml/2022/2/15/263
> >>
> >> Reviewed-by: Anup Patel <anup@brainfault.org>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> Suggested-by: Heiko Stubner <heiko@sntech.de>
> >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >> ---
> >>
> >> Changes from v3->v4:
> >> 1. Fixed the order of the extension names.
> >> 2. Added all the available ISA extensions in Qemu.
> >>
> >> Changes from v2->v3:
> >> 1. Used g_strconcat to replace snprintf & a max isa string length as
> >> suggested by Anup.
> >> 2. I have not included the Tested-by Tag from Heiko because the
> >> implementation changed from v2 to v3.
> >>
> >> Changes from v1->v2:
> >> 1. Improved the code redability by using arrays instead of individual
> check
> >> ---
> >>  target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 43 insertions(+)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index ddda4906ffb7..2521a6f31f9f 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -34,6 +34,12 @@
> >>
> >>  /* RISC-V CPU definitions */
> >>
> >> +/* This includes the null terminated character '\0' */
> >> +struct isa_ext_data {
> >> +        const char *name;
> >> +        bool enabled;
> >> +};
> >> +
> >>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
> >>
> >>  const char * const riscv_int_regnames[] =3D {
> >> @@ -898,6 +904,42 @@ static void riscv_cpu_class_init(ObjectClass *c,
> void *data)
> >>      device_class_set_props(dc, riscv_cpu_properties);
> >>  }
> >>
> >> +#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> >> +
> >> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
> max_str_len)
> >> +{
> >> +    char *old =3D *isa_str;
> >> +    char *new =3D *isa_str;
> >> +    int i;
> >> +    struct isa_ext_data isa_edata_arr[] =3D {
> >> +        ISA_EDATA_ENTRY(svinval, ext_svinval),
> >> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> >> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> >> +        ISA_EDATA_ENTRY(zba, ext_zba),
> >> +        ISA_EDATA_ENTRY(zbb, ext_zbb),
> >> +        ISA_EDATA_ENTRY(zbc, ext_zbc),
> >> +        ISA_EDATA_ENTRY(zbs, ext_zbs),
> >> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> >> +        ISA_EDATA_ENTRY(zfh, ext_zfhmin),
> >> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> >> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> >> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> >> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> >> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> >> +    };
> >
> >
> > Hi Atish,
> >
> > According to RISC-V Unpriviledge spec, Section 28.6:
> > https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L8=
5
> >
> > "The first letter following the =E2=80=9CZ=E2=80=9D conventionally indi=
cates the most
> closely
> > related alphabetical extension category, IMAFDQLCBKJTPV.
> > For the =E2=80=9CZam=E2=80=9D extension for misaligned atomics,
> > for example, the letter =E2=80=9Ca=E2=80=9D indicates the extension is =
related to the
> =E2=80=9CA=E2=80=9D standard extension.
> > If multiple =E2=80=9CZ=E2=80=9D extensions are named, they should be or=
dered first by
> category,
> > then alphabetically within a category=E2=80=94for example, =E2=80=9CZic=
sr Zifencei Zam=E2=80=9D."
> >
>
> Yes. Sorry I missed that part. Will fix it.
>
> > So I think the order of "Z" extensions should be:
> > zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f, zve64f, zhinx,
> zhinxmin
> >
> > Also, I think "Zifencei" and "Zicsr" should also be covered as well,
> > and all extensions should follow the order defined in Table 28.11:
> >
> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L141
> >
>
> I thought about that earlier as well. Zifencei & Zicsr was already
> part of the ISA and carved out as an extension later.
> Qemu/Any supervisor support that by default and won't work without
> that. We can't possibly disable those and boot anything.
>
> Do you think there is any benefit adding it ?
>

I believe Zifencei & Zicsr are mostly supported by default.
They do appear in our internal hardware-generated DTS.
So... it's fine to either add them or not.
I don't see any penalty (as well as the benefit) to add them.

Regards,
Frank Chang


>
>
> > "The table also defines the canonical order in which extension names
> must appear in the name string,
> > with top-to-bottom in table indicating first-to-last in the name string=
,
> > e.g., RV32IMACV is legal, whereas RV32IMAVC is not."
> >
> > So the overall order would be:
> > zicsr, zifencei, zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f,
> zve64f, zhinx, zhinxmin, svinval, svnapot, svpbmt,
> >
> > Regards,
> > Frank Chang
> >
> >>
> >> +
> >> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> >> +        if (isa_edata_arr[i].enabled) {
> >> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL=
);
> >> +            g_free(old);
> >> +            old =3D new;
> >> +        }
> >> +    }
> >> +
> >> +    *isa_str =3D new;
> >> +}
> >> +
> >>  char *riscv_isa_string(RISCVCPU *cpu)
> >>  {
> >>      int i;
> >> @@ -910,6 +952,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
> >>          }
> >>      }
> >>      *p =3D '\0';
> >> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
> >>      return isa_str;
> >>  }
> >>
> >> --
> >> 2.30.2
> >>
> >>
>

--00000000000065b23105d9e6aa34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 11, 2022 at 2:42 AM Atish Kum=
ar Patra &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Wed, Mar 9, 2022 at 5:47 AM Frank Chang &lt;<a hr=
ef=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" target=3D"_blan=
k">atishp@rivosinc.com</a>&gt; =E6=96=BC 2022=E5=B9=B43=E6=9C=889=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:53=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; The Linux kernel parses the ISA extensions from &quot;riscv,isa&qu=
ot; DT<br>
&gt;&gt; property. It used to parse only the single letter base extensions<=
br>
&gt;&gt; until now. A generic ISA extension parsing framework was proposed[=
1]<br>
&gt;&gt; recently that can parse multi-letter ISA extensions as well.<br>
&gt;&gt;<br>
&gt;&gt; Generate the extended ISA string by appending=C2=A0 the available =
ISA extensions<br>
&gt;&gt; to the &quot;riscv,isa&quot; string if it is enabled so that kerne=
l can process it.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://lkml.org/lkml/2022/2/15/263" rel=3D"norefer=
rer" target=3D"_blank">https://lkml.org/lkml/2022/2/15/263</a><br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org"=
 target=3D"_blank">anup@brainfault.org</a>&gt;<br>
&gt;&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.franc=
is@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt; Suggested-by: Heiko Stubner &lt;<a href=3D"mailto:heiko@sntech.de"=
 target=3D"_blank">heiko@sntech.de</a>&gt;<br>
&gt;&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.c=
om" target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Changes from v3-&gt;v4:<br>
&gt;&gt; 1. Fixed the order of the extension names.<br>
&gt;&gt; 2. Added all the available ISA extensions in Qemu.<br>
&gt;&gt;<br>
&gt;&gt; Changes from v2-&gt;v3:<br>
&gt;&gt; 1. Used g_strconcat to replace snprintf &amp; a max isa string len=
gth as<br>
&gt;&gt; suggested by Anup.<br>
&gt;&gt; 2. I have not included the Tested-by Tag from Heiko because the<br=
>
&gt;&gt; implementation changed from v2 to v3.<br>
&gt;&gt;<br>
&gt;&gt; Changes from v1-&gt;v2:<br>
&gt;&gt; 1. Improved the code redability by using arrays instead of individ=
ual check<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++++++=
+++++++<br>
&gt;&gt;=C2=A0 1 file changed, 43 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; index ddda4906ffb7..2521a6f31f9f 100644<br>
&gt;&gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; @@ -34,6 +34,12 @@<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /* RISC-V CPU definitions */<br>
&gt;&gt;<br>
&gt;&gt; +/* This includes the null terminated character &#39;\0&#39; */<br=
>
&gt;&gt; +struct isa_ext_data {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool enabled;<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 static const char riscv_exts[26] =3D &quot;IEMAFDQCLBJTPVNSU=
HKORWXYZG&quot;;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 const char * const riscv_int_regnames[] =3D {<br>
&gt;&gt; @@ -898,6 +904,42 @@ static void riscv_cpu_class_init(ObjectClass =
*c, void *data)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 device_class_set_props(dc, riscv_cpu_propertie=
s);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +#define ISA_EDATA_ENTRY(name, prop) {#name, cpu-&gt;cfg.prop}<br>
&gt;&gt; +<br>
&gt;&gt; +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, i=
nt max_str_len)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 char *old =3D *isa_str;<br>
&gt;&gt; +=C2=A0 =C2=A0 char *new =3D *isa_str;<br>
&gt;&gt; +=C2=A0 =C2=A0 int i;<br>
&gt;&gt; +=C2=A0 =C2=A0 struct isa_ext_data isa_edata_arr[] =3D {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval)=
,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot)=
,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zba, ext_zba),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbb, ext_zbb),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbc, ext_zbc),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbs, ext_zbs),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zdinx, ext_zdinx),<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfhmin),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx),<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx),<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmi=
n),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve32f, ext_zve32f),<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f),<=
br>
&gt;&gt; +=C2=A0 =C2=A0 };<br>
&gt;<br>
&gt;<br>
&gt; Hi Atish,<br>
&gt;<br>
&gt; According to RISC-V Unpriviledge spec, Section 28.6:<br>
&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/blob/master/src/n=
aming.tex#L85" rel=3D"noreferrer" target=3D"_blank">https://github.com/risc=
v/riscv-isa-manual/blob/master/src/naming.tex#L85</a><br>
&gt;<br>
&gt; &quot;The first letter following the =E2=80=9CZ=E2=80=9D conventionall=
y indicates the most closely<br>
&gt; related alphabetical extension category, IMAFDQLCBKJTPV.<br>
&gt; For the =E2=80=9CZam=E2=80=9D extension for misaligned atomics,<br>
&gt; for example, the letter =E2=80=9Ca=E2=80=9D indicates the extension is=
 related to the =E2=80=9CA=E2=80=9D standard extension.<br>
&gt; If multiple =E2=80=9CZ=E2=80=9D extensions are named, they should be o=
rdered first by category,<br>
&gt; then alphabetically within a category=E2=80=94for example, =E2=80=9CZi=
csr Zifencei Zam=E2=80=9D.&quot;<br>
&gt;<br>
<br>
Yes. Sorry I missed that part. Will fix it.<br>
<br>
&gt; So I think the order of &quot;Z&quot; extensions should be:<br>
&gt; zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f, zve64f, zhinx, =
zhinxmin<br>
&gt;<br>
&gt; Also, I think &quot;Zifencei&quot; and &quot;Zicsr&quot; should also b=
e covered as well,<br>
&gt; and all extensions should follow the order defined in Table 28.11:<br>
&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/blob/master/src/n=
aming.tex#L141" rel=3D"noreferrer" target=3D"_blank">https://github.com/ris=
cv/riscv-isa-manual/blob/master/src/naming.tex#L141</a><br>
&gt;<br>
<br>
I thought about that earlier as well. Zifencei &amp; Zicsr was already<br>
part of the ISA and carved out as an extension later.<br>
Qemu/Any supervisor support that by default and won&#39;t work without<br>
that. We can&#39;t possibly disable those and boot anything.<br>
<br>
Do you think there is any benefit adding it ?<br></blockquote><div><br></di=
v><div>I believe=C2=A0Zifencei &amp; Zicsr=C2=A0are mostly supported by def=
ault.</div><div>They do appear in our internal hardware-generated DTS.</div=
><div>So... it&#39;s fine to either add them or not.</div><div>I don&#39;t =
see any penalty (as well as the benefit) to add them.<br></div><div><br></d=
iv><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; &quot;The table also defines the canonical order in which extension na=
mes must appear in the name string,<br>
&gt; with top-to-bottom in table indicating first-to-last in the name strin=
g,<br>
&gt; e.g., RV32IMACV is legal, whereas RV32IMAVC is not.&quot;<br>
&gt;<br>
&gt; So the overall order would be:<br>
&gt; zicsr, zifencei, zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f=
, zve64f, zhinx, zhinxmin, svinval, svnapot, svpbmt,<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(isa_edata_arr); i++=
) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D g_strconcat(old=
, &quot;_&quot;, isa_edata_arr[i].name, NULL);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(old);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old =3D new;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 *isa_str =3D new;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 char *riscv_isa_string(RISCVCPU *cpu)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;&gt; @@ -910,6 +952,7 @@ char *riscv_isa_string(RISCVCPU *cpu)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *p =3D &#39;\0&#39;;<br>
&gt;&gt; +=C2=A0 =C2=A0 riscv_isa_string_ext(cpu, &amp;isa_str, maxlen);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return isa_str;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.30.2<br>
&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000065b23105d9e6aa34--

