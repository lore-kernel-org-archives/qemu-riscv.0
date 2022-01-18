Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9gEd-0005Sg-Uj
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gEb-0005Rh-Ri; Mon, 17 Jan 2022 23:36:42 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=34721
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gEa-0005a9-7f; Mon, 17 Jan 2022 23:36:41 -0500
Received: by mail-io1-xd2e.google.com with SMTP id z19so18434686ioj.1;
 Mon, 17 Jan 2022 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FUB2qtagaF7rQwCflGW43XF1DurTsMedNSgPmQ8nfS4=;
 b=XCSsN2rqFhPuv1IlPW0UxUnZWXBcw9ui/l1J1X/5mQEhB4Fgm58Ja+G9A+KjvKG9eS
 qGQwMJtk198qyBZ4MeGJspk5hY45jD0zCGbsQCeQwNMOOTCEPgLZMFmdZnqIqatLWa0T
 5HdRctkGXsyl3Ks0Ra9PEHvwnlIPnJ9MG0wHBcBe4L++2SuGbjXBmKpfcHHus2PWeC3B
 g2POkZ3VvEANseje1g5U/CoEK869HVpTpMRmY488GKODvfB8mdW1YqAiAVE25A1o4J+N
 fkRKCwG6N7g6Gn/XNvz4lL6bmfq7Au37LD3MlctJUTqtJNmZlEp1NrJqbJcS9KptWow5
 qsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FUB2qtagaF7rQwCflGW43XF1DurTsMedNSgPmQ8nfS4=;
 b=KjXB8q03Druc2XirnjuX6/lGC23o8ieKA2N+JCuK3uc0Ro6JP2iOwddJJLC8ACHKN8
 FyOHbUqe+EVby1F+WBe1ffxCOgVQuWurA6C9x+B62qCIoKthNx6ryt0FPbNysxlxYnNt
 c9TFrZJTKOnGoCkgbCGunHTeCI5YFYE1MdF23XjDRe3VdIMQZJV3fihMASiWhYB3NZXA
 GQ7fozoHezQz03r2KStfZdisHISWX0SrVXxr6KAK/bn+pGfV/VQpKSrVc03xmq6ONTv0
 abUUBe1DgbRifnWtJXjL9kZgn9/jiX6hAay4r2vBY26BnI3JobSauAp1xeoc7XOut6fi
 lBaQ==
X-Gm-Message-State: AOAM533zpc2n/R71fDJNz0SMcD9sdUGeNfUH8o9DHmVUbRwEcoEiTThN
 h1zI8zzU9CG71Th5ogFU/2LjmPErICqZq1ZP8tU=
X-Google-Smtp-Source: ABdhPJwbpt+7izZf5ajsYiW8FR0bux76fsX7qWmsZ0intlnYN37h6wJjL1XlH088xBu3gzdfMjIfSnPG4ZwF213R9OI=
X-Received: by 2002:a02:a818:: with SMTP id f24mr11342328jaj.125.1642480593023; 
 Mon, 17 Jan 2022 20:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <20220111035124.9468-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20220111035124.9468-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:36:06 +1000
Message-ID: <CAKmqyKObfKvb4gi1Ap_rBdN+UOGLWfHADQGa_m-mNzi6dG3FYA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] target/riscv: rvk: add CSR support for Zkr
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 04:36:42 -0000

