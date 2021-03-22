Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOLbg-0006CN-MZ
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 10:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOLbV-00068R-VM; Mon, 22 Mar 2021 10:32:26 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:40627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOLbQ-0005MF-Dn; Mon, 22 Mar 2021 10:32:25 -0400
Received: by mail-io1-xd35.google.com with SMTP id n21so14130403ioa.7;
 Mon, 22 Mar 2021 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UaFL8qr3cH/9JfMJWavGZD8fV59GN9NTydC4WJxqUsU=;
 b=ED0kg/P4I7yRx5vpIbMb9pL+VJO88I5uEf5RAO6O8XaA+vMaGPnDpio/s1gkO1QFay
 ScP33jaxCF6INWGJVPnwtZjRNC7OOvGHoPgL9Bw7LnZSjonMY8Yf0tnDhU22KFM/Mjap
 6Vjm5GdLmO6zkQtYD9Pv5I+E6/gWSqSZ42Uu7xTpm5temBUha5dYEBigbxeKoDK/t8++
 arWmmRzYFP3Q1E12X/yj/JL+9W3hpQzEFGogkgwiRefAfgftV5feazlgtXoFHLsmi9/+
 nthxILqS8tv2x0DalEge6HF9Dblt1oA9rfRKpWwjk4HZWfaP0cpaFLciFem/OIzA7HMy
 cAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UaFL8qr3cH/9JfMJWavGZD8fV59GN9NTydC4WJxqUsU=;
 b=MHuBzfGflezc+q7JzN0n0d8JrardhEOh6rnQFFvSWTs40ORnZltBDzysvL1MVROpH/
 15bGLvHUERQ6w6ABKXebpg4HgZnC1hHVD30OJ2sww/6WLH3Gn4vSGCSS4gl2AFTOEDvM
 o14inmUqoUOMSodtkrWN2WUpVKVCneDSJ4zMtZvSTHPyD4/8lQD8gKHeBCvyEgIzmgwH
 GxNuXSuajmFxDzxlujsi6wGh72TJfm9Nx9rc7WyF/xAfAv6j3JdeC5+TdsS9K80+1QO6
 VqLnXFrB56BbhszNpmIM0Z3IWKDzFPmPskYEyltkiseCW5UdAElthvSTyG0jSxMI7/wB
 IqGQ==
X-Gm-Message-State: AOAM5307qZHrlJjKOiuXm49UTDjjlCCfPx9EqSoGK6op17ptBGjVIjY9
 jJJAYwnzENszZebklWpwp58V/c7AeOqQQ2wyBoEy9E5Vyds=
X-Google-Smtp-Source: ABdhPJwadSJv4F7K8lsPrnfhmP3gNXTK3Iob9FwfuWouEu991p69541PE6ZJ7h5nQkMkX5a9VmZyLbOqMKXufKX75jI=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr45767ion.176.1616423538921;
 Mon, 22 Mar 2021 07:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210319141459.1196741-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210319141459.1196741-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 10:30:23 -0400
Message-ID: <CAKmqyKM__Xk35Ood4R59=ie0f3is8PLXK96eM-YBDNhAzNVfMA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add proper two-stage lookup exception
 detection
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 14:32:27 -0000

On Fri, Mar 19, 2021 at 10:16 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> The current two-stage lookup detection in riscv_cpu_do_interrupt falls
> short of its purpose, as all it checks is whether two-stage address
> translation either via the hypervisor-load store instructions or the
> MPRV feature would be allowed.
>
> What we really need instead is whether two-stage address translation was
> active when the exception was raised. However, in riscv_cpu_do_interrupt
> we do not have the information to reliably detect this. Therefore, when
> we raise a memory fault exception we have to record whether two-stage
> address translation is active.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Unfortunately, I tested the previous version of the patch only against
> the RISC-V softmmu target, not against the linux-user target.
> I modified the patch, so that the two_stage_lookup is neither present
> nor updated for the linux-user target.
>
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        |  4 ++++
>  target/riscv/cpu_helper.c | 21 ++++++++-------------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddea8fbeeb..e8c4455525 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -356,6 +356,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>      env->mcause = 0;
>      env->pc = env->resetvec;
> +    env->two_stage_lookup = false;
>  #endif
>      cs->exception_index = EXCP_NONE;
>      env->load_res = -1;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb2826a2..0a33d387ba 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -213,6 +213,10 @@ struct CPURISCVState {
>      target_ulong satp_hs;
>      uint64_t mstatus_hs;
>
> +    /* Signals whether the current exception occurred with two-stage address
> +       translation active. */
> +    bool two_stage_lookup;
> +
>      target_ulong scounteren;
>      target_ulong mcounteren;
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2f43939fb6..af00728829 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -605,6 +605,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>          g_assert_not_reached();
>      }
>      env->badaddr = address;
> +    env->two_stage_lookup = two_stage;
>  }
>
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> @@ -646,6 +647,8 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>      }
>
>      env->badaddr = addr;
> +    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> +                            riscv_cpu_two_stage_lookup(mmu_idx);
>      riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
>  }
>
> @@ -669,6 +672,8 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>          g_assert_not_reached();
>      }
>      env->badaddr = addr;
> +    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> +                            riscv_cpu_two_stage_lookup(mmu_idx);
>      riscv_raise_exception(env, cs->exception_index, retaddr);
>  }
>  #endif /* !CONFIG_USER_ONLY */
> @@ -910,16 +915,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          /* handle the trap in S-mode */
>          if (riscv_has_ext(env, RVH)) {
>              target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
> -            bool two_stage_lookup = false;
>
> -            if (env->priv == PRV_M ||
> -                (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -                (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
> -                    get_field(env->hstatus, HSTATUS_HU))) {
> -                    two_stage_lookup = true;
> -            }
> -
> -            if ((riscv_cpu_virt_enabled(env) || two_stage_lookup) && write_tval) {
> +            if (env->two_stage_lookup && write_tval) {
>                  /*
>                   * If we are writing a guest virtual address to stval, set
>                   * this to 1. If we are trapping to VS we will set this to 0
> @@ -957,10 +954,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  riscv_cpu_set_force_hs_excep(env, 0);
>              } else {
>                  /* Trap into HS mode */
> -                if (!two_stage_lookup) {
> -                    env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
> -                                             riscv_cpu_virt_enabled(env));
> -                }
> +                env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
>                  htval = env->guest_phys_fault_addr;
>              }
>          }
> @@ -1016,6 +1010,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       * RISC-V ISA Specification.
>       */
>
> +    env->two_stage_lookup = false;
>  #endif
>      cs->exception_index = EXCP_NONE; /* mark handled to qemu */
>  }
> --
> 2.31.0
>
>

