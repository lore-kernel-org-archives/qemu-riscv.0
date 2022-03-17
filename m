Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUmtE-0000jP-Ud
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 05:57:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nUmtD-0000iy-1f
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 05:57:51 -0400
Received: from [2607:f8b0:4864:20::534] (port=34428
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nUmtA-0002KZ-HR
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 05:57:50 -0400
Received: by mail-pg1-x534.google.com with SMTP id t187so2266529pgb.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Mar 2022 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bigXU4UIDhO2tR/loz255+aZBYK2dhzBkGjin5Tpwgs=;
 b=HJOThLWYmK/ighRS6/thYpA9t8L5gCkDVeM5eE/Te4KWgWNJdUb3Z6yGmk947nQQH0
 ohI0syzO2FQWU8KwQB1D0wZg2OgEnPrgOS858bwFxErHFr/bYoVKO8k+Wy73iKZus8w9
 lYgfrnFaVktFs91mhB7aOZdzsLQPnerBdaLyBc96mu/TM3HybCpJVqInujbsxxcFu3jb
 iZypXNKULGziohaiXeZMUH1DVeRb+Q/p8T0JE8lklxVDit6U+r1iwQhJecZNq+SCvtxa
 iyhziL1bWrw6uGHmKBHlEWmaNmHUY6vAyV++wisjKb4SSjPL3OoQNoHbwhvcaYwaxCWX
 G7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bigXU4UIDhO2tR/loz255+aZBYK2dhzBkGjin5Tpwgs=;
 b=VJm+53MdRWzeIyN0nil3MuZs2sCM2+SFGfJg37Bv5k/fFUMa90UCgGkSRGhzzA0BcY
 OlIffgeh6cypr//mWNVwYeiyBnSsVXN+BtxWKHwyASK8//jwhLc++7PXW/jYbGZvudBD
 D0rX52Ccwi+gVGHKwh3EzdSVgKVf8hw3sZSFlAHQvSV+g9y3Yn20hg2fVSQuOcUihqUM
 jGJpZegWe1Py5ItElHGNk8s8bChHcdSBKGh7IzOMasEDDP0Iq85K4yXrQEw7O1glnUVk
 V5cegwyoH7nYPGva50lFZeGBVlKsHvYrXiUIQ9tsVaLotaFlk2pLomYa3QebIkU85yV7
 yACQ==
X-Gm-Message-State: AOAM5318MSmbwt7EfEwwJJQvsjaKLt5QaxPyuBk/BWnk69XrAkhTSSFK
 PYJEriQAonAvm9+jj6RVL0MHSraG+S3eXrpw
X-Google-Smtp-Source: ABdhPJwMNQh4WbXLWXoOfLrsH/YQgYt7EewSq/+YYBVAbIfQ0d8+5aQSG1eZtNfAYXSFfBW8UV7JAg==
X-Received: by 2002:a05:6a00:1a88:b0:4fa:58f3:c55e with SMTP id
 e8-20020a056a001a8800b004fa58f3c55emr952585pfv.82.1647511066695; 
 Thu, 17 Mar 2022 02:57:46 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45]) by smtp.gmail.com with ESMTPSA id
 k1-20020a056a00134100b004f78df32666sm6765867pfu.198.2022.03.17.02.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 02:57:45 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so1130698pjb.5; 
 Thu, 17 Mar 2022 02:57:45 -0700 (PDT)
X-Received: by 2002:a17:902:e88d:b0:151:ba78:3bc1 with SMTP id
 w13-20020a170902e88d00b00151ba783bc1mr3879780plg.13.1647511064661; Thu, 17
 Mar 2022 02:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220316175759.821785-1-atishp@rivosinc.com>
In-Reply-To: <20220316175759.821785-1-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 17 Mar 2022 17:57:33 +0800
X-Gmail-Original-Message-ID: <CANzO1D3jsXMKQ3UUjR8p-9PxHh_YK9rtNVFcr-+S0ZGB3S26RA@mail.gmail.com>
Message-ID: <CANzO1D3jsXMKQ3UUjR8p-9PxHh_YK9rtNVFcr-+S0ZGB3S26RA@mail.gmail.com>
Subject: Re: [PATCH v6] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000c5d66705da670fb2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Thu, 17 Mar 2022 09:57:51 -0000

--000000000000c5d66705da670fb2
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 1:58 AM Atish Patra <atishp@rivosinc.com> wrote:

> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
>
> Generate the extended ISA string by appending the available ISA extensions
> to the "riscv,isa" string if it is enabled so that kernel can process it.
>
> [1] https://lkml.org/lkml/2022/2/15/263
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Changes from v5->v6:
> 1. Improved commit message.
> 2. Fixed a typo for Zfh.
>
> Changes from v4->v5:
> 1. Fixed the order of Zxx extensions.
> 2. Added a comment clearly describing the rules of extension order.
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
> 1. Improved the code redability by using arrays instead of individual check
> ---
>  target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ffb7..937ccdda997b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,11 @@
>
>  /* RISC-V CPU definitions */
>
> +struct isa_ext_data {
> +        const char *name;
> +        bool enabled;
> +};
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] = {
> @@ -898,6 +903,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void
> *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> +#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> +
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
> max_str_len)
> +{
> +    char *old = *isa_str;
> +    char *new = *isa_str;
> +    int i;
> +
> +    /**
> +     * Here are the ordering rules of extension naming defined by RISC-V
> +     * specification :
> +     * 1. All extensions should be separated from from other multi-letter
> +     *    extensions by an underscore.
> +     * 2. The first letter following the 'Z' conventionally indicates the
> most
> +     *    closely related alphabetical extension category,
> IMAFDQLCBKJTPVH.
> +     *    If multiple 'Z' extensions are named, they should be ordered
> first
> +     *    by category, then alphabetically within a category.
> +     * 3. Standard supervisor-level extensions (starts with 'S') should be
> +     *    listed after standard unprivileged extensions.  If multiple
> +     *    supervisor-level extensions are listed, they should be ordered
> +     *    alphabetically.
> +     * 4. Non-standard extensions (starts with 'X') must be listed after
> all
> +     *    standard extensions. They must be separated from other
> multi-letter
> +     *    extensions by an underscore.
> +     */
> +    struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zfh, ext_zfh),
> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> +        ISA_EDATA_ENTRY(zba, ext_zba),
> +        ISA_EDATA_ENTRY(zbb, ext_zbb),
> +        ISA_EDATA_ENTRY(zbc, ext_zbc),
> +        ISA_EDATA_ENTRY(zbs, ext_zbs),
> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> +        ISA_EDATA_ENTRY(svinval, ext_svinval),
> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> +    };
> +
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_edata_arr[i].enabled) {
> +            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +            g_free(old);
> +            old = new;
> +        }
> +    }
> +
> +    *isa_str = new;
> +}
> +
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> @@ -910,6 +969,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000c5d66705da670fb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 17, 2022 at 1:58 AM Atish Pat=
ra &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">The Linux kernel parses the ISA extensions from &quot;risc=
v,isa&quot; DT<br>
property. It used to parse only the single letter base extensions<br>
until now. A generic ISA extension parsing framework was proposed[1]<br>
recently that can parse multi-letter ISA extensions as well.<br>
<br>
Generate the extended ISA string by appending the available ISA extensions<=
br>
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
Changes from v5-&gt;v6:<br>
1. Improved commit message.<br>
2. Fixed a typo for Zfh.<br>
<br>
Changes from v4-&gt;v5:<br>
1. Fixed the order of Zxx extensions.<br>
2. Added a comment clearly describing the rules of extension order.<br>
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
=C2=A0target/riscv/cpu.c | 60 +++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 60 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index ddda4906ffb7..937ccdda997b 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -34,6 +34,11 @@<br>
<br>
=C2=A0/* RISC-V CPU definitions */<br>
<br>
+struct isa_ext_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool enabled;<br>
+};<br>
+<br>
=C2=A0static const char riscv_exts[26] =3D &quot;IEMAFDQCLBJTPVNSUHKORWXYZG=
&quot;;<br>
<br>
=C2=A0const char * const riscv_int_regnames[] =3D {<br>
@@ -898,6 +903,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void =
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
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Here are the ordering rules of extension naming defi=
ned by RISC-V<br>
+=C2=A0 =C2=A0 =C2=A0* specification :<br>
+=C2=A0 =C2=A0 =C2=A0* 1. All extensions should be separated from from othe=
r multi-letter<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 extensions by an underscore.<br>
+=C2=A0 =C2=A0 =C2=A0* 2. The first letter following the &#39;Z&#39; conven=
tionally indicates the most<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 closely related alphabetical extension =
category, IMAFDQLCBKJTPVH.<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 If multiple &#39;Z&#39; extensions are =
named, they should be ordered first<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 by category, then alphabetically within=
 a category.<br>
+=C2=A0 =C2=A0 =C2=A0* 3. Standard supervisor-level extensions (starts with=
 &#39;S&#39;) should be<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 listed after standard unprivileged exte=
nsions.=C2=A0 If multiple<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 supervisor-level extensions are listed,=
 they should be ordered<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 alphabetically.<br>
+=C2=A0 =C2=A0 =C2=A0* 4. Non-standard extensions (starts with &#39;X&#39;)=
 must be listed after all<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 standard extensions. They must be separ=
ated from other multi-letter<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 extensions by an underscore.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 struct isa_ext_data isa_edata_arr[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfh),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zdinx, ext_zdinx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zba, ext_zba),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbb, ext_zbb),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbc, ext_zbc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbs, ext_zbs),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve32f, ext_zve32f),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),<br>
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
@@ -910,6 +969,7 @@ char *riscv_isa_string(RISCVCPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0*p =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 riscv_isa_string_ext(cpu, &amp;isa_str, maxlen);<br>
=C2=A0 =C2=A0 =C2=A0return isa_str;<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;<br></div>=
</div></div>

--000000000000c5d66705da670fb2--

