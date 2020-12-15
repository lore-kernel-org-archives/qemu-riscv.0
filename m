Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpAMz-0001k0-2e
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 08:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpAMx-0001jO-0J; Tue, 15 Dec 2020 08:27:59 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:41375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpAMu-0000gN-KT; Tue, 15 Dec 2020 08:27:58 -0500
Received: by mail-yb1-xb41.google.com with SMTP id w127so18912812ybw.8;
 Tue, 15 Dec 2020 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kFfM8CAWbriFXs1uy+TMm57tN9TsmhoKDsX8bj8t/tQ=;
 b=O2u00EcwfHk6vlgdnFmyKitSuKHTzXeXjn/XyhHxIwXZ/AlUt+LZf9rD7+LtFFxKC7
 sp/B4hiu9tz4tzbbNmKkvK0exAgidrceTFMMKgP8v4vfsqMKW9GPN8KRYS347+3lYPha
 Iw0YuQ4pnhEwtUTL02lM6Wn8Xs0MGTUt2x33cygCmSa88mRMpdlqFgPASDL8H/WCwmQ0
 /lAZCkEF3BcfQf08xz8jHA3PsCkW/6elzc8EIpGP8gWCjMVM5SiDqKat4Feu0fWza+Pv
 jkCSo4WjZwSegXQP9op3nZdB99pl52KzXBF2eGmZfUdDYC/wfwp2OpbRO4Uo5e30ETsM
 gdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFfM8CAWbriFXs1uy+TMm57tN9TsmhoKDsX8bj8t/tQ=;
 b=Yi9EexuQ3pBkzYbGakvtrX0c227g3uZ7TTNM0OS8IV6Neu/9wzEs5C4Wi4MC7xxgZl
 H1PkoSv96hMefn41I76EDDvXAJ6Lefh2YI40GcKgBFGne37ni9bzOpkg5IpdnraH5LO2
 MRYmNLMt9424LYJyCIgfgSEzeFeuZiQ9ClPlJwynNVYpBHB4ShMvDr4ccFRNqjrod+ho
 pT0GkDawpNKi/Lv406+Lj568mI4de+s+IdKMDv40zMqDvGLwnjJNufQcWDK8vtLtUoOr
 nYqIpSE2Fckfx3pnjgDWaWC7xSqaGzOvkSjZM+U+KyDNwsOlyusvd8bC5+hZGjxT3CBR
 dUFA==
X-Gm-Message-State: AOAM530dTltanlzopeXQ15SQlC9lEk0ZHyjg6s0NHZPfuGCukPjf/Rmz
 kEkj9YOSEbDZaUkQ9XxlAELpvXeqnORaK9TXZks=
X-Google-Smtp-Source: ABdhPJxBr5ioMzXHOqxad4t2bDVZU+fmcBfPRPYhKA8C1ZjreTRdDI9kZoITdS+WlqzKjcNOrFeBKyhGhPBz7gzPgUM=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr44558412ybs.122.1608038874987; 
 Tue, 15 Dec 2020 05:27:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <8f85e44940d5f4f5f947a92033685531b3df7aea.1607967113.git.alistair.francis@wdc.com>
In-Reply-To: <8f85e44940d5f4f5f947a92033685531b3df7aea.1607967113.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Dec 2020 21:27:42 +0800
Message-ID: <CAEUhbmVs8DyxaCyGhhAT0iGys4Svrrn+rchYshz_PBxnZdYbJQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] target/riscv: csr: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2020 13:27:59 -0000

