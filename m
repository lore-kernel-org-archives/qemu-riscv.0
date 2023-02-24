Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVNCw-0001o2-Vw
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 20:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVNCt-0001nd-Kz; Thu, 23 Feb 2023 20:49:08 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVNCp-000874-PW; Thu, 23 Feb 2023 20:49:07 -0500
Received: from [192.168.0.120] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADn75uDF_hjUvT7Bw--.36185S2;
 Fri, 24 Feb 2023 09:48:51 +0800 (CST)
Message-ID: <073e76de-d963-d27c-ee2f-6489a9e2a798@iscas.ac.cn>
Date: Fri, 24 Feb 2023 09:48:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 2/4] target/riscv: implement Zicboz extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-3-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230223234427.521114-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADn75uDF_hjUvT7Bw--.36185S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ZF1rJF4rAr48Aw45Wry3Arb_yoWDXw45pF
 48Gay7GFWDJryIv3yftr45Jr15Cws5Ww4UGwn3Awn5Jr43JrWxJF4DKr47KFWDJFWkur4j
 9a1jvFy2v395ta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
 IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
 MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
 WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
 6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 24 Feb 2023 01:49:08 -0000


On 2023/2/24 07:44, Daniel Henrique Barboza wrote:
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
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c                          |  4 ++
>   target/riscv/cpu.h                          |  2 +
>   target/riscv/helper.h                       |  3 +
>   target/riscv/insn32.decode                  | 10 +++-
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 30 ++++++++++
>   target/riscv/op_helper.c                    | 65 +++++++++++++++++++++
>   target/riscv/translate.c                    |  1 +
>   7 files changed, 114 insertions(+), 1 deletion(-)
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
> index 48f918b71b..72a8ca31fc 100644
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
> @@ -123,6 +124,70 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
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
> +    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) ||
> +        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env) &&
> +        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
> +         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
> +    }
This seems also not correct. if !get_field(env->senvcfg, envbits) in VU 
mode, virtual instruction fault should be triggered when

get_field(env->menvcfg, envbits) is true. So I think the correct order will be:

     if ((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }

     if (riscv_cpu_virt_enabled(env) &&
         (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
          ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
     }

     if ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }

Regards,
Weiwei Li


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


