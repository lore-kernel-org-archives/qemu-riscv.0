Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5dv-00085O-L6
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 17:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5dt-000856-8G; Mon, 23 Jan 2023 17:50:21 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5dq-0006Tp-0S; Mon, 23 Jan 2023 17:50:21 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id t2so6767820vkk.9;
 Mon, 23 Jan 2023 14:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrHEM6IxsY3EE6MKnYDaPOHYvQiIofAFFhu0Ipm5UI8=;
 b=XFM9dK5EpT7dhghnl3vh+xEuAXvHQn27oceBv/RIHJWrpTozt8JPXIxe2XGC8oFwct
 akYY479zPIrwWIegQoyU2FUnBSabEgEQ3J945k0RBgZmyb24Gv5xgL/+si0qsSHlWOya
 4Gg6WhDvVVveAswUtXP49IKwK1fIUmFqtPVOozd/dfUiBwWL+996K2MY+yMA9Txrn9jy
 0ecMsH8SV1XMx2exX66/w2/vSB2LZf+wWxcHozX6eym6MF8OQnRl5zVsKRXJZ8Vsu+4f
 bx4xuOsXsS3zRqeoSVXoYLgz/sPtCkLQBsV6lCka+gHYCcqyIq4tNshTHCo7FDeD1ihD
 ESww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrHEM6IxsY3EE6MKnYDaPOHYvQiIofAFFhu0Ipm5UI8=;
 b=GIfRxRtufnFgOK1M8qdit2Hdyp8xSeNvOJCZGv4SPRx8K/Qh2nn2EbFpACz6/GUflc
 zcMrQTeFsK7KZYVgDld3i6qjWWGmQjXBKnmQYK1W4PFnx8P0qRXyKtzCzxPa3cBSa6dA
 3yzXLuP5k98ZRNy6O0FNaLWVbl+KTgMgzFsPzo1TpwSG1buTMf8bMX1NtUMz9y9T/92f
 y9cASTAEFYC+OeslrS6+JbmOsq6Gun1xfXc4tC/z4A33RGwPSVR2zccOKDGtj89CWjfG
 iLyGtWqTRO2GWps4vgcZ42cl9efvLC8nicz5w/1TPxaWuU6y6VL/V/v55xeFQB1ITKcD
 EFhA==
X-Gm-Message-State: AFqh2krPVHRvHhWy4G+zdKpKKcjBWCk5jn/xmMydQ7V4mXax7XFS3924
 LIK67ZhGJRGxCBGOexhJpSlEDWuW1uyIx06+YCg=
X-Google-Smtp-Source: AMrXdXuIIfCxC8fmfRjyfkm0UPYfiVkTG74B8fyf0NpfPVIxOo4+pCNtkiKeQvwhlbbzaILARZeb7F8qktOLqXj6HB0=
X-Received: by 2002:a1f:b681:0:b0:3dd:fc42:994d with SMTP id
 g123-20020a1fb681000000b003ddfc42994dmr3515028vkf.25.1674514216393; Mon, 23
 Jan 2023 14:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-2-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-2-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 08:49:50 +1000
Message-ID: <CAKmqyKOXM2poHz5c1CbddvUBC-wQxQE3o_bm7bqrn+XTkqASrg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] RISC-V: Adding XTheadCmo ISA extension
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 22:50:21 -0000

On Sat, Dec 24, 2022 at 4:09 AM Christoph Muellner
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
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Explicit test for PRV_U
> - Encapsule access to env-priv in inline function
> - Use single decoder for XThead extensions
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> ---
>  target/riscv/cpu.c                         |  2 +
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 89 ++++++++++++++++++++++
>  target/riscv/meson.build                   |  1 +
>  target/riscv/translate.c                   | 15 +++-
>  target/riscv/xthead.decode                 | 38 +++++++++
>  6 files changed, 143 insertions(+), 3 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
>  create mode 100644 target/riscv/xthead.decode
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6fe176e483..a90b82c5c5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
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
> @@ -1060,6 +1061,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
>      /* Vendor-specific custom extensions */
> +    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
>      /* These are experimental so mark with 'x-' */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 443d15a47c..ad1c19f870 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -465,6 +465,7 @@ struct RISCVCPUConfig {
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
> index 0000000000..00e75c7dca
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -0,0 +1,89 @@
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
> +     /* Priv level equals mem_idx -- see cpu_mmu_index. */
> +    return ctx->mem_idx;

This should be ANDed with TB_FLAGS_PRIV_MMU_MASK as sometimes this can
include hypervisor priv access information

> +#endif
> +}
> +
> +#define REQUIRE_PRIV_MHSU(ctx)                                  \
> +do {                                                            \
> +    int priv =3D priv_level(ctx);                                 \
> +    if (!(priv =3D=3D PRV_M ||                                      \
> +          priv =3D=3D PRV_H ||                                      \

PRV_H isn't used

> +          priv =3D=3D PRV_S ||                                      \
> +          priv =3D=3D PRV_U)) {                                     \
> +        return false;                                           \

When would this not be the case?

> +    }                                                           \
> +} while (0)
> +
> +#define REQUIRE_PRIV_MHS(ctx)                                   \
> +do {                                                            \
> +    int priv =3D priv_level(ctx);                                 \
> +    if (!(priv =3D=3D PRV_M ||                                      \
> +          priv =3D=3D PRV_H ||                                      \

Also not used

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
> +NOP_PRIVCHECK(th_dcache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +
> +NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_icache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
> +
> +NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
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
> index db123da5ec..14d9116975 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -125,13 +125,18 @@ static bool always_true_p(DisasContext *ctx  __attr=
ibute__((__unused__)))
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
>          return ctx->cfg_ptr->ext_ ## ext ; \
>      }
>
> -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)

Do we need this change?

>
>  #ifdef TARGET_RISCV32
>  #define get_xl(ctx)    MXL_RV32
> @@ -732,6 +737,10 @@ static int ex_rvc_shiftri(DisasContext *ctx, int imm=
)
>  /* Include the auto-generated decoder for 32 bit insn */
>  #include "decode-insn32.c.inc"
>
> +/* Include decoders for factored-out extensions */
> +#include "decode-xthead.c.inc"
> +#include "decode-XVentanaCondOps.c.inc"
> +
>  static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
>                               void (*func)(TCGv, TCGv, target_long))
>  {
> @@ -1033,12 +1042,11 @@ static uint32_t opcode_at(DisasContextBase *dcbas=
e, target_ulong pc)
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>  #include "insn_trans/trans_svinval.c.inc"
> +#include "insn_trans/trans_xthead.c.inc"
>  #include "insn_trans/trans_xventanacondops.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
>  #include "decode-insn16.c.inc"
> -/* Include decoders for factored-out extensions */
> -#include "decode-XVentanaCondOps.c.inc"

Can we not leave these at the bottom?

Alistair

>
>  /* The specification allows for longer insns, but not supported by qemu.=
 */
>  #define MAX_INSN_LEN  4
> @@ -1059,6 +1067,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
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
> 2.38.1
>
>

