Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEY5-0003qH-Hq
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYEY2-0003lm-OZ; Wed, 06 Oct 2021 17:33:59 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYEY0-0003FS-WB; Wed, 06 Oct 2021 17:33:58 -0400
Received: by mail-il1-x132.google.com with SMTP id j2so4266671ilo.10;
 Wed, 06 Oct 2021 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HGRiIuJM7xYb3tv7DWrv8cBPYp4kL+yoync+/010XVI=;
 b=Y2JV4NDaAtLw/KBsSmHnS94hql29ocsOGSjSch36ab6XUIjP4zgtFNIxYuyhJkCPoH
 UhfH43MrvKpo/vYrxlO83FgJ6RIZoqWdSlmfCHZLaPgwI0phYtKRepOls754w8Q+RRxp
 84S8CXNwCNaE3bMYcpXySwpEygh58hI+Lvbx89d4yMNgQr1+5Yk7HJe03/rIRvpOu01U
 qAfLMUfUxZCY5+Homylc41lXbTguCHTflqBDE+S6A/Hgdw8DIduTAmsQZJ3u0kW+k/DD
 sR9Rroq71AxzKB68jbc1krsLw3D7D5VTqar80i4IF14vEsHC0Xaz3P402lVxWJ4t8hss
 MutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HGRiIuJM7xYb3tv7DWrv8cBPYp4kL+yoync+/010XVI=;
 b=63SMIOCyVGQTg4Cypeuo3DK5DLlTfVBdmRKskyTiajzI/wKcaa0ahQGyApoWXMwjdg
 PeJ1NeP1lBfh+qD17T+4lUDGtJrvJQmtOl5nOAxjr28RB30OrksXXhqk4GRqPQO2IHf6
 qncHwckI0lSO71ZsBNA6rWVAdaF4FgbgFQQMoJdHxaDW6WVrssQKng0xZEO5FpEoLxui
 VbEmpdqN0FOyzc0DTzNQR58vGA2CsSfPabnlsOwSeSPHDJlMb4dKkmKdvoR4Bj0G0s7+
 ZQVjjxUdwOwbpqhUALQbrIdojgTpJSocxrYFp8cDYxvz5uCT0A8bIyQCrTQTzrgK78uz
 bpSA==
X-Gm-Message-State: AOAM530NnTwX4fQhOZogNNRRsUMCBkIRraEHVreHtPMIyv7GVS2By1Rp
 fSHoVsB0jPIkxY16wpfK62UPcT97Pa2s8L/Ncbs=
X-Google-Smtp-Source: ABdhPJysAPqwg+Avjrv0kLUoo9P99vSmJvknFLazRXKykOUVFKAmT5ja/m1gLDp2ZJowEMw74bNX7WlW/vvjRzEHF/Y=
X-Received: by 2002:a05:6e02:15c6:: with SMTP id
 q6mr337253ilu.221.1633556034274; 
 Wed, 06 Oct 2021 14:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211006172307.780893-1-richard.henderson@linaro.org>
 <20211006172307.780893-16-richard.henderson@linaro.org>
In-Reply-To: <20211006172307.780893-16-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Oct 2021 07:33:28 +1000
Message-ID: <CAKmqyKPrLMsPcuf6wr+71jffnaUiapM29UdtiKkmZeiyDEF=dQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/41] linux-user/host/riscv: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Wed, 06 Oct 2021 21:34:00 -0000

