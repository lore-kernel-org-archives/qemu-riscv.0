Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQKsF-00052i-89
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 22:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQKsD-00052V-Q9; Tue, 14 Sep 2021 22:42:09 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQKsB-0003tZ-AU; Tue, 14 Sep 2021 22:42:09 -0400
Received: by mail-io1-xd34.google.com with SMTP id z1so1518338ioh.7;
 Tue, 14 Sep 2021 19:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRZCI1oTKwBOs9dXYI4/j+Pd9t8Gr1iIk+cbfeB+rnI=;
 b=DgiZpVTOcDvo/xc/wlVJBO3g9ptKNjexNmCf5aYEi0YGpEW3FUXZOWZjg+zF79QAHz
 ujxSFm16udCO93M9TqxRLBZaz4iMBy5avXYoqgkpJQE4YWwzeQJhFAG5dQBzt9wPVf33
 CREqXXh4HhPJc9HnOrIX4fdejVgy9piSTEQGe7gML/clXahxjiZfo9I4N4j+/Fro5RhL
 ZtodkqwPZJRQy4t55fUd2K6Zj1OfZl9rtoEcBUfSSMBiVsQwpzvyxxQwjkxa+b03+W+Y
 AcbxiS6+eibM2jjjk8pd0nAnKiwScuQg10zDVPQcW3XIx7930F/QMIf6lliBd2JUsQ74
 z49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRZCI1oTKwBOs9dXYI4/j+Pd9t8Gr1iIk+cbfeB+rnI=;
 b=W0wSFJMkF/W1LcMNekJCiyCKKkY+nvKTlzjbme8CIUjYT2o9ih4l0+WEqNwMS1rWPu
 ZSlWlQ67v4q1D5WZGFAu57mN8wb/HxzuyAU967Eq/7JnItT0TdB1rJD+9caWcaLrAfVD
 tZWndt4EW7RXOg8ddk9JrhShrEN5lmH0PkYNGCceqaQn+Pj/J/mVSV04mCB1kTUd3JWw
 deJaX/Qe3wwV5WnCnKWerHLVsojo95CT8ZrV3hKWKRTXVnmMEb1MsQ/VqORsTW8pIx17
 yAlOJ3aVzngl4PKFSfFItjxzs32M8Kst84BB7Vej4+Kho+Yg/zkWxXPijR9CHn0VaW+y
 Ds0A==
X-Gm-Message-State: AOAM533UgfakR+PU9Znqfxid8abZwPcCgQRpbcROt4651lyrwPAgL/Eb
 ci3+0B+GMCTk7ju50q3Iiw8EE5mw25Nw6QOVJPY=
X-Google-Smtp-Source: ABdhPJyEnAskawQt5HZDNfFuub1wvXe1D0/SKk63HPLMNXSKmW6cEA3WTmg6PQPDQQ4Na+ypTsrUgIrsZ5spN2gKFRw=
X-Received: by 2002:a02:6d17:: with SMTP id m23mr17152697jac.63.1631673725218; 
 Tue, 14 Sep 2021 19:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-4-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-4-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 12:41:38 +1000
Message-ID: <CAKmqyKNFVhA+B6E3waPrXvU5A+OvMcpbTwFhd4eQZ6_8SvDFWg@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] target/riscv: Implement hgeie and hgeip CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 02:42:10 -0000

