Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miUhP-00019Q-W9
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 00:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUhO-00017p-KU; Thu, 04 Nov 2021 00:50:02 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUhM-0007d8-Rx; Thu, 04 Nov 2021 00:50:02 -0400
Received: by mail-io1-xd29.google.com with SMTP id n128so5546670iod.9;
 Wed, 03 Nov 2021 21:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qQ06XqCQA9i6dQsUXofryK5I7o+5XApbqcASl65OPpU=;
 b=Jl0eOPy2QCdmcg4jc2uigPL9FMnm48fAATt36A7JRrO+Yt3fJeThweGjB59LaoEMA8
 9bTptvAMOSviCWmdRdPSMy2xfsQBd43+MvohvEjzmpRMzG1MBw/7Q9PjKBKAxZA10Gyy
 t85atLeA/6k3Yk2r1BCIV6tGPiRoaeAc+iYmaVoAOyk4fh3S8wL1UHfTxt/ujOhGSDym
 g8IuJJu2aww8KN2pPIvyQu3qUnBy+zX1mcYNYCX8Yqo82Gh2gl5um56yWnJvdKq7EN91
 1ljDZy8zobjAck0uRkYJ2y0zrvwrMFUIE7W9J6JToVYFU8Frz8Sui0xHqSNFmPhyqQE+
 e6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qQ06XqCQA9i6dQsUXofryK5I7o+5XApbqcASl65OPpU=;
 b=A2h7KmThuz68ppC71LoA7XKn1LvIjuR3TU9g33AeJaf+PiCCGzjxG66oW9RCmBXaOv
 JVKh6erJ9KE/xZnRX1WO7ulR/y27QoLq0LBDTKnL+xW1btwGRxw0lXeiJ01HPPdhbk8W
 JltQVYx1Jt87jc/7xLVCv2ku1WoM4v1IjENCQnQ2vN81LbTOG7tFnW8Ys8CCeri0rTGR
 UAK1Sq8LLiVu4IpfJfePQAxn8EwJMzdd6ecYYJGCDLGfK0PYpU8ltknUcHXTuwzjAfYi
 Oq/o1M+EAimOWo0adxTT2UKYsZUIGZwAf9MIPrV9m9YxdkVuL+uohqehqZ6XQREshlLF
 bxYQ==
X-Gm-Message-State: AOAM5301NpHMhDVUmbk7YdXo3XJUfCA1REQMF63Xg9ZMoR4rtZ7R616H
 blXFrGSGYYG5bhzMenHYHpEX5efMNZ09DOFbiqE=
X-Google-Smtp-Source: ABdhPJzWPfVRgHN58wO6Zne6kODkxCnAvvs1w5jVQ8F3+vmIKeeoGAW4w1qs+CaZqGc2GTvPOqXXJd7zlQdTZRYGVW4=
X-Received: by 2002:a05:6638:329e:: with SMTP id
 f30mr1993750jav.63.1636001399246; 
 Wed, 03 Nov 2021 21:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-12-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-12-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Nov 2021 14:49:31 +1000
Message-ID: <CAKmqyKODrqQRD6XUZOjaEjXiY6JNLWd2ZL3rUnb8g0jUEC1_FQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/22] target/riscv: Implement AIA hvictl and hviprioX
 CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
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
X-List-Received-Date: Thu, 04 Nov 2021 04:50:02 -0000

On Tue, Oct 26, 2021 at 5:39 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The AIA hvictl and hviprioX CSRs allow hypervisor to control
> interrupts visible at VS-level. This patch implements AIA hvictl
> and hviprioX CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/cpu.h     |   1 +
>  target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c |   2 +
>  3 files changed, 129 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 718a95e864..21d9c536ef 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -196,6 +196,7 @@ struct CPURISCVState {
>      uint64_t htimedelta;
>
>      /* Hypervisor controlled virtual interrupt priorities */
> +    target_ulong hvictl;
>      uint8_t hviprio[64];
>
>      /* Virtual CSRs */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3a7d89ac34..46d0cabbde 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -219,6 +219,15 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
>
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
> @@ -1031,6 +1040,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
>      uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
>      } else {
>          ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
> @@ -1229,6 +1241,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
>      uint64_t mask = env->mideleg & sip_writable_mask;
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          ret = rmw_vsip64(env, CSR_VSIE, ret_val, new_val, wr_mask);
>      } else {
>          ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
> @@ -1615,6 +1630,110 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
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
> +    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);

You should be checking the CPUs xlen instead of using the hardcoded
TARGET_LONG_BITS here.

Alistair

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
> +    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);
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
> @@ -2005,9 +2124,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> index 7356d70be6..bc20960260 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -116,6 +116,8 @@ static const VMStateDescription vmstate_hyper = {
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

