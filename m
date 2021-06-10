Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrTtC-00024r-93
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 19:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTtA-00020s-8A; Thu, 10 Jun 2021 19:15:04 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:42880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTt8-0006sK-9y; Thu, 10 Jun 2021 19:15:03 -0400
Received: by mail-io1-xd2b.google.com with SMTP id k22so28927651ioa.9;
 Thu, 10 Jun 2021 16:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVP+dxvSY4L2ftlconSa/u0IThh/n9Z0b0XiEFkLpc0=;
 b=g5A1X/wj3hyb0ybxd8gbxhCvHyv0IUGVQej7qQ2AgI4eTxaPzppGGSaCGfnkA59xqg
 pEG3ARGZJbQhc5dYlsgjYw2DEGnNVdB2MbftOXOj1fPRT+KxLwrBDvWla8e4N9z4B7lF
 P+RcCy4CpUbTJDs8eZNLWhrdkLRLgEdziGdppNiXdEZywe+jpjFaaGYzxS84vEtEZxOo
 PDb95wrC1Q7a0QTjOCqAOlROEXEThexftxTKlnZeq/MnqHNl8BtrNlcB3RXpzDZwtC7S
 DFqBPE6fPEbpMhkexrq6bRmuZr+KwbD1Rjdr3si+vbqiAfKHEmqyT+YkVqkK0ZGI/f9k
 AnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVP+dxvSY4L2ftlconSa/u0IThh/n9Z0b0XiEFkLpc0=;
 b=dTxmCB11ZnO2Q1p4B61PCvEgphgNNIIYN20/UgfE1nUIGEmArS/b9gYz6rrcuwa85J
 0g+1y/a/GrOeBngDtANUsFwpkBJfjbzqp7LXtgnbbEOOaBZVHXr11Xl1eNrNLmtw735k
 50PEKj72HFNdJZondNe1i3QDaibgpqydhnwVP00WEYA2a7F+Gk43t4EI4kM2156oJ5UD
 Xx69fmfGqiTP1HgqA2nfrDIT6RQi0i/dLFI+IxA71E0o6hOCzkOVW72RzC+sib8LM37X
 5+7Lwzswg2kGona3f/ah2o1O99AQCELMVjxJwKExBb+F9y0zDuvKqeSIPg+qkXhVPkpz
 oPVg==
X-Gm-Message-State: AOAM532gUZt+v+KrOWVR2HsBv+q4c9anzWn9XfEs7jlLMiJhsw6JRRce
 L8TBPFoyiRDb/i+a/goQhcoHIklrEGUvHmm6zrs=
X-Google-Smtp-Source: ABdhPJy1BER2ykX9rakY/mn6Qe7tFa5Fp+ybXN9H/myjXJGIpTk2tLJdYRJPEid59y2d8rr4jzSynhqk9Kk3HOV0ZAo=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr906879jak.91.1623366900937; 
 Thu, 10 Jun 2021 16:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210602191125.525742-1-josemartins90@gmail.com>
 <20210602191125.525742-3-josemartins90@gmail.com>
In-Reply-To: <20210602191125.525742-3-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 09:14:34 +1000
Message-ID: <CAKmqyKMYZAfUPvASnis1DvGapoCOFZF9NPXaXzEX2MYnkSQdNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: remove force HS exception
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
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
X-List-Received-Date: Thu, 10 Jun 2021 23:15:04 -0000

On Thu, Jun 3, 2021 at 5:12 AM Jose Martins <josemartins90@gmail.com> wrote:
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
> index 0a33d387ba..a30a64241a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -337,8 +337,6 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> -bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> -void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
>  bool riscv_cpu_two_stage_lookup(int mmu_idx);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599207..7322f54157 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -462,12 +462,6 @@
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
> index 592d4642be..babe3d844b 100644
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
> @@ -884,7 +866,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> -    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
>      uint64_t s;
>
>      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
> @@ -913,8 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> -            force_hs_execp = true;
> -            /* fallthrough */
>          case RISCV_EXCP_INST_ADDR_MIS:
>          case RISCV_EXCP_INST_ACCESS_FAULT:
>          case RISCV_EXCP_LOAD_ADDR_MIS:
> @@ -973,8 +952,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
>              }
>
> -            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
> -                !force_hs_execp) {
> +            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
>                  /* Trap to VS mode */
>                  /*
>                   * See if we need to adjust cause. Yes if its VS mode interrupt
> @@ -996,7 +974,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  htval = env->guest_phys_fault_addr;
>
>                  riscv_cpu_set_virt_enabled(env, 0);
> -                riscv_cpu_set_force_hs_excep(env, 0);
>              } else {
>                  /* Trap into HS mode */
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
> @@ -1032,7 +1009,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>              /* Trapping to M mode, virt is disabled */
>              riscv_cpu_set_virt_enabled(env, 0);
> -            riscv_cpu_set_force_hs_excep(env, 0);
>          }
>
>          s = env->mstatus;
> --
> 2.30.2
>
>

