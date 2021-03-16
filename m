Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMG6p-0000aa-Kg
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 16:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMG6d-0000Xq-Gf; Tue, 16 Mar 2021 16:16:00 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMG6Y-00007s-NG; Tue, 16 Mar 2021 16:15:55 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id by2so276534qvb.11;
 Tue, 16 Mar 2021 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ih7QjX3pGRLrpCP8+V3hMsMJ8l7+n0RoclBzSNUy2c=;
 b=ESQFk/+bpwPe9S8KPeo+iNtml5ytm3znAXo+XZAbTwP5ZybDE6WKrJA7vAnPx8fvxi
 55jaEXxZP4gvovsSgrKADzwUjvYk1aNTqrA2bJS8zpfuJcK6GvnrJENcuEfEgPWCvwcQ
 xC3yYQTl7JrTWZoUtq1Vplp7vgZ7gS3lsZKzylAVzIbJ8cDiK1Us3mkL1q3exNHLzAnt
 lKdU5XZg5fLSKaWBUQfMBi5vtEtoWd/VoqpxR4B0h3Yw9TvbSENYRD7gWFajICWznh//
 L/F6QpP1uzMPxZf6foOVJwgSwbBF4L93mJ5J89D+xVY0tO/6Eg+UcR7nM7frYrnFz0K/
 HhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ih7QjX3pGRLrpCP8+V3hMsMJ8l7+n0RoclBzSNUy2c=;
 b=lHivwHzOcT9MSyIVxUM/5uNroD4lKmD8z4M187zYfN0wIxs2t7PjmzZ4A0ipLnxcVQ
 au+J0QOQugF9P7SoAEaZFS+D6gy94y6tpKQu34xKgej9m1FZ7XpbIP2kepty1JMCJAyC
 bokagcOFNOld1DY6K4qZ0XBGHcco3eyUbCYbGER4ArXGEfYU8GGrDZzUVS66wsINi0kY
 J9hELFOwNtSEHLa5h2Br6+nK9fP8plUN1VmJmjrUCSFtfTMKb0SeAHEDncbvWkC0vRVv
 NKsNNJhAnsPep68TTgnLtXHXRUtg9/BQD4WNXA2b43iirbAfOJTtHA4EGBXNg7xKhj6f
 PYFA==
X-Gm-Message-State: AOAM532VkIcwN99YWfAnLUt1pyXFI/gByDugsHFQ6MT5sSw+zcER7xAK
 GyamHCbKXYkGOq7rTbqTpawud/8vdxRDessGwQ68GZe6Ze4=
X-Google-Smtp-Source: ABdhPJxIs4SQ/xjEj09DCKkDHKjSDcNpa7uHwEdRjNMuzfjLwgU/7JkVY9NIX+7fWEg1dcLMOlnS/KTUzybb5kJMzBE=
X-Received: by 2002:a05:6214:523:: with SMTP id
 x3mr1268383qvw.27.1615925745128; 
 Tue, 16 Mar 2021 13:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210311102924.1400371-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311102924.1400371-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 16:14:08 -0400
Message-ID: <CAKmqyKN3Ad4AXs4fYNpCVD5xu1vENgCVkv_8s-GSfB0GTZ3Z9w@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add proper two-stage lookup exception
 detection
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=alistair23@gmail.com; helo=mail-qv1-xf2e.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 20:16:00 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

