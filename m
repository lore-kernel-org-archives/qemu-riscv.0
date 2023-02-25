Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVoMR-00081v-K5
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 01:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVoMQ-00081H-3Y; Sat, 25 Feb 2023 01:48:46 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVoMN-0006F0-6K; Sat, 25 Feb 2023 01:48:45 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowABXXZlEr_ljUAVvCA--.7733S2;
 Sat, 25 Feb 2023 14:48:36 +0800 (CST)
Message-ID: <e21fdc77-7255-52c7-d2f9-def5c41f2913@iscas.ac.cn>
Date: Sat, 25 Feb 2023 14:48:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 2/4] target/riscv: implement Zicboz extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230224132536.552293-1-dbarboza@ventanamicro.com>
 <20230224132536.552293-3-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230224132536.552293-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowABXXZlEr_ljUAVvCA--.7733S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UZF1rury7Xw1ftw15XFb_yoWftrWrpF
 4xGay7GFWDJryxZw4ftr45Jr15Gws5Ww4UGwn3Awn5Xr43JFWxJF4DKw47KF4UJFWkur4j
 9a1jvFy2y395ta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
 WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5SPfJUUUUU==
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 25 Feb 2023 06:48:46 -0000


On 2023/2/24 21:25, Daniel Henrique Barboza wrote:
> From: Christoph Muellner <cmuellner@linux.com>
>
> The RISC-V base cache management operation (CBO) ISA extension has been
> ratified. It defines three extensions: Cache-Block Management, Cache-Block
> Prefetch and Cache-Block Zero. More information about the spec can be
> found at [1].
>
> Let's start by implementing the Cache-Block Zero extension, Zicboz. It
> uses the cbo.zero instruction that, as with all CBO instructions that
> will be added later, needs to be implemented in an overlap group with
> the LQ instruction due to overlapping patterns.
>
> cbo.zero throws a Illegal Instruction/Virtual Instruction exception
> depending on CSR state. This is also the case for the remaining cbo
> instructions we're going to add next, so create a check_zicbo_envcfg()
> that will be used by all Zicbo[mz] instructions.
>
> [1] https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
> ---
>   target/riscv/cpu.c                          |  4 ++
>   target/riscv/cpu.h                          |  2 +
>   target/riscv/helper.h                       |  3 +
>   target/riscv/insn32.decode                  | 10 ++-
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 30 +++++++++
>   target/riscv/op_helper.c                    | 68 +++++++++++++++++++++
>   target/riscv/translate.c                    |  1 +
>   7 files changed, 117 insertions(+), 1 deletion(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 93b52b826c..7dd37de7f9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -74,6 +74,7 @@ struct isa_ext_data {
>   static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>       ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
>       ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>       ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
>       ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
> @@ -1126,6 +1127,9 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
>       DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>   
> +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
> +
>       DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>   
>       /* Vendor-specific custom extensions */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..6b4c714d3a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -447,6 +447,7 @@ struct RISCVCPUConfig {
>       bool ext_zkt;
>       bool ext_ifencei;
>       bool ext_icsr;
> +    bool ext_icboz;
>       bool ext_zihintpause;
>       bool ext_smstateen;
>       bool ext_sstc;
> @@ -494,6 +495,7 @@ struct RISCVCPUConfig {
>       char *vext_spec;
>       uint16_t vlen;
>       uint16_t elen;
> +    uint16_t cboz_blocksize;
>       bool mmu;
>       bool pmp;
>       bool epmp;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 0497370afd..ce165821b8 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -97,6 +97,9 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
>   
> +/* Cache-block operations */
> +DEF_HELPER_2(cbo_zero, void, env, tl)
> +
>   /* Special functions */
>   DEF_HELPER_2(csrr, tl, env, int)
>   DEF_HELPER_3(csrw, void, env, int, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index b7e7613ea2..3985bc703f 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -179,7 +179,15 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>   
>   # *** RV128I Base Instruction Set (in addition to RV64I) ***
>   ldu      ............   ..... 111 ..... 0000011 @i
> -lq       ............   ..... 010 ..... 0001111 @i
> +{
> +  [
> +    # *** RV32 Zicboz Standard Extension ***
> +    cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
> +  ]
> +
> +  # *** RVI128 lq ***
> +  lq       ............   ..... 010 ..... 0001111 @i
> +}
>   sq       ............   ..... 100 ..... 0100011 @s
>   addid    ............  .....  000 ..... 1011011 @i
>   sllid    000000 ......  ..... 001 ..... 1011011 @sh6
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> new file mode 100644
> index 0000000000..feabc28342
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> @@ -0,0 +1,30 @@
> +/*
> + * RISC-V translation routines for the RISC-V CBO Extension.
> + *
> + * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZICBOZ(ctx) do {    \
> +    if (!ctx->cfg_ptr->ext_icboz) { \
> +        return false;               \
> +    }                               \
> +} while (0)
> +
> +static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
> +{
> +    REQUIRE_ZICBOZ(ctx);
> +    gen_helper_cbo_zero(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 48f918b71b..c43ecc19b5 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -3,6 +3,7 @@
>    *
>    * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
>    * Copyright (c) 2017-2018 SiFive, Inc.
> + * Copyright (c) 2022      VRULL GmbH
>    *
>    * This program is free software; you can redistribute it and/or modify it
>    * under the terms and conditions of the GNU General Public License,
> @@ -123,6 +124,73 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
>       return int128_getlo(rv);
>   }
>   
> +
> +/*
> + * check_zicbo_envcfg
> + *
> + * Raise virtual exceptions and illegal instruction exceptions for
> + * Zicbo[mz] instructions based on the settings of [mhs]envcfg as
> + * specified in section 2.5.1 of the CMO specification.
> + */
> +static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
> +                                uintptr_t ra)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if ((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env) &&
> +        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
> +         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
> +    }
> +
> +    if ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> +    }
> +#endif
> +}
> +
> +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint16_t cbozlen = cpu->cfg.cboz_blocksize;
> +    int mmu_idx = cpu_mmu_index(env, false);
> +    uintptr_t ra = GETPC();
> +    void *mem;
> +
> +    check_zicbo_envcfg(env, MENVCFG_CBZE, ra);
> +
> +    /* Mask off low-bits to align-down to the cache-block. */
> +    address &= ~(cbozlen - 1);
> +
> +    /*
> +     * cbo.zero requires MMU_DATA_STORE access. Do a probe_write()
> +     * to raise any exceptions, including PMP.
> +     */
> +    mem = probe_write(env, address, cbozlen, mmu_idx, ra);
> +
> +    if (likely(mem)) {
> +        memset(mem, 0, cbozlen);
> +    } else {
> +        /*
> +         * This means that we're dealing with an I/O page. Section 4.2
> +         * of cmobase v1.0.1 says:
> +         *
> +         * "Cache-block zero instructions store zeros independently
> +         * of whether data from the underlying memory locations are
> +         * cacheable."
> +         *
> +         * Write zeros in address + cbozlen regardless of not being
> +         * a RAM page.
> +         */
> +        for (int i = 0; i < cbozlen; i++) {
> +            cpu_stb_mmuidx_ra(env, address + i, 0, mmu_idx, ra);
> +        }
> +    }
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   
>   target_ulong helper_sret(CPURISCVState *env)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 772f9d7973..7f687a7e37 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1104,6 +1104,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   #include "insn_trans/trans_rvv.c.inc"
>   #include "insn_trans/trans_rvb.c.inc"
>   #include "insn_trans/trans_rvzawrs.c.inc"
> +#include "insn_trans/trans_rvzicbo.c.inc"
>   #include "insn_trans/trans_rvzfh.c.inc"
>   #include "insn_trans/trans_rvk.c.inc"
>   #include "insn_trans/trans_privileged.c.inc"


