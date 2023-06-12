Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6521C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:22:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Y7x-0004Uc-Oq; Sun, 11 Jun 2023 23:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Y7w-0004UI-Ig; Sun, 11 Jun 2023 23:21:56 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Y7u-0004Mm-It; Sun, 11 Jun 2023 23:21:56 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-462a2998bceso1161382e0c.2; 
 Sun, 11 Jun 2023 20:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686540112; x=1689132112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pq9afIScTSaxD+ourO03PzcvbCQ40DM5fFlfdoXj2kU=;
 b=MBdM0/UgWiFMPDueCuU2ZQcV0d1NGNw/uIHudB5ZYTid0eYSu35isdAl3i9SWgJ7ZZ
 7wsbWnMt38NT271k7ba2P2L7GAQ+7m8FWbNTSXLnyMLvnqJxFLq3WddNbIQ21dZlFtsp
 6U9lSSR+OKBOHXALyZ1OiUDm2ROIZa+ayiMZpTCDTrmt2f0dh50OHVEqypHvRZWDP6bi
 8XstMBeDwQzW8paAD6Y06ddni8AfTWUrXI2mvFdjOigaE/dEXeYB0UzCAb24pqYPTWT2
 8Yz1oyNt1Pmi2QfULa5y7lqTrbcPGvQ+Sdj7whktkHY8uhBV8JlkEcJ93tVxa0lXkNH1
 dkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686540112; x=1689132112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pq9afIScTSaxD+ourO03PzcvbCQ40DM5fFlfdoXj2kU=;
 b=hIZ2DsJwDp7L/9n5pOqAERMa1K4qykDlelOAE5F//dS8iZRlSTqkguZLzpEhxr+UXF
 jAOsx77cuzAFMKBE73rrvbQ0zK6XiPiZDwVPdUlmdXp+IeE38VvB7+3CPVLJhi5rBywa
 mcPwHZpi1weW/6R5N4k6caQUcV6alcR72OttI4co8jB9UdzNzW0y25rmK1Sv+Wj7RJET
 RpAqdwCyAeilI+VsGkUhTIJ4feMSrs1kA+JeM/KXYLwwDhlQ4By7u8C8Zh03m6icjZSU
 mCByYVyIPpczzSGLMoHQSanN0VTfCCfl/gGWWq1eDYOXD1kkM6ZVNTknB1meASPWMFS5
 cong==
X-Gm-Message-State: AC+VfDxiZ2RgiicvbY+i5UeguKbBNX5GRx7iCnffl9iYplpv6Nl9mWuB
 7w6yK9k6WWxTqqHPHI+3fmaIpJk5XIJgGPqgBK8=
X-Google-Smtp-Source: ACHHUZ6lfn+EkuVGARiVsncioZLkp0VU4A0r1i9CrJtfgSzp4V/5QLG0ZunvSPu9J2NcqemwI862FUxFmUlzk6AOfuU=
X-Received: by 2002:a1f:cac3:0:b0:464:6be9:9f3d with SMTP id
 a186-20020a1fcac3000000b004646be99f3dmr3193763vkg.14.1686540112293; Sun, 11
 Jun 2023 20:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-3-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-3-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:21:26 +1000