On Thu, Oct 7, 2021 at 3:31 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split host_signal_pc and host_signal_write out of user-exec.c.
>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/host/riscv/host-signal.h |  85 +++++++++++++++++-
>  accel/tcg/user-exec.c               | 134 ----------------------------
>  2 files changed, 84 insertions(+), 135 deletions(-)
>
> diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
> index f4b4d65031..5860dce7d7 100644
> --- a/linux-user/host/riscv/host-signal.h
> +++ b/linux-user/host/riscv/host-signal.h
> @@ -1 +1,84 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef RISCV_HOST_SIGNAL_H
> +#define RISCV_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.__gregs[REG_PC];
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
> +
> +    /*
> +     * Detect store by reading the instruction at the program
> +     * counter. Note: we currently only generate 32-bit
> +     * instructions so we thus only detect 32-bit stores
> +     */
> +    switch (((insn >> 0) & 0b11)) {
> +    case 3:
> +        switch (((insn >> 2) & 0b11111)) {
> +        case 8:
> +            switch (((insn >> 12) & 0b111)) {
> +            case 0: /* sb */
> +            case 1: /* sh */
> +            case 2: /* sw */
> +            case 3: /* sd */
> +            case 4: /* sq */
> +                return true;
> +            default:
> +                break;
> +            }
> +            break;
> +        case 9:
> +            switch (((insn >> 12) & 0b111)) {
> +            case 2: /* fsw */
> +            case 3: /* fsd */
> +            case 4: /* fsq */
> +                return true;
> +            default:
> +                break;
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +
> +    /* Check for compressed instructions */
> +    switch (((insn >> 13) & 0b111)) {
> +    case 7:
> +        switch (insn & 0b11) {
> +        case 0: /*c.sd */
> +        case 2: /* c.sdsp */
> +            return true;
> +        default:
> +            break;
> +        }
> +        break;
> +    case 6:
> +        switch (insn & 0b11) {
> +        case 0: /* c.sw */
> +        case 3: /* c.swsp */
> +            return true;
> +        default:
> +            break;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return false;
> +}
> +
> +#endif
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index fe3a3ce6e2..de8e106b68 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -139,64 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
>      }
>  }
>
> -/*
> - * 'pc' is the host PC at which the exception was raised.
> - * 'address' is the effective address of the memory exception.
> - * 'is_write' is 1 if a write caused the exception and otherwise 0.
> - * 'old_set' is the signal set which should be restored.
> - */
> -static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
> -                                    int is_write, sigset_t *old_set)
> -{
> -    CPUState *cpu = current_cpu;
> -    CPUClass *cc;
> -    unsigned long host_addr = (unsigned long)info->si_addr;
> -    MMUAccessType access_type = adjust_signal_pc(&pc, is_write);
> -    abi_ptr guest_addr;
> -
> -    /* For synchronous signals we expect to be coming from the vCPU
> -     * thread (so current_cpu should be valid) and either from running
> -     * code or during translation which can fault as we cross pages.
> -     *
> -     * If neither is true then something has gone wrong and we should
> -     * abort rather than try and restart the vCPU execution.
> -     */
> -    if (!cpu || !cpu->running) {
> -        printf("qemu:%s received signal outside vCPU context @ pc=0x%"
> -               PRIxPTR "\n",  __func__, pc);
> -        abort();
> -    }
> -
> -#if defined(DEBUG_SIGNAL)
> -    printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
> -           pc, host_addr, is_write, *(unsigned long *)old_set);
> -#endif
> -
> -    /* Convert forcefully to guest address space, invalid addresses
> -       are still valid segv ones */
> -    guest_addr = h2g_nocheck(host_addr);
> -
> -    /* XXX: locking issue */
> -    if (is_write &&
> -        info->si_signo == SIGSEGV &&
> -        info->si_code == SEGV_ACCERR &&
> -        h2g_valid(host_addr) &&
> -        handle_sigsegv_accerr_write(cpu, old_set, pc, guest_addr)) {
> -        return 1;
> -    }
> -
> -    /*
> -     * There is no way the target can handle this other than raising
> -     * an exception.  Undo signal and retaddr state prior to longjmp.
> -     */
> -    sigprocmask(SIG_SETMASK, old_set, NULL);
> -
> -    cc = CPU_GET_CLASS(cpu);
> -    cc->tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
> -                          MMU_USER_IDX, false, pc);
> -    g_assert_not_reached();
> -}
> -
>  static int probe_access_internal(CPUArchState *env, target_ulong addr,
>                                   int fault_size, MMUAccessType access_type,
>                                   bool nonfault, uintptr_t ra)
> @@ -255,82 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__riscv)
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    greg_t pc = uc->uc_mcontext.__gregs[REG_PC];
> -    uint32_t insn = *(uint32_t *)pc;
> -    int is_write = 0;
> -
> -    /* Detect store by reading the instruction at the program
> -       counter. Note: we currently only generate 32-bit
> -       instructions so we thus only detect 32-bit stores */
> -    switch (((insn >> 0) & 0b11)) {
> -    case 3:
> -        switch (((insn >> 2) & 0b11111)) {
> -        case 8:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 0: /* sb */
> -            case 1: /* sh */
> -            case 2: /* sw */
> -            case 3: /* sd */
> -            case 4: /* sq */
> -                is_write = 1;
> -                break;
> -            default:
> -                break;
> -            }
> -            break;
> -        case 9:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 2: /* fsw */
> -            case 3: /* fsd */
> -            case 4: /* fsq */
> -                is_write = 1;
> -                break;
> -            default:
> -                break;
> -            }
> -            break;
> -        default:
> -            break;
> -        }
> -    }
> -
> -    /* Check for compressed instructions */
> -    switch (((insn >> 13) & 0b111)) {
> -    case 7:
> -        switch (insn & 0b11) {
> -        case 0: /*c.sd */
> -        case 2: /* c.sdsp */
> -            is_write = 1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case 6:
> -        switch (insn & 0b11) {
> -        case 0: /* c.sw */
> -        case 3: /* c.swsp */
> -            is_write = 1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    default:
> -        break;
> -    }
> -
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -#endif
> -
>  /* The softmmu versions of these helpers are in cputlb.c.  */
>
>  uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
> --
> 2.25.1
>
>

