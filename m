Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81FFC7EE25
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 07:13:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q79pZ-0008Ky-3Y; Thu, 08 Jun 2023 03:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q79pU-0008Jz-1t
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 03:13:08 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q79pR-0004qR-AO
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 03:13:07 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-786f7e1ea2fso70811241.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 00:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686208383; x=1688800383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IgCvgKErjywH9PXB6OMa+B8wlR5BNDoot+mC19FFvPQ=;
 b=ggG1SCBUTF4UIGaXdr7iJmVO1g0OaED7JJTyNuFrXp8xe8BzBZI/po6RgH+Oxz7UlT
 xa4HiBHITYFiknjH1fXM/rOFYUNi/llyG8DRmO9OkkFKgYgVYdD8aTVEGTiM65PtzHqI
 26iB6JUYlJQ4LnLof6shQIM2jTbLaAGK9EiV2VCuZE6N/jrdRcrb1M4x3pRB2TayPZ1r
 JdUdNuErYQAL/0LH9ek6Q5hUNpQMs2j3VEempe7BG1/uAgfSgUy+ss7H8im/Amu0oKO5
 GtpcAuu5qIUynEP0RymrT5rQ/6gFgaNdzs7VKBxkoGVdfxCxPw71e6M3bC8/JaI0CxcG
 DHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686208383; x=1688800383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IgCvgKErjywH9PXB6OMa+B8wlR5BNDoot+mC19FFvPQ=;
 b=NdjYTI7V4LrfpAEex0NESnq38v5tVj4XGSJ8OZOlIOvBg1GYKm9Vo9uSifcDzO3kDj
 BojuyeraFQIXFD6Bbjv6hSR173MKp6XmFgc2EdOMOb1NhIKZWtuXC9EsZUhb6I0bWi9R
 ciXnqMHZmqE4lfw54iGvn97iwUM5xfLnP9mHyg8voK3k0hO6FFKcVFKfJeDh6CPz95Fi
 xqg2EemXv6GU1Y+86cHWuqfhjNheILbomMJ9mQL01sZdZm0uKx1wxkk1KWXqR9WFX78x
 RR0BUh1hGNHhTSsqYT+eCqHFWHkqb4ROtlFGZ8vsPydbMwa36io5V0YwbxJib3ONrdC3
 ywwg==
X-Gm-Message-State: AC+VfDzfRnSp9sbCw3Vm0VI1UorJOB2Ly51PJB1rI8PBlzqzW/+17zz2
 yiQisuA4lu0O6GB0vnhL1lnbLYuIuaAPoWFSyTlPlw==
X-Google-Smtp-Source: ACHHUZ4itS+QbjAUt4CQgKqyEuTPOXyN0H1qLrQc5old6HNn88s0LZjnzGAyxPWxTbS2kEG8ca5z7Ey53TbC4sW8p4k=
X-Received: by 2002:a67:ec06:0:b0:43b:516c:aad with SMTP id
 d6-20020a67ec06000000b0043b516c0aadmr897255vso.29.1686208383294; Thu, 08 Jun
 2023 00:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230522131123.3498539-1-tommy.wu@sifive.com>
 <20230522131123.3498539-2-tommy.wu@sifive.com>
 <ce8f000c-30d7-f4f8-76af-575388569d38@ventanamicro.com>
In-Reply-To: <ce8f000c-30d7-f4f8-76af-575388569d38@ventanamicro.com>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Thu, 8 Jun 2023 15:12:52 +0800
Message-ID: <CANj3q_kt3YGLGYOpfgbo2RsO3iPjFd_nRLVHYjS=UoD1dnWx+w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] target/riscv: Add Smrnmi cpu extension.
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 richard.henderson@linaro.org
Content-Type: multipart/alternative; boundary="000000000000b438e105fd98fb54"
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=tommy.wu@sifive.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000b438e105fd98fb54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Daniel,
Thanks for all the suggestions ! I'll send patch v4 and fix all the issues.

