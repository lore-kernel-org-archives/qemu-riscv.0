Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my4Rq-0003Hl-IS
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 23:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my4Ro-0003H3-PL; Thu, 16 Dec 2021 23:02:20 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=37736
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my4Rm-0006Lg-Km; Thu, 16 Dec 2021 23:02:20 -0500
Received: by mail-io1-xd2d.google.com with SMTP id k21so1253062ioh.4;
 Thu, 16 Dec 2021 20:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lY094tC7EYGdtDQmRNplI8FldbQiQolhtf85mnd9oTA=;
 b=Y0IIu0nHj5w2YdlK4UtvciJII5yWsMht8/RDffOVcFq+fsshnEFm7W7dT1dtclV9Ch
 EXDgkQK+AlKbEs2JiYr0wneHQzlJKiTBo6BvQ7hsfa1t1AjCgmwRmqunxYonl3JOWY9S
 DacCxlFQpeOZ8V3TmmA/YUnDpe9aP68ICloOs4Hn9xAABS4swONxaKEUE8KuAq8rIXXM
 OM3EVfqVCeAwna91cCH1cqOprGgq4zS+WSZYEE1+WDaX/zTURfyGDx+ULzUDbhKLMo6K
 pGLSLTJyKXwiSIPARPIXOPuSys77VpaWcJzQV4DmZEoh3MWFpFSff5ATq2js5GLscuTn
 3AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lY094tC7EYGdtDQmRNplI8FldbQiQolhtf85mnd9oTA=;
 b=D/8rbcsjlXYIhR/VIysiPwdJ78wZscQoPQ1+v9a9BBd4S6DAmXSc9iEdSrn9ChiH5b
 NhAkaWs2SYjWkDa9q2TEmqTBxOgERqKS9lb+yPVYjZfsDXAuNxbJHetKsJBFrvt7AQPo
 83E8O+OwvGrXbhrFwhPC1UCuENpaZwU6K2n4AMHIBcKOgGYi8rCpGjc3qbyLq2o4JCem
 ZrReRGpfeS3JVWXCCCo4ucMMLmw/ZQpPcINsI9Qiw1gMxZdaXI41EApKHsblDu9mhre7
 8oHcKIFu4dqFjn+qn47NdRdKSlKnOcFxFPFAgdX7dsGAxtjP04hMTm4Gn0YR3ap5afim
 aEcg==
X-Gm-Message-State: AOAM53159M3duSqirxGfqPaoI2kqwJkxlnlIdZ7mVIcUxirO8BIXJ4wo
 +iQ4zHhwI1Sl8JaXFdzkDmyfszF6xWbIARJGBu4=
X-Google-Smtp-Source: ABdhPJyB120nyDKuRKowVrLQkuPJYWjorUlqH4GgMkWGvGRyI6f0sycsuoJc3cqTx116m7QyEaXpN1SXLhyuqJBI8+Q=
X-Received: by 2002:a05:6638:32a2:: with SMTP id
 f34mr685877jav.63.1639713735867; 
 Thu, 16 Dec 2021 20:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-12-anup.patel@wdc.com>
In-Reply-To: <20211211041917.135345-12-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 14:01:49 +1000
Message-ID: <CAKmqyKN-1qXvuuhwJna9h2rYfcFLTxvSuCHrmpVsyMMjq_A-rw@mail.gmail.com>
Subject: Re: [PATCH v5 11/23] target/riscv: Implement AIA hvictl and hviprioX
 CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 17 Dec 2021 04:02:21 -0000

On Sat, Dec 11, 2021 at 2:23 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The AIA hvictl and hviprioX CSRs allow hypervisor to control
> interrupts visible at VS-level. This patch implements AIA hvictl
> and hviprioX CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     |   2 +
>  target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c |   2 +
>  3 files changed, 130 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8b14fac9a9..c6b9cc0f2a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -197,6 +197,7 @@ struct CPURISCVState {
>      uint64_t htimedelta;
>
>      /* Hypervisor controlled virtual interrupt priorities */
> +    target_ulong hvictl;
>      uint8_t hviprio[64];
>
>      /* Virtual CSRs */
> @@ -465,6 +466,7 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>      return env->misa_mxl;
>  }
>  #endif
> +#define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
>
>  /*
>   * A simplification for VLMAX
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d9bb5ff649..968a65bbd2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -229,6 +229,15 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> +static int aia_hmode(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +     }
> +
> +     return hmode(env, csrno);
> +}
> +
>  static int aia_hmode32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> @@ -1041,6 +1050,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
>      uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
>      } else {
>          ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
> @@ -1239,6 +1251,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
>      uint64_t mask = env->mideleg & sip_writable_mask;
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          ret = rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
>      } else {
>          ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
> @@ -1625,6 +1640,110 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->hvictl;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->hvictl = val & HVICTL_VALID_MASK;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_hvipriox(CPURISCVState *env, int first_index,
> +                         uint8_t *iprio, target_ulong *val)
> +{
> +    int i, irq, rdzero, num_irqs = 4 * (riscv_cpu_mxl_bits(env) / 32);
> +
> +    /* First index has to be multiple of numbe of irqs per register */
> +    if (first_index % num_irqs) {
> +        return (riscv_cpu_virt_enabled(env)) ?
> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /* Fill-up return value */
> +    *val = 0;
> +    for (i = 0; i < num_irqs; i++) {
> +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
> +            continue;
> +        }
> +        if (rdzero) {
> +            continue;
> +        }
> +        *val |= ((target_ulong)iprio[irq]) << (i * 8);
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_hvipriox(CPURISCVState *env, int first_index,
> +                          uint8_t *iprio, target_ulong val)
> +{
> +    int i, irq, rdzero, num_irqs = 4 * (riscv_cpu_mxl_bits(env) / 32);
> +
> +    /* First index has to be multiple of numbe of irqs per register */
> +    if (first_index % num_irqs) {
> +        return (riscv_cpu_virt_enabled(env)) ?
> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /* Fill-up priority arrary */
> +    for (i = 0; i < num_irqs; i++) {
> +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
> +            continue;
> +        }
> +        if (rdzero) {
> +            iprio[irq] = 0;
> +        } else {
> +            iprio[irq] = (val >> (i * 8)) & 0xff;
> +        }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    return read_hvipriox(env, 0, env->hviprio, val);
> +}
> +
> +static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    return write_hvipriox(env, 0, env->hviprio, val);
> +}
> +
> +static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    return read_hvipriox(env, 4, env->hviprio, val);
> +}
> +
> +static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    return write_hvipriox(env, 4, env->hviprio, val);
> +}
> +
> +static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    return read_hvipriox(env, 8, env->hviprio, val);
> +}
> +
> +static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    return write_hvipriox(env, 8, env->hviprio, val);
> +}
> +
> +static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    return read_hvipriox(env, 12, env->hviprio, val);
> +}
> +
> +static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    return write_hvipriox(env, 12, env->hviprio, val);
> +}
> +
>  /* Virtual CSR Registers */
>  static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
> @@ -2277,9 +2396,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
>      [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
>
> +    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
> +    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
> +    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
> +
>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>      [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
>      [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
> +    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
> +    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
>      [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
>      [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 44dca84ded..f027d5e307 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper = {
>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +
> +        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>          VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>
>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> --
> 2.25.1
>
>

