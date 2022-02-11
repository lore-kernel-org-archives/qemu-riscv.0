Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nILsP-0007eO-LJ
	for mharc-qemu-riscv@gnu.org; Thu, 10 Feb 2022 21:41:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nILsN-0007dd-42; Thu, 10 Feb 2022 21:41:35 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:42460 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nILsJ-0006xj-2G; Thu, 10 Feb 2022 21:41:34 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAA3PvrHzAViK+ipAA--.57198S2;
 Fri, 11 Feb 2022 10:41:12 +0800 (CST)
Subject: Re: [PATCH v3] target/riscv: Enable Zicbo[m,z,p] instructions
To: Christoph Muellner <cmuellner@linux.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
References: <20220210163449.3859905-1-cmuellner@linux.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <2901768a-7aaa-2288-b971-a2b091a4ff51@iscas.ac.cn>
Date: Fri, 11 Feb 2022 10:41:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220210163449.3859905-1-cmuellner@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAA3PvrHzAViK+ipAA--.57198S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGrWrArWUZryUWw1kJF1UZFb_yoW8JryfCo
 WxCr4xAr4fKr13CF9YkwnrXr17Xw409FZ3Jr4q9r1DWFZ7ZryxZr9rtw4rAa1xtr1fKFW8
 Ja97Xa43Aan5W3s3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYk7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyU
 JVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
 IYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 11 Feb 2022 02:41:35 -0000