On Thu, May 25, 2023 at 8:29=E2=80=AFPM Daniel Henrique Barboza <
dbarboza@ventanamicro.com> wrote:

>
>
> On 5/22/23 10:11, Tommy Wu wrote:
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> > ---
> >   hw/riscv/riscv_hart.c         | 21 +++++++++++++++++++++
> >   include/hw/riscv/riscv_hart.h |  4 ++++
> >   target/riscv/cpu.c            | 14 ++++++++++++++
> >   target/riscv/cpu.h            |  7 +++++++
> >   target/riscv/cpu_bits.h       | 12 ++++++++++++
> >   target/riscv/cpu_helper.c     | 24 ++++++++++++++++++++++++
> >   6 files changed, 82 insertions(+)
> >
> > diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> > index 613ea2aaa0..eac18f8c29 100644
> > --- a/hw/riscv/riscv_hart.c
> > +++ b/hw/riscv/riscv_hart.c
> > @@ -33,6 +33,12 @@ static Property riscv_harts_props[] =3D {
> >       DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
> >       DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
> >                          DEFAULT_RSTVEC),
> > +    DEFINE_PROP_ARRAY("rnmi-interrupt-vector", RISCVHartArrayState,
> > +                      num_rnmi_irqvec, rnmi_irqvec, qdev_prop_uint64,
> > +                      uint64_t),
> > +    DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
> > +                      num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64=
,
> > +                      uint64_t),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> >
> > @@ -47,6 +53,21 @@ static bool riscv_hart_realize(RISCVHartArrayState
> *s, int idx,
> >   {
> >       object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx],
> cpu_type);
> >       qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec",
> s->resetvec);
> > +
> > +    if (s->harts[idx].cfg.ext_smrnmi) {
> > +        if (s->rnmi_irqvec) {
> > +            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
> > +                                 "rnmi-interrupt-vector",
> > +                                 s->rnmi_irqvec[idx]);
> > +        }
> > +
> > +        if (s->rnmi_excpvec) {
> > +            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
> > +                                 "rnmi-exception-vector",
> > +                                 s->rnmi_excpvec[idx]);
> > +        }
> > +    }
> > +
> >       s->harts[idx].env.mhartid =3D s->hartid_base + idx;
> >       qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
> >       return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
> > diff --git a/include/hw/riscv/riscv_hart.h
> b/include/hw/riscv/riscv_hart.h
> > index bbc21cdc9a..99c0ac5009 100644
> > --- a/include/hw/riscv/riscv_hart.h
> > +++ b/include/hw/riscv/riscv_hart.h
> > @@ -38,6 +38,10 @@ struct RISCVHartArrayState {
> >       uint32_t hartid_base;
> >       char *cpu_type;
> >       uint64_t resetvec;
> > +    uint32_t num_rnmi_irqvec;
> > +    uint64_t *rnmi_irqvec;
> > +    uint32_t num_rnmi_excpvec;
> > +    uint64_t *rnmi_excpvec;
> >       RISCVCPU *harts;
> >   };
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index db0875fb43..39b74569b1 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
> >       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
> >       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
> >       ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> > +    ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
> >       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> >       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> >       ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
> > @@ -1404,6 +1405,12 @@ static void riscv_cpu_set_irq(void *opaque, int
> irq, int level)
> >           g_assert_not_reached();
> >       }
> >   }
> > +
> > +static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
> > +{
> > +    RISCVCPU *cpu =3D RISCV_CPU(opaque);
> > +    riscv_cpu_set_rnmi(cpu, irq, level);
>
> Minor commennt/nit: you can do:
>
> > +    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
>
> And avoid the extra 'cpu' pointer.
>
>
> > +}
> >   #endif /* CONFIG_USER_ONLY */
> >
> >   static void riscv_cpu_init(Object *obj)
> > @@ -1420,6 +1427,8 @@ static void riscv_cpu_init(Object *obj)
> >   #ifndef CONFIG_USER_ONLY
> >       qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
> >                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> > +    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
> > +                            "riscv.cpu.rnmi", RNMI_MAX);
> >   #endif /* CONFIG_USER_ONLY */
> >   }
> >
> > @@ -1600,6 +1609,7 @@ static Property riscv_cpu_extensions[] =3D {
> >       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> >       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> >       DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> > +    DEFINE_PROP_BOOL("x-smrnmi", RISCVCPU, cfg.ext_smrnmi, false),
> >
> >       DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
> >       DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
> > @@ -1644,6 +1654,10 @@ static Property riscv_cpu_properties[] =3D {
> >
> >       DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s,
> false),
> >       DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s,
> false),
> > +    DEFINE_PROP_UINT64("rnmi-interrupt-vector", RISCVCPU,
> env.rnmi_irqvec,
> > +                       DEFAULT_RNMI_IRQVEC),
> > +    DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU,
> env.rnmi_excpvec,
> > +                       DEFAULT_RNMI_EXCPVEC),
> >
> >       /*
> >        * write_misa() is marked as experimental for now so mark
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index de7e43126a..6c14b93cb5 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -366,6 +366,11 @@ struct CPUArchState {
> >       uint64_t kvm_timer_compare;
> >       uint64_t kvm_timer_state;
> >       uint64_t kvm_timer_frequency;
> > +
> > +    /* RNMI */
> > +    target_ulong rnmip;
> > +    uint64_t rnmi_irqvec;
> > +    uint64_t rnmi_excpvec;
> >   };
> >
> >   /*
> > @@ -436,6 +441,7 @@ struct RISCVCPUConfig {
> >       bool ext_smaia;
> >       bool ext_ssaia;
> >       bool ext_sscofpmf;
> > +    bool ext_smrnmi;
> >       bool rvv_ta_all_1s;
> >       bool rvv_ma_all_1s;
> >
> > @@ -562,6 +568,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState
> *env);
> >   int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
> >   uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
> >                                 uint64_t value);
> > +void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
> >   #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip
> value */
> >   void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void
> *),
> >                                void *arg);
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 59f0ffd9e1..7cb43b88f3 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -659,6 +659,12 @@ typedef enum {
> >   /* Default Reset Vector adress */
> >   #define DEFAULT_RSTVEC      0x1000
> >
> > +/* Default RNMI Interrupt Vector address */
> > +#define DEFAULT_RNMI_IRQVEC     0x0
> > +
> > +/* Default RNMI Exception Vector address */
> > +#define DEFAULT_RNMI_EXCPVEC    0x0
> > +
> >   /* Exception causes */
> >   typedef enum RISCVException {
> >       RISCV_EXCP_NONE =3D -1, /* sentinel value */
> > @@ -705,6 +711,9 @@ typedef enum RISCVException {
> >   #define IRQ_LOCAL_MAX                      16
> >   #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
> >
> > +/* RNMI causes */
> > +#define RNMI_MAX                           16
> > +
> >   /* mip masks */
> >   #define MIP_USIP                           (1 << IRQ_U_SOFT)
> >   #define MIP_SSIP                           (1 << IRQ_S_SOFT)
> > @@ -896,6 +905,9 @@ typedef enum RISCVException {
> >   #define MHPMEVENT_IDX_MASK                 0xFFFFF
> >   #define MHPMEVENT_SSCOF_RESVD              16
> >
> > +/* RISC-V-specific interrupt pending bits. */
> > +#define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0
> > +
> >   /* JVT CSR bits */
> >   #define JVT_MODE                           0x3F
> >   #define JVT_BASE                           (~0x3F)
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 57d04385f1..cc7898f103 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -635,6 +635,30 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env,
> uint64_t mask,
> >       return old;
> >   }
> >
> > +void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
> > +{
> > +    CPURISCVState *env =3D &cpu->env;
> > +    CPUState *cs =3D CPU(cpu);
> > +    bool locked =3D false;
> > +
> > +    if (!qemu_mutex_iothread_locked()) {
> > +        locked =3D true;
> > +        qemu_mutex_lock_iothread();
> > +    }
> > +
> > +    if (level) {
> > +        env->rnmip |=3D 1 << irq;
> > +        cpu_interrupt(cs, CPU_INTERRUPT_RNMI);
> > +    } else {
> > +        env->rnmip &=3D ~(1 << irq);
> > +        cpu_reset_interrupt(cs, CPU_INTERRUPT_RNMI);
> > +    }
> > +
> > +    if (locked) {
> > +        qemu_mutex_unlock_iothread();
> > +    }
>
>
> 'locked' is not a good named for this flag because you guaranteed that th=
e
> iothread
> will always be locked at this point. Questions is whether you locked it
> yourself,
> and then you need to unlock it, or if it was locked beforehand.
>
> I suggest renaming 'locked' to 'release_lock' for clarity. Asumming you
> agree:
>
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
>
>
>
>
> > +}
> > +
> >   void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void
> *),
> >                                void *arg)
> >   {
>

--000000000000b438e105fd98fb54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0

Daniel,<br>Thanks for all the suggestions ! I&#39;ll send patch v4 and fix =
all the issues.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 25, 2023 at 8:29=E2=80=AFPM Daniel Henrique Bar=
boza &lt;<a href=3D"mailto:dbarboza@ventanamicro.com">dbarboza@ventanamicro=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On 5/22/23 10:11, Tommy Wu wrote:<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" tar=
get=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/riscv/riscv_hart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
1 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0include/hw/riscv/riscv_hart.h |=C2=A0 4 ++++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 14 ++++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++=
+++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0| 24 ++++++++=
++++++++++++++++<br>
&gt;=C2=A0 =C2=A06 files changed, 82 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c<br>
&gt; index 613ea2aaa0..eac18f8c29 100644<br>
&gt; --- a/hw/riscv/riscv_hart.c<br>
&gt; +++ b/hw/riscv/riscv_hart.c<br>
&gt; @@ -33,6 +33,12 @@ static Property riscv_harts_props[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;cpu-type&quot;, RIS=
CVHartArrayState, cpu_type),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT64(&quot;resetvec&quot;, RIS=
CVHartArrayState, resetvec,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 DEFAULT_RSTVEC),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ARRAY(&quot;rnmi-interrupt-vector&quot;, RI=
SCVHartArrayState,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 num_rnmi_irqvec, rnmi_irqvec, qdev_prop_uint64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 uint64_t),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ARRAY(&quot;rnmi-exception-vector&quot;, RI=
SCVHartArrayState,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 uint64_t),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -47,6 +53,21 @@ static bool riscv_hart_realize(RISCVHartArrayState =
*s, int idx,<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0object_initialize_child(OBJECT(s), &quot;har=
ts[*]&quot;, &amp;s-&gt;harts[idx], cpu_type);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint64(DEVICE(&amp;s-&gt;harts=
[idx]), &quot;resetvec&quot;, s-&gt;resetvec);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;harts[idx].cfg.ext_smrnmi) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;rnmi_irqvec) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint64(DEVICE=
(&amp;s-&gt;harts[idx]),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rnmi-interrupt-vecto=
r&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;rnmi_irqvec[idx]);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;rnmi_excpvec) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint64(DEVICE=
(&amp;s-&gt;harts[idx]),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rnmi-exception-vecto=
r&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;rnmi_excpvec[idx]);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;harts[idx].env.mhartid =3D s-&gt;harti=
d_base + idx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_register_reset(riscv_harts_cpu_reset, &=
amp;s-&gt;harts[idx]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return qdev_realize(DEVICE(&amp;s-&gt;harts[=
idx]), NULL, errp);<br>
&gt; diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_ha=
rt.h<br>
&gt; index bbc21cdc9a..99c0ac5009 100644<br>
&gt; --- a/include/hw/riscv/riscv_hart.h<br>
&gt; +++ b/include/hw/riscv/riscv_hart.h<br>
&gt; @@ -38,6 +38,10 @@ struct RISCVHartArrayState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t hartid_base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *cpu_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t resetvec;<br>
&gt; +=C2=A0 =C2=A0 uint32_t num_rnmi_irqvec;<br>
&gt; +=C2=A0 =C2=A0 uint64_t *rnmi_irqvec;<br>
&gt; +=C2=A0 =C2=A0 uint32_t num_rnmi_excpvec;<br>
&gt; +=C2=A0 =C2=A0 uint64_t *rnmi_excpvec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *harts;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index db0875fb43..39b74569b1 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_=
0, ext_zhinx),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_=
12_0, ext_zhinxmin),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_=
0, ext_smaia),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smr=
nmi),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_=
0, ext_ssaia),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_=
12_0, ext_sscofpmf),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0=
, ext_sstc),<br>
&gt; @@ -1404,6 +1405,12 @@ static void riscv_cpu_set_irq(void *opaque, int=
 irq, int level)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +static void riscv_cpu_set_nmi(void *opaque, int irq, int level)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(opaque);<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_set_rnmi(cpu, irq, level);<br>
