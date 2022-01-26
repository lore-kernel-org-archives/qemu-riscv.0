Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCdOT-0001D4-Hh
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jan 2022 03:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCdOJ-0001BF-9H; Wed, 26 Jan 2022 03:11:01 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:34874 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCdMa-00062y-C0; Wed, 26 Jan 2022 03:09:12 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAA3JkGOAfFhuRYAAA--.387S2;
 Wed, 26 Jan 2022 16:08:47 +0800 (CST)
Subject: Re: [PATCH v2] target/riscv: Enable bitmanip Zicbo[m,z,p] instructions
To: Christoph Muellner <cmuellner@linux.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20220124140023.1165850-1-cmuellner@linux.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <d27e6334-14e5-eaa4-836c-0a9cc0b1f34e@iscas.ac.cn>
Date: Wed, 26 Jan 2022 16:08:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124140023.1165850-1-cmuellner@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAA3JkGOAfFhuRYAAA--.387S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGrWrCw43ZFyrur1UtF1UKFg_yoW8JFWxKo
 WxGr4xZrs5Kr13CFn5Cw1UXr17Xr409FZ3Jr4q9r1qgFs7Zr1fGr1Dtws5Jw48Jr1fKrWU
 Ja97JFy5Aa1rW3s3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYC7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 26 Jan 2022 08:11:03 -0000