On Tue, Dec 15, 2020 at 4:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h |   4 +-
>  target/riscv/csr.c      | 176 +++++++++++++++++++++-------------------
>  2 files changed, 92 insertions(+), 88 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 24b24c69c5..1337269ae8 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -437,9 +437,7 @@
>  #define HSTATUS_VGEIN        0x0003F000
>  #define HSTATUS_VTVM         0x00100000
>  #define HSTATUS_VTSR         0x00400000
> -#if defined(TARGET_RISCV64)
> -#define HSTATUS_VSXL        0x300000000
> -#endif
> +#define HSTATUS_VSXL         0x300000000
>
>  #define HSTATUS32_WPRI       0xFF8FF87E
>  #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 93263f8e06..63b818c1dd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -102,44 +102,65 @@ static int ctr(CPURISCVState *env, int csrno)
>                  return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>              }
>              break;
> -#if defined(TARGET_RISCV32)
> -        case CSR_CYCLEH:
> -            if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
> -                get_field(env->mcounteren, HCOUNTEREN_CY)) {
> -                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_TIMEH:
> -            if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
> -                get_field(env->mcounteren, HCOUNTEREN_TM)) {
> -                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_INSTRETH:
> -            if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
> -                get_field(env->mcounteren, HCOUNTEREN_IR)) {
> -                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
> -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
> -                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +        if (riscv_cpu_is_32bit(env)) {
> +            switch (csrno) {
> +            case CSR_CYCLEH:
> +                if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
> +                    get_field(env->mcounteren, HCOUNTEREN_CY)) {
> +                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +                }
> +                break;
> +            case CSR_TIMEH:
> +                if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
> +                    get_field(env->mcounteren, HCOUNTEREN_TM)) {
> +                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +                }
> +                break;
> +            case CSR_INSTRETH:
> +                if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
> +                    get_field(env->mcounteren, HCOUNTEREN_IR)) {
> +                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +                }
> +                break;
> +            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> +                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
> +                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
> +                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +                }
> +                break;
>              }
> -            break;
> -#endif
>          }
>      }
>  #endif
>      return 0;
>  }
>
> +static int ctr32(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_cpu_is_32bit(env)) {
> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return ctr(env, csrno);
> +}
> +
>  #if !defined(CONFIG_USER_ONLY)
>  static int any(CPURISCVState *env, int csrno)
>  {
>      return 0;
>  }
>
> +static int any32(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_cpu_is_32bit(env)) {
> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return any(env, csrno);
> +
> +}
> +
>  static int smode(CPURISCVState *env, int csrno)
>  {
>      return -!riscv_has_ext(env, RVS);
> @@ -161,6 +182,16 @@ static int hmode(CPURISCVState *env, int csrno)
>      return -RISCV_EXCP_ILLEGAL_INST;
>  }
>
> +static int hmode32(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_cpu_is_32bit(env)) {
> +        return 0;
> +    }
> +
> +    return hmode(env, csrno);
> +
> +}
> +
>  static int pmp(CPURISCVState *env, int csrno)
>  {
>      return -!riscv_feature(env, RISCV_FEATURE_PMP);
> @@ -310,7 +341,6 @@ static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
>      return 0;
>  }
>
> -#if defined(TARGET_RISCV32)
>  static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -324,7 +354,6 @@ static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
>  #endif
>      return 0;
>  }
> -#endif /* TARGET_RISCV32 */
>
>  #if defined(CONFIG_USER_ONLY)
>  static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
> @@ -333,13 +362,11 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
>      return 0;
>  }
>
> -#if defined(TARGET_RISCV32)
>  static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = cpu_get_host_ticks() >> 32;
>      return 0;
>  }
> -#endif
>
>  #else /* CONFIG_USER_ONLY */
>
> @@ -355,7 +382,6 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
>      return 0;
>  }
>
> -#if defined(TARGET_RISCV32)
>  static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
> @@ -367,7 +393,6 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>      *val = (env->rdtime_fn(env->rdtime_fn_arg) + delta) >> 32;
>      return 0;
>  }
> -#endif
>
>  /* Machine constants */
>
> @@ -406,19 +431,17 @@ static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
>  static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>
> -#if defined(TARGET_RISCV32)
> -static const char valid_vm_1_10[16] = {
> +static const char valid_vm_1_10_32[16] = {
>      [VM_1_10_MBARE] = 1,
>      [VM_1_10_SV32] = 1
>  };
> -#elif defined(TARGET_RISCV64)
> -static const char valid_vm_1_10[16] = {
> +
> +static const char valid_vm_1_10_64[16] = {
>      [VM_1_10_MBARE] = 1,
>      [VM_1_10_SV39] = 1,
>      [VM_1_10_SV48] = 1,
>      [VM_1_10_SV57] = 1
>  };
> -#endif /* CONFIG_USER_ONLY */
>
>  /* Machine Information Registers */
>  static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
> @@ -441,7 +464,11 @@ static int read_mstatus(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> -    return valid_vm_1_10[vm & 0xf];
> +    if (riscv_cpu_is_32bit(env)) {
> +        return valid_vm_1_10_32[vm & 0xf];
> +    } else {
> +        return valid_vm_1_10_64[vm & 0xf];
> +    }
>  }
>
>  static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
> @@ -459,13 +486,14 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>          MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
>          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
>          MSTATUS_TW;
> -#if defined(TARGET_RISCV64)
> -    /*
> -     * RV32: MPV and GVA are not in mstatus. The current plan is to
> -     * add them to mstatush. For now, we just don't support it.
> -     */
> -    mask |= MSTATUS_MPV | MSTATUS_GVA;
> -#endif
> +
> +    if (!riscv_cpu_is_32bit(env)) {
> +        /*
> +         * RV32: MPV and GVA are not in mstatus. The current plan is to
> +         * add them to mstatush. For now, we just don't support it.
> +         */
> +        mask |= MSTATUS_MPV | MSTATUS_GVA;
> +    }
>
>      mstatus = (mstatus & ~mask) | (val & mask);
>
> @@ -477,7 +505,6 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> -#ifdef TARGET_RISCV32
>  static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->mstatus >> 32;
> @@ -497,7 +524,6 @@ static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
>
>      return 0;
>  }
> -#endif
>
>  static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -895,10 +921,10 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
>  static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->hstatus;
> -#ifdef TARGET_RISCV64
> -    /* We only support 64-bit VSXL */
> -    *val = set_field(*val, HSTATUS_VSXL, 2);
> -#endif
> +    if (!riscv_cpu_is_32bit(env)) {
> +        /* We only support 64-bit VSXL */
> +        *val = set_field(*val, HSTATUS_VSXL, 2);
> +    }
>      /* We only support little endian */
>      *val = set_field(*val, HSTATUS_VSBE, 0);
>      return 0;
> @@ -907,11 +933,9 @@ static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
>  static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
>  {
>      env->hstatus = val;
> -#ifdef TARGET_RISCV64
> -    if (get_field(val, HSTATUS_VSXL) != 2) {
> +    if (!riscv_cpu_is_32bit(env) && get_field(val, HSTATUS_VSXL) != 2) {
>          qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
>      }
> -#endif
>      if (get_field(val, HSTATUS_VSBE) != 0) {
>          qemu_log_mask(LOG_UNIMP, "QEMU does not support big endian guests.");
>      }
> @@ -1053,11 +1077,7 @@ static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>
> -#if defined(TARGET_RISCV32)
> -    *val = env->htimedelta & 0xffffffff;
> -#else
>      *val = env->htimedelta;
> -#endif
>      return 0;
>  }
>
> @@ -1067,15 +1087,14 @@ static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong val)
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>
> -#if defined(TARGET_RISCV32)
> -    env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
> -#else
> -    env->htimedelta = val;
> -#endif
> +    if (riscv_cpu_is_32bit(env)) {
> +        env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
> +    } else {
> +        env->htimedelta = val;
> +    }
>      return 0;
>  }
>
> -#if defined(TARGET_RISCV32)
>  static int read_htimedeltah(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      if (!env->rdtime_fn) {
> @@ -1095,7 +1114,6 @@ static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong val)
>      env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
>      return 0;
>  }
> -#endif
>
>  /* Virtual CSR Registers */
>  static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
> @@ -1374,26 +1392,20 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* User Timers and Counters */
>      [CSR_CYCLE] =               { ctr,  read_instret                        },
>      [CSR_INSTRET] =             { ctr,  read_instret                        },
> -#if defined(TARGET_RISCV32)
> -    [CSR_CYCLEH] =              { ctr,  read_instreth                       },
> -    [CSR_INSTRETH] =            { ctr,  read_instreth                       },
> -#endif
> +    [CSR_CYCLEH] =              { ctr32,  read_instreth                       },
> +    [CSR_INSTRETH] =            { ctr32,  read_instreth                       },

