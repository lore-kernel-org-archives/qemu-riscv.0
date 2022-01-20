Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAhHt-0000a8-1b
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 18:56:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhHr-0000WK-2C; Thu, 20 Jan 2022 18:56:15 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=45899
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhHo-0005M0-SL; Thu, 20 Jan 2022 18:56:14 -0500
Received: by mail-io1-xd2a.google.com with SMTP id s11so8889689ioe.12;
 Thu, 20 Jan 2022 15:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLGiHiWsSLMNSFHv6BGn6ONXZuDD0kLAX5GEx2qmyv4=;
 b=E/UMwCgO/miWNTKFyv7l4HTjjQVDFD/3UKe+pzkEgmScdqkpCZZm4lg6KjMBKfEHWn
 ezVH7pRYWLWMroK780C83aL+zdtTq1n+WzbnOgULCMkvQv/M5yal6hDktEcEQn1PALqG
 ZmSIeetnIfICmSjYxZNzypNjK3mJGMGlxruhU1FIi8zXof+Yij4KdyC/LjDNNrRmXm8W
 89QaaIkdpwBWC34bnhGKnemng4mBWD43dU7ro5kvbxK4D937ciceYqk/fd5rX2sgKG1s
 obHh/EJkWbSZYzRhqcFaydrLeK9cVws/eotivQLHNd9EGqts8ceN/ImOnT8PLLYuimO6
 6UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLGiHiWsSLMNSFHv6BGn6ONXZuDD0kLAX5GEx2qmyv4=;
 b=znpmwhgrzbwQPjnQW4D1c+ACjHiNjCs3r0urg5rj/sOhjNyZ2jKxRigU2zFuW7flui
 nJWUvKtrFHTfZM8rdy0yjFqnF3yS8wtI+SHU9jJUtMKeM9hZUo6tP/iAr/nOvt69uH5y
 dZz+fRhI3kwwW1m31jH+7ZNkGV129OJVRlhHeVujcsiTUBdRbuUG4pNO55SIfItsXJ1k
 6GvSJRRiUokQpioco0a1Vgy1EhSi4EEX+AynnP72uy/U2d9TQFuOTNom8JqCryyc6z+p
 gJdCu1X+EnC7ny7Kb46nNZ3bEbC73kpRopx/oia/mxNDbTypzXvAWk3w9HGSfYB/pafv
 BsHg==
X-Gm-Message-State: AOAM532V6jPJcEu0aTMiKT6gkD9an47bZFD7y6NaMgXtpM4wqsZkbqcw
 873yw/zsDOLIb9on1HPXt3nlJkOykFDyWp8USQ0=
X-Google-Smtp-Source: ABdhPJxaRCUppjlBt+EVYEplE+5HAjoJOXPHCLPo5WswAZBDLbym4+jIqkkjUbEs74Vbbbhc1NI2N1biypEG4IBIb6s=
X-Received: by 2002:a02:6954:: with SMTP id e81mr549310jac.63.1642722971056;
 Thu, 20 Jan 2022 15:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20220119152614.27548-1-anup@brainfault.org>
 <20220119152614.27548-14-anup@brainfault.org>
In-Reply-To: <20220119152614.27548-14-anup@brainfault.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 09:55:44 +1000
Message-ID: <CAKmqyKM5Wh-z=vYPTQpb40PnDg2LQr=1wvDEdDx788qvrr8XKw@mail.gmail.com>
Subject: Re: [PATCH v8 13/23] target/riscv: Implement AIA mtopi, stopi, and
 vstopi CSRs
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Thu, 20 Jan 2022 23:56:15 -0000