在 2022/2/11 上午12:34, Christoph Muellner 写道:
> The RISC-V base cache management operation ISA extension has been
> ratified [1]. This patch adds support for the defined instructions.
>
> The cmo.prefetch instructions are nops for QEMU (no emulation of the memory
> hierarchy, no illegal instructions, no permission faults, no traps),
> therefore there's only a comment where they would be decoded.
>
> The other cbo* instructions are moved into an overlap group to
> resolve the overlapping pattern with the LQ instruction.
> The cbo.zero zeros a configurable amount of bytes.
> Similar to other extensions (e.g. atomic instructions),
> the trap behavior is limited such, that only the page permissions
> are checked (ignoring other optional protection mechanisms like
> PMA or PMP).
>
> [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
>
> v3:
> - Enable by default (like zb*)
> - Rename flags Zicbo* -> zicbo* (like zb*)
> - Rename ext_zicbo* -> ext_icbo* (like ext_icsr)
> - Rename trans_zicbo.c.inc -> trans_rvzicbo.c.inc (like all others)
> - Simplify prefetch instruction support to a single comment
> - Rebase on top of github-alistair23/riscv-to-apply.next plus the
>    Priv v1.12 series from github-atishp04/priv_1_12_support_v3
>
> v2:
> - Fix overlapping instruction encoding with LQ instructions
> - Drop CSR related changes and rebase on Priv 1.12 patchset
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>   target/riscv/cpu.c                          |  3 +
>   target/riscv/cpu.h                          |  3 +
>   target/riscv/helper.h                       |  5 ++
>   target/riscv/insn32.decode                  | 16 +++-
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 +++++++++++++
>   target/riscv/op_helper.c                    | 94 +++++++++++++++++++++
>   target/riscv/translate.c                    |  1 +
>   7 files changed, 178 insertions(+), 1 deletion(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 39ffb883fc..cbd0a34318 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -764,6 +764,9 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> +    DEFINE_PROP_UINT16("cbozlen", RISCVCPU, cfg.cbozlen, 64),
>       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe80caeec0..7bd2fd26d6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,6 +368,8 @@ struct RISCVCPUConfig {
>       bool ext_counters;
>       bool ext_ifencei;
>       bool ext_icsr;
> +    bool ext_icbom;
> +    bool ext_icboz;
>       bool ext_zfh;
>       bool ext_zfhmin;
>       bool ext_zve32f;
> @@ -382,6 +384,7 @@ struct RISCVCPUConfig {
>       char *vext_spec;
>       uint16_t vlen;
>       uint16_t elen;
> +    uint16_t cbozlen;
>       bool mmu;
>       bool pmp;
>       bool epmp;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 72cc2582f4..ef1944da8f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
>   
> +/* Cache-block operations */
> +DEF_HELPER_2(cbo_clean_flush, void, env, tl)
> +DEF_HELPER_2(cbo_inval, void, env, tl)
> +DEF_HELPER_2(cbo_zero, void, env, tl)
> +
>   /* Special functions */
>   DEF_HELPER_2(csrr, tl, env, int)
>   DEF_HELPER_3(csrw, void, env, int, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..d5f8329970 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -128,6 +128,7 @@ addi     ............     ..... 000 ..... 0010011 @i
>   slti     ............     ..... 010 ..... 0010011 @i
>   sltiu    ............     ..... 011 ..... 0010011 @i
>   xori     ............     ..... 100 ..... 0010011 @i
> +# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
>   ori      ............     ..... 110 ..... 0010011 @i
>   andi     ............     ..... 111 ..... 0010011 @i
>   slli     00000. ......    ..... 001 ..... 0010011 @sh
> @@ -168,7 +169,20 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>   
>   # *** RV128I Base Instruction Set (in addition to RV64I) ***
>   ldu      ............   ..... 111 ..... 0000011 @i
> -lq       ............   ..... 010 ..... 0001111 @i
> +{
> +  [
> +    # *** RV32 Zicbom Standard Extension ***
> +    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
> +    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
> +    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
> +
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
> index 0000000000..35c277261f
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> @@ -0,0 +1,57 @@
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
> +#define REQUIRE_ZICBOM(ctx) do {		\
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icbom) {	\
> +        return false;				\
> +    }						\
> +} while (0)
> +
It's better to use ctx->cfg_ptr->ext_icbom instead.
> +#define REQUIRE_ZICBOZ(ctx) do {		\
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icboz) {	\
> +        return false;				\
> +    }						\
> +} while (0)
> +
> +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
> +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
> +static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_inval(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
> +static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
> +{
> +    REQUIRE_ZICBOZ(ctx);
> +    gen_helper_cbo_zero(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 1a75ba11e6..21762bc2e0 100644
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
> @@ -114,6 +115,99 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
>       return int128_getlo(rv);
>   }
>   
> +
> +/* helper_zicbo_envcfg
> + *
> + * Raise virtual exceptions and illegal instruction exceptions for
> + * Zicbo[mz] instructions based on the settings of [mhs]envcfg as
> + * specified in section 2.5.1 of the CMO specification.
> + */
> +static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
> +                                uintptr_t ra)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* Check for virtual instruction exceptions first, as we don't see
> +     * VU and VS reflected in env->priv (these are just the translated
> +     * U and S stated with virtualisation enabled.
> +     */
> +    if (riscv_cpu_virt_enabled(env) &&
> +        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
> +         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
> +    }
> +
> +    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) ||
> +        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> +    }
> +#endif
> +}
> +
> +/* helper_zicbom_access
> + *
> + * Check access permissions (LOAD, STORE or FETCH as specified in section
> + * 2.5.2 of the CMO specification) for Zicbom, raising either store
> + * page-fault (non-virtualised) or store guest-page fault (virtualised).
> + */
> +static void helper_zicbom_access(CPURISCVState *env, target_ulong address,
> +                                 uintptr_t ra)
> +{
> +    void* phost;
> +    int ret = TLB_INVALID_MASK;
> +    MMUAccessType access_type = MMU_DATA_LOAD;
> +
> +    while (ret == TLB_INVALID_MASK && access_type <= MMU_INST_FETCH) {
> +        ret = probe_access_flags(env, address, access_type++,
> +                                 cpu_mmu_index(env, false),
> +                                 true, &phost, ra);

Using probe_access_flags here will make the size of   pmp check for 
final physical address to be zero.

Maybe it's better to use probe_access with cbozlen as size and address 
aligned to cbozlen.


> +    }
> +
> +    if (ret == TLB_INVALID_MASK) {
> +        uint32_t exc = RISCV_EXCP_STORE_PAGE_FAULT;
> +
> +#ifndef CONFIG_USER_ONLY
> +        /* User-mode emulation does not have virtualisation. */
> +        if (riscv_cpu_virt_enabled(env)) {
> +            exc = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
> +        }
> +#endif
> +        riscv_raise_exception(env, exc, ra);

If pmp violation triggers, the exception type should be 
RISCV_EXCP_STORE_AMO_ACCESS_FAULT.

And It seems that not all exception triggered when virtualisation is 
enabled is guest page fault(RISCV_EXCP_STORE_GUEST_*_ACCESS_FAULT) .  
The exception triggered in first stage(G-Stage) is normal page fault.

Regards,

Weiwei Li

> +    }
> +}
> +
> +void helper_cbo_clean_flush(CPURISCVState *env, target_ulong address)
> +{
> +    uintptr_t ra = GETPC();
> +    helper_zicbo_envcfg(env, MENVCFG_CBCFE, ra);
> +    helper_zicbom_access(env, address, ra);
> +}
> +
> +void helper_cbo_inval(CPURISCVState *env, target_ulong address)
> +{
> +    uintptr_t ra = GETPC();
> +    helper_zicbo_envcfg(env, MENVCFG_CBIE, ra);
> +    helper_zicbom_access(env, address, ra);
> +}
> +
> +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> +{
> +    uintptr_t ra = GETPC();
> +    helper_zicbo_envcfg(env, MENVCFG_CBZE, ra);
> +
> +    /* Get the size of the cache block for zero instructions. */
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint16_t cbozlen = cpu->cfg.cbozlen;
> +
> +    /* Mask off low-bits to align-down to the cache-block. */
> +    address &= ~(cbozlen - 1);
> +
> +    void* mem = probe_access(env, address, cbozlen, MMU_DATA_STORE,
> +                             cpu_mmu_index(env, false), GETPC());
> +
> +    /* Zero the block */
> +    memset(mem, 0, cbozlen);
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   
>   target_ulong helper_sret(CPURISCVState *env)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index eaf5a72c81..0ee2ce85ec 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -861,6 +861,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   #include "insn_trans/trans_rvv.c.inc"
>   #include "insn_trans/trans_rvb.c.inc"
>   #include "insn_trans/trans_rvzfh.c.inc"
> +#include "insn_trans/trans_rvzicbo.c.inc"
>   #include "insn_trans/trans_privileged.c.inc"
>   #include "insn_trans/trans_xventanacondops.c.inc"
>   