在 2022/1/24 下午10:00, Christoph Muellner 写道:
> The RISC-V base cache management operation ISA extension has been
> ratified [1]. This patch adds support for the defined instructions.
> Overlap groups are used to resolve the overlapping patterns
> of the prefetch*/ori and cbo_*/lq instructions.
>
> This patch depends on a patchset that introduces the Priv 1.12 CSRs:
> https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg04478.html
>
> [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
>
> v2:
> - Fix overlapping instruction encoding with LQ instructions
> - Drop CSR related changes and rebase on Priv 1.12 patchset
>
> https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg04213.html
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>   target/riscv/cpu.c                        |  4 +
>   target/riscv/cpu.h                        |  4 +
>   target/riscv/cpu_bits.h                   |  5 ++
>   target/riscv/helper.h                     |  5 ++
>   target/riscv/insn32.decode                | 29 +++++++-
>   target/riscv/insn_trans/trans_zicbo.c.inc | 72 ++++++++++++++++++
>   target/riscv/op_helper.c                  | 89 +++++++++++++++++++++++
>   target/riscv/translate.c                  |  1 +
>   8 files changed, 207 insertions(+), 2 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_zicbo.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3cba82e560..0deed67497 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -721,6 +721,10 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> +    DEFINE_PROP_BOOL("Zicbom", RISCVCPU, cfg.ext_zicbom, false),
> +    DEFINE_PROP_BOOL("Zicbop", RISCVCPU, cfg.ext_zicbop, false),
> +    DEFINE_PROP_BOOL("Zicboz", RISCVCPU, cfg.ext_zicboz, false),
> +    DEFINE_PROP_UINT16("cbolen", RISCVCPU, cfg.cbolen, 64),
>       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>       DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 2f678e6c4f..7612a59161 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -354,6 +354,9 @@ struct RISCVCPU {
>           bool ext_zfhmin;
>           bool ext_zve32f;
>           bool ext_zve64f;
> +        bool ext_zicbom;
> +        bool ext_zicbop;
> +        bool ext_zicboz;
>   
>           char *priv_spec;
>           char *user_spec;
> @@ -361,6 +364,7 @@ struct RISCVCPU {
>           char *vext_spec;
>           uint16_t vlen;
>           uint16_t elen;
> +        uint16_t cbolen;
>           bool mmu;
>           bool pmp;
>           bool epmp;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 47ed4d6cab..62c38595d7 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -464,6 +464,11 @@ typedef enum {
>   /* vsstatus CSR bits */
>   #define VSSTATUS64_UXL       0x0000000300000000ULL
>   
> +/* [msh]envcfg CSR bits */
> +#define ENVCFG_CBIE          (0b11 << 4)
> +#define ENVCFG_CBCFE         (1 << 6)
> +#define ENVCFG_CBZE          (1 << 7)
> +
>   /* Privilege modes */
>   #define PRV_U 0
>   #define PRV_S 1
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 72cc2582f4..0e068ac6cd 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
>   DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
>   
> +/* Cache-block operations */
> +DEF_HELPER_2(cbo_inval, void, env, tl)
> +DEF_HELPER_2(cbo_clean, void, env, tl)
> +DEF_HELPER_2(cbo_zero, void, env, tl)
> +
>   /* Special functions */
>   DEF_HELPER_2(csrr, tl, env, int)
>   DEF_HELPER_3(csrw, void, env, int, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..8d86628784 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -89,6 +89,8 @@
>   @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
>   @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
>   
> +@cbo_pref   simm:7 ..... .....   ... ..... ....... %rs1
> +
>   # Formats 64:
>   @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
>   
> @@ -128,7 +130,17 @@ addi     ............     ..... 000 ..... 0010011 @i
>   slti     ............     ..... 010 ..... 0010011 @i
>   sltiu    ............     ..... 011 ..... 0010011 @i
>   xori     ............     ..... 100 ..... 0010011 @i
> -ori      ............     ..... 110 ..... 0010011 @i
> +{
> +  [
> +    # *** RV32 Zicbop Sandard Extension (hints in the ori-space) ***
> +    prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
> +    prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
> +    prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
> +  ]
> +
> +  # *** RV32I ori ***
> +  ori      ............     ..... 110 ..... 0010011 @i
> +}
>   andi     ............     ..... 111 ..... 0010011 @i
>   slli     00000. ......    ..... 001 ..... 0010011 @sh
>   srli     00000. ......    ..... 101 ..... 0010011 @sh
> @@ -168,7 +180,20 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
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
> diff --git a/target/riscv/insn_trans/trans_zicbo.c.inc b/target/riscv/insn_trans/trans_zicbo.c.inc
> new file mode 100644
> index 0000000000..e75f7d99e3
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_zicbo.c.inc
> @@ -0,0 +1,72 @@
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
> +#define REQUIRE_ZICBOM(ctx) do {                 \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zicbom) {   \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
> +#define REQUIRE_ZICBOZ(ctx) do {                 \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zicboz) {   \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
> +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
> +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
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
> +
> +static bool trans_prefetch_i(DisasContext *ctx, arg_prefetch_i *a)
> +{
> +    return true;
> +}
> +

If we add these instructions, maybe we need add REQUIRE_ZICBOP(ctx) here.

> +static bool trans_prefetch_r(DisasContext *ctx, arg_prefetch_i *a)
> +{
> +    return true;
> +}
> +
> +static bool trans_prefetch_w(DisasContext *ctx, arg_prefetch_i *a)
> +{
> +    return true;
> +}
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 1a75ba11e6..3c410358d4 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -3,6 +3,7 @@
>    *
>    * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
>    * Copyright (c) 2017-2018 SiFive, Inc.
> + * Copyright (c) 2021      VRULL GmbH
>    *
>    * This program is free software; you can redistribute it and/or modify it
>    * under the terms and conditions of the GNU General Public License,
> @@ -70,6 +71,33 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
>       return val;
>   }
>   
> +/* helper_zicbo_envcfg
> + *
> + * Raise virtual exceptions and illegal instruction exceptions for
> + * Zicbo[mz] instructions based on the settings of [mhs]envcfg.
> + */
> +static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong envbits)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    target_ulong ra = GETPC();
> +
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
>   target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
>   {
>       Int128 rv = int128_zero();
> @@ -114,6 +142,67 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
>       return int128_getlo(rv);
>   }
>   
> +/* helper_zicbom_access
> + *
> + * Check access permissions (LOAD or STORE or FETCH) for Zicbom,
> + * raising either store page-fault (non-virtualised) or store
> + * guest-page fault (virtualised).
> + */
> +static void helper_zicbom_access(CPURISCVState *env, target_ulong address)
> +{
> +    void* phost;
> +    int ret = TLB_INVALID_MASK;
> +    MMUAccessType access_type = MMU_DATA_LOAD;
> +    target_ulong ra = GETPC();
> +
> +    while (ret == TLB_INVALID_MASK && access_type <= MMU_INST_FETCH) {
> +        ret = probe_access_flags(env, address, access_type++,
> +                                 cpu_mmu_index(env, false),
> +                                 true, &phost, ra);
> +    }
> +

The permission check have been relaxed in the v1.0 spec . So I think 
only do LOAD check is OK here.

> +    if (ret == TLB_INVALID_MASK) {
> +        uint32_t exc = RISCV_EXCP_STORE_PAGE_FAULT;
> +
> +#ifndef CONFIG_USER_ONLY
> +        /* User-mode emulation does not have virtualisation... */
> +        if (riscv_cpu_virt_enabled(env)) {
> +            exc = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
> +        }
> +#endif
> +        riscv_raise_exception(env, exc, ra);
> +    }
> +}
> +

It seems that  current implementation doesn't  take PMP check(access 
fault) into consideration.

Regards,

Weiwei Li

> +void helper_cbo_inval(CPURISCVState *env, target_ulong address)
> +{
> +    helper_zicbo_envcfg(env, ENVCFG_CBIE);
> +    helper_zicbom_access(env, address);
> +
> +    /* We don't emulate the cache-hierarchy, so we're done. */
> +}
> +
> +void helper_cbo_clean(CPURISCVState *env, target_ulong address)
> +{
> +    helper_zicbo_envcfg(env, ENVCFG_CBCFE);
> +    helper_zicbom_access(env, address);
> +
> +    /* We don't emulate the cache-hierarchy, so we're done. */
> +}
> +
> +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> +{
> +    helper_zicbo_envcfg(env, ENVCFG_CBZE);
> +
> +    /* mask off low-bits to align-down to the cache-block */
> +    address &= ~(RISCV_CPU(env)->cfg.cbolen - 1);
> +    void* mem = probe_access(env, address, 4, MMU_DATA_STORE,
> +                             cpu_mmu_index(env, false), GETPC());
> +
> +    /* Zeroize the block */
> +    memset(mem, 0, RISCV_CPU(env)->cfg.cbolen);
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   
>   target_ulong helper_sret(CPURISCVState *env)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f0bbe80875..8f25a6d02f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -854,6 +854,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   #include "insn_trans/trans_rvv.c.inc"
>   #include "insn_trans/trans_rvb.c.inc"
>   #include "insn_trans/trans_rvzfh.c.inc"
> +#include "insn_trans/trans_zicbo.c.inc"
>   #include "insn_trans/trans_privileged.c.inc"
>   
>   /* Include the auto-generated decoder for 16 bit insn */


