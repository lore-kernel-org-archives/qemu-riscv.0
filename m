Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pTN9T-0001YD-9B
	for mharc-qemu-riscv@gnu.org; Sat, 18 Feb 2023 08:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pTN9R-0001Xs-S8; Sat, 18 Feb 2023 08:21:17 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pTN9N-0003hX-Qg; Sat, 18 Feb 2023 08:21:17 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAA3O0e70PBjX7XnBQ--.22135S2;
 Sat, 18 Feb 2023 21:20:59 +0800 (CST)
Message-ID: <518c38ce-a260-f6f1-1c1b-6df13b071f44@iscas.ac.cn>
Date: Sat, 18 Feb 2023 21:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 2/4] target/riscv: implement Zicboz extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
 <20230217203445.51077-3-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230217203445.51077-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAA3O0e70PBjX7XnBQ--.22135S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww4kGF4kCrykAF1fXF4fZrb_yoWfur43pF
 4fGay3GFWDJryxZ3yftr45Jr15Gws5Ww4UGwn3Awn5JF43JrWxJF1DKr47KFWUJFWkur4j
 9a1jvFy2y3ykJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.256,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 18 Feb 2023 13:21:18 -0000


On 2023/2/18 04:34, Daniel Henrique Barboza wrote:
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
>   target/riscv/helper.h                       |  3 ++
>   target/riscv/insn32.decode                  | 10 +++-
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 30 +++++++++++
>   target/riscv/op_helper.c                    | 55 +++++++++++++++++++++
>   target/riscv/translate.c                    |  1 +
>   7 files changed, 104 insertions(+), 1 deletion(-)
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
> index 48f918b71b..c5053e9446 100644
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
> @@ -123,6 +124,60 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
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
> +    /*
> +     * Check for virtual instruction exceptions first, as we don't see
> +     * VU and VS reflected in env->priv (these are just the translated
> +     * U and S stated with virtualisation enabled.
> +     */
> +    if (riscv_cpu_virt_enabled(env) &&
> +        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
> +         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
> +    }

Check of (env->priv < PRV_M) && !get_field(env->menvcfg, envbits) should 
be put before upper check.

Illegal instruction exception should be triggered if (env->priv < PRV_M) 
&& !get_field(env->menvcfg, envbits).

However, virtual instruction exception may be triggered if we do upper 
check firstly.

Regards,

Weiwei Li

> +
> +    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) ||
> +        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> +    }
> +#endif
> +}
> +
> +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uintptr_t ra = GETPC();
> +    uint16_t cbozlen;
> +    void *mem;
> +
> +    check_zicbo_envcfg(env, MENVCFG_CBZE, ra);
> +
> +    /* Get the size of the cache block for zero instructions. */
> +    cbozlen = cpu->cfg.cboz_blocksize;
> +
> +    /* Mask off low-bits to align-down to the cache-block. */
> +    address &= ~(cbozlen - 1);
> +
> +    mem = tlb_vaddr_to_host(env, address, MMU_DATA_STORE,
> +                            cpu_mmu_index(env, false));
> +
> +    if (likely(mem)) {
> +        /* Zero the block */
> +        memset(mem, 0, cbozlen);
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


