Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhnee-0004uA-Qp
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 02:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhneb-0004tW-Mx; Tue, 02 Nov 2021 02:52:17 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhneY-0003we-Uc; Tue, 02 Nov 2021 02:52:17 -0400
Received: by mail-yb1-xb33.google.com with SMTP id q74so44670568ybq.11;
 Mon, 01 Nov 2021 23:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bnU0UssTY9ryQEnrIdu1EfGW8Y/io+93x1FDdCmvdhg=;
 b=hvhSnKyNsCLuwKvnB+fsuS/CJfaB3PW9N6RIh/VxeokYQXoA0CwTDCkKanV1IpaMd+
 4UNOvXSeZHL3Q2T4Kp4bzMoMXqRsXBpXvbOfPvFK/MY9VmP1KBqZHezqE3IjAgKRkMSc
 cwJUbzyvIW0S97xET2x36EShJEacRhOQfpcAP6AlU4SmSGe3Xwt26mq540wgSneViPCq
 tiU3q7YY0f8oVe5YVbtR/m2jMFl6hNlIXUanKK4M/pVchXLXeqd+d3BbGSD0ydrvvxjE
 KmLGR4PHlbqyjnIrOLN+LzL5ik+KltACGHIIZ65idEjnzWngoFc2EsVfAdNK0MZoifNr
 4zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnU0UssTY9ryQEnrIdu1EfGW8Y/io+93x1FDdCmvdhg=;
 b=zZPgi6aS9zLvqiXqObnI6NjnWILezPV9ODgOPhyOwr3tIbZPLlrTpODr4TvcMtpnSL
 88cC8P4wKP57/VxnK+9YTHhhXNRyZJq5AvGDXJSVfbYYYBK8rrduAbYB+a6LGLcoM5xq
 WP5bC3KJdz8PrlbR/iOhjZkjfrSi1IZ4v7ZvqcfMtYsL+ZAEg8wsWfT7s5mAL8YXKw+d
 LkiPG4g44Rg3+STsVlxAwl8iMyg3aDLSEkhfTbUwOVZuRPsAMA/JOFTvbizdumtUTTNu
 2+oWwRgRbfI5GjgerVELZg02ZCKk42JxWNXk53ssJ6fTlx1BlD1CWB5DQu2x7H2wA0rR
 L1Jg==
X-Gm-Message-State: AOAM530LyxDqdKboUluvZjSP4w5xy6dY4Cs19B+lh4Wz8jgZLHSVtAvk
 geNNgOEOmPFayWwCj+Hqqm/nHLh7Tv7IxGGNSco=
X-Google-Smtp-Source: ABdhPJyQSWFdtR6mPTddoQHC73aNH/it8J65vsCkyWabLM6YwAlmyMIiDeNqLc2LjTIvUzKBrWo+81iCwZF98NrpENs=
X-Received: by 2002:a25:42c7:: with SMTP id
 p190mr29014013yba.332.1635835932062; 
 Mon, 01 Nov 2021 23:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-3-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-3-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 2 Nov 2021 14:52:00 +0800
Message-ID: <CAEUhbmX_XFTTGZBnRACrdOh27Hddj2Ho-RUL8xmf=2YG=Fw0OA@mail.gmail.com>
Subject: Re: [PATCH v4 02/22] target/riscv: Implement SGEIP bit in hip and hie
 CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 06:52:17 -0000

On Tue, Oct 26, 2021 at 2:43 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> A hypervsior can optionally take guest external interrupts using

typo: hypervisor

> SGEIP bit of hip and hie CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c      |  3 ++-
>  target/riscv/cpu_bits.h |  3 +++
>  target/riscv/csr.c      | 18 +++++++++++-------
>  3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 788fa0b11c..0460a3972b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -365,6 +365,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>          env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
>      }
>      env->mcause = 0;
> +    env->miclaim = MIP_SGEIP;
>      env->pc = env->resetvec;
>      env->two_stage_lookup = false;
>  #endif
> @@ -598,7 +599,7 @@ static void riscv_cpu_init(Object *obj)
>      cpu_set_cpustate_pointers(cpu);
>
>  #ifndef CONFIG_USER_ONLY
> -    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
> +    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index cffcd3a5df..8a5a4cde95 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -498,6 +498,8 @@ typedef enum RISCVException {
>  #define IRQ_S_EXT                          9
>  #define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
> +#define IRQ_S_GEXT                         12
> +#define IRQ_LOCAL_MAX                      13

The IRQ_LOCAL_MAX should be XLEN long, not 13.

>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> @@ -512,6 +514,7 @@ typedef enum RISCVException {
>  #define MIP_SEIP                           (1 << IRQ_S_EXT)
>  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
>  #define MIP_MEIP                           (1 << IRQ_M_EXT)
> +#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
>
>  /* sip masks */
>  #define SIP_SSIP                           MIP_SSIP
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9dfc9b5eba..9a0a0c0679 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -408,12 +408,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>  #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
>  #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
>  #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> +#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
>
>  static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
>                                             VS_MODE_INTERRUPTS;
>  static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
>  static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
> -                                     VS_MODE_INTERRUPTS;
> +                                     HS_MODE_INTERRUPTS;
>  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
>                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
>                           (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
> @@ -673,7 +674,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
>  {
>      env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
>      if (riscv_has_ext(env, RVH)) {
> -        env->mideleg |= VS_MODE_INTERRUPTS;
> +        env->mideleg |= HS_MODE_INTERRUPTS;
>      }
>      return RISCV_EXCP_NONE;
>  }
> @@ -689,6 +690,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
>      env->mie = (env->mie & ~all_ints) | (val & all_ints);
> +    if (!riscv_has_ext(env, RVH)) {
> +        env->mie &= ~MIP_SGEIP;
> +    }
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -984,7 +988,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
>      }
>
>      if (ret_value) {
> -        *ret_value &= env->mideleg;
> +        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1102,7 +1106,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
>                        write_mask & hvip_writable_mask);
>
>      if (ret_value) {
> -        *ret_value &= hvip_writable_mask;
> +        *ret_value &= VS_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1115,7 +1119,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
>                        write_mask & hip_writable_mask);
>
>      if (ret_value) {
> -        *ret_value &= hip_writable_mask;
> +        *ret_value &= HS_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1123,14 +1127,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
>  static RISCVException read_hie(CPURISCVState *env, int csrno,
>                                 target_ulong *val)
>  {
> -    *val = env->mie & VS_MODE_INTERRUPTS;
> +    *val = env->mie & HS_MODE_INTERRUPTS;
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException write_hie(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
> -    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
> +    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
>      return write_mie(env, CSR_MIE, newval);
>  }
>

Regards,
Bin

