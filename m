Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okUxa-00048F-2G
	for mharc-qemu-riscv@gnu.org; Mon, 17 Oct 2022 14:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1okUxY-00045X-Jp
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 14:35:32 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:35364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1okUxV-000477-Kk
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 14:35:32 -0400
Received: by mail-il1-x134.google.com with SMTP id d14so6285552ilf.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Oct 2022 11:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0GIH//E4dIKqMg5h9vTem7jDlTET9lt3mIPEdgi2pH8=;
 b=LVn5eALLzJOhOS5++pTaFpozu0+co/TudRqylkEbeQjf2al3virUKvlyrmMFLpRUOW
 wcX/JWtnZTPFfh6lYc1itH8BX0in9syIlYcQ9hlTnTw/5gcau5fhp0IPkxUcpunJT1Ml
 vCZF+O3w8JNPWn6S24Ee9UybVXr0vW90QttQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GIH//E4dIKqMg5h9vTem7jDlTET9lt3mIPEdgi2pH8=;
 b=F1uw67GNI8Qea0p0PL+SbYYJYQxxE0ahUYDIDTMxzvNNfIJFwnvfXwaaM+FRCtBioE
 2f4bl7a4Gb3omDJWuZ3R/7lLUJRJV/gxXyYEWn1Fx/24rwrVPPbb6hCfsJsZmpf4+RSt
 B+lYtKb9xJbM+03P5C5+MV88YDhAfrXXzSW2i00ji7sPmgBeD6EXPUINzoky+Gl762e7
 E+umXpBofed4NhYqpTQldFEOnTMnsUfPtwm222eMViMtUPnZtEm6qrmSmVJCTSmDRy+U
 O/69QBWxIF5x4LkEVb1ukh7Ljo39hj3uFURYwKt1BJnbFVe4Jsx3ekuHPsvdUKtAalet
 6OFQ==
X-Gm-Message-State: ACrzQf0haBYCOFL1EOBBfys76ZcVEKVn7C0Zoc6zBgUiwi4j49droC2K
 UAgSeCB5t05A0DmA/Zxdu65h7bHsZ46m/m7j5OvS
X-Google-Smtp-Source: AMsMyM5nEQETiDx/GB/bwLb00dv9/S+4Z5DZdzTZh/6wKSc7KwTqFe2ukL1KvH3xnjDA2X4PUh/RaLuQZ+AfTXuWQiY=
X-Received: by 2002:a05:6e02:1bce:b0:2fa:d26f:793f with SMTP id
 x14-20020a056e021bce00b002fad26f793fmr5442620ilv.118.1666031726449; Mon, 17
 Oct 2022 11:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <20220216154839.1024927-3-cmuellner@linux.com>
 <CAAhSdy0FD+7oDpoRgBNvDEUwEHNO2tYYVrM3x2dpQeBMBYtEzw@mail.gmail.com>
In-Reply-To: <CAAhSdy0FD+7oDpoRgBNvDEUwEHNO2tYYVrM3x2dpQeBMBYtEzw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 17 Oct 2022 11:35:15 -0700
Message-ID: <CAOnJCUKqXv7c2L-ShG=CqGfvD_Xk+kCrZJbJ2VqmF2adHoPLdA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/riscv: Enable Zicbo[m,z,p] instructions
To: Anup Patel <anup@brainfault.org>
Cc: Christoph Muellner <cmuellner@linux.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=atishp@atishpatra.org; helo=mail-il1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 17 Oct 2022 18:35:32 -0000

On Wed, Mar 16, 2022 at 1:01 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Feb 16, 2022 at 9:18 PM Christoph Muellner <cmuellner@linux.com> wrote:
> >
> > The RISC-V base cache management operation ISA extension has been
> > ratified. This patch adds support for the defined instructions.
> >
> > The cmo.prefetch instructions are nops for QEMU (no emulation of the memory
> > hierarchy, no illegal instructions, no permission faults, no traps),
> > therefore there's only a comment where they would be decoded.
> >
> > The other cbo* instructions are moved into an overlap group to
> > resolve the overlapping pattern with the LQ instruction.
> > The cbo* instructions perform permission checks and raise exceptions
> > according to the specification.
> >
> > The cache block sizes (for cbom and cboz) are configurable.
> >
> > Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
>
> Can you rebase this series upon Atish's "target/riscv: Add isa extenstion
> strings to the device tree" patch ?
>
> Also, please add cmo extensions in the generated ISA string.
>

I couldn't find a v5. Is this the latest version or did I miss something ?

