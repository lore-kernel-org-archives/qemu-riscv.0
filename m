Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxMym-000724-Oo
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 01:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxMyg-00071J-Kf; Tue, 22 Nov 2022 01:41:56 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxMyd-00036k-UB; Tue, 22 Nov 2022 01:41:54 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id a6so13551156vsc.5;
 Mon, 21 Nov 2022 22:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LobYHw507qGRi8H+vg6pkaHa3bKrdYQAtwIyiZM56MA=;
 b=Sf6s0E5/cK043yFN4RSvXIR1Zf34HvlOTseEjICxjt2Jzfh69ciCvVSGTgr+W7ItAK
 TIppno1p43yDkCuGCNe4u5yAQO65qLcH2GlrNjpQh5f0NMn/KBtSZn2Ii7eV6bWZp4/a
 seu8iVR9IqMbCYgz3PjpaCCxS0XXDZV4oRyg/7kzvYYsfy3NSUgitEWMGK13ycDenyyb
 4Xk+DEkkukVK7sNuMi9+t1a8Xrf7XTgdv1Wo7K/9iKbpgFMpiSFRqRAJCf97sGixsfjo
 f9Jv44Xa+lgocc6BlM5ePvHNl0r/+PAjALbW7L+vXldqIsMhfNiZSr2aFipGCpRANTw/
 5gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LobYHw507qGRi8H+vg6pkaHa3bKrdYQAtwIyiZM56MA=;
 b=LIGjPsN6Mut6mWXS8DpcXWqcvtne+yggPkZjPQ4Ti+wPvzepkAdxGVbNUpCEQ448Ai
 P+3tu7AsBB65m4EHhBqoyLdguKgXsnmnLmoj31yUW6c9EHgsO+h3Ync2TC5wgYvUXuTn
 TD8WCPCLxJzYBE/y4BZhBRyUApcqGeawC2f6fng5tBM36wefAIdLfWbAaq0a+VLLcMxW
 8+yKeXR0GIj9DQlXFTw5S1JvY7D8n42IWFB4mGK9mpVUI1CpIoLpXLjUgyhY4ooIauNj
 Z67VlPwOqgqYFLrqaa+0Ztwa7JfANVDyrwlIhwYEfW6axMLip/dXFtxJA11J6MNAi6EP
 PMLA==
X-Gm-Message-State: ANoB5pknl991Iv6nUCj6lTp6un4uIvZ8B3cTRmJKAKxVSjL+8siv4zI1
 weVBy+WAfT6JNTxUoKx8m+C7is+9ij/sM4EugRc=
X-Google-Smtp-Source: AA0mqf5RnAXbNZnaeHTaDVWLPdGzqNepEaql5Y7htrIfoCUAIEhIJTF1YDxhNuytNsQAT+qV0ombFOBwXvPlKcgb1mc=
X-Received: by 2002:a67:fe52:0:b0:3ad:c930:b9bb with SMTP id
 m18-20020a67fe52000000b003adc930b9bbmr3330172vsr.10.1669099310601; Mon, 21
 Nov 2022 22:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20221118123728.49319-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Nov 2022 16:41:23 +1000
Message-ID: <CAKmqyKNF1ik4wXKu7KXTJub=EXm3pYeNZG7x8+6ZHFh4HJuisQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] target/riscv: add support for Zcmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 22 Nov 2022 06:41:56 -0000

