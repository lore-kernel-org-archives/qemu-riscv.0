Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAhLB-0002iJ-A9
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 18:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhL9-0002fO-KF; Thu, 20 Jan 2022 18:59:39 -0500
Received: from [2607:f8b0:4864:20::133] (port=42634
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhL7-0005tl-Bc; Thu, 20 Jan 2022 18:59:39 -0500
Received: by mail-il1-x133.google.com with SMTP id u5so6343379ilq.9;
 Thu, 20 Jan 2022 15:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EhjzVjs1Jp79YEAy51JghEC6x5Ox2ek5v0xoOw/Q0ww=;
 b=ipj81tTvxUjvVh2/HjZFcNUMzdPDElRqh0sdtV9y4bDTnCuHa9Hcqs9l11QS4DzqpW
 Ptn7JXc7hk/18JTxgd9LiZXth5tHe6PNsI/k9eHWQ8D7JLO06jfDzzdMZD5bm2g8pQMN
 LRX1iupEM079/45kUoFVwzvwPq7Qzoy9e8DPTeDC3EEDsSmpaw2yxEdUThFJb8YsL0xc
 qYRI22LUA4CPqCszJzmIwSkQwiKRd4by5wganGZfAvhdj3FsjgFQFoeay7IbP88ELjuy
 3cvsYDk6jdhNS2xVKGaCTgySqBU3bCDBd1lx0hugjgu5pmu2aYIAc9w3OsFxVT2ClNK1
 pbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EhjzVjs1Jp79YEAy51JghEC6x5Ox2ek5v0xoOw/Q0ww=;
 b=FCZCbAV2gSfiu5YLy0HOjfXpWpOTJE+f2A+dC73Eor9QIW9KV5zWGEDgbsfjq8sg4L
 GzOYbr4A7ziOTn1F/izbLqgMQZDsHznRpeKCihNDUrYen67ibc9ouYG/+zDMEL1M+1XY
 XpuKkMGHaaHJEiW+1oO+NgiVe5drpjZ0Ozbc1S5F5Vepr9h3KyxvoviVnOEM/i6AlWtv
 Z5bR8AjiIo2PrfWvux4htnSQu5IW8teC6qhrrro1eVj7K3CQDowhbRFVh1Gd9hMiUx8u
 vJD7KUWFbJ8HlxsywE78gWzBr6jyP7/oRgL2fy2osEPk8xQzCVO3LDDx+8541hPVKDCU
 YMvw==
X-Gm-Message-State: AOAM533+kpsLQ5Y5jcExWOedmQplaStoaRBcVeTrhNEf4XiTo4VQgvEK
 v+lDobbmPMaacl7+HuW+r7RbCqhsAVp1ZJg/FrQ=
X-Google-Smtp-Source: ABdhPJwrhMGPHhshFH/mSlFBAKx301iqkhc33D+sXMgLBvxkfCtMy0SZu8f15qf1zymzmLX4MzAN3WCevj6GPjEaorc=
X-Received: by 2002:a92:3012:: with SMTP id x18mr741260ile.221.1642723173681; 
 Thu, 20 Jan 2022 15:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20220119152614.27548-1-anup@brainfault.org>
 <20220119152614.27548-15-anup@brainfault.org>
In-Reply-To: <20220119152614.27548-15-anup@brainfault.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 09:59:07 +1000
Message-ID: <CAKmqyKNBnRxkFRBBSdS0oeSwNU_uw1hW29Eo7VVT=3og=gT-dw@mail.gmail.com>
Subject: Re: [PATCH v8 14/23] target/riscv: Implement AIA xiselect and xireg
 CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Thu, 20 Jan 2022 23:59:39 -0000

On Thu, Jan 20, 2022 at 2:32 AM Anup Patel <anup@brainfault.org> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
> which allow indirect access to interrupt priority arrays and per-HART
> IMSIC registers. This patch implements AIA xiselect and xireg CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     |   7 ++
>  target/riscv/csr.c     | 175 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c |   3 +
>  3 files changed, 185 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 65ffd31801..058ea9ce99 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -195,6 +195,10 @@ struct CPURISCVState {
>      uint8_t miprio[64];
>      uint8_t siprio[64];
>
> +    /* AIA CSRs */
> +    target_ulong miselect;
> +    target_ulong siselect;
> +
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
>      target_ulong hedeleg;
> @@ -228,6 +232,9 @@ struct CPURISCVState {
>      target_ulong vstval;
>      target_ulong vsatp;
>
> +    /* AIA VS-mode CSRs */
> +    target_ulong vsiselect;
> +
>      target_ulong mtval2;
>      target_ulong mtinst;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f7904c003f..e40620f455 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -916,6 +916,169 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
>      return RISCV_EXCP_NONE;
>  }
>
> +static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_cpu_virt_enabled(env)) {
> +        return csrno;
> +    }
> +
> +    switch (csrno) {
> +    case CSR_SISELECT:
> +        return CSR_VSISELECT;
> +    case CSR_SIREG:
> +        return CSR_VSIREG;
> +    default:
> +        return csrno;
> +    };
> +}
> +
> +static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
> +                        target_ulong new_val, target_ulong wr_mask)
> +{
> +    target_ulong *iselect;
> +
> +    /* Translate CSR number for VS-mode */
> +    csrno = aia_xlate_vs_csrno(env, csrno);
> +
> +    /* Find the iselect CSR based on CSR number */
> +    switch (csrno) {
> +    case CSR_MISELECT:
> +        iselect = &env->miselect;
> +        break;
> +    case CSR_SISELECT:
> +        iselect = &env->siselect;
> +        break;
> +    case CSR_VSISELECT:
> +        iselect = &env->vsiselect;
> +        break;
> +    default:
> +         return RISCV_EXCP_ILLEGAL_INST;
> +    };
> +
> +    if (val) {
> +        *val = *iselect;
> +    }
> +
> +    wr_mask &= ISELECT_MASK;
> +    if (wr_mask) {
> +        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int rmw_iprio(target_ulong xlen,
> +                     target_ulong iselect, uint8_t *iprio,
> +                     target_ulong *val, target_ulong new_val,
> +                     target_ulong wr_mask, int ext_irq_no)
> +{
> +    int i, firq, nirqs;
> +    target_ulong old_val;
> +
> +    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
> +        return -EINVAL;
> +    }
> +    if (xlen != 32 && iselect & 0x1) {
> +        return -EINVAL;
> +    }
> +
> +    nirqs = 4 * (xlen / 32);
> +    firq = ((iselect - ISELECT_IPRIO0) / (xlen / 32)) * (nirqs);
> +
> +    old_val = 0;
> +    for (i = 0; i < nirqs; i++) {
> +        old_val |= ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS * i);
> +    }
> +
> +    if (val) {
> +        *val = old_val;
> +    }
> +
> +    if (wr_mask) {
> +        new_val = (old_val & ~wr_mask) | (new_val & wr_mask);
> +        for (i = 0; i < nirqs; i++) {
> +            /*
> +             * M-level and S-level external IRQ priority always read-only
> +             * zero. This means default priority order is always preferred
> +             * for M-level and S-level external IRQs.
> +             */
> +            if ((firq + i) == ext_irq_no) {
> +                continue;
> +            }
> +            iprio[firq + i] = (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
> +                     target_ulong new_val, target_ulong wr_mask)
> +{
> +    bool virt;
> +    uint8_t *iprio;
> +    int ret = -EINVAL;
> +    target_ulong priv, isel, vgein;
> +
> +    /* Translate CSR number for VS-mode */
> +    csrno = aia_xlate_vs_csrno(env, csrno);
> +
> +    /* Decode register details from CSR number */
> +    virt = false;
> +    switch (csrno) {
> +    case CSR_MIREG:
> +        iprio = env->miprio;
> +        isel = env->miselect;
> +        priv = PRV_M;
> +        break;
> +    case CSR_SIREG:
> +        iprio = env->siprio;
> +        isel = env->siselect;
> +        priv = PRV_S;
> +        break;
> +    case CSR_VSIREG:
> +        iprio = env->hviprio;
> +        isel = env->vsiselect;
> +        priv = PRV_S;
> +        virt = true;
> +        break;
> +    default:
> +         goto done;
> +    };
> +
> +    /* Find the selected guest interrupt file */
> +    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> +
> +    if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
> +        /* Local interrupt priority registers not available for VS-mode */
> +        if (!virt) {
> +            ret = rmw_iprio(riscv_cpu_mxl_bits(env),
> +                            isel, iprio, val, new_val, wr_mask,
> +                            (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
> +        }
> +    } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
> +        /* IMSIC registers only available when machine implements it. */
> +        if (env->aia_ireg_rmw_fn[priv]) {
> +            /* Selected guest interrupt file should not be zero */
> +            if (virt && (!vgein || env->geilen < vgein)) {
> +                goto done;
> +            }
> +            /* Call machine specific IMSIC register emulation */
> +            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
> +                                    AIA_MAKE_IREG(isel, priv, virt, vgein,
> +                                                  riscv_cpu_mxl_bits(env)),
> +                                    val, new_val, wr_mask);
> +        }
> +    }
> +
> +done:
> +    if (ret) {
> +        return (riscv_cpu_virt_enabled(env) && virt) ?
> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -2690,6 +2853,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
>      [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
>
> +    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> +    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
> +    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
> +
>      /* Machine-Level Interrupts (AIA) */
>      [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
>
> @@ -2722,6 +2889,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
>
> +    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
> +    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
> +    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
> +
>      /* Supervisor-Level Interrupts (AIA) */
>      [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
>
> @@ -2763,6 +2934,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
>      [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
>
> +    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
> +    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
> +    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
> +
>      /* VS-Level Interrupts (H-extension with AIA) */
>      [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c6a01ba953..9895930b29 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -103,6 +103,7 @@ static const VMStateDescription vmstate_hyper = {
>          VMSTATE_UINTTL(env.vscause, RISCVCPU),
>          VMSTATE_UINTTL(env.vstval, RISCVCPU),
>          VMSTATE_UINTTL(env.vsatp, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
>
>          VMSTATE_UINTTL(env.mtval2, RISCVCPU),
>          VMSTATE_UINTTL(env.mtinst, RISCVCPU),
> @@ -260,6 +261,8 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mepc, RISCVCPU),
>          VMSTATE_UINTTL(env.mcause, RISCVCPU),
>          VMSTATE_UINTTL(env.mtval, RISCVCPU),
> +        VMSTATE_UINTTL(env.miselect, RISCVCPU),
> +        VMSTATE_UINTTL(env.siselect, RISCVCPU),
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> --
> 2.25.1
>
>

