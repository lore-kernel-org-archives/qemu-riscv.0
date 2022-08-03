Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJLeb-0001zJ-3N
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 17:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJLeW-0001xq-BD
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 17:11:42 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJLeT-0003Qj-UC
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 17:11:40 -0400
Received: by mail-pg1-x531.google.com with SMTP id s206so16214113pgs.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3GlXPH1lg5pd8Hg7NqkvfxO4LUduXMYAGkSrZlZkKmU=;
 b=jdHG+ww0A8Tr9qvP01mRWaFaYAYEpbGbY9DPfGuLWlcfOlROZVTjGKrdDXO631qHrS
 X4D2IGsjG+WUe87jChpENe8EmzqkLZ3/2qwhVzbe+WvsGXMrAjEUls0s3jvh8fdEUeV4
 9B3Tr6yN7ChprWXyiLDWLNPywjv1TmAb6Uxj6NgICdIR3Cu2HvValdRzZ33FJdi2pnWL
 LWbq47kpHRR0wO/dogcmo7P1OdEu020mbyWn9ugPt1VJU7wc/ZHGvVICaKr3r/BrsVef
 hALOchwQxDemYuUoxYgIAsTifj1k7Oe+9+q0OyqxfczukO1HtzbutlAfm8Bsyvt84CtM
 OTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3GlXPH1lg5pd8Hg7NqkvfxO4LUduXMYAGkSrZlZkKmU=;
 b=xxU9mcUwcDeGv0loChTlJ7oUnJvv1jTljecRUpsvQeAijJ1Dv6wO3RAOysLnETjz1x
 RtwFhnhfmcpyfrGFz3t6aohjBrdZs0xJ1jG/GNzL4NY7ew2HRVSfUD0FJSgbzbFflURV
 qRA77DxbLPW7qtR8p2u6O1jUiSlxyc1LNy18ZTfklOSOg5++vSWQwP3wP5JnpliDIJgt
 1rQphvxe5bMeYFzFNd6gkBlf33qjgjkvf5bGCp+e3+8/O6LRmOjf5S40T93wJr8EBWiy
 w5ypCCK2OYTPtQq7JlaSKRf0crimmA0O7/4z7cfMROZulhW83T/eHrtc2Ftgbhhmj6bq
 EKLA==
X-Gm-Message-State: ACgBeo2gfrTCpfC2VwlCYQBYxvTmtJwAvvZ0xOw+7GVP70Ls6mB82pEQ
 RmRlt5SrZKE/u6DKkpKFJ8fJGk0AbNftYfrZgJOoAg==
X-Google-Smtp-Source: AA6agR4CVoCYcLjmFx/Sih2rpgv3q9Ehb8W1cAVcGkOsH+A8q3iQpYgI9BIiN0pRWo6KxYKX2zHmanW2aIGArDXXSxw=
X-Received: by 2002:a65:578f:0:b0:41c:62a0:6b61 with SMTP id
 b15-20020a65578f000000b0041c62a06b61mr8216993pgr.88.1659561094932; Wed, 03
 Aug 2022 14:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220803082516.2271344-1-atishp@rivosinc.com>
 <20220803082516.2271344-3-atishp@rivosinc.com>
 <57873d3b-dd78-2bcc-7e28-a7aec0bbf24e@codethink.co.uk>
In-Reply-To: <57873d3b-dd78-2bcc-7e28-a7aec0bbf24e@codethink.co.uk>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 3 Aug 2022 14:11:24 -0700
Message-ID: <CAHBxVyG1Ltbs-QW11T6+Z6Va=aqUGMjS_bn3zQnyOJ3eaJvMOg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] target/riscv: Add stimecmp support
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008bfe1305e55cada8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 03 Aug 2022 21:11:43 -0000

