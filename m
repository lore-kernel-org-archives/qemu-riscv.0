Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMasg-0000Tf-MW
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 14:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMasX-0000PR-7q; Wed, 17 Mar 2021 14:26:45 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:38294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMasP-00060i-Ku; Wed, 17 Mar 2021 14:26:44 -0400
Received: by mail-io1-xd2b.google.com with SMTP id k2so240069ioh.5;
 Wed, 17 Mar 2021 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TiXuv/NkAl3p35AOwhp8XviX1iMStiHRzHsQbJjcdzE=;
 b=YH7I6aKpvBevXzkTOZu6aQokcBNRu+0Iey9/uU1dvt9IYPuljg+0SU0v8coKGhv0X8
 UVab4v907qBAorvsq+8wixinsGVjyrvZX84e/9O4eWImQvbwhxFV+hOQ1lguSEfaQvMY
 HOmdC9I+nQWiB+ZCI7Ie4g2Miy4eGgvqaHThG53h1xvj6Iw/af3EoHU9BviqMvaOuCrY
 3ksrRj8C1ni122KAGiKgoQUj/lZSHQnqSM3MCKcAyjy4+LnmHHvfQo592wySOrgKbHc3
 SpqCP64IMEThSpJr+94RvE9FoytAY7fL/CA4xFNV7T824+DCmVI3pww31I2DaGNgzhV0
 vpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TiXuv/NkAl3p35AOwhp8XviX1iMStiHRzHsQbJjcdzE=;
 b=XMKDriYa1QSir4rU5qacJS9D+y6XG+6noZEK+lZ+IAkpIk96OP9CfQO9opmaTTtqEf
 +WmHGkEK+YqrOfvwZwSOW4Y1F6T8X5gIEqgaW0fTi8p8Ie5pmaMCnQoYB57Ew6WjWq+3
 29lMoZkecRjQ14mfHSkkC1TMNe6NJf9U/phWiR4HeupIEsT4djADc3/xCEVN3vhWYhpw
 SaC3W4vnAlxOEbq+/wvy5fnDBlHCdp08rYvqXeG7DMWFrwkcY03FUXD2LfaKKbNh49AE
 F559GPFGiosd5LFucLwzQFnrttlm7ac87Q9DC/ZphDx978qIRKdRtKw4O+RXotL12rD1
 AcKg==
X-Gm-Message-State: AOAM532fhPPae7y9mPEJkKru4RtDalVtrahPM+bU5/bowZiZtPuULJIV
 yktmxfICxvH8m28qcmwOsMZhXDqDu+RrR2Z+Ec4=
X-Google-Smtp-Source: ABdhPJxdyApg1yPWPVspYRmo+m8NYe2YWtuTsnYd6uTr6j9ouy3t/Wq431AfOvbmIqNNd7SMRzA/BCstobt4lzAeabA=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr3809899jal.91.1616005596069; 
 Wed, 17 Mar 2021 11:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210311102924.1400371-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311102924.1400371-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Mar 2021 14:24:58 -0400
Message-ID: <CAKmqyKM-v4okNONFwCQJ+B_U8_mKsPqv7+H9uj6ocDQLoZ-j=g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add proper two-stage lookup exception
 detection
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Wed, 17 Mar 2021 18:26:48 -0000

On Thu, Mar 11, 2021 at 5:29 AM Georg Kotheimer
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
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        |  3 +++
>  target/riscv/cpu_helper.c | 21 ++++++++-------------
>  3 files changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddea8fbeeb..865caddb06 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -358,6 +358,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->pc = env->resetvec;
>  #endif
>      cs->exception_index = EXCP_NONE;
> +    env->two_stage_lookup = false;
>      env->load_res = -1;
>      set_default_nan_mode(1, &env->fp_status);
>  }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb2826a2..1288ff5981 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -131,6 +131,9 @@ struct CPURISCVState {
>
>      target_ulong badaddr;
>      target_ulong guest_phys_fault_addr;
> +    /* Signals whether the current exception occurred with two-stage address
> +       translation active. */
> +    bool two_stage_lookup;
>
>      target_ulong priv_ver;
>      target_ulong vext_ver;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2f43939fb6..2de870d3a3 100644
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
> @@ -1018,4 +1012,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>  #endif
>      cs->exception_index = EXCP_NONE; /* mark handled to qemu */
> +    env->two_stage_lookup = false;
>  }
> --
> 2.30.1
>
>

