Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu3Kt-0005nL-Fa
	for mharc-qemu-riscv@gnu.org; Thu, 17 Jun 2021 21:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3Kp-0005kI-90; Thu, 17 Jun 2021 21:30:15 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3Kn-0002G4-GF; Thu, 17 Jun 2021 21:30:15 -0400
Received: by mail-il1-x12d.google.com with SMTP id b14so7087462ilq.7;
 Thu, 17 Jun 2021 18:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4a0L9bStbo0AeqMa5GaxDDr7lZNTTgY0yk0HwS70PE=;
 b=KuLxl/h0M7hhN748DxZX1MtXK/wK+a8GWVCzmUBjNeNjGwOysSBsD+cXKsymCyMnzf
 UpnRL6R/ditYjyuVnYxv9gLqRwg1APe8JSR5IN2KhukXSEejLGctwU7sz3q16MOSQJsS
 eO+J9JqlBYwwTu5bqt6CNkcMiKk8eaZFUbWWmMHOwq+6hy6+6yzmgqGQMOPYLMg81hg3
 pKLnP4P8IM0hSEMpuAOsgrnUhHxjF8CoyMaC/L6i5aE495g3Ljn4PICLtMOBDZNhyZGS
 1Q9UU2SFx5gAT8EF4KW46cqK9dKkZqWu7bI+JsMUQw3oBIQzXDbeaJcjdd2o+VjpTNL1
 UI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4a0L9bStbo0AeqMa5GaxDDr7lZNTTgY0yk0HwS70PE=;
 b=K9lfRuJOCPWgOc0UjRAj+/ra0t7fJYbtjrZkNt3+pG+Gn1P17RXS+1KbEAFcfyBofi
 6RLCuuZ5oG4Gj37cGPGETgPKyxlmeGjiqnQ5XuBxcwhidOh67auly0AHpVJ6+cx0d+hO
 iDRsqYH0Nojb/aaHTx0Cy6B5OwL7/tzHtZxSGV5wb7tHaWMmr6SMj4gCPvsX/s3blt7a
 jKGFSwIHUmYnTLd7rvKmrsMWVXlVB4l87DIqkTVJukOVfHcCO0UANlCu29Afojmq3ltF
 KMyj8ZU5yYcwMCUp+W+n9s/u8qWGswPYEWJCGfiqbq40NUgK7rD13p6o9Kkcp9IodhdU
 65qA==
X-Gm-Message-State: AOAM531UhmzvLRyKeJx/mlyuIrVFA6w2W4Y0RD6FXl7MlOeRFkmERC/H
 tAGwz0VES14DczwpTtyho334smPDYCOGQc+lgdU=
X-Google-Smtp-Source: ABdhPJy9C57UkBSd2IpfzBXOlws8gwYl9alYUKsB0NVQZK+FXhGJJOtXl3hJvvA/+6VXAVCD1f47A+tybO4CHTlBmaE=
X-Received: by 2002:a05:6e02:d51:: with SMTP id
 h17mr5565855ilj.177.1623979811911; 
 Thu, 17 Jun 2021 18:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-17-richard.henderson@linaro.org>
In-Reply-To: <20210616011209.1446045-17-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 11:29:46 +1000
Message-ID: <CAKmqyKPGzPseaCgX+PFVDASH+rvgPDjV3wKkPcLVjpf_+335dQ@mail.gmail.com>
Subject: Re: [PATCH 16/21] linux-user/riscv: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Fri, 18 Jun 2021 01:30:15 -0000

On Wed, Jun 16, 2021 at 11:22 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the rt signal trampoline.
>
> This fixes a bug wrt libgcc fallback unwinding.  It expects
> the stack pointer to point to the siginfo_t, whereas we had
> inexplicably placed our private signal trampoline at the start
> of the signal frame instead of the end.  Now moot because we
> have removed it from the stack frame entirely.
>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/riscv/target_signal.h |  2 ++
>  linux-user/riscv/signal.c        | 22 +++++++++++++---------
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/linux-user/riscv/target_signal.h b/linux-user/riscv/target_signal.h
> index f113ba9a55..3e36fddc9d 100644
> --- a/linux-user/riscv/target_signal.h
> +++ b/linux-user/riscv/target_signal.h
> @@ -15,4 +15,6 @@ typedef struct target_sigaltstack {
>
>  #include "../generic/signal.h"
>
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> +
>  #endif /* RISCV_TARGET_SIGNAL_H */
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index 9405c7fd9a..4086dfa5d5 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -46,7 +46,6 @@ struct target_ucontext {
>  };
>
>  struct target_rt_sigframe {
> -    uint32_t tramp[2]; /* not in kernel, which uses VDSO instead */
>      struct target_siginfo info;
>      struct target_ucontext uc;
>  };
> @@ -104,12 +103,6 @@ static void setup_ucontext(struct target_ucontext *uc,
>      setup_sigcontext(&uc->uc_mcontext, env);
>  }
>
> -static inline void install_sigtramp(uint32_t *tramp)
> -{
> -    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
> -    __put_user(0x00000073, tramp + 1);  /* ecall */
> -}
> -
>  void setup_rt_frame(int sig, struct target_sigaction *ka,
>                      target_siginfo_t *info,
>                      target_sigset_t *set, CPURISCVState *env)
> @@ -126,14 +119,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>
>      setup_ucontext(&frame->uc, env, set);
>      tswap_siginfo(&frame->info, info);
> -    install_sigtramp(frame->tramp);
>
>      env->pc = ka->_sa_handler;
>      env->gpr[xSP] = frame_addr;
>      env->gpr[xA0] = sig;
>      env->gpr[xA1] = frame_addr + offsetof(struct target_rt_sigframe, info);
>      env->gpr[xA2] = frame_addr + offsetof(struct target_rt_sigframe, uc);
> -    env->gpr[xRA] = frame_addr + offsetof(struct target_rt_sigframe, tramp);
> +    env->gpr[xRA] = default_rt_sigreturn;
>
>      return;
>
> @@ -202,3 +194,15 @@ badframe:
>      force_sig(TARGET_SIGSEGV);
>      return 0;
>  }
> +
> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
> +    assert(tramp != NULL);
> +
> +    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
> +    __put_user(0x00000073, tramp + 1);  /* ecall */
> +
> +    default_rt_sigreturn = sigtramp_page;
> +    unlock_user(tramp, sigtramp_page, 8);
> +}
> --
> 2.25.1
>
>