nits: please keep all the right } aligned

>
>      /* In privileged mode, the monitor will have to emulate TIME CSRs only if
>       * rdtime callback is not provided by machine/platform emulation */
>      [CSR_TIME] =                { ctr,  read_time                           },
> -#if defined(TARGET_RISCV32)
> -    [CSR_TIMEH] =               { ctr,  read_timeh                          },
> -#endif
> +    [CSR_TIMEH] =               { ctr32,  read_timeh                          },
>
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
>      [CSR_MCYCLE] =              { any,  read_instret                        },
>      [CSR_MINSTRET] =            { any,  read_instret                        },
> -#if defined(TARGET_RISCV32)
> -    [CSR_MCYCLEH] =             { any,  read_instreth                       },
> -    [CSR_MINSTRETH] =           { any,  read_instreth                       },
> -#endif
> +    [CSR_MCYCLEH] =             { any32,  read_instreth                       },
> +    [CSR_MINSTRETH] =           { any32,  read_instreth                       },
>
>      /* Machine Information Registers */
>      [CSR_MVENDORID] =           { any,  read_zero                           },
> @@ -1410,9 +1422,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTVEC] =               { any,  read_mtvec,       write_mtvec       },
>      [CSR_MCOUNTEREN] =          { any,  read_mcounteren,  write_mcounteren  },
>
> -#if defined(TARGET_RISCV32)
> -    [CSR_MSTATUSH] =            { any,  read_mstatush,    write_mstatush    },
> -#endif
> +    [CSR_MSTATUSH] =            { any32,  read_mstatush,    write_mstatush    },
>
>      [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
>
> @@ -1452,9 +1462,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HGEIP] =               { hmode,   read_hgeip,       write_hgeip      },
>      [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
>      [CSR_HTIMEDELTA] =          { hmode,   read_htimedelta,  write_htimedelta },
> -#if defined(TARGET_RISCV32)
> -    [CSR_HTIMEDELTAH] =         { hmode,   read_htimedeltah, write_htimedeltah},
> -#endif
> +    [CSR_HTIMEDELTAH] =         { hmode32,   read_htimedeltah, write_htimedeltah},
>
>      [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
>      [CSR_VSIP] =                { hmode,   NULL,     NULL,     rmw_vsip       },
> @@ -1477,9 +1485,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =    { ctr,  read_zero          },
>      [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =   { any,  read_zero          },
>      [CSR_MHPMEVENT3    ... CSR_MHPMEVENT31] =     { any,  read_zero          },
> -#if defined(TARGET_RISCV32)
> -    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr,  read_zero          },
> -    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any,  read_zero          },
> -#endif
> +    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr32,  read_zero          },
> +    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any32,  read_zero          },
>  #endif /* !CONFIG_USER_ONLY */
>  };

Otherwise,
Reviewed-by: Bin Meng <bin.meng@windriver.com>