On Thu, Sep 2, 2021 at 9:47 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The hgeie and hgeip CSRs are required for emulating an external
> interrupt controller capable of injecting virtual external
> interrupt to Guest/VM running at VS-level.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        | 61 ++++++++++++++++++++++++++++-----------
>  target/riscv/cpu.h        |  5 ++++
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 36 +++++++++++++++++++++--
>  target/riscv/csr.c        | 43 ++++++++++++++++++---------
>  target/riscv/machine.c    |  6 ++--
>  6 files changed, 117 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9d97fbe3d9..0ade6ad144 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -572,23 +572,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  {
>      RISCVCPU *cpu = RISCV_CPU(opaque);
> +    CPURISCVState *env = &cpu->env;
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
> +        irq = irq - IRQ_LOCAL_MAX + 1;
> +        if (env->geilen < irq) {
> +            g_assert_not_reached();
> +        }
> +
> +        /* Update HGEIP CSR */
> +        env->hgeip &= ~((target_ulong)1 << irq);
> +        if (level) {
> +            env->hgeip |= (target_ulong)1 << irq;
> +        }
> +
> +        /* Update mip.SGEIP bit */
> +        riscv_cpu_update_mip(cpu, MIP_SGEIP,
> +                             BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
> +    } else {
>          g_assert_not_reached();
>      }
>  }
> @@ -601,7 +627,8 @@ static void riscv_cpu_init(Object *obj)
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
> index bf1c899c00..59b36f758f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -148,6 +148,7 @@ struct CPURISCVState {
>      target_ulong priv;
>      /* This contains QEMU specific information about the virt state. */
>      target_ulong virt;
> +    target_ulong geilen;
>      target_ulong resetvec;
>
>      target_ulong mhartid;
> @@ -185,6 +186,8 @@ struct CPURISCVState {
>      target_ulong htval;
>      target_ulong htinst;
>      target_ulong hgatp;
> +    target_ulong hgeie;
> +    target_ulong hgeip;
>      uint64_t htimedelta;
>
>      /* Virtual CSRs */
> @@ -336,6 +339,8 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> +target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
> +void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>  bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 17ede1d4a9..a1958dbd6a 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -506,6 +506,7 @@ typedef enum RISCVException {
>  #define IRQ_M_EXT                          11
>  #define IRQ_S_GEXT                         12
>  #define IRQ_LOCAL_MAX                      13
> +#define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 968cb8046f..ee316db594 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -46,7 +46,10 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>
>      target_ulong pending = env->mip & env->mie &
>                                 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> -    target_ulong vspending = (env->mip & env->mie &
> +    target_ulong vsgemask =
> +                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
> +    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
> +    target_ulong vspending = ((env->mip | vsgein) & env->mie &
>                                (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
>
>      target_ulong mie    = env->priv < PRV_M ||
> @@ -167,6 +170,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
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
> +    env->geilen = geilen;
> +}
> +
>  bool riscv_cpu_virt_enabled(CPURISCVState *env)
>  {
>      if (!riscv_has_ext(env, RVH)) {
> @@ -228,9 +253,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
>  {
>      CPURISCVState *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
> -    uint32_t old = env->mip;
> +    uint32_t gein, vsgein = 0, old = env->mip;
>      bool locked = false;
>
> +    if (riscv_cpu_virt_enabled(env)) {
> +        gein = get_field(env->hstatus, HSTATUS_VGEIN);
> +        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    }
> +
>      if (!qemu_mutex_iothread_locked()) {
>          locked = true;
>          qemu_mutex_lock_iothread();
> @@ -238,7 +268,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
>
>      env->mip = (env->mip & ~mask) | (value & mask);
>
> -    if (env->mip) {
> +    if (env->mip | vsgein) {
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index bc25c79e39..77fb5884bc 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -764,7 +764,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
>      RISCVCPU *cpu = env_archcpu(env);
>      /* Allow software control of delegable interrupts not claimed by hardware */
>      target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
> -    uint32_t old_mip;
> +    uint32_t gin, old_mip;
>
>      if (mask) {
>          old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
> @@ -772,6 +772,11 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
>          old_mip = env->mip;
>      }
>
> +    if (csrno != CSR_HVIP) {
> +        gin = get_field(env->hstatus, HSTATUS_VGEIN);
> +        old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
> +    }
> +
>      if (ret_value) {
>          *ret_value = old_mip;
>      }
> @@ -939,7 +944,7 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
>                                 target_ulong new_value, target_ulong write_mask)
>  {
>      /* Shift the S bits to their VS bit location in mip */
> -    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
> +    int ret = rmw_mip(env, csrno, ret_value, new_value << 1,
>                        (write_mask << 1) & vsip_writable_mask & env->hideleg);
>
>      if (ret_value) {
> @@ -959,7 +964,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
>      if (riscv_cpu_virt_enabled(env)) {
>          ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
>      } else {
> -        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
> +        ret = rmw_mip(env, csrno, ret_value, new_value,
>                        write_mask & env->mideleg & sip_writable_mask);
>      }
>
> @@ -1078,7 +1083,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
>                                 target_ulong *ret_value,
>                                 target_ulong new_value, target_ulong write_mask)
>  {
> -    int ret = rmw_mip(env, 0, ret_value, new_value,
> +    int ret = rmw_mip(env, csrno, ret_value, new_value,
>                        write_mask & hvip_writable_mask);
>
>      if (ret_value) {
> @@ -1091,7 +1096,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
>                                target_ulong *ret_value,
>                                target_ulong new_value, target_ulong write_mask)
>  {
> -    int ret = rmw_mip(env, 0, ret_value, new_value,
> +    int ret = rmw_mip(env, csrno, ret_value, new_value,
>                        write_mask & hip_writable_mask);
>
>      if (ret_value) {
> @@ -1128,15 +1133,27 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
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
> +        *val = env->hgeie;
>      }
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException write_hgeie(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
> +    val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
> +    env->hgeie = val;
> +    /* Update mip.SGEIP bit */
> +    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
> +                         BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_htval(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -1164,11 +1181,11 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
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
> +        *val = env->hgeip;
>      }
>      return RISCV_EXCP_NONE;
>  }
> @@ -1595,10 +1612,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
>      [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
>      [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
> -    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,        write_hgeie       },
> +    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
>      [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
>      [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
> -    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,        write_hgeip       },
> +    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       NULL              },
>      [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
>      [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
>      [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 16a08302da..a669d63e0f 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -102,8 +102,8 @@ static const VMStateDescription vmstate_vector = {
>
>  static const VMStateDescription vmstate_hyper = {
>      .name = "cpu/hyper",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .needed = hyper_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> @@ -113,6 +113,8 @@ static const VMStateDescription vmstate_hyper = {
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

