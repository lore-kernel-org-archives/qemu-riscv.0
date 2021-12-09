Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvDB4-0004CD-At
	for mharc-qemu-riscv@gnu.org; Thu, 09 Dec 2021 01:45:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mvDB0-0004Ap-PS
 for qemu-riscv@nongnu.org; Thu, 09 Dec 2021 01:45:11 -0500
Received: from [2a00:1450:4864:20::32a] (port=51830
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mvDAu-00087X-7F
 for qemu-riscv@nongnu.org; Thu, 09 Dec 2021 01:45:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 137so3377000wma.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Dec 2021 22:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQtQfPpWqbdor+rT/pdPbGhnJBvI4e3sbCW4U66JiOM=;
 b=CUvNJCIzsUv9v7ZfYZFOUk1cWWt1pBPVtyvhRu1Ld/1p5BizOssp9oO32Buszt+5+h
 jJEi3vZuRCo4IwTACq+SoICSEvkuUYYFZyaj85iOZj5YrrhAOXV1OahxSNEHblvkLl78
 a7m3u4IEVFtV7OCd+CihNMYEKYrM+6n513QE3A9/zAfR2imGmGCFKZtGZRfX7FKG1Rt3
 oB8Dm7miIno5ZGIOwf0+WhUlrIbelDLeqCt5zCJWLVK/eJzQBH6Ew4v3dsrGkDrQm3Tv
 qHppCfcRJN5y3feCyKg+YUtmiEFr3j0ukFkgA7tTo1EH55zWGSNsACCWG0F2liVvTUkY
 8JaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQtQfPpWqbdor+rT/pdPbGhnJBvI4e3sbCW4U66JiOM=;
 b=WeYzsLYKSaLR+rsewRGeiJvKitbkM7DMgbIVIZSlnmOSAiSgsX+W5JNWPFFNutiX5C
 y1r5XrMTpak2R4BNoTE3SifuTHI3XhcFNQIB1mlTIeB1Vt3Bd4ND3ldHD4jiiiJJ1TuD
 rJObt6dlDrIzdJvOIEDA9Wvv2veQhrXrgSu1EVsedz/7rvCU58c/DqedrMrGuljBVGt2
 Gs5lQ2BmZU0PzgpR5RdCvMqbiP0Gc/rEPE4yOtWuoy+oLAyHlgzxmVtQnSj8bRDxy4SJ
 jAP0RJOSOuO7MA+KFezTqQwFMlUglgqAJNR4z/MfOBpsWbCwH9+eK8YsXH4mxCb6QbOX
 iyXw==
X-Gm-Message-State: AOAM532DyJG7Ec9JI8w/sqED93+yJ/1GcC/J6M7Kwu6lty9b+uljXAKB
 8GmhrXmbQBstcxWgLMpqGY0t4wA5zKFhkYSNHgNuGw==
X-Google-Smtp-Source: ABdhPJwIq1SFnSSDe1nIj3dvUuqEXaijMN0Qgv7HCOTD8xm3LNGWCfqPeGZ6mxJZEhL2o2OP2GD4ShylkwpupIi1AgU=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr4777651wmj.176.1639032302449; 
 Wed, 08 Dec 2021 22:45:02 -0800 (PST)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-12-anup.patel@wdc.com>
 <CAKmqyKODrqQRD6XUZOjaEjXiY6JNLWd2ZL3rUnb8g0jUEC1_FQ@mail.gmail.com>
In-Reply-To: <CAKmqyKODrqQRD6XUZOjaEjXiY6JNLWd2ZL3rUnb8g0jUEC1_FQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Dec 2021 12:14:51 +0530
Message-ID: <CAAhSdy27HKfvnWhaaWLiC3T-ikq==MZdRKHmqkpy4WP3=GMf1g@mail.gmail.com>
Subject: Re: [PATCH v4 11/22] target/riscv: Implement AIA hvictl and hviprioX
 CSRs
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 09 Dec 2021 06:45:13 -0000

On Thu, Nov 4, 2021 at 10:19 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 5:39 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The AIA hvictl and hviprioX CSRs allow hypervisor to control
> > interrupts visible at VS-level. This patch implements AIA hvictl
> > and hviprioX CSRs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.h     |   1 +
> >  target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/machine.c |   2 +
> >  3 files changed, 129 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 718a95e864..21d9c536ef 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -196,6 +196,7 @@ struct CPURISCVState {
> >      uint64_t htimedelta;
> >
> >      /* Hypervisor controlled virtual interrupt priorities */
> > +    target_ulong hvictl;
> >      uint8_t hviprio[64];
> >
> >      /* Virtual CSRs */
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 3a7d89ac34..46d0cabbde 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -219,6 +219,15 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
> >
> >  }
> >
> > +static int aia_hmode(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +     }
> > +
> > +     return hmode(env, csrno);
> > +}
> > +
> >  static int aia_hmode32(CPURISCVState *env, int csrno)
> >  {
> >      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > @@ -1031,6 +1040,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
> >      uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
> >
> >      if (riscv_cpu_virt_enabled(env)) {
> > +        if (env->hvictl & HVICTL_VTI) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> >          ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
> >      } else {
> >          ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
> > @@ -1229,6 +1241,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
> >      uint64_t mask = env->mideleg & sip_writable_mask;
> >
> >      if (riscv_cpu_virt_enabled(env)) {
> > +        if (env->hvictl & HVICTL_VTI) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> >          ret = rmw_vsip64(env, CSR_VSIE, ret_val, new_val, wr_mask);
> >      } else {
> >          ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
> > @@ -1615,6 +1630,110 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    *val = env->hvictl;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    env->hvictl = val & HVICTL_VALID_MASK;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int read_hvipriox(CPURISCVState *env, int first_index,
> > +                         uint8_t *iprio, target_ulong *val)
> > +{
> > +    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);
>
> You should be checking the CPUs xlen instead of using the hardcoded
> TARGET_LONG_BITS here.

Sure, I will update and use CPU xlen.

Regards,
Anup

>
> Alistair
>
> > +
> > +    /* First index has to be multiple of numbe of irqs per register */
> > +    if (first_index % num_irqs) {
> > +        return (riscv_cpu_virt_enabled(env)) ?
> > +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    /* Fill-up return value */
> > +    *val = 0;
> > +    for (i = 0; i < num_irqs; i++) {
> > +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
> > +            continue;
> > +        }
> > +        if (rdzero) {
> > +            continue;
> > +        }
> > +        *val |= ((target_ulong)iprio[irq]) << (i * 8);
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int write_hvipriox(CPURISCVState *env, int first_index,
> > +                          uint8_t *iprio, target_ulong val)
> > +{
> > +    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);
> > +
> > +    /* First index has to be multiple of numbe of irqs per register */
> > +    if (first_index % num_irqs) {
> > +        return (riscv_cpu_virt_enabled(env)) ?
> > +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    /* Fill-up priority arrary */
> > +    for (i = 0; i < num_irqs; i++) {
> > +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
> > +            continue;
> > +        }
> > +        if (rdzero) {
> > +            iprio[irq] = 0;
> > +        } else {
> > +            iprio[irq] = (val >> (i * 8)) & 0xff;
> > +        }
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    return read_hvipriox(env, 0, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    return write_hvipriox(env, 0, env->hviprio, val);
> > +}
> > +
> > +static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    return read_hvipriox(env, 4, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    return write_hvipriox(env, 4, env->hviprio, val);
> > +}
> > +
> > +static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    return read_hvipriox(env, 8, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    return write_hvipriox(env, 8, env->hviprio, val);
> > +}
> > +
> > +static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    return read_hvipriox(env, 12, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    return write_hvipriox(env, 12, env->hviprio, val);
> > +}
> > +
> >  /* Virtual CSR Registers */
> >  static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
> >                                      target_ulong *val)
> > @@ -2005,9 +2124,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
> >      [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
> >
> > +    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> > +    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
> > +    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
> > +    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
> > +
> >      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> >      [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
> >      [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
> > +    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
> > +    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
> >      [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
> >      [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
> >
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 7356d70be6..bc20960260 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -116,6 +116,8 @@ static const VMStateDescription vmstate_hyper = {
> >          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
> >          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
> >          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> > +
> > +        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
> >          VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> >
> >          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> > --
> > 2.25.1
> >
> >

