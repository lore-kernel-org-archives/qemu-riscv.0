Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV8Ya-00021v-Qv
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 05:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pV8YV-00021L-Qk
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 05:10:27 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pV8YR-0005TV-KU
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 05:10:27 -0500
Received: by mail-lf1-x135.google.com with SMTP id s22so13056261lfi.9
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 02:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zLy8+Gzb9ExOnatS0PZ2N/i+0/tAZOgnkK169b8Y7Sk=;
 b=S524msp/M/kr1i3M2f3Y2Gna7r0brCiASpb6oM7dfcuGVrwuMZ+vGvLS5IsZ2cQIyA
 +d4nE90q0Jku2X2bNSoni7xkbnoMdgjaxYSeTw4Hx7rLZBd15ApSB09kbzvO2Dj1r4mt
 uVe8x2QkSGVRU84/4k/6oq9c2BKZ0ZOrEVvNWi61WmzL5h7TpXqgvE80GccT0+SSPHc8
 s4ljFEJRioDSAU/M8bMoBniyc02eztjNWVCaAnVn0fNkuVXVVN0fMm2W35wd8JtMGqVh
 f4T441WWpmx15C+JIY6SWTHlyA0kr8knhY4iySCXBeQIB3LxpqRyTJOUyuPFLDZoF4Za
 k6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zLy8+Gzb9ExOnatS0PZ2N/i+0/tAZOgnkK169b8Y7Sk=;
 b=yjiE6f1XJcD41DBij6PUieqKda4oesTQ4NdzlfWQc3gfJKtza9XcMyswRGpdaT/3eG
 8QUVqle9+GadJsOZ4SvkN1UhDmnE7/i+c+HaMpCUt8405pfniveRoVJcfcnkpaS9vsC9
 QUlmujU23DuEnHluRIoJn2N7h0H1B8Fxcgu6+QLLm5Xr/d1byj/9LxkCOJLxlDpQ+cws
 9aFgQAQpK3VL8V4ymW7mt7HsPkevBKKTy+qdePfI7f4+C2TcQUxS4gK+R+LHTzaursFS
 /noEC+2TN0TVkJ+LzzU/4PAx6jKUI0eXG3+0lFxZcI2AywfrqPhtfegbbEIe0M23Z2NA
 dAIg==
X-Gm-Message-State: AO0yUKUPAZ9o3drY0UE/nr/AlFB29k37zxbgfB9K84nF1FzuKXdjHjvI
 yaEJh2UT79XV1iIn/Le24Qx8pEOC2qRphFBY0YluMF37LIiHDK2lvquXRFmuPBrQ2HFUy+AgX5z
 +Qk5XdvMMN1+yDeGoauOE456k7zXxBpM0w4ExZPOHeNRY3x6aDrRX5W5fdmlEmEZtZhH7FPba+4
 oZ2g==
X-Google-Smtp-Source: AK7set/JIonbnnuBU880JYwnq1nJ5uOOkXJ5NBpWv+yMhDH+FzvsbFtyI6Fku8PjBpHMB5inN68KcA==
X-Received: by 2002:ac2:532f:0:b0:4d1:331:f6e9 with SMTP id
 f15-20020ac2532f000000b004d10331f6e9mr3616771lfh.48.1677147021333; 
 Thu, 23 Feb 2023 02:10:21 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 l26-20020ac2555a000000b004cb45148027sm1269021lfk.203.2023.02.23.02.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:10:20 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id y14so3190093ljq.4;
 Thu, 23 Feb 2023 02:10:20 -0800 (PST)
X-Received: by 2002:a2e:a497:0:b0:295:945d:b381 with SMTP id
 h23-20020a2ea497000000b00295945db381mr2051354lji.7.1677147020141; Thu, 23 Feb
 2023 02:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20230221091009.36545-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230221091009.36545-1-liweiwei@iscas.ac.cn>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 23 Feb 2023 18:10:08 +0800
X-Gmail-Original-Message-ID: <CANzO1D14pHkKpjk5XHgrxhiZzp8uowWkfq_3LP1mcg4MGOProA@mail.gmail.com>
Message-ID: <CANzO1D14pHkKpjk5XHgrxhiZzp8uowWkfq_3LP1mcg4MGOProA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add support for Zicond extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: multipart/alternative; boundary="0000000000005f2ac105f55b3873"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Feb 2023 10:10:28 -0000