On Thu, Jan 20, 2022 at 1:41 AM Anup Patel <anup@brainfault.org> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA specification introduces new [m|s|vs]topi CSRs for
> reporting pending local IRQ number and associated IRQ priority.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 156 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 37a66942cb..f7904c003f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -194,6 +194,15 @@ static int smode32(CPURISCVState *env, int csrno)
>      return smode(env, csrno);
>  }
>
> +static int aia_smode(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
>  static int aia_smode32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> @@ -506,6 +515,8 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>  #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
>  #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
>
> +#define VSTOPI_NUM_SRCS 5
> +
>  static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
>                                             VS_MODE_INTERRUPTS;
>  static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
> @@ -883,6 +894,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
>      return ret;
>  }
>
> +static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq;
> +    uint8_t iprio;
> +
> +    irq = riscv_cpu_mirq_pending(env);
> +    if (irq <= 0 || irq > 63) {
> +       *val = 0;
> +    } else {
> +       iprio = env->miprio[irq];
> +       if (!iprio) {
> +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
> +               iprio = IPRIO_MMAXIPRIO;
> +           }
> +       }
> +       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> +       *val |= iprio;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -1452,6 +1485,120 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq, ret;
> +    target_ulong topei;
> +    uint64_t vseip, vsgein;
> +    uint32_t iid, iprio, hviid, hviprio, gein;
> +    uint32_t s, scount = 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_SRCS];
> +
> +    gein = get_field(env->hstatus, HSTATUS_VGEIN);
> +    hviid = get_field(env->hvictl, HVICTL_IID);
> +    hviprio = get_field(env->hvictl, HVICTL_IPRIO);
> +
> +    if (gein) {
> +        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +        vseip = env->mie & (env->mip | vsgein) & MIP_VSEIP;
> +        if (gein <= env->geilen && vseip) {
> +            siid[scount] = IRQ_S_EXT;
> +            siprio[scount] = IPRIO_MMAXIPRIO + 1;
> +            if (env->aia_ireg_rmw_fn[PRV_S]) {
> +                /*
> +                 * Call machine specific IMSIC register emulation for
> +                 * reading TOPEI.
> +                 */
> +                ret = env->aia_ireg_rmw_fn[PRV_S](
> +                        env->aia_ireg_rmw_fn_arg[PRV_S],
> +                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, gein,
> +                                      riscv_cpu_mxl_bits(env)),
> +                        &topei, 0, 0);
> +                if (!ret && topei) {
> +                    siprio[scount] = topei & IMSIC_TOPEI_IPRIO_MASK;
> +                }
> +            }
> +            scount++;
> +        }
> +    } else {
> +        if (hviid == IRQ_S_EXT && hviprio) {
> +            siid[scount] = IRQ_S_EXT;
> +            siprio[scount] = hviprio;
> +            scount++;
> +        }
> +    }
> +
> +    if (env->hvictl & HVICTL_VTI) {
> +        if (hviid != IRQ_S_EXT) {
> +            siid[scount] = hviid;
> +            siprio[scount] = hviprio;
> +            scount++;
> +        }
> +    } else {
> +        irq = riscv_cpu_vsirq_pending(env);
> +        if (irq != IRQ_S_EXT && 0 < irq && irq <= 63) {
> +           siid[scount] = irq;
> +           siprio[scount] = env->hviprio[irq];
> +           scount++;
> +        }
> +    }
> +
> +    iid = 0;
> +    iprio = UINT_MAX;
> +    for (s = 0; s < scount; s++) {
> +        if (siprio[s] < iprio) {
> +            iid = siid[s];
> +            iprio = siprio[s];
> +        }
> +    }
> +
> +    if (iid) {
> +        if (env->hvictl & HVICTL_IPRIOM) {
> +            if (iprio > IPRIO_MMAXIPRIO) {
> +                iprio = IPRIO_MMAXIPRIO;
> +            }
> +            if (!iprio) {
> +                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) {
> +                    iprio = IPRIO_MMAXIPRIO;
> +                }
> +            }
> +        } else {
> +            iprio = 1;
> +        }
> +    } else {
> +        iprio = 0;
> +    }
> +
> +    *val = (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> +    *val |= iprio;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq;
> +    uint8_t iprio;
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return read_vstopi(env, CSR_VSTOPI, val);
> +    }
> +
> +    irq = riscv_cpu_sirq_pending(env);
> +    if (irq <= 0 || irq > 63) {
> +       *val = 0;
> +    } else {
> +       iprio = env->siprio[irq];
> +       if (!iprio) {
> +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
> +               iprio = IPRIO_MMAXIPRIO;
> +           }
> +       }
> +       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> +       *val |= iprio;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /* Hypervisor Extensions */
>  static RISCVException read_hstatus(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
> @@ -2543,6 +2690,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
>      [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
>
> +    /* Machine-Level Interrupts (AIA) */
> +    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
> +
>      /* Virtual Interrupts for Supervisor Level (AIA) */
>      [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
>      [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
> @@ -2572,6 +2722,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
>
> +    /* Supervisor-Level Interrupts (AIA) */
> +    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
> +
>      /* Supervisor-Level High-Half CSRs (AIA) */
>      [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
>      [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
> @@ -2610,6 +2763,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
>      [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
>
> +    /* VS-Level Interrupts (H-extension with AIA) */
> +    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
> +
>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>      [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
>      [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
> --
> 2.25.1
>
>