<br>
Minor commennt/nit: you can do:<br>
<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);<br>
<br>
And avoid the extra &#39;cpu&#39; pointer.<br>
<br>
<br>
&gt; +}<br>
&gt;=C2=A0 =C2=A0#endif /* CONFIG_USER_ONLY */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void riscv_cpu_init(Object *obj)<br>
&gt; @@ -1420,6 +1427,8 @@ static void riscv_cpu_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0#ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set=
_irq,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);<br>
&gt; +=C2=A0 =C2=A0 qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv.cpu.rnmi&quot;, RNMI_MAX);<br>
&gt;=C2=A0 =C2=A0#endif /* CONFIG_USER_ONLY */<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1600,6 +1609,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-epmp&quot;, RISCVCP=
U, cfg.epmp, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-smaia&quot;, RISCVC=
PU, cfg.ext_smaia, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-ssaia&quot;, RISCVC=
PU, cfg.ext_ssaia, false),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;x-smrnmi&quot;, RISCVCPU, cfg.ex=
t_smrnmi, false),<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-zvfh&quot;, RISCVCP=
U, cfg.ext_zvfh, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-zvfhmin&quot;, RISC=
VCPU, cfg.ext_zvfhmin, false),<br>
&gt; @@ -1644,6 +1654,10 @@ static Property riscv_cpu_properties[] =3D {<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;rvv_ta_all_1s&quot;, =
RISCVCPU, cfg.rvv_ta_all_1s, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;rvv_ma_all_1s&quot;, =
RISCVCPU, cfg.rvv_ma_all_1s, false),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;rnmi-interrupt-vector&quot;, R=
ISCVCPU, env.rnmi_irqvec,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DEFAULT_RNMI_IRQVEC),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;rnmi-exception-vector&quot;, R=
ISCVCPU, env.rnmi_excpvec,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DEFAULT_RNMI_EXCPVEC),<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * write_misa() is marked as experimental fo=
r now so mark<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index de7e43126a..6c14b93cb5 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -366,6 +366,11 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t kvm_timer_compare;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t kvm_timer_state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t kvm_timer_frequency;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* RNMI */<br>
&gt; +=C2=A0 =C2=A0 target_ulong rnmip;<br>
&gt; +=C2=A0 =C2=A0 uint64_t rnmi_irqvec;<br>
&gt; +=C2=A0 =C2=A0 uint64_t rnmi_excpvec;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/*<br>
&gt; @@ -436,6 +441,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_smaia;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_ssaia;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_sscofpmf;<br>
&gt; +=C2=A0 =C2=A0 bool ext_smrnmi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool rvv_ta_all_1s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool rvv_ma_all_1s;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -562,6 +568,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState =
*env);<br>
&gt;=C2=A0 =C2=A0int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t int=
errupts);<br>
&gt;=C2=A0 =C2=A0uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t=
 mask,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t value);<br>
&gt; +void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);<br>
&gt;=C2=A0 =C2=A0#define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_u=
pdate_mip value */<br>
&gt;=C2=A0 =C2=A0void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t =
(*fn)(void *),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *arg);<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index 59f0ffd9e1..7cb43b88f3 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -659,6 +659,12 @@ typedef enum {<br>
&gt;=C2=A0 =C2=A0/* Default Reset Vector adress */<br>
&gt;=C2=A0 =C2=A0#define DEFAULT_RSTVEC=C2=A0 =C2=A0 =C2=A0 0x1000<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Default RNMI Interrupt Vector address */<br>
&gt; +#define DEFAULT_RNMI_IRQVEC=C2=A0 =C2=A0 =C2=A00x0<br>
&gt; +<br>
&gt; +/* Default RNMI Exception Vector address */<br>
&gt; +#define DEFAULT_RNMI_EXCPVEC=C2=A0 =C2=A0 0x0<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Exception causes */<br>
&gt;=C2=A0 =C2=A0typedef enum RISCVException {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_EXCP_NONE =3D -1, /* sentinel value */=
<br>
&gt; @@ -705,6 +711,9 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 =C2=A0#define IRQ_LOCAL_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
&gt;=C2=A0 =C2=A0#define IRQ_LOCAL_GUEST_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (TARGET_LONG_BITS - 1)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* RNMI causes */<br>
&gt; +#define RNMI_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* mip masks */<br>
&gt;=C2=A0 =C2=A0#define MIP_USIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_SO=
FT)<br>
&gt;=C2=A0 =C2=A0#define MIP_SSIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_SO=
FT)<br>
&gt; @@ -896,6 +905,9 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 =C2=A0#define MHPMEVENT_IDX_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFFFFF<br>
&gt;=C2=A0 =C2=A0#define MHPMEVENT_SSCOF_RESVD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 16<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* RISC-V-specific interrupt pending bits. */<br>
&gt; +#define CPU_INTERRUPT_RNMI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0CPU_INTERRUPT_TGT_EXT_0<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* JVT CSR bits */<br>
&gt;=C2=A0 =C2=A0#define JVT_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3F<br>
&gt;=C2=A0 =C2=A0#define JVT_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(~0x3F)<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index 57d04385f1..cc7898f103 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -635,6 +635,30 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env,=
 uint64_t mask,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return old;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 CPUState *cs =3D CPU(cpu);<br>
&gt; +=C2=A0 =C2=A0 bool locked =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!qemu_mutex_iothread_locked()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 locked =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (level) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;rnmip |=3D 1 &lt;&lt; irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_interrupt(cs, CPU_INTERRUPT_RNMI);<br=
>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;rnmip &amp;=3D ~(1 &lt;&lt; irq);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_reset_interrupt(cs, CPU_INTERRUPT_RNM=
I);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (locked) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
<br>
&#39;locked&#39; is not a good named for this flag because you guaranteed t=
hat the iothread<br>
will always be locked at this point. Questions is whether you locked it you=
rself,<br>
and then you need to unlock it, or if it was locked beforehand.<br>
<br>
I suggest renaming &#39;locked&#39; to &#39;release_lock&#39; for clarity. =
Asumming you agree:<br>
<br>
<br>
Reviewed-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:dbarboza@ventana=
micro.com" target=3D"_blank">dbarboza@ventanamicro.com</a>&gt;<br>
<br>
<br>
<br>
<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t =
(*fn)(void *),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *arg)<br>
&gt;=C2=A0 =C2=A0{<br>
</blockquote></div>

--000000000000b438e105fd98fb54--