> Regards,
> Anup
>
> > ---
> >  target/riscv/cpu.c                          |  4 +
> >  target/riscv/cpu.h                          |  4 +
> >  target/riscv/helper.h                       |  5 ++
> >  target/riscv/insn32.decode                  | 16 +++-
> >  target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 ++++++++++++
> >  target/riscv/op_helper.c                    | 97 +++++++++++++++++++++
> >  target/riscv/translate.c                    |  1 +
> >  7 files changed, 183 insertions(+), 1 deletion(-)
> >  create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 39ffb883fc..04500fe352 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -764,6 +764,10 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> > +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> > +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> > +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
> >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index fe80caeec0..5fda1fc7be 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -368,6 +368,8 @@ struct RISCVCPUConfig {
> >      bool ext_counters;
> >      bool ext_ifencei;
> >      bool ext_icsr;
> > +    bool ext_icbom;
> > +    bool ext_icboz;
> >      bool ext_zfh;
> >      bool ext_zfhmin;
> >      bool ext_zve32f;
> > @@ -382,6 +384,8 @@ struct RISCVCPUConfig {
> >      char *vext_spec;
> >      uint16_t vlen;
> >      uint16_t elen;
> > +    uint16_t cbom_blocksize;
> > +    uint16_t cboz_blocksize;
> >      bool mmu;
> >      bool pmp;
> >      bool epmp;
> > diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> > index 72cc2582f4..ef1944da8f 100644
> > --- a/target/riscv/helper.h
> > +++ b/target/riscv/helper.h
> > @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
> >  DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
> >  DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
> >
> > +/* Cache-block operations */
> > +DEF_HELPER_2(cbo_clean_flush, void, env, tl)
> > +DEF_HELPER_2(cbo_inval, void, env, tl)
> > +DEF_HELPER_2(cbo_zero, void, env, tl)
> > +
> >  /* Special functions */
> >  DEF_HELPER_2(csrr, tl, env, int)
> >  DEF_HELPER_3(csrw, void, env, int, tl)
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 5bbedc254c..d5f8329970 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -128,6 +128,7 @@ addi     ............     ..... 000 ..... 0010011 @i
> >  slti     ............     ..... 010 ..... 0010011 @i
> >  sltiu    ............     ..... 011 ..... 0010011 @i
> >  xori     ............     ..... 100 ..... 0010011 @i
> > +# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
> >  ori      ............     ..... 110 ..... 0010011 @i
> >  andi     ............     ..... 111 ..... 0010011 @i
> >  slli     00000. ......    ..... 001 ..... 0010011 @sh
> > @@ -168,7 +169,20 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
> >
> >  # *** RV128I Base Instruction Set (in addition to RV64I) ***
> >  ldu      ............   ..... 111 ..... 0000011 @i
> > -lq       ............   ..... 010 ..... 0001111 @i
> > +{
> > +  [
> > +    # *** RV32 Zicbom Standard Extension ***
> > +    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
> > +    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
> > +    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
> > +
> > +    # *** RV32 Zicboz Standard Extension ***
> > +    cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
> > +  ]
> > +
> > +  # *** RVI128 lq ***
> > +  lq       ............   ..... 010 ..... 0001111 @i
> > +}
> >  sq       ............   ..... 100 ..... 0100011 @s
> >  addid    ............  .....  000 ..... 1011011 @i
> >  sllid    000000 ......  ..... 001 ..... 1011011 @sh6
> > diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> > new file mode 100644
> > index 0000000000..e14754f91d
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> > @@ -0,0 +1,57 @@
> > +/*
> > + * RISC-V translation routines for the RISC-V CBO Extension.
> > + *
> > + * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#define REQUIRE_ZICBOM(ctx) do {       \
> > +    if (!ctx->cfg_ptr->ext_icbom) {    \
> > +        return false;                  \
> > +    }                                  \
> > +} while (0)
> > +
> > +#define REQUIRE_ZICBOZ(ctx) do {       \
> > +    if (!ctx->cfg_ptr->ext_icboz) {    \
> > +        return false;                  \
> > +    }                                  \
> > +} while (0)
> > +
> > +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> > +{
> > +    REQUIRE_ZICBOM(ctx);
> > +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > +
> > +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
> > +{
> > +    REQUIRE_ZICBOM(ctx);
> > +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > +
> > +static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
> > +{
> > +    REQUIRE_ZICBOM(ctx);
> > +    gen_helper_cbo_inval(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > +
> > +static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
> > +{
> > +    REQUIRE_ZICBOZ(ctx);
> > +    gen_helper_cbo_zero(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index 1a75ba11e6..c207cdf29c 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -3,6 +3,7 @@
> >   *
> >   * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> >   * Copyright (c) 2017-2018 SiFive, Inc.
> > + * Copyright (c) 2022      VRULL GmbH
> >   *
> >   * This program is free software; you can redistribute it and/or modify it
> >   * under the terms and conditions of the GNU General Public License,
> > @@ -114,6 +115,102 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
> >      return int128_getlo(rv);
> >  }
> >
> > +
> > +/* helper_zicbo_envcfg
> > + *
> > + * Raise virtual exceptions and illegal instruction exceptions for
> > + * Zicbo[mz] instructions based on the settings of [mhs]envcfg as
> > + * specified in section 2.5.1 of the CMO specification.
> > + */
> > +static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
> > +                                uintptr_t ra)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    /* Check for virtual instruction exceptions first, as we don't see
> > +     * VU and VS reflected in env->priv (these are just the translated
> > +     * U and S stated with virtualisation enabled.
> > +     */
> > +    if (riscv_cpu_virt_enabled(env) &&
> > +        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
> > +         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
> > +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
> > +    }
> > +
> > +    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) ||
> > +        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) {
> > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> > +    }
> > +#endif
> > +}
> > +
> > +/* helper_zicbom_access
> > + *
> > + * Check access permissions (LOAD, STORE or FETCH as specified in section
> > + * 2.5.2 of the CMO specification) for Zicbom, raising either store
> > + * page-fault (non-virtualised) or store guest-page fault (virtualised).
> > + */
> > +static void helper_zicbom_access(CPURISCVState *env, target_ulong address,
> > +                                 uintptr_t ra)
> > +{
> > +    int ret;
> > +    void* phost;
> > +    int mmu_idx = cpu_mmu_index(env, false);
> > +
> > +    /* Get the size of the cache block for management instructions. */
> > +    RISCVCPU *cpu = env_archcpu(env);
> > +    uint16_t cbomlen = cpu->cfg.cbom_blocksize;
> > +
> > +    /* Mask off low-bits to align-down to the cache-block. */
> > +    address &= ~(cbomlen - 1);
> > +
> > +    /* A cache-block management instruction is permitted to access
> > +     * the specified cache block whenever a load instruction, store
> > +     * instruction, or instruction fetch is permitted to access the
> > +     * corresponding physical addresses.
> > +     */
> > +    ret = probe_access_range_flags(env, address, cbomlen, MMU_DATA_LOAD,
> > +                                   mmu_idx, true, &phost, ra);
> > +    if (ret == TLB_INVALID_MASK)
> > +        ret = probe_access_range_flags(env, address, cbomlen, MMU_INST_FETCH,
> > +                                       mmu_idx, true, &phost, ra);
> > +    if (ret == TLB_INVALID_MASK)
> > +        probe_access_range_flags(env, address, cbomlen, MMU_DATA_STORE,
> > +                                 mmu_idx, false, &phost, ra);
> > +}
> > +
> > +void helper_cbo_clean_flush(CPURISCVState *env, target_ulong address)
> > +{
> > +    uintptr_t ra = GETPC();
> > +    helper_zicbo_envcfg(env, MENVCFG_CBCFE, ra);
> > +    helper_zicbom_access(env, address, ra);
> > +}
> > +
> > +void helper_cbo_inval(CPURISCVState *env, target_ulong address)
> > +{
> > +    uintptr_t ra = GETPC();
> > +    helper_zicbo_envcfg(env, MENVCFG_CBIE, ra);
> > +    helper_zicbom_access(env, address, ra);
> > +}
> > +
> > +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> > +{
> > +    uintptr_t ra = GETPC();
> > +    helper_zicbo_envcfg(env, MENVCFG_CBZE, ra);
> > +
> > +    /* Get the size of the cache block for zero instructions. */
> > +    RISCVCPU *cpu = env_archcpu(env);
> > +    uint16_t cbozlen = cpu->cfg.cboz_blocksize;
> > +
> > +    /* Mask off low-bits to align-down to the cache-block. */
> > +    address &= ~(cbozlen - 1);
> > +
> > +    void* mem = probe_access(env, address, cbozlen, MMU_DATA_STORE,
> > +                             cpu_mmu_index(env, false), GETPC());
> > +
> > +    /* Zero the block */
> > +    memset(mem, 0, cbozlen);
> > +}
> > +
> >  #ifndef CONFIG_USER_ONLY
> >
> >  target_ulong helper_sret(CPURISCVState *env)
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index eaf5a72c81..0ee2ce85ec 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -861,6 +861,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
> >  #include "insn_trans/trans_rvv.c.inc"
> >  #include "insn_trans/trans_rvb.c.inc"
> >  #include "insn_trans/trans_rvzfh.c.inc"
> > +#include "insn_trans/trans_rvzicbo.c.inc"
> >  #include "insn_trans/trans_privileged.c.inc"
> >  #include "insn_trans/trans_xventanacondops.c.inc"
> >
> > --
> > 2.35.1
> >
>


-- 
Regards,
Atish

