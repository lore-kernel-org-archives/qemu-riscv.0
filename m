Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE39CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:58:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFfi-0004J9-Er; Mon, 16 Oct 2023 00:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFfh-0004Ix-JV; Mon, 16 Oct 2023 00:57:41 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFfe-0007wy-MQ; Mon, 16 Oct 2023 00:57:41 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-457cb7f53afso777931137.3; 
 Sun, 15 Oct 2023 21:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697432257; x=1698037057; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w46eWtcpsATBV28jSIwBVNMkl+m3pouK6wZrKUBaw3o=;
 b=iGJpqnW7N/+CccJsaRPEsGjOyMY6LFaU7pzB+DN6esZmQyCSzJfAnFDVtGOoXZ0xRF
 BO7tMdBownmfG5B5drHqjOR5FYs332097ZJAwwkMHEun+3qpOfNugSPMIV9IEWVNCvmf
 +d3GxZSVM38xyefEPnRus/lQVKNCRwcfMzEZlZLoDdBdsBdaE/qkAJ/KcdRXIhDznnaN
 LSTKdkE/q+uK5fHJM8S1x04IYzy8al+g5afaxA7GcynU9yYN2Zh++cTdbKN6o5nRHCbK
 JQaEcJbiYOGdc1fancffb8LwccInI8UqZMEc4msxA50G/aIzgHoYipAnQBeTGTRR1PTo
 R57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697432257; x=1698037057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w46eWtcpsATBV28jSIwBVNMkl+m3pouK6wZrKUBaw3o=;
 b=M3P3cdrESnk1XFRe7H4uhDdUHKKY6WuOHg+qhyEylVpo9/WzVfQGG75HERxA3FjNbn
 7JGFRuc+lbBsz9PJsws+mBh76wT0yaKIXmIc3plrfVH4/JmYL9dgGaX8X+7pt4Ouc9Gw
 0bJ45zkt1dOQiTccZLSr+uZqHa4FsAPkCuDObz4bwK50ovFlA1BlcszEVkwgG92xStK8
 Ny9d4my3tDC5G3Tz4mgokQacvOj0D86QtOalfPGn9vAB7WJ6UwsM/qQWanzLB4xcZR8z
 X55t6mmR7wMKNsIdE0sZbh6YaHDdTKZ9+lY9aeeXj18whrqkrCSuROuvy9e2iqpxEVE+
 /7SQ==
X-Gm-Message-State: AOJu0YzR3pXId+1JTXVFouZKQ43B3rqsXquZC2jBIXhQsHOm6M6xDXe6
 7lemwUM4kEH+uSXgWaRom40fWkK8YJnZXBtXvrA=
X-Google-Smtp-Source: AGHT+IGvme5LSuiZBFX25rFmtuk9PlT9WZMc5ga0s6/A5XWSmPMNuQbaUU870i/TiQ28qXD9DE9PhpsevS3erQV6FTc=
X-Received: by 2002:a67:e1d9:0:b0:457:ce29:27c9 with SMTP id
 p25-20020a67e1d9000000b00457ce2927c9mr4178541vsl.0.1697432257075; Sun, 15 Oct
 2023 21:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231012100103.28612-1-rkanwal@rivosinc.com>
 <20231012100103.28612-6-rkanwal@rivosinc.com>
In-Reply-To: <20231012100103.28612-6-rkanwal@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:57:10 +1000
Message-ID: <CAKmqyKNHZrS4N9Uy9Okhaf=UCRkOBg7KqwcOP=-d_LbkLb6GAA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] target/riscv: Add M-mode virtual interrupt and IRQ
 filtering support.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Oct 12, 2023 at 8:03=E2=80=AFPM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:
