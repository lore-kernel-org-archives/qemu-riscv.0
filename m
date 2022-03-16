Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUOaU-0003Kq-Pf
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 04:00:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nUOaS-0003KO-U8
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 04:00:52 -0400
Received: from [2a00:1450:4864:20::436] (port=43993
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nUOaP-0007JK-Df
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 04:00:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id a1so343130wrh.10
 for <qemu-riscv@nongnu.org>; Wed, 16 Mar 2022 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tE2wugyIn+HbBBanBsNm07cY2IGv4n73JQZG3bNB2XM=;
 b=TzEicKXKp8TWfY2OtJENCUljWooGASBtlQukp1L+OluK++/HDOEyFmBeQxGVSNUIOa
 2qCjiwik7OOyrvbRuKF1cGCWPd+fPzi9YwEi9K2yfm8Thu86titEIR/2pf362hxqQK0T
 C2NCLzZ5nmAKS35Xx8sxell2TyX7yB2+IPwLgMCf6o7Yon1EdFGHmw24vUCAGklJzfHZ
 +oDbsRWNGZLYsx3wXjthQ6cBrkmi+JCYNTg1WVi+yIdV/T6rXTR4A3px1CrweB3dfCwT
 qYHi+orjLIMgG4/DvRfxi5n50IAskiBGnBAcvNp7PBxlrZ3m6f8ulgCzOVn8zlm8FVj4
 sSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tE2wugyIn+HbBBanBsNm07cY2IGv4n73JQZG3bNB2XM=;
 b=t0D1hTG5xdq+Z38bQqYTuAM36ULVibVmYExFqX+P0qhgScXmbtZZcNnrDamRoHQ2DF
 h3IvXpy7NwDcCz+K/h1tz1x8/o/ytinRFhRNJSHe2CFQ3WhG+5k88o2DRmFeDX3U8CKf
 6G/E9rCEmSD7mwn7KyAtNy4qnMBvFAEnd8U9gZKMQg1BDIYGi+L60kmugtseek6E8DIs
 mweGtB1pYP3Vhh3vHgD2lsWugHckKZlLiF+UW8mg4ytpVf/SNsf31B/xXC3RiUW2WdGA
 Bxk0eTgfbgz94Bxl0oddgugaAlhAO2hZVmCgukPvO7gA5Pox3wobljGctnqwIU2QxRvs
 IgSA==
X-Gm-Message-State: AOAM530p9LD7BuXP4XX+jIpiVNlLeVGxPg0uSgu7N2q5hpANe1vN+UbV
 fEdjeSTwoLTOV+CnB6XSoTUozqyFzRs4N7g14CiPpA==
X-Google-Smtp-Source: ABdhPJys+LUb4PGZGZ2WdHV57gjNuOjb8D8josc20d2XtafylQ2xcowkyhvuvTx36oIAhiv6YqQGPr6gryzGoPoo/Qk=
X-Received: by 2002:adf:bb54:0:b0:203:e244:fbe4 with SMTP id
 x20-20020adfbb54000000b00203e244fbe4mr390650wrg.313.1647417647249; Wed, 16
 Mar 2022 01:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <20220216154839.1024927-3-cmuellner@linux.com>
In-Reply-To: <20220216154839.1024927-3-cmuellner@linux.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Mar 2022 13:30:35 +0530
Message-ID: <CAAhSdy0FD+7oDpoRgBNvDEUwEHNO2tYYVrM3x2dpQeBMBYtEzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/riscv: Enable Zicbo[m,z,p] instructions
To: Christoph Muellner <cmuellner@linux.com>
Cc: Atish Patra <atishp@rivosinc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::436;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Mar 2022 08:00:53 -0000

On Wed, Feb 16, 2022 at 9:18 PM Christoph Muellner <cmuellner@linux.com> wrote:
>
> The RISC-V base cache management operation ISA extension has been
> ratified. This patch adds support for the defined instructions.
>
> The cmo.prefetch instructions are nops for QEMU (no emulation of the memory
> hierarchy, no illegal instructions, no permission faults, no traps),
> therefore there's only a comment where they would be decoded.
>
> The other cbo* instructions are moved into an overlap group to
> resolve the overlapping pattern with the LQ instruction.
> The cbo* instructions perform permission checks and raise exceptions
> according to the specification.
>
> The cache block sizes (for cbom and cboz) are configurable.
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>

Can you rebase this series upon Atish's "target/riscv: Add isa extenstion
strings to the device tree" patch ?

Also, please add cmo extensions in the generated ISA string.

Regards,
Anup

> ---
>  target/riscv/cpu.c                          |  4 +
>  target/riscv/cpu.h                          |  4 +
>  target/riscv/helper.h                       |  5 ++
>  target/riscv/insn32.decode                  | 16 +++-
>  target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 ++++++++++++
>  target/riscv/op_helper.c                    | 97 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  7 files changed, 183 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 39ffb883fc..04500fe352 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -764,6 +764,10 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe80caeec0..5fda1fc7be 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,6 +368,8 @@ struct RISCVCPUConfig {
>      bool ext_counters;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_icbom;
> +    bool ext_icboz;
>      bool ext_zfh;
>      bool ext_zfhmin;
>      bool ext_zve32f;
> @@ -382,6 +384,8 @@ struct RISCVCPUConfig {
>      char *vext_spec;
>      uint16_t vlen;
>      uint16_t elen;
> +    uint16_t cbom_blocksize;
> +    uint16_t cboz_blocksize;
>      bool mmu;
>      bool pmp;
>      bool epmp;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 72cc2582f4..ef1944da8f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
>
> +/* Cache-block operations */
> +DEF_HELPER_2(cbo_clean_flush, void, env, tl)
> +DEF_HELPER_2(cbo_inval, void, env, tl)
> +DEF_HELPER_2(cbo_zero, void, env, tl)
> +
>  /* Special functions */
>  DEF_HELPER_2(csrr, tl, env, int)
>  DEF_HELPER_3(csrw, void, env, int, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..d5f8329970 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -128,6 +128,7 @@ addi     ............     ..... 000 ..... 0010011 @i
>  slti     ............     ..... 010 ..... 0010011 @i
>  sltiu    ............     ..... 011 ..... 0010011 @i
>  xori     ............     ..... 100 ..... 0010011 @i
> +# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
>  ori      ............     ..... 110 ..... 0010011 @i
>  andi     ............     ..... 111 ..... 0010011 @i
>  slli     00000. ......    ..... 001 ..... 0010011 @sh
> @@ -168,7 +169,20 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>
>  # *** RV128I Base Instruction Set (in addition to RV64I) ***
>  ldu      ............   ..... 111 ..... 0000011 @i
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
>  sq       ............   ..... 100 ..... 0100011 @s
>  addid    ............  .....  000 ..... 1011011 @i
>  sllid    000000 ......  ..... 001 ..... 1011011 @sh6
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> new file mode 100644
> index 0000000000..e14754f91d
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
> +#define REQUIRE_ZICBOM(ctx) do {       \
> +    if (!ctx->cfg_ptr->ext_icbom) {    \
> +        return false;                  \
> +    }                                  \
> +} while (0)
> +
> +#define REQUIRE_ZICBOZ(ctx) do {       \
> +    if (!ctx->cfg_ptr->ext_icboz) {    \
> +        return false;                  \
> +    }                                  \
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
> index 1a75ba11e6..c207cdf29c 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -3,6 +3,7 @@
>   *
>   * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
>   * Copyright (c) 2017-2018 SiFive, Inc.
> + * Copyright (c) 2022      VRULL GmbH
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -114,6 +115,102 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
>      return int128_getlo(rv);
>  }
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
> +    int ret;
> +    void* phost;
> +    int mmu_idx = cpu_mmu_index(env, false);
> +
> +    /* Get the size of the cache block for management instructions. */
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint16_t cbomlen = cpu->cfg.cbom_blocksize;
> +
> +    /* Mask off low-bits to align-down to the cache-block. */
> +    address &= ~(cbomlen - 1);
> +
> +    /* A cache-block management instruction is permitted to access
> +     * the specified cache block whenever a load instruction, store
> +     * instruction, or instruction fetch is permitted to access the
> +     * corresponding physical addresses.
> +     */
> +    ret = probe_access_range_flags(env, address, cbomlen, MMU_DATA_LOAD,
> +                                   mmu_idx, true, &phost, ra);
> +    if (ret == TLB_INVALID_MASK)
> +        ret = probe_access_range_flags(env, address, cbomlen, MMU_INST_FETCH,
> +                                       mmu_idx, true, &phost, ra);
> +    if (ret == TLB_INVALID_MASK)
> +        probe_access_range_flags(env, address, cbomlen, MMU_DATA_STORE,
> +                                 mmu_idx, false, &phost, ra);
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
> +    uint16_t cbozlen = cpu->cfg.cboz_blocksize;
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
>  #ifndef CONFIG_USER_ONLY
>
>  target_ulong helper_sret(CPURISCVState *env)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index eaf5a72c81..0ee2ce85ec 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -861,6 +861,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
> +#include "insn_trans/trans_rvzicbo.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>  #include "insn_trans/trans_xventanacondops.c.inc"
>
> --
> 2.35.1
>

