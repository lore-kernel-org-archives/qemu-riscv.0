Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWaS5-0000sf-UF
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 04:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRd-0000jq-4l; Wed, 14 Apr 2021 04:00:17 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRb-0001xj-6R; Wed, 14 Apr 2021 04:00:16 -0400
Received: by mail-yb1-xb31.google.com with SMTP id v3so18810412ybi.1;
 Wed, 14 Apr 2021 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iTO2x5UL2VMxD+9kRQ1j6hbdIUt/Aaad2utv5VuYn0k=;
 b=bMJteFjBZ/0Kf3FK7Fmseo943WMs3K9GgvllRbf625ecBvc2n+jPL7snEikxJfhVsz
 JMuuqLFSSkJ7yvM3GEX0yTaFkaOabI55t7h2IuGUiCQq7UPHRsloSubmtUBjC5epFpTg
 P4mRf8w9SD8ZLDA/PDX9hI3iTZZ8K5EYpppjdlSE2Rj7Dv2VTd6xNU13CaIN/1qtU9yQ
 DjwqX5nHglwf32/m2kz4HtpTL7hryRNpSx18r1xDr4ZxPaLS/xr8H0Ng4pOPtCkXrIR0
 v+sYv9+7VWrjhJvVA+t2phwKquYnjj23IEe8uOs8szG5NtoyiKS1eP9CRP2ofa0Wfp74
 ovWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTO2x5UL2VMxD+9kRQ1j6hbdIUt/Aaad2utv5VuYn0k=;
 b=PUuADZEA5yfXke1SEmstRZEwJRBVO9IODq3MpHXxbT2vQk9i3S+2qWx1z34IZcJFxx
 E22BoiDyoML0cbzoU4zzMJ+kLi/JQu0bIgxjZjwHs22kSqGWLg0Pe3+AYaOHLDR/cwxe
 9GqTlViaGQxk1IzsEvvqakmQ6+HXKtmDcHxZ1XpLb4ilFCbsYPmKbIvcfZO9ffO3XsYr
 v52BnvxiY317pUKq4xzVKbyVJPVUvl0gJZN1dqakJtrcPf7jur5jCicgP8I9qSJZ1yZp
 2WA+s40tXLjj8P1rUIpT7aJAG6xouNARTA1pxgxJHpxmWkZTfByFvNHHSEufLU0hd/fi
 82IQ==
X-Gm-Message-State: AOAM533n3nlEgAKzSixQL8U0uw9hEG94bWvWs+zJ8bh7YdYRv6eCJCnO
 ioxIWiREEdVknOJ4tTnCw+wte8QAouzc5ThOBbM=
X-Google-Smtp-Source: ABdhPJyD2MomR7YpVStvIWML8t53pYt/uwpMAs6SU6L1AiAYXsqChdfWgiT8eCpGIZNBAiF+LdTMa1XjpCH9DqfrOuw=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr23482469ybo.517.1618387213803; 
 Wed, 14 Apr 2021 01:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <ef02611060de1a918f148fef5773a68d336afc16.1618356725.git.alistair.francis@wdc.com>
In-Reply-To: <ef02611060de1a918f148fef5773a68d336afc16.1618356725.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 16:00:01 +0800
Message-ID: <CAEUhbmXocpd=S7X8Qm29Ftk=xhZrpB7+OWTWuQuZr_4q8yE3Kw@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] target/riscv: Remove the hardcoded SATP_MODE macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 08:00:18 -0000

