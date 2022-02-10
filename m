Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nICcG-0007bd-D6
	for mharc-qemu-riscv@gnu.org; Thu, 10 Feb 2022 11:48:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nICcE-0007YS-5w
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 11:48:18 -0500
Received: from [2a00:1450:4864:20::336] (port=46975
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nICcA-0002Kp-DJ
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 11:48:17 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so4366656wml.5
 for <qemu-riscv@nongnu.org>; Thu, 10 Feb 2022 08:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UzPj6MQI7ExOveHwWF+jr5ftoa4u9hQI9oxyAMnru8g=;
 b=RNV8vbKYB8kpLytFAHuf3S88mzh2RAqkTIv1cx2bqzhJsAc+AhMnSaOkUzUnBsY4w9
 gGP5xpzvUb+l63xUL0GbUN4M1O964TeYoX4+CBoB0g3Fuqa/dlFlRjCjt7aobGIPG0gS
 onqKcerRhoCkaw+THXbBSC3wv81vBxgxzWryDdWmcTnhUxnpKOKKPUnv6Rxg0leYPCHy
 xvVtaKVCBQoFVItUqP3Jg2MPEUnJpnp98xmsUo5aAOcd5NwgjxPjk4+hR0f8k1INDuMm
 4IbgFtcjOZsFmuKxk4hILlp3RlE2YslIsyEHe1HxWx8vUWDaxz0kYth7KmSsa/XlCGbe
 V6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UzPj6MQI7ExOveHwWF+jr5ftoa4u9hQI9oxyAMnru8g=;
 b=IpCunvKenWZPORV2J2WfPvMr77+VDSrSAz7YihDbRVOqP/X6Bcp3UG0/uDGm8kBTaR
 v11gxFvgEkD3PortOOV/7WayaB//FKC2x90bLUs+VW6lqndl51myVDiIGzHB45/dHSM8
 3BWCWzct1fAo1ZFeph7UBIlPRlZHVZJOCT3isvQfxwUr3DTGOlfXtxiWxlDvSvmD3q4D
 HJKmeq3lkRO7dE1WTraiQ7231E8zMKgQQSlrZq1abJoL7W1xDKQq1XO5KiyJ6+MOF3Mq
 rpqlH1dn1i+EOW/yz66dWDY44pPCJyaSLFyY/f48jFDNxOecCy6e3cFLSfWToVS+f8qN
 iZkg==
X-Gm-Message-State: AOAM531Fip7n+wYOvYRi55MY7oQdZ1YJR0AccXxuQ6Q6mid2+yVOLiIt
 aZ62KdiJz6C16HG2Sj+ZhyqCKaZE2Rc3hiVzNBym0Q==
X-Google-Smtp-Source: ABdhPJxi/oPCzrBzOK3IGifd6Mcd+b/pS9xViikfqK4L5TP/ik8wRWR6QBLlRG/vEpa/TE3i8XRlOJeS1BWL9yH3nBI=
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr2878427wmq.41.1644511691467; 
 Thu, 10 Feb 2022 08:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20220210163449.3859905-1-cmuellner@linux.com>
In-Reply-To: <20220210163449.3859905-1-cmuellner@linux.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 10 Feb 2022 17:48:00 +0100
Message-ID: <CAAeLtUAf-mXKupWuQR6vK3ZfEtyD57sStEDO6VCUS=4LnzGB5A@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Enable Zicbo[m,z,p] instructions
To: Christoph Muellner <cmuellner@linux.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: multipart/alternative; boundary="00000000000033047305d7acb77d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 10 Feb 2022 16:48:18 -0000

--00000000000033047305d7acb77d
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Feb 2022 at 17:34, Christoph Muellner <cmuellner@linux.com>
wrote:

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
>   Priv v1.12 series from github-atishp04/priv_1_12_support_v3
>
> v2:
> - Fix overlapping instruction encoding with LQ instructions
> - Drop CSR related changes and rebase on Priv 1.12 patchset
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>  target/riscv/cpu.c                          |  3 +
>  target/riscv/cpu.h                          |  3 +
>  target/riscv/helper.h                       |  5 ++
>  target/riscv/insn32.decode                  | 16 +++-
>  target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 +++++++++++++
>  target/riscv/op_helper.c                    | 94 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  7 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 39ffb883fc..cbd0a34318 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -764,6 +764,9 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> +    DEFINE_PROP_UINT16("cbozlen", RISCVCPU, cfg.cbozlen, 64),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe80caeec0..7bd2fd26d6 100644
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
> @@ -382,6 +384,7 @@ struct RISCVCPUConfig {
>      char *vext_spec;
>      uint16_t vlen;
>      uint16_t elen;
> +    uint16_t cbozlen;
>      bool mmu;
>      bool pmp;
>      bool epmp;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 72cc2582f4..ef1944da8f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env,
> tl)
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
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc
> b/target/riscv/insn_trans/trans_rvzicbo.c.inc
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
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZICBOM(ctx) do {               \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icbom) {  \
> +        return false;                          \
> +    }                                          \
> +} while (0)
>