--0000000000005f2ac105f55b3873
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Tue, Feb 21, 2023 at 5:10 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

> The spec can be found in https://github.com/riscv/riscv-zicond.
> Two instructions are added:
>  - czero.eqz: Moves zero to a register rd, if the condition rs2 is
>    equal to zero, otherwise moves rs1 to rd.
>  - czero.nez: Moves zero to a register rd, if the condition rs2 is
>    nonzero, otherwise moves rs1 to rd.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c                           |  2 +
>  target/riscv/cpu.h                           |  1 +
>  target/riscv/insn32.decode                   |  4 ++
>  target/riscv/insn_trans/trans_rvzicond.c.inc | 49 ++++++++++++++++++++
>  target/riscv/translate.c                     |  1 +
>  5 files changed, 57 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dd2f0c753..80b92930ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -74,6 +74,7 @@ struct isa_ext_data {
>  static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>      ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0,
> ext_zihintpause),
> @@ -1143,6 +1144,7 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU,
> cfg.ext_XVentanaCondOps, false),
>
>      /* These are experimental so mark with 'x-' */
> +    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..81b7c92e7a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -447,6 +447,7 @@ struct RISCVCPUConfig {
>      bool ext_zkt;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_zicond;
>      bool ext_zihintpause;
>      bool ext_smstateen;
>      bool ext_sstc;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index b7e7613ea2..fb537e922e 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
>  # *** RV32 Zksed Standard Extension ***
>  sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
>  sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
> +
> +# *** RV32 Zicond Standard Extension ***
> +czero_eqz   0000111  ..... ..... 101 ..... 0110011 @r
> +czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc
> b/target/riscv/insn_trans/trans_rvzicond.c.inc
> new file mode 100644
> index 0000000000..645260164e
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
> @@ -0,0 +1,49 @@
> +/*
> + * RISC-V translation routines for the Zicond Standard Extension.
> + *
> + * Copyright (c) 2020-2023 PLCT Lab
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZICOND(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_zicond) {      \
> +        return false;                     \
> +    }                                     \
> +} while (0)
> +
> +static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx->zero, ctx->zero,
> src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_czero_nez(DisasContext *ctx, arg_czero_nez *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, ctx->zero, ctx->zero,
> src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 772f9d7973..6e65c6afca 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1103,6 +1103,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,
> target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzicond.c.inc"
>  #include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
> --
> 2.25.1
>
>
>

--0000000000005f2ac105f55b3873
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 5:10 PM =
Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
he spec can be found in <a href=3D"https://github.com/riscv/riscv-zicond" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/riscv/riscv-zicond</=
a>.<br>
Two instructions are added:<br>
=C2=A0- czero.eqz: Moves zero to a register rd, if the condition rs2 is<br>
=C2=A0 =C2=A0equal to zero, otherwise moves rs1 to rd.<br>
=C2=A0- czero.nez: Moves zero to a register rd, if the condition rs2 is<br>
=C2=A0 =C2=A0nonzero, otherwise moves rs1 to rd.<br>
<br>
Signed-off-by: Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" target=
=3D"_blank">liweiwei@iscas.ac.cn</a>&gt;<br>
Signed-off-by: Junqiang Wang &lt;<a href=3D"mailto:wangjunqiang@iscas.ac.cn=
" target=3D"_blank">wangjunqiang@iscas.ac.cn</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
=C2=A0target/riscv/insn_trans/trans_rvzicond.c.inc | 49 +++++++++++++++++++=
+<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A05 files changed, 57 insertions(+)<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 0dd2f0c753..80b92930ae 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -74,6 +74,7 @@ struct isa_ext_data {<br>
=C2=A0static const struct isa_ext_data isa_edata_arr[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h=
),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v=
),<br>
+=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zi=
cond),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ex=
t_icsr),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0,=
 ext_ifencei),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10=
_0, ext_zihintpause),<br>
@@ -1143,6 +1144,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;xventanacondops&quot;, RISCVCPU,=
 cfg.ext_XVentanaCondOps, false),<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* These are experimental so mark with &#39;x-&#39; */<=
br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;x-zicond&quot;, RISCVCPU, cfg.ext_zic=
ond, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-j&quot;, RISCVCPU, cfg.ext_j, =
false),<br>
=C2=A0 =C2=A0 =C2=A0/* ePMP 0.9.3 */<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-epmp&quot;, RISCVCPU, cfg.epmp=
, false),<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 7128438d8e..81b7c92e7a 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -447,6 +447,7 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zkt;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_ifencei;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_icsr;<br>
+=C2=A0 =C2=A0 bool ext_zicond;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zihintpause;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_smstateen;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_sstc;<br>
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<br>
index b7e7613ea2..fb537e922e 100644<br>
--- a/target/riscv/insn32.decode<br>
+++ b/target/riscv/insn32.decode<br>
@@ -890,3 +890,7 @@ sm3p1=C2=A0 =C2=A0 =C2=A0 =C2=A000 01000 01001 ..... 00=
1 ..... 0010011 @r2<br>
=C2=A0# *** RV32 Zksed Standard Extension ***<br>
=C2=A0sm4ed=C2=A0 =C2=A0 =C2=A0 =C2=A0.. 11000 ..... ..... 000 ..... 011001=
1 @k_aes<br>
=C2=A0sm4ks=C2=A0 =C2=A0 =C2=A0 =C2=A0.. 11010 ..... ..... 000 ..... 011001=
1 @k_aes<br>
+<br>
+# *** RV32 Zicond Standard Extension ***<br>
+czero_eqz=C2=A0 =C2=A00000111=C2=A0 ..... ..... 101 ..... 0110011 @r<br>
+czero_nez=C2=A0 =C2=A00000111=C2=A0 ..... ..... 111 ..... 0110011 @r<br>
diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/in=
sn_trans/trans_rvzicond.c.inc<br>
new file mode 100644<br>
index 0000000000..645260164e<br>
--- /dev/null<br>
+++ b/target/riscv/insn_trans/trans_rvzicond.c.inc<br>
@@ -0,0 +1,49 @@<br>
+/*<br>
+ * RISC-V translation routines for the Zicond Standard Extension.<br>
+ *<br>
+ * Copyright (c) 2020-2023 PLCT Lab<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#define REQUIRE_ZICOND(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zicond) {=C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
+} while (0)<br>
+<br>
+static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)<br>
+{<br>
+=C2=A0 =C2=A0 REQUIRE_ZICOND(ctx);<br>
+<br>
+=C2=A0 =C2=A0 TCGv dest =3D dest_gpr(ctx, a-&gt;rd);<br>
+=C2=A0 =C2=A0 TCGv src1 =3D get_gpr(ctx, a-&gt;rs1, EXT_NONE);<br>
+=C2=A0 =C2=A0 TCGv src2 =3D get_gpr(ctx, a-&gt;rs2, EXT_NONE);<br>
+<br>
+=C2=A0 =C2=A0 tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx-&gt;zero, ct=
x-&gt;zero, src1);<br>
+=C2=A0 =C2=A0 gen_set_gpr(ctx, a-&gt;rd, dest);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static bool trans_czero_nez(DisasContext *ctx, arg_czero_nez *a)<br>
+{<br>
+=C2=A0 =C2=A0 REQUIRE_ZICOND(ctx);<br>
+<br>
+=C2=A0 =C2=A0 TCGv dest =3D dest_gpr(ctx, a-&gt;rd);<br>
+=C2=A0 =C2=A0 TCGv src1 =3D get_gpr(ctx, a-&gt;rs1, EXT_NONE);<br>
+=C2=A0 =C2=A0 TCGv src2 =3D get_gpr(ctx, a-&gt;rs2, EXT_NONE);<br>
+<br>
+=C2=A0 =C2=A0 tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, ctx-&gt;zero, ct=
x-&gt;zero, src1);<br>
+=C2=A0 =C2=A0 gen_set_gpr(ctx, a-&gt;rd, dest);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 772f9d7973..6e65c6afca 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -1103,6 +1103,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, t=
arget_ulong pc)<br>
=C2=A0#include &quot;insn_trans/trans_rvh.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvv.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvb.c.inc&quot;<br>
+#include &quot;insn_trans/trans_rvzicond.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvzawrs.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvzfh.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvk.c.inc&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--0000000000005f2ac105f55b3873--

