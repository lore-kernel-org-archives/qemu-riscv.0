Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOoI2-0002Qh-D9
	for mharc-qemu-riscv@gnu.org; Sun, 05 Feb 2023 18:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoI1-0002QS-7z; Sun, 05 Feb 2023 18:19:17 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoHz-00066J-0A; Sun, 05 Feb 2023 18:19:16 -0500
Received: by mail-vs1-xe33.google.com with SMTP id y8so11042382vsq.0;
 Sun, 05 Feb 2023 15:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxfLAWUMnj84Z4YmP0w4/V/7l5YeAH2mEdnmFf+2kQs=;
 b=Got/5EjvDz5VHb0ki6jcRWQQxHUECVq23gGb60Y+UMKbjC+cBWE24mt+PZd7N4Usu6
 /a6D3zqU3UTHBceXHBbQ/ek8NJynBZ0u3APd9vypyxF7ftnNxhCckD23wpKyAchzRiWs
 s9f+EhXRlxFOBxXI0UWrYu+VViESRB1OwB00LADrYPwkFHrOr9bq0S7q/OqEReH3PCrq
 YZKIv3kZwHQqGgABnZPA45/BPwPWMvfm8EGlCyKC4JWkCim4rFfZ0i0AnMiCqX9LUQYI
 clO8sh30k70kxBVpHE/iEyd2KaIK6uJiQYt2mMyH4mHrTMmiPiFYDVuGveDBMUuvBqNd
 Fy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxfLAWUMnj84Z4YmP0w4/V/7l5YeAH2mEdnmFf+2kQs=;
 b=dwBT8ZP5xpkk2zLaK4Ha+EA17qbNNCJfwrlXlAD3r+nmyJml1bHJkXP+FYHstc12tc
 88IaMILZ6EsuwSC5mLdt/7ctCRaasq6Avz87rjUFk8Ms3/rbthI5nHSHFHR3fsI72tvP
 2OYiMedRAqmAd8ZTvAcz0GuYBq8V1b9bpUcfwQcca+lFeGMxTck7kkDZUffvqKlOJaE9
 XVzJhte7ydyTFEye2Vp66DBuc8Rz1NdJfyHgA6auIQq0uxr3/qsJwEsLzVLf5kk5anJ7
 LEhrq2ZdFnXy47xOkd2DEbhYnVVUrXb2OPEvV1291uHLXx/fb+2rkr19KdETLwFs6GVV
 3Vsw==
X-Gm-Message-State: AO0yUKXFbE1J1BBI4YZncoqUk8UF7Wefs9NvOJc36UB3hE/e9BOw4DkX
 hWlmA0akJQXqRKnPjgn9uufFN+DsMle2Wf/MQRA=
X-Google-Smtp-Source: AK7set/2X8UGQ7icMADz7vGl6w3C1qURhHhF2gF5aJVIJcS2JdxwSWWI4ndkWFrd9JpzBO9LaUtG5ANPgvJOZXYJfaw=
X-Received: by 2002:a67:e102:0:b0:3f0:89e1:7c80 with SMTP id
 d2-20020a67e102000000b003f089e17c80mr2193272vsl.72.1675639153582; Sun, 05 Feb
 2023 15:19:13 -0800 (PST)
MIME-Version: 1.0
References: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
 <20230131202013.2541053-2-christoph.muellner@vrull.eu>
In-Reply-To: <20230131202013.2541053-2-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 09:18:47 +1000
Message-ID: <CAKmqyKMkJXh7izoYndhCo+Mj+1xR+jOeVvqwRTGpxfFUzNZ+_A@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] RISC-V: Adding XTheadCmo ISA extension
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>, 
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>, 
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 05 Feb 2023 23:19:17 -0000

