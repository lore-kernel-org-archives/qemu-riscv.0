Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfZZA-0006YW-LR
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 23:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfZZ7-0006VI-Sc; Tue, 26 Oct 2021 23:25:25 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:39642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfZZ6-0003K0-3N; Tue, 26 Oct 2021 23:25:25 -0400
Received: by mail-io1-xd29.google.com with SMTP id o184so1949952iof.6;
 Tue, 26 Oct 2021 20:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XH/bUTP6/0rYiCA+nCNu6rPUGTDokhp7CNxJAfZHEtE=;
 b=Gyw2tlvJ6WlkupBFDk4gJLFbUA2fO2Z6Vn4VULgmao0etyjAIyTFeUlzS6MI+lciUd
 G7uNaVO19h6KhUYK1q2AbiDq+n/jU4/icsqa0EUpzvHrVc+xZyhe9lPsluknesooQr+l
 AUEOhDbKJ1JRv/+86TWFlkVT4Y3z8tSUzZR/Vq5DlVVngNZHox9HCzkgdNjS5vGrUiNr
 nu9qPk2ftP9Nw1Ko2vTkamJh0un726oUCzYpYU+fnkEGH6JMgDa37O06MeJWiq/G8IMF
 7K5kDSjThY8HI9iTJTcmiaBd5mtJFuwjnAeU2yPDiHa7sf3d4OJPECt/URMp4z6ZhajQ
 faDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XH/bUTP6/0rYiCA+nCNu6rPUGTDokhp7CNxJAfZHEtE=;
 b=Onwj+yApgCdMJEvdhc5u96wlQJG9zL0U1PwORS7oZPwlsm/x+9rGhGqLq99mGnscx4
 NuRYVaMSwD0c/pzhCoGroMuXjrgkltXdy/4t5hMjPiF1r3pD7mupV1Wmv1cPcjPouV0Y
 afkzh6GD4wJDBVFdwbZIGGT4CtEdeee8M51sh+NW7iS8E7uKb8JMpJufX05ryBF6gVLv
 q+lDo/9rHZUAarIu48N06PO6rG9mmCndTEDnHuBeIr1lpND7gFTuGJmp4QBHsQhqDbJ8
 apzOzqVE+gYfHmxnJjN8w00GtnhwiWlPzwILwTeF+pzE1nuUBP5RBIjcOH/B+tAgknuU
 BAkA==
X-Gm-Message-State: AOAM533VScYCIa0QMWE+96T/KrrF6k67kwwe9gRVJyjlzxy6xwd8bVwS
 Kd65DfMQizUvXQ5Y9WJbfHsBa/XOoBngAR8SFBk=
X-Google-Smtp-Source: ABdhPJw8StHgpmVisIvvjqjQvN5I3jftzDL5W88PxkMrGfYq8JjdVQwG59Saqsh4Endgcf8HPL7q+tjnjKIffLjZ6EY=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr18392024jak.18.1635305122160; 
 Tue, 26 Oct 2021 20:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145126.11025-1-josemartins90@gmail.com>
 <20211026145126.11025-3-josemartins90@gmail.com>
In-Reply-To: <20211026145126.11025-3-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Oct 2021 13:24:56 +1000
Message-ID: <CAKmqyKO9-ZyBNGL5Vgh0P_Cr8kOytHTVzexOzo=smv5DdctgJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: remove force HS exception
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Wed, 27 Oct 2021 03:25:26 -0000

On Wed, Oct 27, 2021 at 12:54 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> There is no need to "force an hs exception" as the current privilege
> level, the state of the global ie and of the delegation registers should
> be enough to route the interrupt to the appropriate privilege level in
> riscv_cpu_do_interrupt. The is true for both asynchronous and
> synchronous exceptions, specifically, guest page faults which must be
> hardwired to zero hedeleg. As such the hs_force_except mechanism can be
> removed.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        |  2 --
>  target/riscv/cpu_bits.h   |  6 ------
>  target/riscv/cpu_helper.c | 26 +-------------------------
>  3 files changed, 1 insertion(+), 33 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00..b3205bfee3 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -338,8 +338,6 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> -bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> -void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
>  bool riscv_cpu_two_stage_lookup(int mmu_idx);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7330ff5a19..5c447e1cc5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -410,12 +410,6 @@
>
>  /* Virtulisation Register Fields */
>  #define VIRT_ONOFF          1
> -/* This is used to save state for when we take an exception. If this is set
> - * that means that we want to force a HS level exception (no matter what the
> - * delegation is set to). This will occur for things such as a second level
> - * page table fault.
> - */
> -#define FORCE_HS_EXCEP      2
>
>  /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 55db004fea..59b72262be 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -178,24 +178,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>      env->virt = set_field(env->virt, VIRT_ONOFF, enable);
>  }
>
> -bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
> -{
> -    if (!riscv_has_ext(env, RVH)) {
> -        return false;
> -    }
> -
> -    return get_field(env->virt, FORCE_HS_EXCEP);
> -}
> -
> -void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
> -{
> -    if (!riscv_has_ext(env, RVH)) {
> -        return;
> -    }
> -
> -    env->virt = set_field(env->virt, FORCE_HS_EXCEP, enable);
> -}
> -
>  bool riscv_cpu_two_stage_lookup(int mmu_idx)
>  {
>      return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> @@ -912,7 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> -    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
>      uint64_t s;
>
>      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
> @@ -941,8 +922,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> -            force_hs_execp = true;
> -            /* fallthrough */
>          case RISCV_EXCP_INST_ADDR_MIS:
>          case RISCV_EXCP_INST_ACCESS_FAULT:
>          case RISCV_EXCP_LOAD_ADDR_MIS:
> @@ -1001,8 +980,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
>              }
>
> -            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
> -                !force_hs_execp) {
> +            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
>                  /* Trap to VS mode */
>                  /*
>                   * See if we need to adjust cause. Yes if its VS mode interrupt
> @@ -1024,7 +1002,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  htval = env->guest_phys_fault_addr;
>
>                  riscv_cpu_set_virt_enabled(env, 0);
> -                riscv_cpu_set_force_hs_excep(env, 0);
>              } else {
>                  /* Trap into HS mode */
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
> @@ -1060,7 +1037,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>              /* Trapping to M mode, virt is disabled */
>              riscv_cpu_set_virt_enabled(env, 0);
> -            riscv_cpu_set_force_hs_excep(env, 0);
>          }
>
>          s = env->mstatus;
> --
> 2.33.1
>
>

