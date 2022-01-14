Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8GDU-00050C-MI
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 01:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n8GDQ-0004vB-BD
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 01:37:36 -0500
Received: from [2607:f8b0:4864:20::432] (port=37456
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n8GDN-0005PK-Ec
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 01:37:36 -0500
Received: by mail-pf1-x432.google.com with SMTP id p37so1942944pfh.4
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 22:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0e5y4c5jVJZPafTKWXA6tDk9gMjaE9hZayJyyFE0Swg=;
 b=KoqTcWiJle2EjrmrRnGhGUr2j2qiDcwDu1Rg8v+jJ/DzGg7BY2RpGPIdEMEWRSDvNk
 rNRyOGKYrhooU3aQNKSE3SeyEoUQxZR6ggZtZ9q4WdQnUll0ecEmsMZEGjXmviUTlio2
 he04w1Ktb8Jg/dV0RgtGbCVGO5kfCul4GIuQ2Gi1NYK7KZo2SXb/fD2296Iz6p1XFmbc
 vmr8YQk8sE8H70TL8Wy7BFDbBE830mZV2D2URGPmHCdKFuxGRlK0sUwELanClL6xhm7z
 Xm7Au3v5NG97nPY6CVUM6mnpYv9Sf4f91x44Tw94plCiXFm+IlXpz6uZ0tuY7/+oeBfS
 WQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0e5y4c5jVJZPafTKWXA6tDk9gMjaE9hZayJyyFE0Swg=;
 b=bsrL0TwtU6Hf0I+ufUbvHwn5DZ2s5+oH65lYHB82g8LAK2exSXBqU9ER/AEJPTnJoi
 OuHiDKnieHHCuOs6rPuGiEUtQm5UbntAdXRauMeIl/Ji+qBO7vKIT66D6UEBEV6CLURh
 BhQR5YzNPHNFl/dzLWAWuurp7WpG2hDCUx1FYi9/bBzjZPlVHdF1XHecRB9MXArfxylE
 +7xGpwX0R6PBBRM9e/5ltlUtvmeqVYLkaPolXQXGyFhW4XBnnO/oLxKKms53I4muXu5f
 z9F03UlA00NbSHMQTOOYqt/rEKdVRsDM+1ArfwzC50Ik1fBsAJoPvUsLaNQ4lFeYsTlE
 B9Uw==
X-Gm-Message-State: AOAM532RfMu9qvOJeJwCK7W8RZlaE678Zj9TNqu6NAT+jx/5s1OoIrV7
 BuY2F14GGEeF1Bhiq/15Y26XlpwHqR7jM9oH
X-Google-Smtp-Source: ABdhPJzuylg6bJdIEXITWReGbV8EH2FXDH6gGrXe9h3qMo0kqxSnsV+xfwGX4uOhfEx1zhJiep+KWQ==
X-Received: by 2002:a63:bd1a:: with SMTP id a26mr6929213pgf.16.1642142251370; 
 Thu, 13 Jan 2022 22:37:31 -0800 (PST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com.
 [209.85.215.176])
 by smtp.gmail.com with ESMTPSA id q18sm4793383pfn.184.2022.01.13.22.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 22:37:29 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id c5so1987755pgk.12;
 Thu, 13 Jan 2022 22:37:29 -0800 (PST)
X-Received: by 2002:a65:6ab8:: with SMTP id x24mr6866380pgu.50.1642142248772; 
 Thu, 13 Jan 2022 22:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-4-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-4-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 14 Jan 2022 14:37:17 +0800
X-Gmail-Original-Message-ID: <CANzO1D30bOxCtsMB0=LvWui_rs0tV=2D0jo7DQPvxuqgXa9fwQ@mail.gmail.com>
Message-ID: <CANzO1D30bOxCtsMB0=LvWui_rs0tV=2D0jo7DQPvxuqgXa9fwQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/23] target/riscv: Implement hgeie and hgeip CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000068a9f905d5850936"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Fri, 14 Jan 2022 06:37:36 -0000