On Fri, Nov 18, 2022 at 10:46 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Add encode, trans* functions and helper functions support for Zcmt
> instrutions
> Add support for jvt csr
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                        |  4 ++
>  target/riscv/cpu_bits.h                   |  7 +++
>  target/riscv/csr.c                        | 38 +++++++++++++++-
>  target/riscv/helper.h                     |  3 ++
>  target/riscv/insn16.decode                |  7 ++-
>  target/riscv/insn_trans/trans_rvzce.c.inc | 28 +++++++++++-
>  target/riscv/machine.c                    | 19 ++++++++
>  target/riscv/meson.build                  |  3 +-
>  target/riscv/zce_helper.c                 | 55 +++++++++++++++++++++++
>  9 files changed, 159 insertions(+), 5 deletions(-)
>  create mode 100644 target/riscv/zce_helper.c
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6e915b6937..7bcedc7467 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -181,6 +181,8 @@ struct CPUArchState {
>
>      uint32_t features;
>
> +    target_ulong jvt;
> +
>  #ifdef CONFIG_USER_ONLY
>      uint32_t elf_flags;
>  #endif
> @@ -600,6 +602,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
>                                                   target_ulong new_val,
>                                                   target_ulong write_mask),
>                                     void *rmw_fn_arg);
> +
> +RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
>  #endif
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 8b0d7e20ea..ce347e5575 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -319,6 +319,7 @@
>  #define SMSTATEEN_MAX_COUNT 4
>  #define SMSTATEEN0_CS       (1ULL << 0)
>  #define SMSTATEEN0_FCSR     (1ULL << 1)
> +#define SMSTATEEN0_JVT      (1ULL << 2)
>  #define SMSTATEEN0_HSCONTXT (1ULL << 57)
>  #define SMSTATEEN0_IMSIC    (1ULL << 58)
>  #define SMSTATEEN0_AIA      (1ULL << 59)
> @@ -523,6 +524,9 @@
>  /* Crypto Extension */
>  #define CSR_SEED            0x015
>
> +/* Zcmt Extension */
> +#define CSR_JVT             0x017
> +
>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
>  #define MSTATUS_SIE         0x00000002
> @@ -894,4 +898,7 @@ typedef enum RISCVException {
>  #define MHPMEVENT_IDX_MASK                 0xFFFFF
>  #define MHPMEVENT_SSCOF_RESVD              16
>
> +/* JVT CSR bits */
> +#define JVT_MODE                           0x3F
> +#define JVT_BASE                           (~0x3F)
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8b25f885ec..5115dc882d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -42,8 +42,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>
>  /* Predicates */
>  #if !defined(CONFIG_USER_ONLY)
> -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> -                                       uint64_t bit)
> +RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit)
>  {
>      bool virt = riscv_cpu_virt_enabled(env);
>      CPUState *cs = env_cpu(env);
> @@ -167,6 +166,24 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
>      return ctr(env, csrno);
>  }
>
> +static RISCVException zcmt(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_zcmt) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +#endif
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  #if !defined(CONFIG_USER_ONLY)
>  static RISCVException mctr(CPURISCVState *env, int csrno)
>  {
> @@ -3987,6 +4004,20 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
>      return ret;
>  }
>
> +static RISCVException read_jvt(CPURISCVState *env, int csrno,
> +                               target_ulong *val)
> +{
> +    *val = env->jvt;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_jvt(CPURISCVState *env, int csrno,
> +                                target_ulong val)
> +{
> +    env->jvt = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /* Control and Status Register function table */
>  riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* User Floating-Point CSRs */
> @@ -4024,6 +4055,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* Crypto Extension */
>      [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
>
> +    /* Zcmt Extension */
> +    [CSR_JVT] = {"jvt", zcmt, read_jvt, write_jvt},
> +
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
>      [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 227c7122ef..d979f0bfc4 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1136,3 +1136,6 @@ DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
>
>  DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
>  DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> +
> +/* Zce helper */
> +DEF_HELPER_FLAGS_2(cm_jalt, TCG_CALL_NO_WG, tl, env, i32)
> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
> index 4654c23052..c359c574ab 100644
> --- a/target/riscv/insn16.decode
> +++ b/target/riscv/insn16.decode
> @@ -49,6 +49,7 @@
>  %zcb_h_uimm  5:1                     !function=ex_shift_1
>  %zcmp_spimm  2:2                     !function=ex_shift_4
>  %zcmp_rlist  4:4
> +%zcmt_index  2:8
>
>  # Argument sets imported from insn32.decode:
>  &empty                  !extern
> @@ -63,6 +64,7 @@
>  &r2_s      rs1 rs2      !extern
>
>  &zcmp      zcmp_rlist zcmp_spimm
> +&zcmt      zcmt_index
>
>  # Formats 16:
>  @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
> @@ -106,6 +108,7 @@
>  @zcb_sh       ... . .. ... .. ... ..  &s  imm=%zcb_h_uimm  rs1=%rs1_3 rs2=%rs2_3
>  @zcmp         ... ...  ........   ..  &zcmp  %zcmp_rlist   %zcmp_spimm
>  @cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%sreg2    rs1=%sreg1
> +@zcmt_jt      ... ...  ........   ..  &zcmt  %zcmt_index
>
>  # *** RV32/64C Standard Extension (Quadrant 0) ***
>  {
> @@ -186,7 +189,7 @@ slli              000 .  .....  ..... 10 @c_shift2
>    sq              101  ... ... .. ... 10 @c_sqsp
>    c_fsd           101   ......  ..... 10 @c_sdsp
>
> -  # *** RV64 and RV32 Zcmp Extension ***
> +  # *** RV64 and RV32 Zcmp/Zcmt Extension ***
>    [
>      cm_push         101  11000  .... .. 10 @zcmp
>      cm_pop          101  11010  .... .. 10 @zcmp
> @@ -194,6 +197,8 @@ slli              000 .  .....  ..... 10 @c_shift2
>      cm_popretz      101  11100  .... .. 10 @zcmp
>      cm_mva01s       101  011 ... 11 ... 10 @cm_mv
>      cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
> +
> +    cm_jalt         101  000   ........ 10 @zcmt_jt
>    ]
>  }
>  sw                110 .  .....  ..... 10 @c_swsp
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
> index f647b6ed15..43cbd822c5 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -1,5 +1,5 @@
>  /*
> - * RISC-V translation routines for the Zc[b,mp] Standard Extension.
> + * RISC-V translation routines for the Zc[b,mp,mt] Standard Extension.
>   *
>   * Copyright (c) 2021-2022 PLCT Lab
>   *
> @@ -26,6 +26,11 @@
>          return false;            \
>  } while (0)
>
> +#define REQUIRE_ZCMT(ctx) do {   \
> +    if (!ctx->cfg_ptr->ext_zcmt) \
> +        return false;            \
> +} while (0)
> +
>  static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
>  {
>      REQUIRE_ZCB(ctx);
> @@ -285,3 +290,24 @@ static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
>
>      return true;
>  }
> +
> +static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
> +{
> +    REQUIRE_ZCMT(ctx);
> +
> +    /*
> +     * Update pc to current for the non-unwinding exception
> +     * that might come from cpu_ld*_code() in the helper.
> +     */
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +    gen_helper_cm_jalt(cpu_pc, cpu_env, tcg_constant_i32(a->zcmt_index));
> +
> +    /* c.jt vs c.jalt depends on the index. */
> +    if (a->zcmt_index >= 32) {
> +        gen_set_gpri(ctx, xRA, ctx->pc_succ_insn);
> +    }
> +
> +    tcg_gen_lookup_and_goto_ptr();
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +    return true;
> +}
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 65a8549ec2..ee3a2deab6 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -331,6 +331,24 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
>      }
>  };
>
> +static bool jvt_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +
> +    return cpu->cfg.ext_zcmt;
> +}
> +
> +static const VMStateDescription vmstate_jvt = {
> +    .name = "cpu/jvt",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = jvt_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(env.jvt, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 5,
> @@ -400,6 +418,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_envcfg,
>          &vmstate_debug,
>          &vmstate_smstateen,
> +        &vmstate_jvt,
>          NULL
>      }
>  };
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index ba25164d74..4bf9c9e632 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -18,7 +18,8 @@ riscv_ss.add(files(
>    'bitmanip_helper.c',
>    'translate.c',
>    'm128_helper.c',
> -  'crypto_helper.c'
> +  'crypto_helper.c',
> +  'zce_helper.c'
>  ))
>  riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
>
> diff --git a/target/riscv/zce_helper.c b/target/riscv/zce_helper.c
> new file mode 100644
> index 0000000000..9cec8c19d6
> --- /dev/null
> +++ b/target/riscv/zce_helper.c
> @@ -0,0 +1,55 @@
> +/*
> + * RISC-V Zc* extension Helpers for QEMU.
> + *
> + * Copyright (c) 2021-2022 PLCT Lab
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
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "exec/cpu_ldst.h"
> +
> +target_ulong HELPER(cm_jalt)(CPURISCVState *env, uint32_t index)
> +{
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
> +    if (ret != RISCV_EXCP_NONE) {
> +        riscv_raise_exception(env, ret, 0);
> +    }
> +#endif
> +
> +    target_ulong target;
> +    target_ulong val = env->jvt;
> +    int xlen = riscv_cpu_xlen(env);
> +    uint8_t mode = get_field(val, JVT_MODE);
> +    target_ulong base = get_field(val, JVT_BASE);
> +    target_ulong t0;
> +
> +    if (mode != 0) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, 0);
> +    }
> +
> +    if (xlen == 32) {
> +        t0 = base + (index << 2);
> +        target = cpu_ldl_code(env, t0);
> +    } else {
> +        t0 = base + (index << 3);
> +        target = cpu_ldq_code(env, t0);
> +    }
> +
> +    return target & ~0x1;
> +}
> --
> 2.25.1
>
>