The exception semantics seem to be broken here: if Zicbom is not
implemented, but the requirements for lq (i.e. rv128) are satisfied, then
this needs to be passed on to lq: "lq zero, 0(rs1)" is still expected to
raise exceptions based on the permissions for the address at 0(rs1).

There are multiple ways to do this, including:
1) perform a tail-call to trans_lq, in case Zicbom is not enabled (instead
of just returning false);
2) use the table-based dispatch (added for XVentanaCondOps) and hook a
Zicbom disptacher before the RVI dispatcher: if Zicbom then falls through,
the RVI dispatcher would drop into trans_lq;


> +
> +#define REQUIRE_ZICBOZ(ctx) do {               \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icboz) {  \
> +        return false;                          \
> +    }                                          \
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
>   *
>   * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
>   * Copyright (c) 2017-2018 SiFive, Inc.
> + * Copyright (c) 2022      VRULL GmbH
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -114,6 +115,99 @@ target_ulong helper_csrrw_i128(CPURISCVState *env,
> int csr,
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
> +    void* phost;
> +    int ret = TLB_INVALID_MASK;
> +    MMUAccessType access_type = MMU_DATA_LOAD;
> +
> +    while (ret == TLB_INVALID_MASK && access_type <= MMU_INST_FETCH) {
> +        ret = probe_access_flags(env, address, access_type++,
> +                                 cpu_mmu_index(env, false),
> +                                 true, &phost, ra);
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
>  #ifndef CONFIG_USER_ONLY
>
>  target_ulong helper_sret(CPURISCVState *env)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index eaf5a72c81..0ee2ce85ec 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -861,6 +861,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,
> target_ulong pc)
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
>

--00000000000033047305d7acb77d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 10 Feb 2022 at 17:34, Christo=
ph Muellner &lt;<a href=3D"mailto:cmuellner@linux.com">cmuellner@linux.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
he RISC-V base cache management operation ISA extension has been<br>
ratified [1]. This patch adds support for the defined instructions.<br>
<br>
The cmo.prefetch instructions are nops for QEMU (no emulation of the memory=
<br>
hierarchy, no illegal instructions, no permission faults, no traps),<br>
therefore there&#39;s only a comment where they would be decoded.<br>
<br>
The other cbo* instructions are moved into an overlap group to<br>
resolve the overlapping pattern with the LQ instruction.<br>
The cbo.zero zeros a configurable amount of bytes.<br>
Similar to other extensions (e.g. atomic instructions),<br>
the trap behavior is limited such, that only the page permissions<br>
are checked (ignoring other optional protection mechanisms like<br>
PMA or PMP).<br>
<br>
[1] <a href=3D"https://wiki.riscv.org/display/TECH/Recently+Ratified+Extens=
ions" rel=3D"noreferrer" target=3D"_blank">https://wiki.riscv.org/display/T=
ECH/Recently+Ratified+Extensions</a><br>
<br>
v3:<br>
- Enable by default (like zb*)<br>
- Rename flags Zicbo* -&gt; zicbo* (like zb*)<br>
- Rename ext_zicbo* -&gt; ext_icbo* (like ext_icsr)<br>
- Rename trans_zicbo.c.inc -&gt; trans_rvzicbo.c.inc (like all others)<br>
- Simplify prefetch instruction support to a single comment<br>
- Rebase on top of github-alistair23/riscv-to-apply.next plus the<br>
=C2=A0 Priv v1.12 series from github-atishp04/priv_1_12_support_v3<br>
<br>
v2:<br>
- Fix overlapping instruction encoding with LQ instructions<br>
- Drop CSR related changes and rebase on Priv 1.12 patchset<br>
<br>
Co-developed-by: Philipp Tomsich &lt;<a href=3D"mailto:philipp.tomsich@vrul=
l.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;<br>
Signed-off-by: Christoph Muellner &lt;<a href=3D"mailto:cmuellner@linux.com=
" target=3D"_blank">cmuellner@linux.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 16 +++-<br>
=C2=A0target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 +++++++++++++<br>
=C2=A0target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 94 +++++++++++++++++++++<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A07 files changed, 178 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 39ffb883fc..cbd0a34318 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -764,6 +764,9 @@ static Property riscv_cpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCVCPU, cfg.ex=
t_counters, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, cfg.ex=
t_ifencei, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.ext_i=
csr, true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zicbom&quot;, RISCVCPU, cfg.ext_icbom=
, true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zicboz&quot;, RISCVCPU, cfg.ext_icboz=
, true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;cbozlen&quot;, RISCVCPU, cfg.cbozle=
n, 64),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, cfg.ext_zfh=
, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfhmin&quot;, RISCVCPU, cfg.ext_=
zfhmin, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zve32f&quot;, RISCVCPU, cfg.ext_=
zve32f, false),<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index fe80caeec0..7bd2fd26d6 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -368,6 +368,8 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool ext_counters;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_ifencei;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_icsr;<br>
+=C2=A0 =C2=A0 bool ext_icbom;<br>
+=C2=A0 =C2=A0 bool ext_icboz;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zfh;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zfhmin;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zve32f;<br>
@@ -382,6 +384,7 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0char *vext_spec;<br>
=C2=A0 =C2=A0 =C2=A0uint16_t vlen;<br>
=C2=A0 =C2=A0 =C2=A0uint16_t elen;<br>
+=C2=A0 =C2=A0 uint16_t cbozlen;<br>
=C2=A0 =C2=A0 =C2=A0bool mmu;<br>
=C2=A0 =C2=A0 =C2=A0bool pmp;<br>
=C2=A0 =C2=A0 =C2=A0bool epmp;<br>
diff --git a/target/riscv/helper.h b/target/riscv/helper.h<br>
index 72cc2582f4..ef1944da8f 100644<br>
--- a/target/riscv/helper.h<br>
+++ b/target/riscv/helper.h<br>
@@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, =
tl)<br>
=C2=A0DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)<br>
=C2=A0DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)<br>
<br>
+/* Cache-block operations */<br>
+DEF_HELPER_2(cbo_clean_flush, void, env, tl)<br>
+DEF_HELPER_2(cbo_inval, void, env, tl)<br>
+DEF_HELPER_2(cbo_zero, void, env, tl)<br>
+<br>
=C2=A0/* Special functions */<br>
=C2=A0DEF_HELPER_2(csrr, tl, env, int)<br>
=C2=A0DEF_HELPER_3(csrw, void, env, int, tl)<br>
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<br>
index 5bbedc254c..d5f8329970 100644<br>
--- a/target/riscv/insn32.decode<br>
+++ b/target/riscv/insn32.decode<br>
@@ -128,6 +128,7 @@ addi=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =C2=
=A0..... 000 ..... 0010011 @i<br>
=C2=A0slti=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =C2=A0..... 010 ...=
.. 0010011 @i<br>
=C2=A0sltiu=C2=A0 =C2=A0 ............=C2=A0 =C2=A0 =C2=A0..... 011 ..... 00=
10011 @i<br>
=C2=A0xori=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =C2=A0..... 100 ...=
.. 0010011 @i<br>
+# cbo.prefetch_{i,r,m} instructions are ori with rd=3Dx0 and not decoded.<=
br>
=C2=A0ori=C2=A0 =C2=A0 =C2=A0 ............=C2=A0 =C2=A0 =C2=A0..... 110 ...=
.. 0010011 @i<br>
=C2=A0andi=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =C2=A0..... 111 ...=
.. 0010011 @i<br>
=C2=A0slli=C2=A0 =C2=A0 =C2=A000000. ......=C2=A0 =C2=A0 ..... 001 ..... 00=
10011 @sh<br>
@@ -168,7 +169,20 @@ sraw=C2=A0 =C2=A0 =C2=A00100000 .....=C2=A0 ..... 101 =
..... 0111011 @r<br>
<br>
=C2=A0# *** RV128I Base Instruction Set (in addition to RV64I) ***<br>
=C2=A0ldu=C2=A0 =C2=A0 =C2=A0 ............=C2=A0 =C2=A0..... 111 ..... 0000=
011 @i<br>
-lq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 010 ..... 0001=
111 @i<br>
+{<br>
+=C2=A0 [<br>
+=C2=A0 =C2=A0 # *** RV32 Zicbom Standard Extension ***<br>
+=C2=A0 =C2=A0 cbo_clean=C2=A0 0000000 00001 ..... 010 00000 0001111 @sfenc=
e_vm<br>
+=C2=A0 =C2=A0 cbo_flush=C2=A0 0000000 00010 ..... 010 00000 0001111 @sfenc=
e_vm<br>
+=C2=A0 =C2=A0 cbo_inval=C2=A0 0000000 00000 ..... 010 00000 0001111 @sfenc=
e_vm<br>
+<br>
+=C2=A0 =C2=A0 # *** RV32 Zicboz Standard Extension ***<br>
+=C2=A0 =C2=A0 cbo_zero=C2=A0 =C2=A00000000 00100 ..... 010 00000 0001111 @=
sfence_vm<br>
+=C2=A0 ]<br>
+<br>
+=C2=A0 # *** RVI128 lq ***<br>
+=C2=A0 lq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 010 ...=
.. 0001111 @i<br>
+}<br>
=C2=A0sq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 100 .....=
 0100011 @s<br>