On Tue, Jan 11, 2022 at 1:53 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>    - add SEED CSR
>    - add USEED, SSEED fields for MSECCFG CSR
>
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu_bits.h |  9 +++++
>  target/riscv/csr.c      | 74 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/pmp.h      |  8 +++--
>  3 files changed, 88 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 5a6d49aa64..65c708622b 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -374,6 +374,9 @@
>  #define CSR_VSPMMASK        0x2c1
>  #define CSR_VSPMBASE        0x2c2
>
> +/* Crypto Extension */
> +#define CSR_SEED           0x015
> +
>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
>  #define MSTATUS_SIE         0x00000002
> @@ -628,4 +631,10 @@ typedef enum RISCVException {
>  #define UMTE_U_PM_INSN      U_PM_INSN
>  #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
>
> +/* seed CSR bits */
> +#define SEED_OPST                        (0b11 << 30)
> +#define SEED_OPST_BIST                   (0b00 << 30)
> +#define SEED_OPST_WAIT                   (0b01 << 30)
> +#define SEED_OPST_ES16                   (0b10 << 30)
> +#define SEED_OPST_DEAD                   (0b11 << 30)
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index adb3d4381d..9d93e72f68 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -22,6 +22,8 @@
>  #include "cpu.h"
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
> +#include "qemu/guest-random.h"
> +#include "qapi/error.h"
>
>  /* CSR function table public API */
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
> @@ -222,6 +224,38 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>  }
>  #endif
>
> +/* Predicates */
> +static RISCVException seed(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);

New line between declarations and code please

> +    if (!cpu->cfg.ext_zkr) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +#if !defined(CONFIG_USER_ONLY)
> +    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVH)) {
> +        /* Hypervisor extension is supported */
> +        if (riscv_cpu_virt_enabled(env) && (env->priv != PRV_M)) {
> +            if (env->mseccfg & MSECCFG_SSEED) {
> +                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +            } else {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +        }
> +    }
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    } else if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
> +        return RISCV_EXCP_NONE;
> +    } else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
> +        return RISCV_EXCP_NONE;
> +    } else {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +#else
> +    return RISCV_EXCP_NONE;
> +#endif
> +}
> +
>  /* User Floating-Point CSRs */
>  static RISCVException read_fflags(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
> @@ -1785,6 +1819,39 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>
>  #endif
>
> +/* Crypto Extension */
> +static int read_seed(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = 0;
> +    uint32_t return_status =  SEED_OPST_ES16;

Keep variable declarations first please

> +    *val = (*val) | return_status;
> +    if (return_status == SEED_OPST_ES16) {
> +        uint16_t random_number;
> +        Error *err = NULL;
> +        if (qemu_guest_getrandom(&random_number, sizeof(random_number),
> +                                 &err) < 0) {

You can use qemu_guest_getrandom_nofail() instead and then not worry
about this error handling.



> +            qemu_log_mask(LOG_UNIMP, "Seed: Crypto failure: %s",
> +                          error_get_pretty(err));
> +            error_free(err);
> +            return -1;
> +        }
> +        *val = (*val) | random_number;
> +    } else if (return_status == SEED_OPST_BIST) {
> +        /* Do nothing */
> +    } else if (return_status == SEED_OPST_WAIT) {
> +        /* Do nothing */
> +    } else if (return_status == SEED_OPST_DEAD) {
> +        /* Do nothing */
> +    }
> +    return 0;

RISCV_EXCP_NONE instead of 0

> +}
> +
> +static RISCVException write_seed(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /*
>   * riscv_csrrw - read and/or update control and status register
>   *
> @@ -1823,6 +1890,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    if (!write_mask && (csrno == CSR_SEED)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }

I think it would be better to remove this and use a rmw_*() function
instead. Then the read/write check can happen in the CSR access
function

Look at rmw_mip() for an example of implementing a rmw_*() function.

> +
>      /* ensure the CSR extension is enabled. */
>      if (!cpu->cfg.ext_icsr) {
>          return RISCV_EXCP_ILLEGAL_INST;
> @@ -2011,6 +2082,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_TIME]  = { "time",  ctr,   read_time  },
>      [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
>
> +    /* Crypto Extension */
> +    [CSR_SEED] = { "seed", seed, read_seed, write_seed},
> +
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
>      [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index a9a0b363a7..83135849bb 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -37,9 +37,11 @@ typedef enum {
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

Why are these all being changed?

Alistair

>  } mseccfg_field_t;
>
>  typedef struct {
> --
> 2.17.1
>
>