--00000000000068a9f905d5850936
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:45=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The hgeie and hgeip CSRs are required for emulating an external
> interrupt controller capable of injecting virtual external interrupt
> to Guest/VM running at VS-level.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        | 61 ++++++++++++++++++++++++++++-----------
>  target/riscv/cpu.h        |  5 ++++
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 37 ++++++++++++++++++++++--
>  target/riscv/csr.c        | 43 ++++++++++++++++++---------
>  target/riscv/machine.c    |  6 ++--
>  6 files changed, 118 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d92ce7555..f4dbc766c2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -582,23 +582,49 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
>  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(opaque);
> +    CPURISCVState *env =3D &cpu->env;
>
> -    switch (irq) {
> -    case IRQ_U_SOFT:
> -    case IRQ_S_SOFT:
> -    case IRQ_VS_SOFT:
> -    case IRQ_M_SOFT:
> -    case IRQ_U_TIMER:
> -    case IRQ_S_TIMER:
> -    case IRQ_VS_TIMER:
> -    case IRQ_M_TIMER:
> -    case IRQ_U_EXT:
> -    case IRQ_S_EXT:
> -    case IRQ_VS_EXT:
> -    case IRQ_M_EXT:
> -        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> -        break;
> -    default:
> +    if (irq < IRQ_LOCAL_MAX) {
> +        switch (irq) {
> +        case IRQ_U_SOFT:
> +        case IRQ_S_SOFT:
> +        case IRQ_VS_SOFT:
> +        case IRQ_M_SOFT:
> +        case IRQ_U_TIMER:
> +        case IRQ_S_TIMER:
> +        case IRQ_VS_TIMER:
> +        case IRQ_M_TIMER:
> +        case IRQ_U_EXT:
> +        case IRQ_S_EXT:
> +        case IRQ_VS_EXT:
> +        case IRQ_M_EXT:
> +            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    } else if (irq < (IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX)) {
> +        /* Require H-extension for handling guest local interrupts */
> +        if (!riscv_has_ext(env, RVH)) {
> +            g_assert_not_reached();
> +        }
> +
> +        /* Compute bit position in HGEIP CSR */
> +        irq =3D irq - IRQ_LOCAL_MAX + 1;
> +        if (env->geilen < irq) {
> +            g_assert_not_reached();
> +        }
> +
> +        /* Update HGEIP CSR */
> +        env->hgeip &=3D ~((target_ulong)1 << irq);
> +        if (level) {
> +            env->hgeip |=3D (target_ulong)1 << irq;
> +        }
> +
> +        /* Update mip.SGEIP bit */
> +        riscv_cpu_update_mip(cpu, MIP_SGEIP,
> +                             BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
> +    } else {
>          g_assert_not_reached();
>      }
>  }
> @@ -611,7 +637,8 @@ static void riscv_cpu_init(Object *obj)
>      cpu_set_cpustate_pointers(cpu);
>
>  #ifndef CONFIG_USER_ONLY
> -    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
> +    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
> +                      IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index dc10f27093..6895ac138c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -151,6 +151,7 @@ struct CPURISCVState {
>      target_ulong priv;
>      /* This contains QEMU specific information about the virt state. */
>      target_ulong virt;
> +    target_ulong geilen;
>      target_ulong resetvec;
>
>      target_ulong mhartid;
> @@ -188,6 +189,8 @@ struct CPURISCVState {
>      target_ulong htval;
>      target_ulong htinst;
>      target_ulong hgatp;
> +    target_ulong hgeie;
> +    target_ulong hgeip;
>      uint64_t htimedelta;
>
>      /* Virtual CSRs */
> @@ -355,6 +358,8 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction
> f, CPUState *cs,
>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> +target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
> +void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>  bool riscv_cpu_vector_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fe276d4b34..f32159a19d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -536,6 +536,7 @@ typedef enum RISCVException {
>  #define IRQ_M_EXT                          11
>  #define IRQ_S_GEXT                         12
>  #define IRQ_LOCAL_MAX                      16
> +#define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 10f3baba53..bf50699b1f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -158,7 +158,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState
> *env)
>      target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
>      target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
>
> -    target_ulong pending =3D env->mip & env->mie;
> +    target_ulong vsgemask =3D
> +                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN=
);
> +    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
> +
> +    target_ulong pending =3D (env->mip | vsgein) & env->mie;
>
>      target_ulong mie    =3D env->priv < PRV_M ||
>                            (env->priv =3D=3D PRV_M && mstatus_mie);
> @@ -278,6 +282,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState
> *env)
>      }
>  }
>
> +target_ulong riscv_cpu_get_geilen(CPURISCVState *env)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return 0;
> +    }
> +
> +    return env->geilen;
> +}
> +
> +void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return;
> +    }
> +
> +    if (geilen > (TARGET_LONG_BITS - 1)) {
> +        return;
> +    }
> +
> +    env->geilen =3D geilen;
> +}
> +
>  bool riscv_cpu_virt_enabled(CPURISCVState *env)
>  {
>      if (!riscv_has_ext(env, RVH)) {
> @@ -321,9 +347,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_=
t
> mask, uint32_t value)
>  {
>      CPURISCVState *env =3D &cpu->env;
>      CPUState *cs =3D CPU(cpu);
> -    uint32_t old =3D env->mip;
> +    uint32_t gein, vsgein =3D 0, old =3D env->mip;
>      bool locked =3D false;
>
> +    if (riscv_cpu_virt_enabled(env)) {
> +        gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> +        vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    }
> +
>      if (!qemu_mutex_iothread_locked()) {
>          locked =3D true;
>          qemu_mutex_lock_iothread();
> @@ -331,7 +362,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t
> mask, uint32_t value)
>
>      env->mip =3D (env->mip & ~mask) | (value & mask);
>
> -    if (env->mip) {
> +    if (env->mip | vsgein) {
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a4028f28e0..50424a8344 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -832,7 +832,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int
> csrno,
>      RISCVCPU *cpu =3D env_archcpu(env);
>      /* Allow software control of delegable interrupts not claimed by
> hardware */
>      target_ulong mask =3D write_mask & delegable_ints & ~env->miclaim;
> -    uint32_t old_mip;
> +    uint32_t gin, old_mip;
>
>      if (mask) {
>          old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
> @@ -840,6 +840,11 @@ static RISCVException rmw_mip(CPURISCVState *env, in=
t
> csrno,
>          old_mip =3D env->mip;
>      }
>
> +    if (csrno !=3D CSR_HVIP) {
> +        gin =3D get_field(env->hstatus, HSTATUS_VGEIN);
> +        old_mip |=3D (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP=
 :
> 0;
> +    }
> +
>      if (ret_value) {
>          *ret_value =3D old_mip;
>      }
> @@ -1002,7 +1007,7 @@ static RISCVException rmw_vsip(CPURISCVState *env,
> int csrno,
>                                 target_ulong new_value, target_ulong
> write_mask)
>  {
>      /* Shift the S bits to their VS bit location in mip */
> -    int ret =3D rmw_mip(env, 0, ret_value, new_value << 1,
> +    int ret =3D rmw_mip(env, csrno, ret_value, new_value << 1,
>                        (write_mask << 1) & vsip_writable_mask &
> env->hideleg);
>
>      if (ret_value) {
> @@ -1022,7 +1027,7 @@ static RISCVException rmw_sip(CPURISCVState *env,
> int csrno,
>      if (riscv_cpu_virt_enabled(env)) {
>          ret =3D rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask=
);
>      } else {
> -        ret =3D rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
> +        ret =3D rmw_mip(env, csrno, ret_value, new_value,
>                        write_mask & env->mideleg & sip_writable_mask);
>      }
>
> @@ -1141,7 +1146,7 @@ static RISCVException rmw_hvip(CPURISCVState *env,
> int csrno,
>                                 target_ulong *ret_value,
>                                 target_ulong new_value, target_ulong
> write_mask)
>  {
> -    int ret =3D rmw_mip(env, 0, ret_value, new_value,
> +    int ret =3D rmw_mip(env, csrno, ret_value, new_value,
>                        write_mask & hvip_writable_mask);
>
>      if (ret_value) {
> @@ -1154,7 +1159,7 @@ static RISCVException rmw_hip(CPURISCVState *env,
> int csrno,
>                                target_ulong *ret_value,
>                                target_ulong new_value, target_ulong
> write_mask)
>  {
> -    int ret =3D rmw_mip(env, 0, ret_value, new_value,
> +    int ret =3D rmw_mip(env, csrno, ret_value, new_value,
>                        write_mask & hip_writable_mask);
>
>      if (ret_value) {
> @@ -1191,15 +1196,27 @@ static RISCVException
> write_hcounteren(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException write_hgeie(CPURISCVState *env, int csrno,
> -                                  target_ulong val)
> +static RISCVException read_hgeie(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
>  {
>      if (val) {
> -        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> +        *val =3D env->hgeie;
>      }
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException write_hgeie(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
> +    val &=3D ((((target_ulong)1) << env->geilen) - 1) << 1;
> +    env->hgeie =3D val;
> +    /* Update mip.SGEIP bit */
> +    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
> +                         BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_htval(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -1227,11 +1244,11 @@ static RISCVException write_htinst(CPURISCVState
> *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException write_hgeip(CPURISCVState *env, int csrno,
> -                                  target_ulong val)
> +static RISCVException read_hgeip(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
>  {
>      if (val) {
> -        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> +        *val =3D env->hgeip;
>      }
>      return RISCV_EXCP_NONE;
>  }
> @@ -1922,10 +1939,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>      [CSR_HIP]         =3D { "hip",         hmode,   NULL,   NULL,
>  rmw_hip           },
>      [CSR_HIE]         =3D { "hie",         hmode,   read_hie,
>  write_hie         },
>      [CSR_HCOUNTEREN]  =3D { "hcounteren",  hmode,   read_hcounteren,
> write_hcounteren  },
> -    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_zero,
> write_hgeie       },
> +    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_hgeie,
>  write_hgeie       },
>      [CSR_HTVAL]       =3D { "htval",       hmode,   read_htval,
>  write_htval       },
>      [CSR_HTINST]      =3D { "htinst",      hmode,   read_htinst,
> write_htinst      },
> -    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_zero,
> write_hgeip       },
> +    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_hgeip,       NU=
LL
>             },
>      [CSR_HGATP]       =3D { "hgatp",       hmode,   read_hgatp,
>  write_hgatp       },
>      [CSR_HTIMEDELTA]  =3D { "htimedelta",  hmode,   read_htimedelta,
> write_htimedelta  },
>      [CSR_HTIMEDELTAH] =3D { "htimedeltah", hmode32, read_htimedeltah,
> write_htimedeltah },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ad8248ebfd..76dd0d415c 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -78,8 +78,8 @@ static bool hyper_needed(void *opaque)
>
>  static const VMStateDescription vmstate_hyper =3D {
>      .name =3D "cpu/hyper",
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> +    .version_id =3D 2,
> +    .minimum_version_id =3D 2,
>      .needed =3D hyper_needed,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> @@ -89,6 +89,8 @@ static const VMStateDescription vmstate_hyper =3D {
>          VMSTATE_UINTTL(env.htval, RISCVCPU),
>          VMSTATE_UINTTL(env.htinst, RISCVCPU),
>          VMSTATE_UINTTL(env.hgatp, RISCVCPU),
> +        VMSTATE_UINTTL(env.hgeie, RISCVCPU),
> +        VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>
>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--00000000000068a9f905d5850936
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:45=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The hgeie and hgeip CSRs are required for emulating an external<br>
interrupt controller capable of injecting virtual external interrupt<br>
to Guest/VM running at VS-level.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 61 ++++++++++++++++++=
++++++++++-----------<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0target/riscv/cpu_helper.c | 37 ++++++++++++++++++++++--<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 43 ++++++++++++++++++=
---------<br>
=C2=A0target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 6 ++--<br>
=C2=A06 files changed, 118 insertions(+), 35 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 7d92ce7555..f4dbc766c2 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -582,23 +582,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)<br>
=C2=A0static void riscv_cpu_set_irq(void *opaque, int irq, int level)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(opaque);<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
<br>
-=C2=A0 =C2=A0 switch (irq) {<br>
-=C2=A0 =C2=A0 case IRQ_U_SOFT:<br>
-=C2=A0 =C2=A0 case IRQ_S_SOFT:<br>
-=C2=A0 =C2=A0 case IRQ_VS_SOFT:<br>
-=C2=A0 =C2=A0 case IRQ_M_SOFT:<br>
-=C2=A0 =C2=A0 case IRQ_U_TIMER:<br>
-=C2=A0 =C2=A0 case IRQ_S_TIMER:<br>
-=C2=A0 =C2=A0 case IRQ_VS_TIMER:<br>
-=C2=A0 =C2=A0 case IRQ_M_TIMER:<br>
-=C2=A0 =C2=A0 case IRQ_U_EXT:<br>
-=C2=A0 =C2=A0 case IRQ_S_EXT:<br>
-=C2=A0 =C2=A0 case IRQ_VS_EXT:<br>
-=C2=A0 =C2=A0 case IRQ_M_EXT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, 1 &lt;&lt; irq, BOOL=
_TO_MASK(level));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 if (irq &lt; IRQ_LOCAL_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (irq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_U_SOFT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_S_SOFT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_VS_SOFT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_M_SOFT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_U_TIMER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_S_TIMER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_VS_TIMER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_M_TIMER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_U_EXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_S_EXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_VS_EXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IRQ_M_EXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, 1 &lt;=
&lt; irq, BOOL_TO_MASK(level));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (irq &lt; (IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Require H-extension for handling guest loca=
l interrupts */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Compute bit position in HGEIP CSR */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D irq - IRQ_LOCAL_MAX + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;geilen &lt; irq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Update HGEIP CSR */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hgeip &amp;=3D ~((target_ulong)1 &lt;&=
lt; irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (level) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hgeip |=3D (target_ulong=
)1 &lt;&lt; irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Update mip.SGEIP bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, MIP_SGEIP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BOOL_TO_MASK(!!(env-&gt;hgeie &amp; env-&gt;=
hgeip)));<br>
+=C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -611,7 +637,8 @@ static void riscv_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0cpu_set_cpustate_pointers(cpu);<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_=
MAX);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);<br>
=C2=A0#endif /* CONFIG_USER_ONLY */<br>
=C2=A0}<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index dc10f27093..6895ac138c 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -151,6 +151,7 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong priv;<br>
=C2=A0 =C2=A0 =C2=A0/* This contains QEMU specific information about the vi=
rt state. */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong virt;<br>
+=C2=A0 =C2=A0 target_ulong geilen;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong resetvec;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mhartid;<br>
@@ -188,6 +189,8 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong htval;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong htinst;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hgatp;<br>
+=C2=A0 =C2=A0 target_ulong hgeie;<br>
+=C2=A0 =C2=A0 target_ulong hgeip;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t htimedelta;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Virtual CSRs */<br>
@@ -355,6 +358,8 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f,=
 CPUState *cs,<br>
=C2=A0int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int r=
eg);<br>
=C2=A0int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);<br>
=C2=A0bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env);<br>
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);<br>
=C2=A0bool riscv_cpu_vector_enabled(CPURISCVState *env);<br>
=C2=A0bool riscv_cpu_virt_enabled(CPURISCVState *env);<br>
=C2=A0void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index fe276d4b34..f32159a19d 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -536,6 +536,7 @@ typedef enum RISCVException {<br>
=C2=A0#define IRQ_M_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
=C2=A0#define IRQ_S_GEXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012<br>
=C2=A0#define IRQ_LOCAL_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
+#define IRQ_LOCAL_GUEST_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (TARGET_LONG_BITS - 1)<br>
<br>
=C2=A0/* mip masks */<br>
=C2=A0#define MIP_USIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_SOFT)<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 10f3baba53..bf50699b1f 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -158,7 +158,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *=
env)<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mstatus_mie =3D get_field(env-&gt;mstatus,=
 MSTATUS_MIE);<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mstatus_sie =3D get_field(env-&gt;mstatus,=
 MSTATUS_SIE);<br>
<br>
-=C2=A0 =C2=A0 target_ulong pending =3D env-&gt;mip &amp; env-&gt;mie;<br>
+=C2=A0 =C2=A0 target_ulong vsgemask =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_ulong)1 &l=
t;&lt; get_field(env-&gt;hstatus, HSTATUS_VGEIN);<br>
+=C2=A0 =C2=A0 target_ulong vsgein =3D (env-&gt;hgeip &amp; vsgemask) ? MIP=
_VSEIP : 0;<br>
+<br>
+=C2=A0 =C2=A0 target_ulong pending =3D (env-&gt;mip | vsgein) &amp; env-&g=
t;mie;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mie=C2=A0 =C2=A0 =3D env-&gt;priv &lt; PRV=
_M ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv =3D=3D PRV_M &amp;&amp; mstatus_mie);=
<br>
@@ -278,6 +282,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env=
)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return env-&gt;geilen;<br>
+}<br>
+<br>
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (geilen &gt; (TARGET_LONG_BITS - 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;geilen =3D geilen;<br>
+}<br>
+<br>
=C2=A0bool riscv_cpu_virt_enabled(CPURISCVState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!riscv_has_ext(env, RVH)) {<br>
@@ -321,9 +347,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t =
mask, uint32_t value)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(cpu);<br>
-=C2=A0 =C2=A0 uint32_t old =3D env-&gt;mip;<br>
+=C2=A0 =C2=A0 uint32_t gein, vsgein =3D 0, old =3D env-&gt;mip;<br>
=C2=A0 =C2=A0 =C2=A0bool locked =3D false;<br>
<br>
+=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gein =3D get_field(env-&gt;hstatus, HSTATUS_VG=
EIN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsgein =3D (env-&gt;hgeip &amp; (1ULL &lt;&lt;=
 gein)) ? MIP_VSEIP : 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (!qemu_mutex_iothread_locked()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locked =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_iothread();<br>
@@ -331,7 +362,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t m=
ask, uint32_t value)<br>
<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mip =3D (env-&gt;mip &amp; ~mask) | (value &amp=
; mask);<br>
<br>
-=C2=A0 =C2=A0 if (env-&gt;mip) {<br>
+=C2=A0 =C2=A0 if (env-&gt;mip | vsgein) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_interrupt(cs, CPU_INTERRUPT_HARD);<br=
>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_reset_interrupt(cs, CPU_INTERRUPT_HAR=
D);<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index a4028f28e0..50424a8344 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -832,7 +832,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int c=
srno,<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D env_archcpu(env);<br>
=C2=A0 =C2=A0 =C2=A0/* Allow software control of delegable interrupts not c=
laimed by hardware */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mask =3D write_mask &amp; delegable_ints &=
amp; ~env-&gt;miclaim;<br>
-=C2=A0 =C2=A0 uint32_t old_mip;<br>
+=C2=A0 =C2=A0 uint32_t gin, old_mip;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (mask) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip =3D riscv_cpu_update_mip(cpu, mas=
k, (new_value &amp; mask));<br>
@@ -840,6 +840,11 @@ static RISCVException rmw_mip(CPURISCVState *env, int =
csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip =3D env-&gt;mip;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (csrno !=3D CSR_HVIP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gin =3D get_field(env-&gt;hstatus, HSTATUS_VGE=
IN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_mip |=3D (env-&gt;hgeip &amp; ((target_ulo=
ng)1 &lt;&lt; gin)) ? MIP_VSEIP : 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (ret_value) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ret_value =3D old_mip;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1002,7 +1007,7 @@ static RISCVException rmw_vsip(CPURISCVState *env, in=
t csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_value, target_ulong=
 write_mask)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* Shift the S bits to their VS bit location in mip */<=
br>
-=C2=A0 =C2=A0 int ret =3D rmw_mip(env, 0, ret_value, new_value &lt;&lt; 1,=
<br>
+=C2=A0 =C2=A0 int ret =3D rmw_mip(env, csrno, ret_value, new_value &lt;&lt=
; 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(write_mask &lt;&lt; 1) &amp; vsip_writable_mask &amp; env-&gt;hi=
deleg);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret_value) {<br>
@@ -1022,7 +1027,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int=
 csrno,<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rmw_vsip(env, CSR_VSIP, ret_value=
, new_value, write_mask);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_mip(env, CSR_MSTATUS, ret_value, n=
ew_value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_mip(env, csrno, ret_value, new_val=
ue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mask &amp; env-&gt;mideleg &amp; sip_writable_mask);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1141,7 +1146,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, in=
t csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_value,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_value, target_ulong=
 write_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ret =3D rmw_mip(env, 0, ret_value, new_value,<br>
+=C2=A0 =C2=A0 int ret =3D rmw_mip(env, csrno, ret_value, new_value,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mask &amp; hvip_writable_mask);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret_value) {<br>
@@ -1154,7 +1159,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int=
 csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_value,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_value, target_ulong =
write_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ret =3D rmw_mip(env, 0, ret_value, new_value,<br>
+=C2=A0 =C2=A0 int ret =3D rmw_mip(env, csrno, ret_value, new_value,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mask &amp; hip_writable_mask);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret_value) {<br>
@@ -1191,15 +1196,27 @@ static RISCVException write_hcounteren(CPURISCVStat=
e *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static RISCVException write_hgeie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
+static RISCVException read_hgeie(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (val) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;No support for =
a non-zero GEILEN.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;hgeie;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static RISCVException write_hgeie(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
+{<br>
+=C2=A0 =C2=A0 /* Only GEILEN:1 bits implemented and BIT0 is never implemen=
ted */<br>
+=C2=A0 =C2=A0 val &amp;=3D ((((target_ulong)1) &lt;&lt; env-&gt;geilen) - =
1) &lt;&lt; 1;<br>
+=C2=A0 =C2=A0 env-&gt;hgeie =3D val;<br>
+=C2=A0 =C2=A0 /* Update mip.SGEIP bit */<br>
+=C2=A0 =C2=A0 riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BOOL_TO_MASK(!!(env-&gt;hgeie &amp; env-&gt;hgeip)));<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0static RISCVException read_htval(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
=C2=A0{<br>
@@ -1227,11 +1244,11 @@ static RISCVException write_htinst(CPURISCVState *e=
nv, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static RISCVException write_hgeip(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
+static RISCVException read_hgeip(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (val) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;No support for =
a non-zero GEILEN.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;hgeip;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
@@ -1922,10 +1939,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0[CSR_HIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;=
hip&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0NULL,=C2=A0 =
=C2=A0NULL,=C2=A0 =C2=A0 =C2=A0rmw_hip=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;=
hie&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hie,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_hie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}=
,<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HCOUNTEREN]=C2=A0 =3D { &quot;hcounteren&quot;,=C2=
=A0 hmode,=C2=A0 =C2=A0read_hcounteren,=C2=A0 write_hcounteren=C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_HGEIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hgeie&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_zero,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 write_hgeie=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_HGEIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hgeie&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hgeie,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0write_hgeie=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HTVAL]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;htval=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_htval,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_htval=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HTINST]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;htinst&quo=
t;,=C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_htinst,=C2=A0 =C2=A0 =C2=A0=
 write_htinst=C2=A0 =C2=A0 =C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_HGEIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hgeip&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_zero,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 write_hgeip=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_HGEIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hgeip&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hgeip,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0NULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HGATP]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hgatp=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hgatp,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_hgatp=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HTIMEDELTA]=C2=A0 =3D { &quot;htimedelta&quot;,=C2=
=A0 hmode,=C2=A0 =C2=A0read_htimedelta,=C2=A0 write_htimedelta=C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HTIMEDELTAH] =3D { &quot;htimedeltah&quot;, hmode3=
2, read_htimedeltah, write_htimedeltah },<br>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index ad8248ebfd..76dd0d415c 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -78,8 +78,8 @@ static bool hyper_needed(void *opaque)<br>
<br>
=C2=A0static const VMStateDescription vmstate_hyper =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;cpu/hyper&quot;,<br>
-=C2=A0 =C2=A0 .version_id =3D 1,<br>
-=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .version_id =3D 2,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 2,<br>
=C2=A0 =C2=A0 =C2=A0.needed =3D hyper_needed,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hstatus, RISCVCPU),<br=
>
@@ -89,6 +89,8 @@ static const VMStateDescription vmstate_hyper =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.htval, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.htinst, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgatp, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hgeie, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hgeip, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.htimedelta, RISCVCPU),=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.vsstatus, RISCVCPU),<b=
r>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--00000000000068a9f905d5850936--

