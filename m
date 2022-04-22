Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhhFs-0003lS-Gi
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 20:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhhFr-0003lF-Fn; Thu, 21 Apr 2022 20:34:35 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhhFp-0004ii-Fd; Thu, 21 Apr 2022 20:34:35 -0400
Received: by mail-io1-xd2e.google.com with SMTP id z19so2506376iof.12;
 Thu, 21 Apr 2022 17:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=amuhzqMnQs86kjPrC1ovZlx0KU56oQYX2hp9oDU/moA=;
 b=NY5+LWtszqQ89esRxQf9Jw47lkxgNCJijPwyDy/aON5gJA530RTHyhvBQt1TJimRTg
 ZOQYRgBBJF13V/LYZbHgEAO6e8yrGX6vm7+NnGiJJvM9Z6GLASy8KUCnBu7J/Vj2yZqo
 Hm68+t3y5lO2sUCK6pLx0/Rg4lh1DR4xlY7f6EdjdU2yg1xfy19H3OPqN9gQceRpHALL
 XHFB3TLwZr5XbRPbuMznCBlZByKdYCTR2VgQdPuMT37FZ1z+RVjTa+o8l88IaVH1SEZN
 b5COn6VooZSuB+56EHqB9R1sgMSk+bGKNgsVRDyMV+ns9TY/AzZzFWowwaL4wvkJv7L3
 15cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=amuhzqMnQs86kjPrC1ovZlx0KU56oQYX2hp9oDU/moA=;
 b=mjSIflnAZ82tq8XCrcoS8n83f4aZ3OySnmkjEKjUtn6GMDDVIUAnwgqgr8K8FJ9qf+
 +Xc8zLFLhw9JOg82Lh8HHhEifglCn6vH5DPD7pRHUB4OpTUNL4Y17ELTm9mkxL2oA1tQ
 7Eb5dYOJ69LDPppzCXNgMrqbSDaH9vVXsNaQk1dgVKMl8VR7psTZ2YdDaHPBtxzvBiOr
 JwLDFKfo03V7OUs3XpPJc8PoUVfpTEmidl36Cm8nQW85X+3gRdn1HpJ6NA2ag9AAHFt2
 9uP2zt4CfQR6pqvvlLN9wEYPMdqA1ZZOcRCc507YDEEuEKlbqR40J4oMw+jFQZvUQbJ4
 qZPg==
X-Gm-Message-State: AOAM5329KiYpYQX0yjz3MLNlptvnquwlEsKdyxvBUqYAJ6pLxLV6E7EM
 hH8H54i2GTlisLuRevnXH4TXvMe354kChWDfEss=
X-Google-Smtp-Source: ABdhPJz+s9jy35bS81EgLv8ELqj+/xXiKCR0rzG5lU2wprd699h8B/4V9fA+2CcZVmd7X8W8FmpzMkwIWTPOwwblrz0=
X-Received: by 2002:a05:6638:480a:b0:326:8244:3a1f with SMTP id
 cp10-20020a056638480a00b0032682443a1fmr1073166jab.21.1650587669730; Thu, 21
 Apr 2022 17:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220419014847.9722-1-liweiwei@iscas.ac.cn>
 <20220419014847.9722-13-liweiwei@iscas.ac.cn>
In-Reply-To: <20220419014847.9722-13-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Apr 2022 10:34:03 +1000
Message-ID: <CAKmqyKO_O0Rt6=B__rCH5NAmyHkaiO7wyX28aq53SDwenspUFw@mail.gmail.com>
Subject: Re: [PATCH v11 12/14] target/riscv: rvk: add CSR support for Zkr
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 00:34:35 -0000

