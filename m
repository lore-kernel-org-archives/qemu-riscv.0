Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nNrm5-0007ST-Rh
	for mharc-qemu-riscv@gnu.org; Sat, 26 Feb 2022 02:45:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nNrm1-0007Or-Tg
 for qemu-riscv@nongnu.org; Sat, 26 Feb 2022 02:45:49 -0500
Received: from [2607:f8b0:4864:20::631] (port=42781
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nNrlz-0000Us-CS
 for qemu-riscv@nongnu.org; Sat, 26 Feb 2022 02:45:48 -0500
Received: by mail-pl1-x631.google.com with SMTP id p17so6609494plo.9
 for <qemu-riscv@nongnu.org>; Fri, 25 Feb 2022 23:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlOMpwar8H3IaqpUsxB8sOF+rxb+lUqLquixj1IQ8rg=;
 b=Xv5VtPFW3rIy4buy/8f6hLXNkOf1dmkmuXMudqm3wD7fgOcQw7HxyAKJFuQm9RrJY+
 BlpSQlFBKhPX06uSBjMr2MDOgRMmJXI5hU3CevE1xLdQCDiTDC255wjEsszwai+L0/XI
 +af/n6IvqBByvsw9ioYu58mqzvQwFvS8LK6mwZZ6qatW7qKo1LvQxFEveNtiakQMNHKA
 ZHZ/TPxCV0ZFR6pFn8Blt1/5bLuBkXVa9hD3dtmS20JXQIgUL0bylaTwxeHcBTGiXHlU
 2PalDoreXk8/ewHHEKNysJ6q9ZDg0SMNy0FFmk25YdcdkRHOPTZVNShjqYjSzMFuK7Cg
 fmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlOMpwar8H3IaqpUsxB8sOF+rxb+lUqLquixj1IQ8rg=;
 b=Iz36cbCBsiBBWxYnQ1jNOq8os7rK21t2jXYuUMBYTMa6GFx1Ni4SlesEppwc5EqQF5
 w96SgddAF+bOdV/MeIj37MZNT7hwxe2Ec96CUxF/JPqkUoHvQwtfCGdGrL+AxpLAB/sr
 ndPQBX1E3OpO+Q/7lkxUIHai+vSI7X6qsEJB+wNJQAj8jFoJviGNl4sSR+WXLBGeoNed
 XNNnRODyR1hoBwZIkEPIn4IwJO3Ks2T9+ibdPh7HpPVCuhzXKPYA20t5u2aL6yPFF0jw
 hYfgmM7+nhiCFVYi59uR2PG8TrC7qALaETqI3a3mZGEyxPI79FBTWJtkUC5pTjnzVKII
 MS1Q==
X-Gm-Message-State: AOAM530/4fvsSyqqrPFPbObsqao4KD9V6d79yhRyesfjLQEXqnlU9R7k
 1jdCSHwtx3DEuw74Y4LGDxDDy3VYRmiY6w==
X-Google-Smtp-Source: ABdhPJzrmTYLO/l8CAU1zM+HEMyoOClLG6CpMFItLGg4JH2SFdgqZSLyRf7QBx8b39/nQtW2QKkCOA==
X-Received: by 2002:a17:902:7483:b0:14f:9a94:8493 with SMTP id
 h3-20020a170902748300b0014f9a948493mr11306015pll.4.1645861545456; 
 Fri, 25 Feb 2022 23:45:45 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50]) by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a9bc400b001bc2e7e51f3sm4793987pjw.21.2022.02.25.23.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 23:45:44 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so10357984pjb.5; 
 Fri, 25 Feb 2022 23:45:43 -0800 (PST)
X-Received: by 2002:a17:903:1cc:b0:151:3e13:e2a1 with SMTP id
 e12-20020a17090301cc00b001513e13e2a1mr4495703plh.52.1645861542856; Fri, 25
 Feb 2022 23:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
In-Reply-To: <20220222223830.2319856-1-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 26 Feb 2022 15:45:31 +0800
X-Gmail-Original-Message-ID: <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
Message-ID: <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000009c8d4905d8e7008e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sat, 26 Feb 2022 07:45:50 -0000

--0000000000009c8d4905d8e7008e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=9A

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
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
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
>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b0a40b83e7a8..2c7ff6ef555a 100644
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
> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, voi=
d
> *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
> max_str_len)
> +{
> +    char *old =3D *isa_str;
> +    char *new =3D *isa_str;
> +    int i;
> +    struct isa_ext_data isa_edata_arr[] =3D {
> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> +        { "svinval", cpu->cfg.ext_svinval },
> +        { "svnapot", cpu->cfg.ext_svnapot },
>

We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs... etc.
Do you mind adding them as well?

Also, I think the order of ISA strings should be alphabetical as described:
https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96

Regards,
Frank Chang


> +    };
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
> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
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

--0000000000009c8d4905d8e7008e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Atish Patra &lt;<a href=3D"mailto:ati=
shp@rivosinc.com">atishp@rivosinc.com</a>&gt; =E6=96=BC 2022=E5=B9=B42=E6=
=9C=8823=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
 Linux kernel parses the ISA extensions from &quot;riscv,isa&quot; DT<br>
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
Suggested-by: Heiko Stubner &lt;<a href=3D"mailto:heiko@sntech.de" target=
=3D"_blank">heiko@sntech.de</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
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
=C2=A0target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 29 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index b0a40b83e7a8..2c7ff6ef555a 100644<br>
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
@@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, void =
*data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, riscv_cpu_properties);<br>
=C2=A0}<br>
<br>
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_st=
r_len)<br>
+{<br>
+=C2=A0 =C2=A0 char *old =3D *isa_str;<br>
+=C2=A0 =C2=A0 char *new =3D *isa_str;<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct isa_ext_data isa_edata_arr[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svpbmt&quot;, cpu-&gt;cfg.ext_svpbmt=
=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svinval&quot;, cpu-&gt;cfg.ext_svinval=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svnapot&quot;, cpu-&gt;cfg.ext_svnapot=
 },<br></blockquote><div><br></div><div>We still have other sub-extensions,=
 e.g. Zfh, Zba, Zbb, Zbc, Zbs... etc.</div><div>Do you mind adding them as =
well?</div><div><br></div><div>Also, I think the order of ISA strings shoul=
d be alphabetical as described:</div><div><a href=3D"https://github.com/ris=
cv/riscv-isa-manual/blob/master/src/naming.tex#L96">https://github.com/risc=
v/riscv-isa-manual/blob/master/src/naming.tex#L96</a><br></div><div><br></d=
iv><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 };<br>
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
@@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0*p =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 riscv_isa_string_ext(cpu, &amp;isa_str, maxlen);<br>
=C2=A0 =C2=A0 =C2=A0return isa_str;<br>
=C2=A0}<br>
<br>
-- <br>
2.30.2<br>
<br></blockquote></div></div>

--0000000000009c8d4905d8e7008e--