On Wed, Apr 14, 2021 at 7:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h   | 11 -----------
>  target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
>  target/riscv/csr.c        | 20 ++++++++++++++++----
>  target/riscv/monitor.c    | 22 +++++++++++++++++-----
>  4 files changed, 51 insertions(+), 26 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index dd643d0f63..6a816ce9c2 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -452,17 +452,6 @@
>  #define SATP64_ASID         0x0FFFF00000000000ULL
>  #define SATP64_PPN          0x00000FFFFFFFFFFFULL
>
> -#if defined(TARGET_RISCV32)
> -#define SATP_MODE           SATP32_MODE
> -#define SATP_ASID           SATP32_ASID
> -#define SATP_PPN            SATP32_PPN
> -#endif
> -#if defined(TARGET_RISCV64)
> -#define SATP_MODE           SATP64_MODE
> -#define SATP_ASID           SATP64_ASID
> -#define SATP_PPN            SATP64_PPN
> -#endif
> -
>  /* VM modes (mstatus.vm) privileged ISA 1.9.1 */
>  #define VM_1_09_MBARE       0
>  #define VM_1_09_MBB         1
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b065ddb681..e5e9339458 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -403,11 +403,21 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>
>      if (first_stage == true) {
>          if (use_background) {
> -            base = (hwaddr)get_field(env->vsatp, SATP_PPN) << PGSHIFT;
> -            vm = get_field(env->vsatp, SATP_MODE);
> +            if (riscv_cpu_is_32bit(env)) {
> +                base = (hwaddr)get_field(env->vsatp, SATP32_PPN) << PGSHIFT;
> +                vm = get_field(env->vsatp, SATP32_MODE);
> +            } else {
> +                base = (hwaddr)get_field(env->vsatp, SATP64_PPN) << PGSHIFT;
> +                vm = get_field(env->vsatp, SATP64_MODE);
> +            }
>          } else {
> -            base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
> -            vm = get_field(env->satp, SATP_MODE);
> +            if (riscv_cpu_is_32bit(env)) {
> +                base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
> +                vm = get_field(env->satp, SATP32_MODE);
> +            } else {
> +                base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
> +                vm = get_field(env->satp, SATP64_MODE);
> +            }
>          }
>          widened = 0;
>      } else {
> @@ -622,8 +632,10 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>      CPUState *cs = env_cpu(env);
>      int page_fault_exceptions, vm;
>
> -    if (first_stage) {
> -        vm = get_field(env->satp, SATP_MODE);
> +    if (first_stage && riscv_cpu_is_32bit(env)) {
> +        vm = get_field(env->satp, SATP32_MODE);
> +    } else if (first_stage) {
> +        vm = get_field(env->satp, SATP64_MODE);
>      } else if (riscv_cpu_is_32bit(env)) {
>          vm = get_field(env->hgatp, SATP32_MODE);
>      } else {

This block can be simplified by something like this:

    if (riscv_cpu_is_32bit(env))
        stap_mode = SATP32_MODE;
    else
        stap_mode = SATP64_MODE;

    if (first_stage)
        vm = get_field(env->satp, stap_mode);
    else
        vm = get_field(env->hgatp, stap_mode);

> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6052b2d6e9..8abfe33b29 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -927,21 +927,33 @@ static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
>  {
> +    int vm, mask, asid;
> +
>      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>          return 0;
>      }
> -    if (validate_vm(env, get_field(val, SATP_MODE)) &&
> -        ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
> -    {
> +
> +    if (riscv_cpu_is_32bit(env)) {
> +        vm = validate_vm(env, get_field(val, SATP32_MODE));
> +        mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
> +        asid = (val ^ env->satp) & SATP32_ASID;
> +    } else {
> +        vm = validate_vm(env, get_field(val, SATP64_MODE));
> +        mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
> +        asid = (val ^ env->satp) & SATP64_ASID;
> +    }
> +
> +    if (vm && mask) {
>          if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>              return -RISCV_EXCP_ILLEGAL_INST;
>          } else {
> -            if ((val ^ env->satp) & SATP_ASID) {
> +            if (asid) {
>                  tlb_flush(env_cpu(env));
>              }
>              env->satp = val;
>          }
>      }
> +
>      return 0;
>  }
>
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index e51188f919..f7e6ea72b3 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -150,9 +150,14 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
>      target_ulong last_size;
>      int last_attr;
>
> -    base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
> +    if (riscv_cpu_is_32bit(env)) {
> +        base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
> +        vm = get_field(env->satp, SATP32_MODE);
> +    } else {
> +        base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
> +        vm = get_field(env->satp, SATP64_MODE);
> +    }
>
> -    vm = get_field(env->satp, SATP_MODE);
>      switch (vm) {
>      case VM_1_10_SV32:
>          levels = 2;
> @@ -215,9 +220,16 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
>          return;
>      }
>
> -    if (!(env->satp & SATP_MODE)) {
> -        monitor_printf(mon, "No translation or protection\n");
> -        return;
> +    if (riscv_cpu_is_32bit(env)) {
> +        if (!(env->satp & SATP32_MODE)) {
> +            monitor_printf(mon, "No translation or protection\n");
> +            return;
> +        }
> +    } else {
> +        if (!(env->satp & SATP64_MODE)) {
> +            monitor_printf(mon, "No translation or protection\n");
> +            return;
> +        }
>      }
>
>      mem_info_svxx(mon, env);

Regards,
Bin