On Tue, Apr 19, 2022 at 12:06 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add SEED CSR which must be accessed with a read-write instruction:
>    A read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/CSRRCI
> with uimm=0 will raise an illegal instruction exception.
>  - add USEED, SSEED fields for MSECCFG CSR
>
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h  |  9 +++++
>  target/riscv/csr.c       | 80 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/op_helper.c |  9 +++++
>  target/riscv/pmp.h       |  8 ++--
>  4 files changed, 103 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index bb47cf7e77..d401100f47 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -458,6 +458,9 @@
>  #define CSR_VSPMMASK        0x2c1
>  #define CSR_VSPMBASE        0x2c2
>
> +/* Crypto Extension */
> +#define CSR_SEED            0x015
> +
>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
>  #define MSTATUS_SIE         0x00000002
> @@ -800,4 +803,10 @@ typedef enum RISCVException {
>  #define HVICTL_VALID_MASK                  \
>      (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
>
> +/* seed CSR bits */
> +#define SEED_OPST                        (0b11 << 30)
> +#define SEED_OPST_BIST                   (0b00 << 30)
> +#define SEED_OPST_WAIT                   (0b01 << 30)
> +#define SEED_OPST_ES16                   (0b10 << 30)
> +#define SEED_OPST_DEAD                   (0b11 << 30)
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e10f691a99..865ffb36ce 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -24,6 +24,8 @@
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>  #include "sysemu/cpu-timers.h"
> +#include "qemu/guest-random.h"
> +#include "qapi/error.h"
>
>  /* CSR function table public API */
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
> @@ -301,6 +303,46 @@ static RISCVException debug(CPURISCVState *env, int csrno)
>  }
>  #endif
>
> +static RISCVException seed(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_zkr) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    /*
> +     * With a CSR read-write instruction:
> +     * 1) The seed CSR is always available in machine mode as normal.
> +     * 2) Attempted access to seed from virtual modes VS and VU always raises
> +     * an exception(virtual instruction exception only if mseccfg.sseed=1).
> +     * 3) Without the corresponding access control bit set to 1, any attempted
> +     * access to seed from U, S or HS modes will raise an illegal instruction
> +     * exception.
> +     */
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    } else if (riscv_cpu_virt_enabled(env)) {
> +        if (env->mseccfg & MSECCFG_SSEED) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        } else {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +    } else {
> +        if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
> +            return RISCV_EXCP_NONE;
> +        } else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
> +            return RISCV_EXCP_NONE;
> +        } else {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +    }
> +#else
> +    return RISCV_EXCP_NONE;
> +#endif
> +}
> +
>  /* User Floating-Point CSRs */
>  static RISCVException read_fflags(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
> @@ -3014,6 +3056,41 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>
>  #endif
>
> +/* Crypto Extension */
> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_value,
> +                               target_ulong new_value,
> +                               target_ulong write_mask)
> +{
> +    uint16_t random_v;
> +    Error *random_e = NULL;
> +    int random_r;
> +    target_ulong rval;
> +
> +    random_r = qemu_guest_getrandom(&random_v, 2, &random_e);
> +    if (unlikely(random_r < 0)) {
> +        /*
> +         * Failed, for unknown reasons in the crypto subsystem.
> +         * The best we can do is log the reason and return a
> +         * failure indication to the guest.  There is no reason
> +         * we know to expect the failure to be transitory, so
> +         * indicate DEAD to avoid having the guest spin on WAIT.
> +         */
> +        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
> +                      __func__, error_get_pretty(random_e));
> +        error_free(random_e);
> +        rval = SEED_OPST_DEAD;
> +    } else {
> +        rval = random_v | SEED_OPST_ES16;
> +    }
> +
> +    if (ret_value) {
> +        *ret_value = rval;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /*
>   * riscv_csrrw - read and/or update control and status register
>   *
> @@ -3258,6 +3335,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_TIME]  = { "time",  ctr,   read_time  },
>      [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
>
> +    /* Crypto Extension */
> +    [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
> +
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
>      [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index e0d708091e..3d8443416d 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -39,6 +39,15 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
>
>  target_ulong helper_csrr(CPURISCVState *env, int csr)
>  {
> +    /*
> +     * The seed CSR must be accessed with a read-write instruction. A
> +     * read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/
> +     * CSRRCI with uimm=0 will raise an illegal instruction exception.
> +     */
> +    if (csr == CSR_SEED) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +
>      target_ulong val = 0;
>      RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0, false);
>
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index fcb6b7c467..a8dd797476 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -39,9 +39,11 @@ typedef enum {
>  } pmp_am_t;
>
>  typedef enum {
> -    MSECCFG_MML  = 1 << 0,
> -    MSECCFG_MMWP = 1 << 1,
> -    MSECCFG_RLB  = 1 << 2
> +    MSECCFG_MML   = 1 << 0,
> +    MSECCFG_MMWP  = 1 << 1,
> +    MSECCFG_RLB   = 1 << 2,
> +    MSECCFG_USEED = 1 << 8,
> +    MSECCFG_SSEED = 1 << 9
>  } mseccfg_field_t;
>
>  typedef struct {
> --
> 2.17.1
>
>

