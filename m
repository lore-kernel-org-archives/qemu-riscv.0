Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nASFt-0005A7-Vt
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 02:53:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nASFr-000596-RS
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 02:53:12 -0500
Received: from [2607:f8b0:4864:20::535] (port=44013
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nASFm-0004Zi-Mi
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 02:53:11 -0500
Received: by mail-pg1-x535.google.com with SMTP id 187so4717752pga.10
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 23:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9j/D4G837WVLSA8Yfo1AfWhKOZylo/jDYo86HQ5jgc=;
 b=kVj1kQ0g/JJxFszdnsjcXuHDF9isiz5/Zhd4xZ+aFzm00Lx1fPQXs7A0ad/DqP0YWx
 nkneL2YUzvCFo1RG8Q8ZMN4+ZPVfQJ1flnKIpx3mk5hr6VqVjCC9cG9aNvEZtJMXi1H9
 vpqY0afgysky805efNXO89JuLZg/cbVg4HF4V61ARoG5JDvz5wuT842slI0HcbiN4bYf
 lM9zXmzmk9FodP3+e2JOcc4odJAQQStLGCeCNJtK9Im6pQ+LMkPSc69R7w+iBPakqLrn
 8DEXO9I0YHgemHKX1hMEZIxMwkEfQdopLR/WoIOeLVutDptbeo6HJJYnW0U/gBMIXj/b
 Ov3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9j/D4G837WVLSA8Yfo1AfWhKOZylo/jDYo86HQ5jgc=;
 b=Lecg16iiZ5447pE+9emBmxbwYnv1QI+yaxL/5Bs1kXoGygO895lcwsDut07/8cok9h
 QxZiUjWF27sTDLWYpqUGIpOdd0REvUxMxi8Egb+yQxxolLvwZt+RKeROjD2dHZuTK72V
 r0WFQZBcj1BKOiV5IGo3jmH9SrdfYFf4cD0SSznjt9IbvyAC3LX8fJybSBefBc86H1IM
 wOPACrHB4tct3qainm/Ic0/iEpu2TSOvuCKVU2n/v5J8+VbleTiAdPlzvZQDOevT6WeG
 doPGYJRRDAWk7Rbfymml3kaTR54joYzQXXIMd3ijFr1+NBEScRN6CqFffLBoeH+3dFzS
 oYtw==
X-Gm-Message-State: AOAM530VWNZq/+eWjwma1Q3qytcRYpgEfkRnlNtpAgjh0qk4gV/A8Ioi
 /MCHtM7Uwl45whiTGNwpR3hhalC9kLHwOw==
X-Google-Smtp-Source: ABdhPJx7pDiRbify3n4beKONmGRdA7k3HCR57e3onqulYy2hayIkBtODV+C2Ypf0gsyjhXjklNg1xw==
X-Received: by 2002:a63:205:: with SMTP id 5mr795763pgc.379.1642665181953;
 Wed, 19 Jan 2022 23:53:01 -0800 (PST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com.
 [209.85.210.176])
 by smtp.gmail.com with ESMTPSA id w1sm1932404pfg.162.2022.01.19.23.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 23:53:01 -0800 (PST)
Received: by mail-pf1-f176.google.com with SMTP id e28so189492pfj.5;
 Wed, 19 Jan 2022 23:53:00 -0800 (PST)
X-Received: by 2002:a05:6a00:26c5:b0:4bd:4ad6:9c71 with SMTP id
 p5-20020a056a0026c500b004bd4ad69c71mr34566681pfw.45.1642665180277; Wed, 19
 Jan 2022 23:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20220119152614.27548-1-anup@brainfault.org>
 <20220119152614.27548-10-anup@brainfault.org>
In-Reply-To: <20220119152614.27548-10-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 20 Jan 2022 15:52:49 +0800
X-Gmail-Original-Message-ID: <CANzO1D27LF6=MWtrw7j3XDYDcTBUSWfw20PLqGf=0gp+pDT_-Q@mail.gmail.com>
Message-ID: <CANzO1D27LF6=MWtrw7j3XDYDcTBUSWfw20PLqGf=0gp+pDT_-Q@mail.gmail.com>
Subject: Re: [PATCH v8 09/23] target/riscv: Implement AIA local interrupt
 priorities
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008e2efd05d5feca0c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 07:53:12 -0000

--0000000000008e2efd05d5feca0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2022=E5=B9=B41=E6=9C=8819=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:33=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA spec defines programmable 8-bit priority for each local interrupt
> at M-level, S-level and VS-level so we extend local interrupt processing
> to consider AIA interrupt priorities. The AIA CSRs which help software
> configure local interrupt priorities will be added by subsequent patches.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  19 +++
>  target/riscv/cpu.h        |  12 ++
>  target/riscv/cpu_helper.c | 281 +++++++++++++++++++++++++++++++++++---
>  target/riscv/machine.c    |   3 +
>  4 files changed, 294 insertions(+), 21 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 14cf9925a3..f137c4bffb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -384,6 +384,10 @@ void restore_state_to_opc(CPURISCVState *env,
> TranslationBlock *tb,
>
>  static void riscv_cpu_reset(DeviceState *dev)
>  {
> +#ifndef CONFIG_USER_ONLY
> +    uint8_t iprio;
> +    int i, irq, rdzero;
> +#endif
>      CPUState *cs =3D CPU(dev);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> @@ -406,6 +410,21 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->miclaim =3D MIP_SGEIP;
>      env->pc =3D env->resetvec;
>      env->two_stage_lookup =3D false;
> +
> +    /* Initialized default priorities of local interrupts. */
> +    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
> +        iprio =3D riscv_cpu_default_priority(i);
> +        env->miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0 : iprio;
> +        env->siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0 : iprio;
> +        env->hviprio[i] =3D 0;
> +    }
> +    i =3D 0;
> +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
> +        if (!rdzero) {
> +            env->hviprio[irq] =3D env->miprio[irq];
> +        }
> +        i++;
> +    }
>      /* mmte is supposed to have pm.current hardwired to 1 */
>      env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 730697fa44..bcdca972ce 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -191,6 +191,10 @@ struct CPURISCVState {
>      target_ulong mcause;
>      target_ulong mtval;  /* since: priv-1.10.0 */
>
> +    /* Machine and Supervisor interrupt priorities */
> +    uint8_t miprio[64];
> +    uint8_t siprio[64];
> +
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
>      target_ulong hedeleg;
> @@ -203,6 +207,9 @@ struct CPURISCVState {
>      target_ulong hgeip;
>      uint64_t htimedelta;
>
> +    /* Hypervisor controlled virtual interrupt priorities */
> +    uint8_t hviprio[64];
> +
>      /* Upper 64-bits of 128-bit CSRs */
>      uint64_t mscratchh;
>      uint64_t sscratchh;
> @@ -405,6 +412,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction
> f, CPUState *cs,
>                                 int cpuid, void *opaque);
>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
);
> +uint8_t riscv_cpu_default_priority(int irq);
> +int riscv_cpu_mirq_pending(CPURISCVState *env);
> +int riscv_cpu_sirq_pending(CPURISCVState *env);
> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>  void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1c606d7cbb..e2cca8fb92 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -154,36 +154,275 @@ void cpu_get_tb_cpu_state(CPURISCVState *env,
> target_ulong *pc,
>  }
>
>  #ifndef CONFIG_USER_ONLY
> -static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> +
> +/*
> + * The HS-mode is allowed to configure priority only for the
> + * following VS-mode local interrupts:
> + *
> + * 0  (Reserved interrupt, reads as zero)
> + * 1  Supervisor software interrupt
> + * 4  (Reserved interrupt, reads as zero)
> + * 5  Supervisor timer interrupt
> + * 8  (Reserved interrupt, reads as zero)
> + * 13 (Reserved interrupt)
> + * 14 "
> + * 15 "
> + * 16 "
> + * 18 Debug/trace interrupt
> + * 20 (Reserved interrupt)
> + * 22 "
> + * 24 "
> + * 26 "
> + * 28 "
> + * 30 (Reserved for standard reporting of bus or system errors)
> + */
> +
> +static const int hviprio_index2irq[] =3D
> +    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
> +static const int hviprio_index2rdzero[] =3D
> +    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
> +
> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
)
> +{
> +    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
> +        return -EINVAL;
> +    }
> +
> +    if (out_irq) {
> +        *out_irq =3D hviprio_index2irq[index];
> +    }
> +
> +    if (out_rdzero) {
> +        *out_rdzero =3D hviprio_index2rdzero[index];
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Default priorities of local interrupts are defined in the
> + * RISC-V Advanced Interrupt Architecture specification.
> + *
> + * ----------------------------------------------------------------
> + *  Default  |
> + *  Priority | Major Interrupt Numbers
> + * ----------------------------------------------------------------
> + *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
> + *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
> + *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
> + *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
> + *           |
> + *           | 11 (0b),  3 (03),  7 (07)
> + *           |  9 (09),  1 (01),  5 (05)
> + *           | 12 (0c)
> + *           | 10 (0a),  2 (02),  6 (06)
> + *           |
> + *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
> + *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
> + *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
> + *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
> + * ----------------------------------------------------------------
> + */
> +static const uint8_t default_iprio[64] =3D {
> + [63] =3D IPRIO_DEFAULT_UPPER,
> + [62] =3D IPRIO_DEFAULT_UPPER + 1,
> + [31] =3D IPRIO_DEFAULT_UPPER + 2,
> + [30] =3D IPRIO_DEFAULT_UPPER + 3,
> + [61] =3D IPRIO_DEFAULT_UPPER + 4,
> + [60] =3D IPRIO_DEFAULT_UPPER + 5,
> +
> + [59] =3D IPRIO_DEFAULT_UPPER + 6,
> + [58] =3D IPRIO_DEFAULT_UPPER + 7,
> + [29] =3D IPRIO_DEFAULT_UPPER + 8,
> + [28] =3D IPRIO_DEFAULT_UPPER + 9,
> + [57] =3D IPRIO_DEFAULT_UPPER + 10,
> + [56] =3D IPRIO_DEFAULT_UPPER + 11,
> +
> + [55] =3D IPRIO_DEFAULT_UPPER + 12,
> + [54] =3D IPRIO_DEFAULT_UPPER + 13,
> + [27] =3D IPRIO_DEFAULT_UPPER + 14,
> + [26] =3D IPRIO_DEFAULT_UPPER + 15,
> + [53] =3D IPRIO_DEFAULT_UPPER + 16,
> + [52] =3D IPRIO_DEFAULT_UPPER + 17,
> +
> + [51] =3D IPRIO_DEFAULT_UPPER + 18,
> + [50] =3D IPRIO_DEFAULT_UPPER + 19,
> + [25] =3D IPRIO_DEFAULT_UPPER + 20,
> + [24] =3D IPRIO_DEFAULT_UPPER + 21,
> + [49] =3D IPRIO_DEFAULT_UPPER + 22,
> + [48] =3D IPRIO_DEFAULT_UPPER + 23,
> +
> + [11] =3D IPRIO_DEFAULT_M,
> + [3]  =3D IPRIO_DEFAULT_M + 1,
> + [7]  =3D IPRIO_DEFAULT_M + 2,
> +
> + [9]  =3D IPRIO_DEFAULT_S,
> + [1]  =3D IPRIO_DEFAULT_S + 1,
> + [5]  =3D IPRIO_DEFAULT_S + 2,
> +
> + [12] =3D IPRIO_DEFAULT_SGEXT,
> +
> + [10] =3D IPRIO_DEFAULT_VS,
> + [2]  =3D IPRIO_DEFAULT_VS + 1,
> + [6]  =3D IPRIO_DEFAULT_VS + 2,
> +
> + [47] =3D IPRIO_DEFAULT_LOWER,
> + [46] =3D IPRIO_DEFAULT_LOWER + 1,
> + [23] =3D IPRIO_DEFAULT_LOWER + 2,
> + [22] =3D IPRIO_DEFAULT_LOWER + 3,
> + [45] =3D IPRIO_DEFAULT_LOWER + 4,
> + [44] =3D IPRIO_DEFAULT_LOWER + 5,
> +
> + [43] =3D IPRIO_DEFAULT_LOWER + 6,
> + [42] =3D IPRIO_DEFAULT_LOWER + 7,
> + [21] =3D IPRIO_DEFAULT_LOWER + 8,
> + [20] =3D IPRIO_DEFAULT_LOWER + 9,
> + [41] =3D IPRIO_DEFAULT_LOWER + 10,
> + [40] =3D IPRIO_DEFAULT_LOWER + 11,
> +
> + [39] =3D IPRIO_DEFAULT_LOWER + 12,
> + [38] =3D IPRIO_DEFAULT_LOWER + 13,
> + [19] =3D IPRIO_DEFAULT_LOWER + 14,
> + [18] =3D IPRIO_DEFAULT_LOWER + 15,
> + [37] =3D IPRIO_DEFAULT_LOWER + 16,
> + [36] =3D IPRIO_DEFAULT_LOWER + 17,
> +
> + [35] =3D IPRIO_DEFAULT_LOWER + 18,
> + [34] =3D IPRIO_DEFAULT_LOWER + 19,
> + [17] =3D IPRIO_DEFAULT_LOWER + 20,
> + [16] =3D IPRIO_DEFAULT_LOWER + 21,
> + [33] =3D IPRIO_DEFAULT_LOWER + 22,
> + [32] =3D IPRIO_DEFAULT_LOWER + 23,
> +};
> +
> +uint8_t riscv_cpu_default_priority(int irq)
>  {
> -    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
> +    if (irq < 0 || irq > 63) {
> +        return IPRIO_MMAXIPRIO;
> +    }
> +
> +    return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
> +};
>
> -    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
> -    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
> +static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> +                                    int extirq, unsigned int
> extirq_def_prio,
> +                                    uint64_t pending, uint8_t *iprio)
> +{
> +    int irq, best_irq =3D RISCV_EXCP_NONE;
> +    unsigned int prio, best_prio =3D UINT_MAX;
>
> -    target_ulong vsgemask =3D
> -                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN=
);
> -    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
> +    if (!pending) {
> +        return RISCV_EXCP_NONE;
> +    }
>
> -    target_ulong pending =3D (env->mip | vsgein) & env->mie;
> +    irq =3D ctz64(pending);
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return irq;
> +    }
>
> -    target_ulong mie    =3D env->priv < PRV_M ||
> -                          (env->priv =3D=3D PRV_M && mstatus_mie);
> -    target_ulong sie    =3D env->priv < PRV_S ||
> -                          (env->priv =3D=3D PRV_S && mstatus_sie);
> -    target_ulong hsie   =3D virt_enabled || sie;
> -    target_ulong vsie   =3D virt_enabled && sie;
> +    pending =3D pending >> irq;
> +    while (pending) {
> +        prio =3D iprio[irq];
> +        if (!prio) {
> +            if (irq =3D=3D extirq) {
> +                prio =3D extirq_def_prio;
> +            } else {
> +                prio =3D (riscv_cpu_default_priority(irq) <
> extirq_def_prio) ?
> +                       1 : IPRIO_MMAXIPRIO;
> +            }
> +        }
> +        if ((pending & 0x1) && (prio <=3D best_prio)) {
> +            best_irq =3D irq;
> +            best_prio =3D prio;
> +        }
> +        irq++;
> +        pending =3D pending >> 1;
> +    }
>
> -    target_ulong irqs =3D
> -            (pending & ~env->mideleg & -mie) |
> -            (pending &  env->mideleg & ~env->hideleg & -hsie) |
> -            (pending &  env->mideleg &  env->hideleg & -vsie);
> +    return best_irq;
> +}
>
> -    if (irqs) {
> -        return ctz64(irqs); /* since non-zero */
> +static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> +{
> +    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> +    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +
> +    return (env->mip | vsgein) & env->mie;
> +}
> +
> +int riscv_cpu_mirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
> +                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> +                                    irqs, env->miprio);
> +}
> +
> +int riscv_cpu_sirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                    irqs, env->siprio);
> +}
> +
> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                    irqs >> 1, env->hviprio);
> +}
> +
> +static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> +{
> +    int virq;
> +    uint64_t irqs, pending, mie, hsie, vsie;
> +
> +    /* Determine interrupt enable state of all privilege modes */
> +    if (riscv_cpu_virt_enabled(env)) {
> +        mie =3D 1;
> +        hsie =3D 1;
> +        vsie =3D (env->priv < PRV_S) ||
> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
>      } else {
> -        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
> +        mie =3D (env->priv < PRV_M) ||
> +              (env->priv =3D=3D PRV_M && get_field(env->mstatus,
> MSTATUS_MIE));
> +        hsie =3D (env->priv < PRV_S) ||
> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
> +        vsie =3D 0;
> +    }
> +
> +    /* Determine all pending interrupts */
> +    pending =3D riscv_cpu_all_pending(env);
> +
> +    /* Check M-mode interrupts */
> +    irqs =3D pending & ~env->mideleg & -mie;
> +    if (irqs) {
> +        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> +                                        irqs, env->miprio);
>      }
> +
> +    /* Check HS-mode interrupts */
> +    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
> +    if (irqs) {
> +        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                        irqs, env->siprio);
> +    }
> +
> +    /* Check VS-mode interrupts */
> +    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
> +    if (irqs) {
> +        virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_=
S,
> +                                        irqs >> 1, env->hviprio);
> +        return (virq <=3D 0) ? virq : virq + 1;
> +    }
> +
> +    /* Indicate no pending interrupt */
> +    return RISCV_EXCP_NONE;
>  }
>
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 39b5dbc36b..92536c4a0e 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>
>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
>          VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> @@ -223,6 +224,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> +        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
> +        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
>          VMSTATE_UINTTL(env.pc, RISCVCPU),
>          VMSTATE_UINTTL(env.load_res, RISCVCPU),
>          VMSTATE_UINTTL(env.load_val, RISCVCPU),
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--0000000000008e2efd05d5feca0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" targe=
t=3D"_blank">anup@brainfault.org</a>&gt; =E6=96=BC 2022=E5=B9=B41=E6=9C=881=
9=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:33=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Anu=
p Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=3D"_blank">anup.pa=
tel@wdc.com</a>&gt;<br>
<br>
The AIA spec defines programmable 8-bit priority for each local interrupt<b=
r>
at M-level, S-level and VS-level so we extend local interrupt processing<br=
>
to consider AIA interrupt priorities. The AIA CSRs which help software<br>
configure local interrupt priorities will be added by subsequent patches.<b=
r>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<br>
=C2=A0target/riscv/cpu_helper.c | 281 +++++++++++++++++++++++++++++++++++--=
-<br>
=C2=A0target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A04 files changed, 294 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 14cf9925a3..f137c4bffb 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -384,6 +384,10 @@ void restore_state_to_opc(CPURISCVState *env, Translat=
ionBlock *tb,<br>
<br>
=C2=A0static void riscv_cpu_reset(DeviceState *dev)<br>
=C2=A0{<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 uint8_t iprio;<br>
+=C2=A0 =C2=A0 int i, irq, rdzero;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(dev);<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);<br>
@@ -406,6 +410,21 @@ static void riscv_cpu_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;miclaim =3D MIP_SGEIP;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;pc =3D env-&gt;resetvec;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;two_stage_lookup =3D false;<br>
+<br>
+=C2=A0 =C2=A0 /* Initialized default priorities of local interrupts. */<br=
>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(env-&gt;miprio); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D riscv_cpu_default_priority(i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0=
 : iprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0=
 : iprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hviprio[i] =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 i =3D 0;<br>
+=C2=A0 =C2=A0 while (!riscv_cpu_hviprio_index2irq(i, &amp;irq, &amp;rdzero=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdzero) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hviprio[irq] =3D env-&gt=
;miprio[irq];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0/* mmte is supposed to have pm.current hardwired to 1 *=
/<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);=
<br>
=C2=A0#endif<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 730697fa44..bcdca972ce 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -191,6 +191,10 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mcause;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtval;=C2=A0 /* since: priv-1.10.0 */<br>
<br>
+=C2=A0 =C2=A0 /* Machine and Supervisor interrupt priorities */<br>
+=C2=A0 =C2=A0 uint8_t miprio[64];<br>
+=C2=A0 =C2=A0 uint8_t siprio[64];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Hypervisor CSRs */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hstatus;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hedeleg;<br>
@@ -203,6 +207,9 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hgeip;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t htimedelta;<br>
<br>
+=C2=A0 =C2=A0 /* Hypervisor controlled virtual interrupt priorities */<br>
+=C2=A0 =C2=A0 uint8_t hviprio[64];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Upper 64-bits of 128-bit CSRs */<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mscratchh;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t sscratchh;<br>
@@ -405,6 +412,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f=
, CPUState *cs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cpuid, void *opaque);<br>
=C2=A0int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int r=
eg);<br>
=C2=A0int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);<br>
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);=
<br>
+uint8_t riscv_cpu_default_priority(int irq);<br>
+int riscv_cpu_mirq_pending(CPURISCVState *env);<br>
+int riscv_cpu_sirq_pending(CPURISCVState *env);<br>
+int riscv_cpu_vsirq_pending(CPURISCVState *env);<br>
=C2=A0bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
=C2=A0target_ulong riscv_cpu_get_geilen(CPURISCVState *env);<br>
=C2=A0void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);<b=
r>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 1c606d7cbb..e2cca8fb92 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -154,36 +154,275 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
_ulong *pc,<br>
=C2=A0}<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
-static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
+<br>
+/*<br>
+ * The HS-mode is allowed to configure priority only for the<br>
+ * following VS-mode local interrupts:<br>
+ *<br>
+ * 0=C2=A0 (Reserved interrupt, reads as zero)<br>
+ * 1=C2=A0 Supervisor software interrupt<br>
+ * 4=C2=A0 (Reserved interrupt, reads as zero)<br>
+ * 5=C2=A0 Supervisor timer interrupt<br>
+ * 8=C2=A0 (Reserved interrupt, reads as zero)<br>
+ * 13 (Reserved interrupt)<br>
+ * 14 &quot;<br>
+ * 15 &quot;<br>
+ * 16 &quot;<br>
+ * 18 Debug/trace interrupt<br>
+ * 20 (Reserved interrupt)<br>
+ * 22 &quot;<br>
+ * 24 &quot;<br>
+ * 26 &quot;<br>
+ * 28 &quot;<br>
+ * 30 (Reserved for standard reporting of bus or system errors)<br>
+ */<br>
+<br>
+static const int hviprio_index2irq[] =3D<br>
+=C2=A0 =C2=A0 { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 =
};<br>
+static const int hviprio_index2rdzero[] =3D<br>
+=C2=A0 =C2=A0 { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };<br>
+<br>
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)<=
br>
+{<br>
+=C2=A0 =C2=A0 if (index &lt; 0 || ARRAY_SIZE(hviprio_index2irq) &lt;=3D in=
dex) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (out_irq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_irq =3D hviprio_index2irq[index];<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (out_rdzero) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_rdzero =3D hviprio_index2rdzero[index];<b=
r>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+/*<br>
+ * Default priorities of local interrupts are defined in the<br>
+ * RISC-V Advanced Interrupt Architecture specification.<br>
+ *<br>
+ * ----------------------------------------------------------------<br>
+ *=C2=A0 Default=C2=A0 |<br>
+ *=C2=A0 Priority | Major Interrupt Numbers<br>
+ * ----------------------------------------------------------------<br>
+ *=C2=A0 Highest=C2=A0 | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (=
3c),<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 59 (3b), 58 (3a), 29 (1d), 28=
 (1c), 57 (39), 56 (38),<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 55 (37), 54 (36), 27 (1b), 26=
 (1a), 53 (35), 52 (34),<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 (33), 50 (32), 25 (19), 24=
 (18), 49 (31), 48 (30)<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 (0b),=C2=A0 3 (03),=C2=A0 =
7 (07)<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 (09),=C2=A0 1 (01),=
=C2=A0 5 (05)<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 (0c)<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 (0a),=C2=A0 2 (02),=C2=A0 =
6 (06)<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 47 (2f), 46 (2e), 23 (17), 22=
 (16), 45 (2d), 44 (2c),<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 (2b), 42 (2a), 21 (15), 20=
 (14), 41 (29), 40 (28),<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 39 (27), 38 (26), 19 (13), 18=
 (12), 37 (25), 36 (24),<br>
+ *=C2=A0 Lowest=C2=A0 =C2=A0| 35 (23), 34 (22), 17 (11), 16 (10), 33 (21),=
 32 (20)<br>
+ * ----------------------------------------------------------------<br>
+ */<br>
+static const uint8_t default_iprio[64] =3D {<br>
+ [63] =3D IPRIO_DEFAULT_UPPER,<br>
+ [62] =3D IPRIO_DEFAULT_UPPER + 1,<br>
+ [31] =3D IPRIO_DEFAULT_UPPER + 2,<br>
+ [30] =3D IPRIO_DEFAULT_UPPER + 3,<br>
+ [61] =3D IPRIO_DEFAULT_UPPER + 4,<br>
+ [60] =3D IPRIO_DEFAULT_UPPER + 5,<br>
+<br>
+ [59] =3D IPRIO_DEFAULT_UPPER + 6,<br>
+ [58] =3D IPRIO_DEFAULT_UPPER + 7,<br>
+ [29] =3D IPRIO_DEFAULT_UPPER + 8,<br>
+ [28] =3D IPRIO_DEFAULT_UPPER + 9,<br>
+ [57] =3D IPRIO_DEFAULT_UPPER + 10,<br>
+ [56] =3D IPRIO_DEFAULT_UPPER + 11,<br>
+<br>
+ [55] =3D IPRIO_DEFAULT_UPPER + 12,<br>
+ [54] =3D IPRIO_DEFAULT_UPPER + 13,<br>
+ [27] =3D IPRIO_DEFAULT_UPPER + 14,<br>
+ [26] =3D IPRIO_DEFAULT_UPPER + 15,<br>
+ [53] =3D IPRIO_DEFAULT_UPPER + 16,<br>
+ [52] =3D IPRIO_DEFAULT_UPPER + 17,<br>
+<br>
+ [51] =3D IPRIO_DEFAULT_UPPER + 18,<br>
+ [50] =3D IPRIO_DEFAULT_UPPER + 19,<br>
+ [25] =3D IPRIO_DEFAULT_UPPER + 20,<br>
+ [24] =3D IPRIO_DEFAULT_UPPER + 21,<br>
+ [49] =3D IPRIO_DEFAULT_UPPER + 22,<br>
+ [48] =3D IPRIO_DEFAULT_UPPER + 23,<br>
+<br>
+ [11] =3D IPRIO_DEFAULT_M,<br>
+ [3]=C2=A0 =3D IPRIO_DEFAULT_M + 1,<br>
+ [7]=C2=A0 =3D IPRIO_DEFAULT_M + 2,<br>
+<br>
+ [9]=C2=A0 =3D IPRIO_DEFAULT_S,<br>
+ [1]=C2=A0 =3D IPRIO_DEFAULT_S + 1,<br>
+ [5]=C2=A0 =3D IPRIO_DEFAULT_S + 2,<br>
+<br>
+ [12] =3D IPRIO_DEFAULT_SGEXT,<br>
+<br>
+ [10] =3D IPRIO_DEFAULT_VS,<br>
+ [2]=C2=A0 =3D IPRIO_DEFAULT_VS + 1,<br>
+ [6]=C2=A0 =3D IPRIO_DEFAULT_VS + 2,<br>
+<br>
+ [47] =3D IPRIO_DEFAULT_LOWER,<br>
+ [46] =3D IPRIO_DEFAULT_LOWER + 1,<br>
+ [23] =3D IPRIO_DEFAULT_LOWER + 2,<br>
+ [22] =3D IPRIO_DEFAULT_LOWER + 3,<br>
+ [45] =3D IPRIO_DEFAULT_LOWER + 4,<br>
+ [44] =3D IPRIO_DEFAULT_LOWER + 5,<br>
+<br>
+ [43] =3D IPRIO_DEFAULT_LOWER + 6,<br>
+ [42] =3D IPRIO_DEFAULT_LOWER + 7,<br>
+ [21] =3D IPRIO_DEFAULT_LOWER + 8,<br>
+ [20] =3D IPRIO_DEFAULT_LOWER + 9,<br>
+ [41] =3D IPRIO_DEFAULT_LOWER + 10,<br>
+ [40] =3D IPRIO_DEFAULT_LOWER + 11,<br>
+<br>
+ [39] =3D IPRIO_DEFAULT_LOWER + 12,<br>
+ [38] =3D IPRIO_DEFAULT_LOWER + 13,<br>
+ [19] =3D IPRIO_DEFAULT_LOWER + 14,<br>
+ [18] =3D IPRIO_DEFAULT_LOWER + 15,<br>
+ [37] =3D IPRIO_DEFAULT_LOWER + 16,<br>
+ [36] =3D IPRIO_DEFAULT_LOWER + 17,<br>
+<br>
+ [35] =3D IPRIO_DEFAULT_LOWER + 18,<br>
+ [34] =3D IPRIO_DEFAULT_LOWER + 19,<br>
+ [17] =3D IPRIO_DEFAULT_LOWER + 20,<br>
+ [16] =3D IPRIO_DEFAULT_LOWER + 21,<br>
+ [33] =3D IPRIO_DEFAULT_LOWER + 22,<br>
+ [32] =3D IPRIO_DEFAULT_LOWER + 23,<br>
+};<br>
+<br>
+uint8_t riscv_cpu_default_priority(int irq)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);<b=
r>
+=C2=A0 =C2=A0 if (irq &lt; 0 || irq &gt; 63) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IPRIO_MMAXIPRIO;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXI=
PRIO;<br>
+};<br>
<br>
-=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(env-&gt;mstatus, MSTA=
TUS_MIE);<br>
-=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(env-&gt;mstatus, MSTA=
TUS_SIE);<br>
+static int riscv_cpu_pending_to_irq(CPURISCVState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int extirq, unsigned i=
nt extirq_def_prio,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t pending, uint=
8_t *iprio)<br>
+{<br>
+=C2=A0 =C2=A0 int irq, best_irq =3D RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 unsigned int prio, best_prio =3D UINT_MAX;<br>
<br>
-=C2=A0 =C2=A0 target_ulong vsgemask =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_ulong)1 &l=
t;&lt; get_field(env-&gt;hstatus, HSTATUS_VGEIN);<br>
-=C2=A0 =C2=A0 target_ulong vsgein =3D (env-&gt;hgeip &amp; vsgemask) ? MIP=
_VSEIP : 0;<br>
+=C2=A0 =C2=A0 if (!pending) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 target_ulong pending =3D (env-&gt;mip | vsgein) &amp; env-&g=
t;mie;<br>
+=C2=A0 =C2=A0 irq =3D ctz64(pending);<br>
+=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return irq;<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 target_ulong mie=C2=A0 =C2=A0 =3D env-&gt;priv &lt; PRV_M ||=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_M &amp;&amp; mstatus_mie);<br>
-=C2=A0 =C2=A0 target_ulong sie=C2=A0 =C2=A0 =3D env-&gt;priv &lt; PRV_S ||=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; mstatus_sie);<br>
-=C2=A0 =C2=A0 target_ulong hsie=C2=A0 =C2=A0=3D virt_enabled || sie;<br>
-=C2=A0 =C2=A0 target_ulong vsie=C2=A0 =C2=A0=3D virt_enabled &amp;&amp; si=
e;<br>
+=C2=A0 =C2=A0 pending =3D pending &gt;&gt; irq;<br>
+=C2=A0 =C2=A0 while (pending) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D iprio[irq];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!prio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq =3D=3D extirq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D extirq_de=
f_prio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D (riscv_cp=
u_default_priority(irq) &lt; extirq_def_prio) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01 : IPRIO_MMAXIPRIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pending &amp; 0x1) &amp;&amp; (prio &lt;=
=3D best_prio)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_irq =3D irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_prio =3D prio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pending =3D pending &gt;&gt; 1;<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 target_ulong irqs =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp; ~env-&gt;mideleg =
&amp; -mie) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=C2=A0 env-&gt;mid=
eleg &amp; ~env-&gt;hideleg &amp; -hsie) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=C2=A0 env-&gt;mid=
eleg &amp;=C2=A0 env-&gt;hideleg &amp; -vsie);<br>
+=C2=A0 =C2=A0 return best_irq;<br>
+}<br>
<br>
-=C2=A0 =C2=A0 if (irqs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ctz64(irqs); /* since non-zero */<br>
+static uint64_t riscv_cpu_all_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t gein =3D get_field(env-&gt;hstatus, HSTATUS_VGEIN);=
<br>
+=C2=A0 =C2=A0 uint64_t vsgein =3D (env-&gt;hgeip &amp; (1ULL &lt;&lt; gein=
)) ? MIP_VSEIP : 0;<br>
+<br>
+=C2=A0 =C2=A0 return (env-&gt;mip | vsgein) &amp; env-&gt;mie;<br>
+}<br>
+<br>
+int riscv_cpu_mirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; ~env-&gt;=
mideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(MI=
P_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAUL=
T_M,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, env-&gt;miprio);=
<br>
+}<br>
+<br>
+int riscv_cpu_sirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; env-&gt;m=
ideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(MI=
P_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAUL=
T_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, env-&gt;siprio);=
<br>
+}<br>
+<br>
+int riscv_cpu_vsirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; env-&gt;m=
ideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MIP=
_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAUL=
T_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs &gt;&gt; 1, env-&=
gt;hviprio);<br>
+}<br>
+<br>
+static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 int virq;<br>
+=C2=A0 =C2=A0 uint64_t irqs, pending, mie, hsie, vsie;<br>
+<br>
+=C2=A0 =C2=A0 /* Determine interrupt enable state of all privilege modes *=
/<br>
+=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D (env-&gt;priv &lt; PRV_S) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv =3D=
=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE));<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE; /* indicates no pendin=
g interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D (env-&gt;priv &lt; PRV_M) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_=
M &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_MIE));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D (env-&gt;priv &lt; PRV_S) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv =3D=
=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Determine all pending interrupts */<br>
+=C2=A0 =C2=A0 pending =3D riscv_cpu_all_pending(env);<br>
+<br>
+=C2=A0 =C2=A0 /* Check M-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; ~env-&gt;mideleg &amp; -mie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_M_EXT=
, IPRIO_DEFAULT_M,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, en=
v-&gt;miprio);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 /* Check HS-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; ~env-&gt;hidele=
g &amp; -hsie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT=
, IPRIO_DEFAULT_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, en=
v-&gt;siprio);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Check VS-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; env-&gt;hideleg=
 &amp; -vsie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_E=
XT, IPRIO_DEFAULT_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs &gt=
;&gt; 1, env-&gt;hviprio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (virq &lt;=3D 0) ? virq : virq + 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Indicate no pending interrupt */<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
=C2=A0bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br=
>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index 39b5dbc36b..92536c4a0e 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeie, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeip, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.htimedelta, RISCVCPU),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64)=
,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.vsstatus, RISCVCPU),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.vstvec, RISCVCPU),<br>
@@ -223,6 +224,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 3=
2),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 3=
2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.pc, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.load_res, RISCVCPU),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.load_val, RISCVCPU),<b=
r>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--0000000000008e2efd05d5feca0c--