On Wed, Feb 1, 2023 at 6:21 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the XTheadCmo ISA extension.
> To avoid interfering with standard extensions, decoder and translation
> are in its own xthead* specific files.
> Future patches should be able to easily add additional T-Head extension.
>
> The implementation does not have much functionality (besides accepting
> the instructions and not qualifying them as illegal instructions if
> the hart executes in the required privilege level for the instruction),
> as QEMU does not model CPU caches and instructions are documented
> to not raise any exceptions.
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Explicit test for PRV_U
> - Encapsule access to env-priv in inline function
> - Use single decoder for XThead extensions
>
> Changes in v3:
> - Appling mask TB_FLAGS_PRIV_MMU_MASK to use of ctx->mem_idx
> - Removing code from test macro REQUIRE_PRIV_MSU()
> - Removing PRV_H from test macro REQUIRE_PRIV_MS()
> - Remove unrelated clean-up
> - Reorder decoder includes
>
> Changes in v4:
> - Reorder decoder includes
>
>  target/riscv/cpu.c                         |  2 +
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 81 ++++++++++++++++++++++
>  target/riscv/meson.build                   |  1 +
>  target/riscv/translate.c                   |  8 +++
>  target/riscv/xthead.decode                 | 38 ++++++++++
>  6 files changed, 131 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
>  create mode 100644 target/riscv/xthead.decode
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 14a7027095..6ea61e5b22 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -109,6 +109,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
>  };
>
> @@ -1088,6 +1089,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
>      /* Vendor-specific custom extensions */
> +    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
>      /* These are experimental so mark with 'x-' */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bcf0826753..d3ebc6f112 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -473,6 +473,7 @@ struct RISCVCPUConfig {
>      uint64_t mimpid;
>
>      /* Vendor-specific custom extensions */
> +    bool ext_xtheadcmo;
>      bool ext_XVentanaCondOps;
>
>      uint8_t pmu_num;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> new file mode 100644
> index 0000000000..24acaf188c
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -0,0 +1,81 @@
> +/*
> + * RISC-V translation routines for the T-Head vendor extensions (xthead*=
).
> + *
> + * Copyright (c) 2022 VRULL GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_XTHEADCMO(ctx) do {              \
> +    if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
> +/* XTheadCmo */
> +
> +static inline int priv_level(DisasContext *ctx)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return PRV_U;
> +#else
> +     /* Priv level is part of mem_idx. */
> +    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
> +#endif
> +}
> +
> +/* Test if priv level is M, S, or U (cannot fail). */
> +#define REQUIRE_PRIV_MSU(ctx)
> +
> +/* Test if priv level is M or S. */
> +#define REQUIRE_PRIV_MS(ctx)                                    \
> +do {                                                            \
> +    int priv =3D priv_level(ctx);                                 \
> +    if (!(priv =3D=3D PRV_M ||                                      \
> +          priv =3D=3D PRV_S)) {                                     \
> +        return false;                                           \
> +    }                                                           \
> +} while (0)
> +
> +#define NOP_PRIVCHECK(insn, extcheck, privcheck)                \
> +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn * a) \
> +{                                                               \
> +    (void) a;                                                   \
> +    extcheck(ctx);                                              \
> +    privcheck(ctx);                                             \
> +    return true;                                                \
> +}
> +
> +NOP_PRIVCHECK(th_dcache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
> +NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
> +NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
> +NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +
> +NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_icache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
> +
> +NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index ba25164d74..5dee37a242 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -2,6 +2,7 @@
>  gen =3D [
>    decodetree.process('insn16.decode', extra_args: ['--static-decode=3Dde=
code_insn16', '--insnwidth=3D16']),
>    decodetree.process('insn32.decode', extra_args: '--static-decode=3Ddec=
ode_insn32'),
> +  decodetree.process('xthead.decode', extra_args: '--static-decode=3Ddec=
ode_xthead'),
>    decodetree.process('XVentanaCondOps.decode', extra_args: '--static-dec=
ode=3Ddecode_XVentanaCodeOps'),
>  ]
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 01cc30a365..1e29ac9886 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -130,6 +130,11 @@ static bool always_true_p(DisasContext *ctx  __attri=
bute__((__unused__)))
>      return true;
>  }
>
> +static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
> +{
> +    return ctx->cfg_ptr->ext_xtheadcmo;
> +}
> +
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
>      static bool has_ ## ext ## _p(DisasContext *ctx)    \
>      { \
> @@ -1080,6 +1085,8 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>  #include "insn_trans/trans_svinval.c.inc"
> +#include "decode-xthead.c.inc"
> +#include "insn_trans/trans_xthead.c.inc"
>  #include "insn_trans/trans_xventanacondops.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
> @@ -1106,6 +1113,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
>          bool (*decode_func)(DisasContext *, uint32_t);
>      } decoders[] =3D {
>          { always_true_p,  decode_insn32 },
> +        { has_xthead_p, decode_xthead },
>          { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
>      };
>
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> new file mode 100644
> index 0000000000..30533a66f5
> --- /dev/null
> +++ b/target/riscv/xthead.decode
> @@ -0,0 +1,38 @@
> +#
> +# Translation routines for the instructions of the XThead* ISA extension=
s
> +#
> +# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
> +#
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +#
> +# The documentation of the ISA extensions can be found here:
> +#   https://github.com/T-head-Semi/thead-extension-spec/releases/latest
> +
> +# Fields:
> +%rs1       15:5
> +
> +# Formats
> +@sfence_vm  ....... ..... .....   ... ..... ....... %rs1
> +
> +# XTheadCmo
> +th_dcache_call   0000000 00001 00000 000 00000 0001011
> +th_dcache_ciall  0000000 00011 00000 000 00000 0001011
> +th_dcache_iall   0000000 00010 00000 000 00000 0001011
> +th_dcache_cpa    0000001 01001 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_cipa   0000001 01011 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_ipa    0000001 01010 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_cva    0000001 00101 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_civa   0000001 00111 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_iva    0000001 00110 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_csw    0000001 00001 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_cisw   0000001 00011 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_isw    0000001 00010 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_cpal1  0000001 01000 ..... 000 00000 0001011 @sfence_vm
> +th_dcache_cval1  0000001 00100 ..... 000 00000 0001011 @sfence_vm
> +th_icache_iall   0000000 10000 00000 000 00000 0001011
> +th_icache_ialls  0000000 10001 00000 000 00000 0001011
> +th_icache_ipa    0000001 11000 ..... 000 00000 0001011 @sfence_vm
> +th_icache_iva    0000001 10000 ..... 000 00000 0001011 @sfence_vm
> +th_l2cache_call  0000000 10101 00000 000 00000 0001011
> +th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
> +th_l2cache_iall  0000000 10110 00000 000 00000 0001011
> --
> 2.39.1
>
>