Message-ID: <CAKmqyKN=59chkcdHqL7A4NgcHGqZBgmnBQ-GZ5kSBy61-6Rgtg@mail.gmail.com>
Subject: Re: [PATCH 2/9] target/riscv: Factor out RISCVCPUConfig from cpu.h
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 30, 2023 at 11:21=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> The file target/riscv/cpu.h cannot be included by files outside
> of target/riscv/. To share data with other parts of QEMU (e.g.
> the disassembler) we need to factor out the relevant code.
> Therefore, this patch moves the definition of RISCVCPUConfig
> (and tightly coupled dependencies and functions) into its
> own target/riscv/cpu-config.h file.
> The goal is to be able to share the enablement-status of
> the RISC-V ISA extensions (RISCVCPUConfig::ext_*) with
> other parts of QEMU.
>
> This patch does not introduce new functionality.
> However, the patch includes a small change:
> The parameter for the extension test functions has been changed
> from 'DisasContext*' to 'const RISCVCPUConfig*'.
> This allows to keep these functions in cpu-config.h.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-config.h | 148 ++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h        | 114 +----------------------------
>  target/riscv/translate.c  |  27 +------
>  3 files changed, 151 insertions(+), 138 deletions(-)
>  create mode 100644 target/riscv/cpu-config.h
>
> diff --git a/target/riscv/cpu-config.h b/target/riscv/cpu-config.h
> new file mode 100644
> index 0000000000..ca368af0b2
> --- /dev/null
> +++ b/target/riscv/cpu-config.h
> @@ -0,0 +1,148 @@
> +/*
> + * QEMU RISC-V CPU Config
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef RISCV_CPU_CONFIG_H
> +#define RISCV_CPU_CONFIG_H
> +
> +/*
> + * map is a 16-bit bitmap: the most significant set bit in map is the ma=
ximum
> + * satp mode that is supported. It may be chosen by the user and must re=
spect
> + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> + * (supported bitmap below).
> + *
> + * init is a 16-bit bitmap used to make sure the user selected a correct
> + * configuration as per the specification.
> + *
> + * supported is a 16-bit bitmap used to reflect the hw capabilities.
> + */
> +typedef struct {
> +    uint16_t map, init, supported;
> +} RISCVSATPMap;
> +
> +struct RISCVCPUConfig {
> +    bool ext_zba;
> +    bool ext_zbb;
> +    bool ext_zbc;
> +    bool ext_zbkb;
> +    bool ext_zbkc;
> +    bool ext_zbkx;
> +    bool ext_zbs;
> +    bool ext_zca;
> +    bool ext_zcb;
> +    bool ext_zcd;
> +    bool ext_zce;
> +    bool ext_zcf;
> +    bool ext_zcmp;
> +    bool ext_zcmt;
> +    bool ext_zk;
> +    bool ext_zkn;
> +    bool ext_zknd;
> +    bool ext_zkne;
> +    bool ext_zknh;
> +    bool ext_zkr;
> +    bool ext_zks;
> +    bool ext_zksed;
> +    bool ext_zksh;
> +    bool ext_zkt;
> +    bool ext_ifencei;
> +    bool ext_icsr;
> +    bool ext_icbom;
> +    bool ext_icboz;
> +    bool ext_zicond;
> +    bool ext_zihintpause;
> +    bool ext_smstateen;
> +    bool ext_sstc;
> +    bool ext_svadu;
> +    bool ext_svinval;
> +    bool ext_svnapot;
> +    bool ext_svpbmt;
> +    bool ext_zdinx;
> +    bool ext_zawrs;
> +    bool ext_zfh;
> +    bool ext_zfhmin;
> +    bool ext_zfinx;
> +    bool ext_zhinx;
> +    bool ext_zhinxmin;
> +    bool ext_zve32f;
> +    bool ext_zve64f;
> +    bool ext_zve64d;
> +    bool ext_zmmul;
> +    bool ext_zvfh;
> +    bool ext_zvfhmin;
> +    bool ext_smaia;
> +    bool ext_ssaia;
> +    bool ext_sscofpmf;
> +    bool rvv_ta_all_1s;
> +    bool rvv_ma_all_1s;
> +
> +    uint32_t mvendorid;
> +    uint64_t marchid;
> +    uint64_t mimpid;
> +
> +    /* Vendor-specific custom extensions */
> +    bool ext_xtheadba;
> +    bool ext_xtheadbb;
> +    bool ext_xtheadbs;
> +    bool ext_xtheadcmo;
> +    bool ext_xtheadcondmov;
> +    bool ext_xtheadfmemidx;
> +    bool ext_xtheadfmv;
> +    bool ext_xtheadmac;
> +    bool ext_xtheadmemidx;
> +    bool ext_xtheadmempair;
> +    bool ext_xtheadsync;
> +    bool ext_XVentanaCondOps;
> +
> +    uint8_t pmu_num;
> +    char *priv_spec;
> +    char *user_spec;
> +    char *bext_spec;
> +    char *vext_spec;
> +    uint16_t vlen;
> +    uint16_t elen;
> +    uint16_t cbom_blocksize;
> +    uint16_t cboz_blocksize;
> +    bool mmu;
> +    bool pmp;
> +    bool epmp;
> +    bool debug;
> +    bool misa_w;
> +
> +    bool short_isa_string;
> +
> +#ifndef CONFIG_USER_ONLY
> +    RISCVSATPMap satp_mode;
> +#endif
> +};
> +
> +typedef struct RISCVCPUConfig RISCVCPUConfig;
> +
> +/* Helper functions to test for extensions.  */
> +
> +static inline bool always_true_p(const RISCVCPUConfig *cfg __attribute__=
((__unused__)))
> +{
> +    return true;
> +}
> +
> +static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
> +{
> +    return cfg->ext_xtheadba || cfg->ext_xtheadbb ||
> +           cfg->ext_xtheadbs || cfg->ext_xtheadcmo ||
> +           cfg->ext_xtheadcondmov ||
> +           cfg->ext_xtheadfmemidx || cfg->ext_xtheadfmv ||
> +           cfg->ext_xtheadmac || cfg->ext_xtheadmemidx ||
> +           cfg->ext_xtheadmempair || cfg->ext_xtheadsync;
> +}
> +
> +#define MATERIALISE_EXT_PREDICATE(ext) \
> +    static inline bool has_ ## ext ## _p(const RISCVCPUConfig *cfg) \
> +    { \
> +        return cfg->ext_ ## ext ; \
> +    }
> +
> +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
> +
> +#endif /* RISCV_CPU_CONFIG_H */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de7e43126a..895a307bad 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -28,6 +28,7 @@
>  #include "qemu/int128.h"
>  #include "cpu_bits.h"
>  #include "qapi/qapi-types-common.h"
> +#include "cpu-config.h"
>  #include "cpu-qom.h"
>
>  #define TCG_GUEST_DEFAULT_MO 0
> @@ -368,119 +369,6 @@ struct CPUArchState {
>      uint64_t kvm_timer_frequency;
>  };
>
> -/*
> - * map is a 16-bit bitmap: the most significant set bit in map is the ma=
ximum
> - * satp mode that is supported. It may be chosen by the user and must re=
spect
> - * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> - * (supported bitmap below).
> - *
> - * init is a 16-bit bitmap used to make sure the user selected a correct
> - * configuration as per the specification.
> - *
> - * supported is a 16-bit bitmap used to reflect the hw capabilities.
> - */
> -typedef struct {
> -    uint16_t map, init, supported;
> -} RISCVSATPMap;
> -
> -struct RISCVCPUConfig {
> -    bool ext_zba;
> -    bool ext_zbb;
> -    bool ext_zbc;
> -    bool ext_zbkb;
> -    bool ext_zbkc;
> -    bool ext_zbkx;
> -    bool ext_zbs;
> -    bool ext_zca;
> -    bool ext_zcb;
> -    bool ext_zcd;
> -    bool ext_zce;
> -    bool ext_zcf;
> -    bool ext_zcmp;
> -    bool ext_zcmt;
> -    bool ext_zk;
> -    bool ext_zkn;
> -    bool ext_zknd;
> -    bool ext_zkne;
> -    bool ext_zknh;
> -    bool ext_zkr;
> -    bool ext_zks;
> -    bool ext_zksed;
> -    bool ext_zksh;
> -    bool ext_zkt;
> -    bool ext_ifencei;
> -    bool ext_icsr;
> -    bool ext_icbom;
> -    bool ext_icboz;
> -    bool ext_zicond;
> -    bool ext_zihintpause;
> -    bool ext_smstateen;
> -    bool ext_sstc;
> -    bool ext_svadu;
> -    bool ext_svinval;
> -    bool ext_svnapot;
> -    bool ext_svpbmt;
> -    bool ext_zdinx;
> -    bool ext_zawrs;
> -    bool ext_zfh;
> -    bool ext_zfhmin;
> -    bool ext_zfinx;
> -    bool ext_zhinx;
> -    bool ext_zhinxmin;
> -    bool ext_zve32f;
> -    bool ext_zve64f;
> -    bool ext_zve64d;
> -    bool ext_zmmul;
> -    bool ext_zvfh;
> -    bool ext_zvfhmin;
> -    bool ext_smaia;
> -    bool ext_ssaia;
> -    bool ext_sscofpmf;
> -    bool rvv_ta_all_1s;
> -    bool rvv_ma_all_1s;
> -
> -    uint32_t mvendorid;
> -    uint64_t marchid;
> -    uint64_t mimpid;
> -
> -    /* Vendor-specific custom extensions */
> -    bool ext_xtheadba;
> -    bool ext_xtheadbb;
> -    bool ext_xtheadbs;
> -    bool ext_xtheadcmo;
> -    bool ext_xtheadcondmov;
> -    bool ext_xtheadfmemidx;
> -    bool ext_xtheadfmv;
> -    bool ext_xtheadmac;
> -    bool ext_xtheadmemidx;
> -    bool ext_xtheadmempair;
> -    bool ext_xtheadsync;
> -    bool ext_XVentanaCondOps;
> -
> -    uint8_t pmu_num;
> -    char *priv_spec;
> -    char *user_spec;
> -    char *bext_spec;
> -    char *vext_spec;
> -    uint16_t vlen;
> -    uint16_t elen;
> -    uint16_t cbom_blocksize;
> -    uint16_t cboz_blocksize;
> -    bool mmu;
> -    bool pmp;
> -    bool epmp;
> -    bool debug;
> -    bool misa_w;
> -
> -    bool short_isa_string;
> -
> -#ifndef CONFIG_USER_ONLY
> -    RISCVSATPMap satp_mode;
> -#endif
> -};
> -
> -typedef struct RISCVCPUConfig RISCVCPUConfig;
> -
>  /*
>   * RISCVCPU:
>   * @env: #CPURISCVState
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 928da0d3f0..2697cc26d0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -119,29 +119,6 @@ static inline bool has_ext(DisasContext *ctx, uint32=
_t ext)
>      return ctx->misa_ext & ext;
>  }
>
> -static bool always_true_p(DisasContext *ctx  __attribute__((__unused__))=
)
> -{
> -    return true;
> -}
> -
> -static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
> -{
> -    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
> -           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadcondmov ||
> -           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfm=
v ||
> -           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx=
 ||
> -           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsy=
nc;
> -}
> -
> -#define MATERIALISE_EXT_PREDICATE(ext)  \
> -    static bool has_ ## ext ## _p(DisasContext *ctx)    \
> -    { \
> -        return ctx->cfg_ptr->ext_ ## ext ; \
> -    }
> -
> -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> -
>  #ifdef TARGET_RISCV32
>  #define get_xl(ctx)    MXL_RV32
>  #elif defined(CONFIG_USER_ONLY)
> @@ -1106,7 +1083,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
>       * that are tested in-order until a decoder matches onto the opcode.
>       */
>      static const struct {
> -        bool (*guard_func)(DisasContext *);
> +        bool (*guard_func)(const RISCVCPUConfig *);
>          bool (*decode_func)(DisasContext *, uint32_t);
>      } decoders[] =3D {
>          { always_true_p,  decode_insn32 },
> @@ -1135,7 +1112,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
>          ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
>
>          for (size_t i =3D 0; i < ARRAY_SIZE(decoders); ++i) {
> -            if (decoders[i].guard_func(ctx) &&
> +            if (decoders[i].guard_func(ctx->cfg_ptr) &&
>                  decoders[i].decode_func(ctx, opcode32)) {
>                  return;
>              }
> --
> 2.40.1
>
>

