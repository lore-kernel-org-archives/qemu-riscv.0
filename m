Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89486C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:41:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8bEd-0006Nq-GD; Mon, 12 Jun 2023 02:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q8bEc-0006NU-32; Mon, 12 Jun 2023 02:41:02 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q8bEY-00034k-Tv; Mon, 12 Jun 2023 02:41:01 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VktNkWD_1686552045; 
Received: from 30.221.96.167(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VktNkWD_1686552045) by smtp.aliyun-inc.com;
 Mon, 12 Jun 2023 14:40:46 +0800
Message-ID: <6e1681c3-6aca-b44a-6033-3c5ef49778a5@linux.alibaba.com>
Date: Mon, 12 Jun 2023 14:40:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/9] target/riscv: Factor out RISCVCPUConfig from cpu.h
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-3-christoph.muellner@vrull.eu>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230530131843.1186637-3-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/5/30 21:18, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
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
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu-config.h | 148 ++++++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h        | 114 +----------------------------
>   target/riscv/translate.c  |  27 +------
>   3 files changed, 151 insertions(+), 138 deletions(-)
>   create mode 100644 target/riscv/cpu-config.h
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
> + * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> + * satp mode that is supported. It may be chosen by the user and must respect
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
> +static inline bool always_true_p(const RISCVCPUConfig *cfg __attribute__((__unused__)))
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
>   #include "qemu/int128.h"
>   #include "cpu_bits.h"
>   #include "qapi/qapi-types-common.h"
> +#include "cpu-config.h"
>   #include "cpu-qom.h"
>   
>   #define TCG_GUEST_DEFAULT_MO 0
> @@ -368,119 +369,6 @@ struct CPUArchState {
>       uint64_t kvm_timer_frequency;
>   };
>   
> -/*
> - * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> - * satp mode that is supported. It may be chosen by the user and must respect
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
>   /*
>    * RISCVCPU:
>    * @env: #CPURISCVState
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 928da0d3f0..2697cc26d0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -119,29 +119,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>       return ctx->misa_ext & ext;
>   }
>   
> -static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
> -{
> -    return true;
> -}
> -
> -static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
> -{
> -    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
> -           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadcondmov ||
> -           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfmv ||
> -           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx ||
> -           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
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
>   #ifdef TARGET_RISCV32
>   #define get_xl(ctx)    MXL_RV32
>   #elif defined(CONFIG_USER_ONLY)
> @@ -1106,7 +1083,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>        * that are tested in-order until a decoder matches onto the opcode.
>        */
>       static const struct {
> -        bool (*guard_func)(DisasContext *);
> +        bool (*guard_func)(const RISCVCPUConfig *);
>           bool (*decode_func)(DisasContext *, uint32_t);
>       } decoders[] = {
>           { always_true_p,  decode_insn32 },
> @@ -1135,7 +1112,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
>   
>           for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> -            if (decoders[i].guard_func(ctx) &&
> +            if (decoders[i].guard_func(ctx->cfg_ptr) &&
>                   decoders[i].decode_func(ctx, opcode32)) {
>                   return;
>               }