--0000000000008bfe1305e55cada8
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 3, 2022 at 3:26 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> On 03/08/2022 09:25, Atish Patra wrote:
> > stimecmp allows the supervisor mode to update stimecmp CSR directly
> > to program the next timer interrupt. This CSR is part of the Sstc
> > extension which was ratified recently.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/cpu.c         | 12 +++++
> >   target/riscv/cpu.h         |  5 ++
> >   target/riscv/cpu_bits.h    |  4 ++
> >   target/riscv/csr.c         | 81 +++++++++++++++++++++++++++++++
> >   target/riscv/machine.c     |  1 +
> >   target/riscv/meson.build   |  3 +-
> >   target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++++++++++++++
> >   target/riscv/time_helper.h | 30 ++++++++++++
> >   8 files changed, 233 insertions(+), 1 deletion(-)
> >   create mode 100644 target/riscv/time_helper.c
> >   create mode 100644 target/riscv/time_helper.h
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d4635c7df46b..e0c3e786849f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -23,6 +23,7 @@
> >   #include "qemu/log.h"
> >   #include "cpu.h"
> >   #include "internals.h"
> > +#include "time_helper.h"
> >   #include "exec/exec-all.h"
> >   #include "qapi/error.h"
> >   #include "qemu/error-report.h"
> > @@ -99,6 +100,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
> >       ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
> >       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
> >       ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0,
> ext_zhinxmin),
> > +    ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
> >       ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0,
> ext_svinval),
> >       ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0,
> ext_svnapot),
> >       ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> > @@ -675,6 +677,13 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >
> >       set_resetvec(env, cpu->cfg.resetvec);
> >
> > +#ifndef CONFIG_USER_ONLY
> > +    if (cpu->cfg.ext_sstc) {
> > +        riscv_timer_init(cpu);
> > +    }
> > +#endif /* CONFIG_USER_ONLY */
> > +
> > +
> >       /* Validate that MISA_MXL is set properly. */
> >       switch (env->misa_mxl_max) {
> >   #ifdef TARGET_RISCV64
> > @@ -968,7 +977,9 @@ static void riscv_cpu_init(Object *obj)
> >   #ifndef CONFIG_USER_ONLY
> >       qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
> >                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> > +
> >   #endif /* CONFIG_USER_ONLY */
> > +
> >   }
> >
> >   static Property riscv_cpu_extensions[] = {
> > @@ -995,6 +1006,7 @@ static Property riscv_cpu_extensions[] = {
> >       DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> >       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > +    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
> >
> >       DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >       DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0fae1569945c..4cda2905661e 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -309,6 +309,9 @@ struct CPUArchState {
> >       uint64_t mfromhost;
> >       uint64_t mtohost;
> >
> > +    /* Sstc CSRs */
> > +    uint64_t stimecmp;
> > +
> >       /* physical memory protection */
> >       pmp_table_t pmp_state;
> >       target_ulong mseccfg;
> > @@ -362,6 +365,7 @@ struct CPUArchState {
> >       float_status fp_status;
> >
> >       /* Fields from here on are preserved across CPU reset. */
> > +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> >
> >       hwaddr kernel_addr;
> >       hwaddr fdt_addr;
> > @@ -425,6 +429,7 @@ struct RISCVCPUConfig {
> >       bool ext_ifencei;
> >       bool ext_icsr;
> >       bool ext_zihintpause;
> > +    bool ext_sstc;
> >       bool ext_svinval;
> >       bool ext_svnapot;
> >       bool ext_svpbmt;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 6be5a9e9f046..ac17cf1515c0 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -206,6 +206,10 @@
> >   #define CSR_STVAL           0x143
> >   #define CSR_SIP             0x144
> >
> > +/* Sstc supervisor CSRs */
> > +#define CSR_STIMECMP        0x14D
> > +#define CSR_STIMECMPH       0x15D
> > +
> >   /* Supervisor Protection and Translation */
> >   #define CSR_SPTBR           0x180
> >   #define CSR_SATP            0x180
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 0fb042b2fd0f..b71e2509b64f 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -22,6 +22,7 @@
> >   #include "qemu/timer.h"
> >   #include "cpu.h"
> >   #include "pmu.h"
> > +#include "time_helper.h"
> >   #include "qemu/main-loop.h"
> >   #include "exec/exec-all.h"
> >   #include "sysemu/cpu-timers.h"
> > @@ -803,6 +804,76 @@ static RISCVException read_timeh(CPURISCVState
> *env, int csrno,
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +static RISCVException sstc(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (env->priv == PRV_M) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (env->priv != PRV_S) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
>
> These seem to be checking env->priv twice, wouldnt
> one check for nv->priv != PRV_S be sufficient?
>
>
nope as we need to allow the access from M-mode unconditionally.
But we can remove the non-Smode check as suggested by Weiwei.


>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html
>

--0000000000008bfe1305e55cada8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 3, 2022 at 3:26 AM Ben Do=
oks &lt;<a href=3D"mailto:ben.dooks@codethink.co.uk">ben.dooks@codethink.co=
.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 03/08/2022 09:25, Atish Patra wrote:<br>
&gt; stimecmp allows the supervisor mode to update stimecmp CSR directly<br=
>
&gt; to program the next timer interrupt. This CSR is part of the Sstc<br>
&gt; extension which was ratified recently.<br>
&gt; <br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +=
++++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 81 +=
++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/machine.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0target/riscv/meson.build=C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/time_helper.h | 30 ++++++++++++<br>
&gt;=C2=A0 =C2=A08 files changed, 233 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 target/riscv/time_helper.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 target/riscv/time_helper.h<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index d4635c7df46b..e0c3e786849f 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -23,6 +23,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;internals.h&quot;<br>
&gt; +#include &quot;time_helper.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/exec-all.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/error-report.h&quot;<br>
&gt; @@ -99,6 +100,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSIO=
N_1_12_0, ext_zve64f),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION=
_1_12_0, ext_zhinx),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERS=
ION_1_12_0, ext_zhinxmin),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext=
_sstc),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSI=
ON_1_12_0, ext_svinval),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSI=
ON_1_12_0, ext_svnapot),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSIO=
N_1_12_0, ext_svpbmt),<br>
&gt; @@ -675,6 +677,13 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0set_resetvec(env, cpu-&gt;cfg.resetvec);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_sstc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_timer_init(cpu);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif /* CONFIG_USER_ONLY */<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Validate that MISA_MXL is set properly. *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (env-&gt;misa_mxl_max) {<br>
&gt;=C2=A0 =C2=A0#ifdef TARGET_RISCV64<br>
&gt; @@ -968,7 +977,9 @@ static void riscv_cpu_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0#ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set=
_irq,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#endif /* CONFIG_USER_ONLY */<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static Property riscv_cpu_extensions[] =3D {<br>
&gt; @@ -995,6 +1006,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zve64f&quot;, RISCVCP=
U, cfg.ext_zve64f, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;mmu&quot;, RISCVCPU, =
cfg.mmu, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;pmp&quot;, RISCVCPU, =
cfg.pmp, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;sstc&quot;, RISCVCPU, cfg.ext_ss=
tc, true),<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;priv_spec&quot;, RI=
SCVCPU, cfg.priv_spec),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;vext_spec&quot;, RI=
SCVCPU, cfg.vext_spec),<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 0fae1569945c..4cda2905661e 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -309,6 +309,9 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t mfromhost;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t mtohost;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* Sstc CSRs */<br>
&gt; +=C2=A0 =C2=A0 uint64_t stimecmp;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* physical memory protection */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmp_table_t pmp_state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mseccfg;<br>
&gt; @@ -362,6 +365,7 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float_status fp_status;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fields from here on are preserved across =
CPU reset. */<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *stimer; /* Internal timer for S-mode interru=
pt */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr kernel_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr fdt_addr;<br>
&gt; @@ -425,6 +429,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_ifencei;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_icsr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zihintpause;<br>
&gt; +=C2=A0 =C2=A0 bool ext_sstc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_svinval;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_svnapot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_svpbmt;<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index 6be5a9e9f046..ac17cf1515c0 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -206,6 +206,10 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_STVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x143<br>
&gt;=C2=A0 =C2=A0#define CSR_SIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x144<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Sstc supervisor CSRs */<br>
&gt; +#define CSR_STIMECMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x14D<br>
&gt; +#define CSR_STIMECMPH=C2=A0 =C2=A0 =C2=A0 =C2=A00x15D<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Supervisor Protection and Translation */<br>
&gt;=C2=A0 =C2=A0#define CSR_SPTBR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x180<br>
&gt;=C2=A0 =C2=A0#define CSR_SATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x180<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index 0fb042b2fd0f..b71e2509b64f 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -22,6 +22,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/timer.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;pmu.h&quot;<br>
&gt; +#include &quot;time_helper.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/main-loop.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/exec-all.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
&gt; @@ -803,6 +804,76 @@ static RISCVException read_timeh(CPURISCVState *e=
nv, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static RISCVException sstc(CPURISCVState *env, int csrno)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;cfg.ext_sstc || !env-&gt;rdtime_fn) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_M) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;priv !=3D PRV_S) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
These seem to be checking env-&gt;priv twice, wouldnt<br>
one check for nv-&gt;priv !=3D PRV_S be sufficient?<br>
<br></blockquote><div><br></div><div>nope as we need to allow the access fr=
om M-mode unconditionally.=C2=A0</div><div>But we can remove the non-Smode =
check as suggested by Weiwei.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
-- <br>
Ben Dooks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.codethin=
k.co.uk/" rel=3D"noreferrer" target=3D"_blank">http://www.codethink.co.uk/<=
/a><br>
Senior Engineer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Codethink - Providing Genius<br>
<br>
<a href=3D"https://www.codethink.co.uk/privacy.html" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.codethink.co.uk/privacy.html</a><br>
</blockquote></div></div>

--0000000000008bfe1305e55cada8--