=C2=A0addid=C2=A0 =C2=A0 ............=C2=A0 .....=C2=A0 000 ..... 1011011 @=
i<br>
=C2=A0sllid=C2=A0 =C2=A0 000000 ......=C2=A0 ..... 001 ..... 1011011 @sh6<b=
r>
diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/ins=
n_trans/trans_rvzicbo.c.inc<br>
new file mode 100644<br>
index 0000000000..35c277261f<br>
--- /dev/null<br>
+++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc<br>
@@ -0,0 +1,57 @@<br>
+/*<br>
+ * RISC-V translation routines for the RISC-V CBO Extension.<br>
+ *<br>
+ * Copyright (c) 2021 Philipp Tomsich, <a href=3D"mailto:philipp.tomsich@v=
rull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a><br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#define REQUIRE_ZICBOM(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 if (!RISCV_CPU(ctx-&gt;cs)-&gt;cfg.ext_icbom) {=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+} while (0)<br></blockquote><div><br></div><div>The exception semantics se=
em to be broken here: if Zicbom=C2=A0is not implemented, but the requiremen=
ts for lq (i.e. rv128) are satisfied, then this needs to be passed on to lq=
: &quot;lq zero, 0(rs1)&quot; is still expected to raise exceptions based o=
n the permissions for the address at 0(rs1).</div><div><br></div><div>There=
 are multiple ways to do this, including:</div><div>1) perform a tail-call =
to trans_lq, in case Zicbom is not enabled (instead of just returning false=
);</div><div>2) use the table-based dispatch (added for XVentanaCondOps) an=
d hook a Zicbom disptacher=C2=A0before the RVI dispatcher: if Zicbom=C2=A0t=
hen falls through, the RVI dispatcher would drop into trans_lq;</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+#define REQUIRE_ZICBOZ(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 if (!RISCV_CPU(ctx-&gt;cs)-&gt;cfg.ext_icboz) {=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+} while (0)<br>
+<br>
+static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)<br>
+{<br>
+=C2=A0 =C2=A0 REQUIRE_ZICBOM(ctx);<br>
+=C2=A0 =C2=A0 gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a-&gt;rs1]);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)<br>
+{<br>
+=C2=A0 =C2=A0 REQUIRE_ZICBOM(ctx);<br>
+=C2=A0 =C2=A0 gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a-&gt;rs1]);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)<br>
+{<br>
+=C2=A0 =C2=A0 REQUIRE_ZICBOM(ctx);<br>
+=C2=A0 =C2=A0 gen_helper_cbo_inval(cpu_env, cpu_gpr[a-&gt;rs1]);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)<br>
+{<br>
+=C2=A0 =C2=A0 REQUIRE_ZICBOZ(ctx);<br>
+=C2=A0 =C2=A0 gen_helper_cbo_zero(cpu_env, cpu_gpr[a-&gt;rs1]);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
index 1a75ba11e6..21762bc2e0 100644<br>
--- a/target/riscv/op_helper.c<br>
+++ b/target/riscv/op_helper.c<br>
@@ -3,6 +3,7 @@<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2016-2017 Sagar Karandikar, <a href=3D"mailto:sagark=
@eecs.berkeley.edu" target=3D"_blank">sagark@eecs.berkeley.edu</a><br>
=C2=A0 * Copyright (c) 2017-2018 SiFive, Inc.<br>
+ * Copyright (c) 2022=C2=A0 =C2=A0 =C2=A0 VRULL GmbH<br>
=C2=A0 *<br>
=C2=A0 * This program is free software; you can redistribute it and/or modi=
fy it<br>
=C2=A0 * under the terms and conditions of the GNU General Public License,<=
br>
@@ -114,6 +115,99 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int=
 csr,<br>
=C2=A0 =C2=A0 =C2=A0return int128_getlo(rv);<br>
=C2=A0}<br>
<br>
+<br>
+/* helper_zicbo_envcfg<br>
+ *<br>
+ * Raise virtual exceptions and illegal instruction exceptions for<br>
+ * Zicbo[mz] instructions based on the settings of [mhs]envcfg as<br>
+ * specified in section 2.5.1 of the CMO specification.<br>
+ */<br>
+static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t ra)<br>
+{<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 /* Check for virtual instruction exceptions first, as we don=
&#39;t see<br>
+=C2=A0 =C2=A0 =C2=A0* VU and VS reflected in env-&gt;priv (these are just =
the translated<br>
+=C2=A0 =C2=A0 =C2=A0* U and S stated with virtualisation enabled.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (((env-&gt;priv &lt; PRV_H) &amp;&amp; !get_fi=
eld(env-&gt;henvcfg, envbits)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((env-&gt;priv &lt; PRV_S) &amp;&amp; !g=
et_field(env-&gt;senvcfg, envbits)))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_VIRT_INS=
TRUCTION_FAULT, ra);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (((env-&gt;priv &lt; PRV_M) &amp;&amp; !get_field(env-&gt=
;menvcfg, envbits)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((env-&gt;priv &lt; PRV_S) &amp;&amp; !get_fie=
ld(env-&gt;senvcfg, envbits))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_=
INST, ra);<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
+}<br>
+<br>
+/* helper_zicbom_access<br>
+ *<br>
+ * Check access permissions (LOAD, STORE or FETCH as specified in section<=
br>
+ * 2.5.2 of the CMO specification) for Zicbom, raising either store<br>
+ * page-fault (non-virtualised) or store guest-page fault (virtualised).<b=
r>
+ */<br>
+static void helper_zicbom_access(CPURISCVState *env, target_ulong address,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t ra)<br>
+{<br>
+=C2=A0 =C2=A0 void* phost;<br>
+=C2=A0 =C2=A0 int ret =3D TLB_INVALID_MASK;<br>
+=C2=A0 =C2=A0 MMUAccessType access_type =3D MMU_DATA_LOAD;<br>
+<br>
+=C2=A0 =C2=A0 while (ret =3D=3D TLB_INVALID_MASK &amp;&amp; access_type &l=
t;=3D MMU_INST_FETCH) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D probe_access_flags(env, address, acces=
s_type++,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_mmu_index(env, false),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true, &amp;phost, ra);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (ret =3D=3D TLB_INVALID_MASK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t exc =3D RISCV_EXCP_STORE_PAGE_FAULT;<=
br>
+<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* User-mode emulation does not have virtualis=
ation. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc =3D RISCV_EXCP_STORE_GUEST_A=
MO_ACCESS_FAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, exc, ra);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+void helper_cbo_clean_flush(CPURISCVState *env, target_ulong address)<br>
+{<br>
+=C2=A0 =C2=A0 uintptr_t ra =3D GETPC();<br>
+=C2=A0 =C2=A0 helper_zicbo_envcfg(env, MENVCFG_CBCFE, ra);<br>
+=C2=A0 =C2=A0 helper_zicbom_access(env, address, ra);<br>
+}<br>
+<br>
+void helper_cbo_inval(CPURISCVState *env, target_ulong address)<br>
+{<br>
+=C2=A0 =C2=A0 uintptr_t ra =3D GETPC();<br>
+=C2=A0 =C2=A0 helper_zicbo_envcfg(env, MENVCFG_CBIE, ra);<br>
+=C2=A0 =C2=A0 helper_zicbom_access(env, address, ra);<br>
+}<br>
+<br>
+void helper_cbo_zero(CPURISCVState *env, target_ulong address)<br>
+{<br>
+=C2=A0 =C2=A0 uintptr_t ra =3D GETPC();<br>
+=C2=A0 =C2=A0 helper_zicbo_envcfg(env, MENVCFG_CBZE, ra);<br>
+<br>
+=C2=A0 =C2=A0 /* Get the size of the cache block for zero instructions. */=
<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
+=C2=A0 =C2=A0 uint16_t cbozlen =3D cpu-&gt;cfg.cbozlen;<br>
+<br>
+=C2=A0 =C2=A0 /* Mask off low-bits to align-down to the cache-block. */<br=
>
+=C2=A0 =C2=A0 address &amp;=3D ~(cbozlen - 1);<br>
+<br>
+=C2=A0 =C2=A0 void* mem =3D probe_access(env, address, cbozlen, MMU_DATA_S=
TORE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_mmu_index(env, false), GETPC());<br>
+<br>
+=C2=A0 =C2=A0 /* Zero the block */<br>
+=C2=A0 =C2=A0 memset(mem, 0, cbozlen);<br>
+}<br>
+<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
<br>
=C2=A0target_ulong helper_sret(CPURISCVState *env)<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index eaf5a72c81..0ee2ce85ec 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -861,6 +861,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, tar=
get_ulong pc)<br>
=C2=A0#include &quot;insn_trans/trans_rvv.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvb.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvzfh.c.inc&quot;<br>
+#include &quot;insn_trans/trans_rvzicbo.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_privileged.c.inc&quot;<br>
=C2=A0#include &quot;insn_trans/trans_xventanacondops.c.inc&quot;<br>
<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div></div>

--00000000000033047305d7acb77d--