>
> This change adds support for inserting virtual interrupts from M-mode
> into S-mode using mvien and mvip csrs. IRQ filtering is a use case of
> this change, i-e M-mode can stop delegating an interrupt to S-mode and
> instead enable it in MIE and receive those interrupts in M-mode and then
> selectively inject the interrupt using mvien and mvip.
>
> Also, the spec doesn't mandate the interrupt to be actually supported
> in hardware. Which allows M-mode to assert virtual interrupts to S-mode
> that have no connection to any real interrupt events.
>
> This is defined as part of the AIA specification [0], "5.3 Interrupt
> filtering and virtual interrupts for supervisor level".
>
> [0]: https://github.com/riscv/riscv-aia/releases/download/1.0-RC4/riscv-i=
nterrupts-1.0-RC4.pdf
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c        |   3 +-
>  target/riscv/cpu.h        |   8 ++
>  target/riscv/cpu_bits.h   |   6 +
>  target/riscv/cpu_helper.c |  26 +++-
>  target/riscv/csr.c        | 279 ++++++++++++++++++++++++++++++++++----
>  target/riscv/machine.c    |   3 +
>  6 files changed, 289 insertions(+), 36 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac4a6c7eec..6546634f9d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -813,7 +813,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
>       * Definition of the WFI instruction requires it to ignore the privi=
lege
>       * mode and delegation registers, but respect individual enables
>       */
> -    return riscv_cpu_all_pending(env) !=3D 0;
> +    return riscv_cpu_all_pending(env) !=3D 0 ||
> +        riscv_cpu_sirq_pending(env) !=3D RISCV_EXCP_NONE;
>  #else
>      return true;
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6fe32e6b38..30f9481f45 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -202,6 +202,12 @@ struct CPUArchState {
>      uint64_t mie;
>      uint64_t mideleg;
>
> +    /*
> +     * When mideleg[i]=3D0 and mvien[i]=3D1, sie[i] is no more
> +     * alias of mie[i] and needs to be maintained separatly.
> +     */
> +    uint64_t sie;
> +
>      target_ulong satp;   /* since: priv-1.10.0 */
>      target_ulong stval;
>      target_ulong medeleg;
> @@ -222,6 +228,8 @@ struct CPUArchState {
>      /* AIA CSRs */
>      target_ulong miselect;
>      target_ulong siselect;
> +    uint64_t mvien;
> +    uint64_t mvip;
>
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 3d6ffaabc7..ebd7917d49 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -735,6 +735,12 @@ typedef enum RISCVException {
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
>
> +/* Machine constants */
> +#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> +#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
> +#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
> +#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
> +
>  /* General PointerMasking CSR bits */
>  #define PM_ENABLE       0x00000001ULL
>  #define PM_CURRENT      0x00000002ULL
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 581b8c6380..b36161708a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -376,6 +376,10 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *e=
nv,
>      return best_irq;
>  }
>
> +/*
> + * Doesn't report interrupts inserted using mvip from M-mode firmware. T=
hose
> + * are returned in riscv_cpu_sirq_pending().
> + */
>  uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>  {
>      uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> @@ -398,9 +402,10 @@ int riscv_cpu_sirq_pending(CPURISCVState *env)
>  {
>      uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
>                      ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +    uint64_t irqs_f =3D env->mvip & env->mvien & ~env->mideleg & env->si=
e;
>
>      return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> -                                    irqs, env->siprio);
> +                                    irqs | irqs_f, env->siprio);
>  }
>
>  int riscv_cpu_vsirq_pending(CPURISCVState *env)
> @@ -414,8 +419,8 @@ int riscv_cpu_vsirq_pending(CPURISCVState *env)
>
>  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
> +    uint64_t irqs, pending, mie, hsie, vsie, irqs_f;
>      int virq;
> -    uint64_t irqs, pending, mie, hsie, vsie;
>
>      /* Determine interrupt enable state of all privilege modes */
>      if (env->virt_enabled) {
> @@ -441,8 +446,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState=
 *env)
>                                          irqs, env->miprio);
>      }
>
> +    /* Check for virtual S-mode interrupts. */
> +    irqs_f =3D env->mvip & (env->mvien & ~env->mideleg) & env->sie;
> +
>      /* Check HS-mode interrupts */
> -    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
> +    irqs =3D  ((pending & env->mideleg & ~env->hideleg) | irqs_f) & -hsi=
e;
>      if (irqs) {
>          return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
>                                          irqs, env->siprio);
> @@ -622,7 +630,7 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_=
t interrupts)
>
>  void riscv_cpu_interrupt(CPURISCVState *env)
>  {
> -    uint64_t gein, vsgein =3D 0, vstip =3D 0;
> +    uint64_t gein, vsgein =3D 0, vstip =3D 0, irqf =3D 0;
>      CPUState *cs =3D env_cpu(env);
>
>      QEMU_IOTHREAD_LOCK_GUARD();
> @@ -630,11 +638,13 @@ void riscv_cpu_interrupt(CPURISCVState *env)
>      if (env->virt_enabled) {
>          gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
>          vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    } else {
> +        irqf =3D env->mvien & env->mvip & env->sie;
>      }
>
>      vstip =3D env->vstime_irq ? MIP_VSTIP : 0;
>
> -    if (env->mip | vsgein | vstip) {
> +    if (env->mip | vsgein | vstip | irqf) {
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> @@ -1611,6 +1621,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
>      target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
>      uint64_t deleg =3D async ? env->mideleg : env->medeleg;
> +    bool s_injected =3D env->mvip & (1 << cause) & env->mvien &&
> +        !(env->mip & (1 << cause));
>      target_ulong tval =3D 0;
>      target_ulong tinst =3D 0;
>      target_ulong htval =3D 0;
> @@ -1699,8 +1711,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                    __func__, env->mhartid, async, cause, env->pc, tval,
>                    riscv_cpu_get_trap_name(cause, async));
>
> -    if (env->priv <=3D PRV_S &&
> -            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> +    if (env->priv <=3D PRV_S && cause < 64 &&
> +        (((deleg >> cause) & 1) || s_injected)) {
>          /* handle the trap in S-mode */
>          if (riscv_has_ext(env, RVH)) {
>              uint64_t hdeleg =3D async ? env->hideleg : env->hedeleg;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d99d954ff3..db2b06905b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1117,21 +1117,16 @@ static RISCVException write_stimecmph(CPURISCVSta=
te *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -/* Machine constants */
> -
> -#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> -#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP | =
\
> -                                      MIP_LCOFIP))
> -#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
> -#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
> -
>  #define VSTOPI_NUM_SRCS 5
>
> -static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |
> -                                           VS_MODE_INTERRUPTS;
> -static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;
> +#define LOCAL_INTERRUPTS (~0x1FFF)
> +
> +static const uint64_t delegable_ints =3D
> +    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
> +static const uint64_t vs_delegable_ints =3D
> +    (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
>  static const uint64_t all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRUPTS=
 |
> -                                     HS_MODE_INTERRUPTS;
> +                                     HS_MODE_INTERRUPTS | LOCAL_INTERRUP=
TS;
>  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
>                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
>                           (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
> @@ -1162,12 +1157,30 @@ static const target_ulong vs_delegable_excps =3D =
DELEGABLE_EXCPS &
>  static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_S=
PIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
> -static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MI=
P_UEIP |
> -                                              SIP_LCOFIP;
> +
> +/*
> + * Spec allows for bits 13:63 to be either read-only or writable.
> + * So far we have interrupt LCOFIP in that region which is writable.
> + *
> + * Also, spec allows to inject virtual interrupts in this region even
> + * without any hardware interrupts for that interrupt number.
> + *
> + * For now interrupt in 13:63 region are all kept writable. 13 being
> + * LCOFIP and 14:63 being virtual only. Change this in future if we
> + * introduce more interrupts that are not writable.
> + */
> +
> +/* Bit STIP can be an alias of mip.STIP that's why it's writable in mvip=
. */
> +static const target_ulong mvip_writable_mask =3D MIP_SSIP | MIP_STIP | M=
IP_SEIP |
> +                                    LOCAL_INTERRUPTS;
> +static const target_ulong mvien_writable_mask =3D MIP_SSIP | MIP_SEIP |
> +                                    LOCAL_INTERRUPTS;
> +
> +static const target_ulong sip_writable_mask =3D SIP_SSIP | LOCAL_INTERRU=
PTS;
>  static const target_ulong hip_writable_mask =3D MIP_VSSIP;
>  static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |
> -                                               MIP_VSEIP;
> -static const target_ulong vsip_writable_mask =3D MIP_VSSIP;
> +                                    MIP_VSEIP | LOCAL_INTERRUPTS;
> +static const target_ulong vsip_writable_mask =3D MIP_VSSIP | LOCAL_INTER=
RUPTS;
>
>  const bool valid_vm_1_10_32[16] =3D {
>      [VM_1_10_MBARE] =3D true,
> @@ -1562,6 +1575,52 @@ static RISCVException rmw_mieh(CPURISCVState *env,=
 int csrno,
>      return ret;
>  }
>
> +static RISCVException rmw_mvien64(CPURISCVState *env, int csrno,
> +                                uint64_t *ret_val,
> +                                uint64_t new_val, uint64_t wr_mask)
> +{
> +    uint64_t mask =3D wr_mask & mvien_writable_mask;
> +
> +    if (ret_val) {
> +        *ret_val =3D env->mvien;
> +    }
> +
> +    env->mvien =3D (env->mvien & ~mask) | (new_val & mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException rmw_mvien(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_val,
> +                              target_ulong new_val, target_ulong wr_mask=
)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mvien64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_mvienh(CPURISCVState *env, int csrno,
> +                                target_ulong *ret_val,
> +                                target_ulong new_val, target_ulong wr_ma=
sk)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mvien64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
> +}
> +
>  static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      int irq;
> @@ -1703,6 +1762,11 @@ static int rmw_xireg(CPURISCVState *env, int csrno=
, target_ulong *val,
>          priv =3D PRV_M;
>          break;
>      case CSR_SIREG:
> +        if (env->priv =3D=3D PRV_S && env->mvien & MIP_SEIP &&
> +            env->siselect >=3D ISELECT_IMSIC_EIDELIVERY &&
> +            env->siselect <=3D ISELECT_IMSIC_EIE63) {
> +            goto done;
> +        }
>          iprio =3D env->siprio;
>          isel =3D env->siselect;
>          priv =3D PRV_S;
> @@ -1769,6 +1833,9 @@ static int rmw_xtopei(CPURISCVState *env, int csrno=
, target_ulong *val,
>          priv =3D PRV_M;
>          break;
>      case CSR_STOPEI:
> +        if (env->mvien & MIP_SEIP && env->priv =3D=3D PRV_S) {
> +            goto done;
> +        }
>          priv =3D PRV_S;
>          break;
>      case CSR_VSTOPEI:
> @@ -2360,6 +2427,143 @@ static RISCVException rmw_miph(CPURISCVState *env=
, int csrno,
>      return ret;
>  }
>
> +/*
> + * The function is written for two use-cases:
> + * 1- To access mvip csr as is for m-mode access.
> + * 2- To access sip as a combination of mip and mvip for s-mode.
> + *
> + * Both report bits 1, 5, 9 and 13:63 but with the exception of
> + * STIP being read-only zero in case of mvip when sstc extension
> + * is present.
> + * Also, sip needs to be read-only zero when both mideleg[i] and
> + * mvien[i] are zero but mvip needs to be an alias of mip.
> + */
> +static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
> +                                uint64_t *ret_val,
> +                                uint64_t new_val, uint64_t wr_mask)
> +{
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +    target_ulong ret_mip =3D 0;
> +    RISCVException ret;
> +    uint64_t old_mvip;
> +
> +    /*
> +     * mideleg[i]  mvien[i]
> +     *   0           0      No delegation. mvip[i] is alias of mip[i].
> +     *   0           1      mvip[i] becomes source of interrupt, mip byp=
assed.
> +     *   1           X      mip[i] is source of interrupt and mvip[i] al=
iases
> +     *                      mip[i].
> +     *
> +     *   So alias condition would be for bits:
> +     *      ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & (mideleg | ~mvien)=
) |
> +     *          (!sstc & MIP_STIP)
> +     *
> +     *   Non-alias condition will be for bits:
> +     *      (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & (~mideleg & mvien)
> +     *
> +     *  alias_mask denotes the bits that come from mip nalias_mask denot=
es bits
> +     *  that come from hvip.
> +     */
> +    uint64_t alias_mask =3D ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> +        (env->mideleg | ~env->mvien)) | MIP_STIP;
> +    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> +        (~env->mideleg & env->mvien);
> +    uint64_t wr_mask_mvip;
> +    uint64_t wr_mask_mip;
> +
> +    /*
> +     * mideleg[i]  mvien[i]
> +     *   0           0      sip[i] read-only zero.
> +     *   0           1      sip[i] alias of mvip[i].
> +     *   1           X      sip[i] alias of mip[i].
> +     *
> +     *  Both alias and non-alias mask remain same for sip except for bit=
s
> +     *  which are zero in both mideleg and mvien.
> +     */
> +    if (csrno =3D=3D CSR_SIP) {
> +        /* Remove bits that are zero in both mideleg and mvien. */
> +        alias_mask &=3D (env->mideleg | env->mvien);
> +        nalias_mask &=3D (env->mideleg | env->mvien);
> +    }
> +
> +    /*
> +     * If sstc is present, mvip.STIP is not an alias of mip.STIP so clea=
r
> +     * that our in mip returned value.
> +     */
> +    if (cpu->cfg.ext_sstc && (env->priv =3D=3D PRV_M) &&
> +        get_field(env->menvcfg, MENVCFG_STCE)) {
> +        alias_mask &=3D ~MIP_STIP;
> +    }
> +
> +    wr_mask_mip =3D wr_mask & alias_mask & mvip_writable_mask;
> +    wr_mask_mvip =3D wr_mask & nalias_mask & mvip_writable_mask;
> +
> +    /*
> +     * For bits set in alias_mask, mvip needs to be alias of mip, so for=
ward
> +     * this to rmw_mip.
> +     */
> +    ret =3D rmw_mip(env, CSR_MIP, &ret_mip, new_val, wr_mask_mip);
> +    if (ret !=3D RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    old_mvip =3D env->mvip;
> +
> +    /*
> +     * Write to mvip. Update only non-alias bits. Alias bits were update=
d
> +     * in mip in rmw_mip above.
> +     */
> +    if (wr_mask_mvip) {
> +        env->mvip =3D (env->mvip & ~wr_mask_mvip) | (new_val & wr_mask_m=
vip);
> +
> +        /*
> +         * Given mvip is separate source from mip, we need to trigger in=
terrupt
> +         * from here separately. Normally this happen from riscv_cpu_upd=
ate_mip.
> +         */
> +        riscv_cpu_interrupt(env);
> +    }
> +
> +    if (ret_val) {
> +        ret_mip &=3D alias_mask;
> +        old_mvip &=3D nalias_mask;
> +
> +        *ret_val =3D old_mvip | ret_mip;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException rmw_mvip(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_val,
> +                              target_ulong new_val, target_ulong wr_mask=
)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mvip64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_mviph(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mvip64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
> +}
> +
>  /* Supervisor Trap Setup */
>  static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
>                                          Int128 *val)
> @@ -2454,20 +2658,37 @@ static RISCVException rmw_sie64(CPURISCVState *en=
v, int csrno,
>                                  uint64_t *ret_val,
>                                  uint64_t new_val, uint64_t wr_mask)
>  {
> +    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> +        (~env->mideleg & env->mvien);
> +    uint64_t alias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & env=
->mideleg;
> +    uint64_t sie_mask =3D wr_mask & nalias_mask;
>      RISCVException ret;
> -    uint64_t mask =3D env->mideleg & S_MODE_INTERRUPTS;
>
> +    /*
> +     * mideleg[i]  mvien[i]
> +     *   0           0      sie[i] read-only zero.
> +     *   0           1      sie[i] is a separate writable bit.
> +     *   1           X      sie[i] alias of mie[i].
> +     *
> +     *  Both alias and non-alias mask remain same for sip except for bit=
s
> +     *  which are zero in both mideleg and mvien.
> +     */
>      if (env->virt_enabled) {
>          if (env->hvictl & HVICTL_VTI) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>          ret =3D rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
> +        if (ret_val) {
> +            *ret_val &=3D alias_mask;
> +        }
>      } else {
> -        ret =3D rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
> -    }
> +        ret =3D rmw_mie64(env, csrno, ret_val, new_val, wr_mask & alias_=
mask);
> +        if (ret_val) {
> +            *ret_val &=3D alias_mask;
> +            *ret_val |=3D env->sie & nalias_mask;
> +        }
>
> -    if (ret_val) {
> -        *ret_val &=3D mask;
> +        env->sie =3D (env->sie & ~sie_mask) | (new_val & sie_mask);
>      }
>
>      return ret;
> @@ -2665,7 +2886,7 @@ static RISCVException rmw_sip64(CPURISCVState *env,=
 int csrno,
>                                  uint64_t new_val, uint64_t wr_mask)
>  {
>      RISCVException ret;
> -    uint64_t mask =3D env->mideleg & sip_writable_mask;
> +    uint64_t mask =3D (env->mideleg | env->mvien) & sip_writable_mask;
>
>      if (env->virt_enabled) {
>          if (env->hvictl & HVICTL_VTI) {
> @@ -2673,11 +2894,12 @@ static RISCVException rmw_sip64(CPURISCVState *en=
v, int csrno,
>          }
>          ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
>      } else {
> -        ret =3D rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
> +        ret =3D rmw_mvip64(env, csrno, ret_val, new_val, wr_mask & mask)=
;
>      }
>
>      if (ret_val) {
> -        *ret_val &=3D env->mideleg & S_MODE_INTERRUPTS;
> +        *ret_val &=3D (env->mideleg | env->mvien) &
> +            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
>      }
>
>      return ret;
> @@ -2842,6 +3064,7 @@ static int read_vstopi(CPURISCVState *env, int csrn=
o, target_ulong *val)
>
>      *val =3D (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
>      *val |=3D iprio;
> +
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -4165,14 +4388,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>      [CSR_MTOPI]    =3D { "mtopi",    aia_any, read_mtopi },
>
>      /* Virtual Interrupts for Supervisor Level (AIA) */
> -    [CSR_MVIEN]    =3D { "mvien",    aia_any, read_zero, write_ignore },
> -    [CSR_MVIP]     =3D { "mvip",     aia_any, read_zero, write_ignore },
> +    [CSR_MVIEN]    =3D { "mvien",    aia_any, NULL, NULL, rmw_mvien   },
> +    [CSR_MVIP]     =3D { "mvip",     aia_any, NULL, NULL, rmw_mvip    },
>
>      /* Machine-Level High-Half CSRs (AIA) */
>      [CSR_MIDELEGH] =3D { "midelegh", aia_any32, NULL, NULL, rmw_midelegh=
 },
>      [CSR_MIEH]     =3D { "mieh",     aia_any32, NULL, NULL, rmw_mieh    =
 },
> -    [CSR_MVIENH]   =3D { "mvienh",   aia_any32, read_zero,  write_ignore=
 },
> -    [CSR_MVIPH]    =3D { "mviph",    aia_any32, read_zero,  write_ignore=
 },
> +    [CSR_MVIENH]   =3D { "mvienh",   aia_any32, NULL, NULL, rmw_mvienh  =
 },
> +    [CSR_MVIPH]    =3D { "mviph",    aia_any32, NULL, NULL, rmw_mviph   =
 },
>      [CSR_MIPH]     =3D { "miph",     aia_any32, NULL, NULL, rmw_miph    =
 },
>
>      /* Execution environment configuration */
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c7c862cdd3..3175587b0d 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -379,6 +379,9 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          VMSTATE_UINT64(env.mip, RISCVCPU),
>          VMSTATE_UINT64(env.miclaim, RISCVCPU),
>          VMSTATE_UINT64(env.mie, RISCVCPU),
> +        VMSTATE_UINT64(env.mvien, RISCVCPU),
> +        VMSTATE_UINT64(env.mvip, RISCVCPU),
> +        VMSTATE_UINT64(env.sie, RISCVCPU),

We need to bump version_id and minimum_version_id as well

Alistair

>          VMSTATE_UINT64(env.mideleg, RISCVCPU),
>          VMSTATE_UINTTL(env.satp, RISCVCPU),
>          VMSTATE_UINTTL(env.stval, RISCVCPU),
> --
> 2.34.1
>
>

