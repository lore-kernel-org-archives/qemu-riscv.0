Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D94C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:31:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2aKy-0006Sk-Ir; Fri, 26 May 2023 12:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aKv-0006RI-NF
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:30:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aKs-0006yD-Nr
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:30:41 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2533ed4f1dcso767770a91.1
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685118637; x=1687710637; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUboXMN9ct9OXzWxZOl4pVRGbhBlGx43OVG3VG5v4RI=;
 b=ZenD0SZo/aDJrwTvWuoeaZpq1+NM4fvt+p1xxWFqp03bpuFzWzWuzf1ovfD/pkM7U7
 GTcT/KOi7u3EzOm6BDdXyqtYlVwK0zWJ3xu/Ao8xEbEXhdDHSuhNqUw9HmBUjOWwmZRc
 U34Dm2aKYwAatt2iMQKjtzYJO+ks0HgluUYSN7/XExCwlUHPVckC+D47Qg4mvP/n5zwK
 EdNn6x+xnSKvK7cYmdJ+xdsxthZepS8r16ul3tJtirIbRZ1CN9nW8Q6WwnriJLCoLwVs
 dwxisNtzQHrcyCfzNHG+MY9CoNOA5Jh17CtWNcsNP2h0WTcnSaraepQYNlbdalfPL8ph
 Lk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685118637; x=1687710637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUboXMN9ct9OXzWxZOl4pVRGbhBlGx43OVG3VG5v4RI=;
 b=Whj6J8lmXL/RGn6t5IywDt5ps+/IZNRI/3sSvbpoaLa9QCvtPLHdU8Ie9sEwiuNJeT
 k5e+mSLbjEWQwXY2jycYacM5jTOZXjtZ8ZkZoDs0fE3NwLDCsCoQW7Pp6wwUo5ncV8pg
 2wc24VPqOK9w53EdZzdg+RX2kCE+bAzuf3okAbKNVXtDaU59/Vz3/MDAFBEOlA1FNvTx
 vPaD6JDFu/NTVymRzb0Oc4ShIIO0fUwOsr+ZyxvTgaaMSMgVRqgWFxzp/RdXujIDuy2I
 cgb+KztxZTxQF9hr0zgEcutxs+XSmhrBfgFnx1huUrs5LSTcDPFkl9o4RfXY5Dtf6JA4
 Fliw==
X-Gm-Message-State: AC+VfDyT5TZUN02AJKGVcv0hbWix/VH5/s7OqeFVVgxsrkCrsewA1sTA
 gB5ruWG0egC6WlQmShTo3QP6C8P9uhnB/WO8CeE1pw==
X-Google-Smtp-Source: ACHHUZ5evl4ug8ldhRJP8Avp2Xa1QL0zwuaYsyMfXrM7Y6DeZwYqwiktipw8lrrWv5mGlceHUuEU2fyhGazzo4nf+lI=
X-Received: by 2002:a17:90b:4b12:b0:23f:2661:f94c with SMTP id
 lx18-20020a17090b4b1200b0023f2661f94cmr2725414pjb.47.1685118637052; Fri, 26
 May 2023 09:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113838.130084-1-rkanwal@rivosinc.com>
 <20230518113838.130084-7-rkanwal@rivosinc.com>
 <adf02d3a-1171-14d2-2c66-eac1fa08625d@ventanamicro.com>
In-Reply-To: <adf02d3a-1171-14d2-2c66-eac1fa08625d@ventanamicro.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 26 May 2023 17:30:25 +0100
Message-ID: <CAECbVCu+3YLu=7AeYF8Xe=ZuvvVchUBYJuFGN1SDfAq6j=7U_A@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/riscv: Add HS-mode virtual interrupt and IRQ
 filtering support.
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 22, 2023 at 6:18=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 5/18/23 08:38, Rajnesh Kanwal wrote:
> > This change adds support for inserting virtual interrupts from HS-mode
> > into VS-mode using hvien and hvip csrs. This also allows for IRQ filter=
ing
> > from HS-mode.
> >
> > Also, the spec doesn't mandate the interrupt to be actually supported
> > in hardware. Which allows HS-mode to assert virtual interrupts to VS-mo=
de
> > that have no connection to any real interrupt events.
> >
> > This is defined as part of the AIA specification [0], "6.3.2 Virtual
> > interrupts for VS level".
> >
> > [0]: https://github.com/riscv/riscv-aia/releases/download/1.0-RC4/riscv=
-interrupts-1.0-RC4.pdf
> >
> > Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> > ---
> >   target/riscv/cpu.c        |   3 +-
> >   target/riscv/cpu.h        |  14 +++
> >   target/riscv/cpu_helper.c |  48 +++++++---
> >   target/riscv/csr.c        | 196 ++++++++++++++++++++++++++++++++++---=
-
> >   target/riscv/machine.c    |   3 +
> >   5 files changed, 234 insertions(+), 30 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 9557194a21..c2b05d4c37 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -713,7 +713,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
> >        * mode and delegation registers, but respect individual enables
> >        */
> >       return riscv_cpu_all_pending(env) !=3D 0 ||
> > -        riscv_cpu_sirq_pending(env) !=3D RISCV_EXCP_NONE;
> > +        riscv_cpu_sirq_pending(env) !=3D RISCV_EXCP_NONE ||
> > +        riscv_cpu_vsirq_pending(env) !=3D RISCV_EXCP_NONE;
> >   #else
> >       return true;
> >   #endif
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 07cf656471..3e10eee38f 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -196,6 +196,12 @@ struct CPUArchState {
> >        */
> >       uint64_t sie;
> >
> > +    /*
> > +     * When hideleg[i]=3D0 and hvien[i]=3D1, vsie[i] is no more
> > +     * alias of sie[i] (mie[i]) and needs to be maintained separatly.
> > +     */
> > +    uint64_t vsie;
> > +
> >       target_ulong satp;   /* since: priv-1.10.0 */
> >       target_ulong stval;
> >       target_ulong medeleg;
> > @@ -230,6 +236,14 @@ struct CPUArchState {
> >       target_ulong hgeie;
> >       target_ulong hgeip;
> >       uint64_t htimedelta;
> > +    uint64_t hvien;
> > +
> > +    /*
> > +     * Bits VSSIP, VSTIP and VSEIP in hvip are maintained in mip. Othe=
r bits
> > +     * from 0:12 are reserved. Bits 13:63 are not aliased and must be =
separately
> > +     * maintain in hvip.
> > +     */
> > +    uint64_t hvip;
> >
> >       /* Hypervisor controlled virtual interrupt priorities */
> >       target_ulong hvictl;
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 681b4ae811..80bdd4cf5a 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -366,8 +366,9 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *=
env,
> >   }
> >
> >   /*
> > - * Doesn't report interrupts inserted using mvip from M-mode firmware.=
 Those
> > - * are returned in riscv_cpu_sirq_pending().
> > + * Doesn't report interrupts inserted using mvip from M-mode firmware =
or
> > + * using hvip bits 13:63 from HS-mode. Those are returned in
> > + * riscv_cpu_sirq_pending() and riscv_cpu_vsirq_pending().
> >    */
> >   uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> >   {
> > @@ -399,16 +400,23 @@ int riscv_cpu_sirq_pending(CPURISCVState *env)
> >
> >   int riscv_cpu_vsirq_pending(CPURISCVState *env)
> >   {
> > -    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> > -                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg & env-=
>hideleg;
> > +    uint64_t irqs_f_vs =3D env->hvip & env->hvien & ~env->hideleg & en=
v->vsie;
> > +    uint64_t vsbits;
> > +
> > +    /* Bring VS-level bits to correct position */
> > +    vsbits =3D irqs & VS_MODE_INTERRUPTS;
> > +    irqs &=3D ~VS_MODE_INTERRUPTS;
> > +    irqs |=3D vsbits >> 1;
> >
> >       return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> > -                                    irqs >> 1, env->hviprio);
> > +                                    (irqs | irqs_f_vs), env->hviprio);
> >   }
> >
> >   static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >   {
> > -    uint64_t irqs, pending, mie, hsie, vsie, irqs_f;
> > +    uint64_t irqs, pending, mie, hsie, vsie, irqs_f, irqs_f_vs;
> > +    uint64_t vsbits, irq_delegated;
> >       int virq;
> >
> >       /* Determine interrupt enable state of all privilege modes */
> > @@ -445,12 +453,26 @@ static int riscv_cpu_local_irq_pending(CPURISCVSt=
ate *env)
> >                                           irqs, env->siprio);
> >       }
> >
> > +    /* Check for virtual VS-mode interrupts. */
> > +    irqs_f_vs =3D env->hvip & env->hvien & ~env->hideleg & env->vsie;
> > +
> >       /* Check VS-mode interrupts */
> > -    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
> > +    irq_delegated =3D pending & env->mideleg & env->hideleg;
> > +
> > +    /* Bring VS-level bits to correct position */
> > +    vsbits =3D irq_delegated & VS_MODE_INTERRUPTS;
> > +    irq_delegated &=3D ~VS_MODE_INTERRUPTS;
> > +    irq_delegated |=3D vsbits >> 1;
> > +
> > +    irqs =3D (irq_delegated | irqs_f_vs) & -vsie;
> >       if (irqs) {
> >           virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAU=
LT_S,
> > -                                        irqs >> 1, env->hviprio);
> > -        return (virq <=3D 0) ? virq : virq + 1;
> > +                                        irqs, env->hviprio);
> > +        if (virq <=3D 0 || (virq > 12 && virq <=3D 63)) {
> > +            return virq;
> > +        } else {
> > +            return virq + 1;
> > +        }
> >       }
> >
> >       /* Indicate no pending interrupt */
> > @@ -625,6 +647,7 @@ void riscv_cpu_interrupt(CPURISCVState *env)
> >       if (env->virt_enabled) {
> >           gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> >           vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> > +        irqf =3D env->hvien & env->hvip & env->vsie;
> >       } else {
> >           irqf =3D env->mvien & env->mvip & env->sie;
> >       }
> > @@ -1620,6 +1643,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       uint64_t deleg =3D async ? env->mideleg : env->medeleg;
> >       bool s_injected =3D env->mvip & (1 << cause) & env->mvien &&
> >           !(env->mip & (1 << cause));
> > +    bool vs_injected =3D env->hvip & (1 << cause) & env->hvien &&
> > +        !(env->mip & (1 << cause));
> >       target_ulong tval =3D 0;
> >       target_ulong tinst =3D 0;
> >       target_ulong htval =3D 0;
> > @@ -1711,12 +1736,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >                     riscv_cpu_get_trap_name(cause, async));
> >
> >       if (env->priv <=3D PRV_S && cause < 64 &&
> > -        (((deleg >> cause) & 1) || s_injected)) {
> > +        (((deleg >> cause) & 1) || s_injected || vs_injected)) {
> >           /* handle the trap in S-mode */
> >           if (riscv_has_ext(env, RVH)) {
> >               uint64_t hdeleg =3D async ? env->hideleg : env->hedeleg;
> >
> > -            if (env->virt_enabled && ((hdeleg >> cause) & 1)) {
> > +            if (env->virt_enabled &&
> > +                (((hdeleg >> cause) & 1) || vs_injected)) {
> >                   /* Trap to VS mode */
> >                   /*
> >                    * See if we need to adjust cause. Yes if its VS mode=
 interrupt
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index c1ca065a81..1929d5fa7b 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -30,6 +30,11 @@
> >   #include "qemu/guest-random.h"
> >   #include "qapi/error.h"
> >
> > +
> > +static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
> > +                                 uint64_t *ret_val,
> > +                                 uint64_t new_val, uint64_t wr_mask);
> > +
>
> This forward declaration breaks qemu linux-user build:
>
>
> [2/26] Compiling C object libqemu-riscv32-linux-user.fa.p/target_riscv_cs=
r.c.o
> FAILED: libqemu-riscv32-linux-user.fa.p/target_riscv_csr.c.o
> cc -m64 -mcx16 -Ilibqemu-riscv32-linux-user.fa.p -I. -I.. -Itarget/riscv =
-I../target/riscv -I../common-user/host/x86_64 -I../linux-user/include/host=
/x86_64 -I../linux-user/include -Ilinux-user -I../linux-user -I../linux-use=
r/riscv -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib6=
4/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=3Dauto -Wal=
l -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /home/danielhb/work/qe=
mu/linux-headers -isystem linux-headers -iquote . -iquote /home/danielhb/wo=
rk/qemu -iquote /home/danielhb/work/qemu/include -iquote /home/danielhb/wor=
k/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOU=
RCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-=
common -fwrapv -Wundef -Wwrite-strings -Wmissing-prototypes -Wstrict-protot=
ypes -Wredundant-decls -Wold-style-declaration -Wold-style-definition -Wtyp=
e-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -W=
empty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplici=
t-fallthrough=3D2 -Wmissing-format-attribute -Wno-missing-include-dirs -Wno=
-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../=
linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"riscv3=
2-linux-user-config-target.h"' '-DCONFIG_DEVICES=3D"riscv32-linux-user-conf=
ig-devices.h"' -MD -MQ libqemu-riscv32-linux-user.fa.p/target_riscv_csr.c.o=
 -MF libqemu-riscv32-linux-user.fa.p/target_riscv_csr.c.o.d -o libqemu-risc=
v32-linux-user.fa.p/target_riscv_csr.c.o -c ../target/riscv/csr.c
> ../target/riscv/csr.c:34:23: error: =E2=80=98rmw_hvip64=E2=80=99 declared=
 =E2=80=98static=E2=80=99 but never defined [-Werror=3Dunused-function]
>     34 | static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
>        |                       ^~~~~~~~~~
> cc1: all warnings being treated as errors
>
>
>
> It's not clear in the code but rmw_vsip64() is inside a huge "#if defined=
(CONFIG_USER_ONLY)"
> block that starts at line 775.
>
> Putting "rmw_hvip64" forward declaration right before rmw_vsip64() is eno=
ugh to fix it.
>
>
> Thanks,
>
>
> Daniel

Thanks Daniel. I have fixed both issues related to linux-user build
failure in v2.
https://lore.kernel.org/all/20230526162308.22892-1-rkanwal@rivosinc.com/

-Rajnesh

>
>
> >   /* CSR function table public API */
> >   void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
> >   {
> > @@ -1176,6 +1181,8 @@ static const target_ulong sip_writable_mask =3D S=
IP_SSIP | LOCAL_INTERRUPTS;
> >   static const target_ulong hip_writable_mask =3D MIP_VSSIP;
> >   static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTI=
P |
> >                                       MIP_VSEIP | LOCAL_INTERRUPTS;
> > +static const target_ulong hvien_writable_mask =3D LOCAL_INTERRUPTS;
> > +
> >   static const target_ulong vsip_writable_mask =3D MIP_VSSIP | LOCAL_IN=
TERRUPTS;
> >
> >   const bool valid_vm_1_10_32[16] =3D {
> > @@ -2584,16 +2591,36 @@ static RISCVException rmw_vsie64(CPURISCVState =
*env, int csrno,
> >                                    uint64_t *ret_val,
> >                                    uint64_t new_val, uint64_t wr_mask)
> >   {
> > +    uint64_t alias_mask =3D (LOCAL_INTERRUPTS | VS_MODE_INTERRUPTS) &
> > +                            env->hideleg;
> > +    uint64_t nalias_mask =3D LOCAL_INTERRUPTS & (~env->hideleg & env->=
hvien);
> > +    uint64_t rval, rval_vs, vsbits;
> > +    uint64_t wr_mask_vsie;
> > +    uint64_t wr_mask_mie;
> >       RISCVException ret;
> > -    uint64_t rval, mask =3D env->hideleg & VS_MODE_INTERRUPTS;
> >
> >       /* Bring VS-level bits to correct position */
> > -    new_val =3D (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
> > -    wr_mask =3D (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
> > +    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
> > +    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
> > +    new_val |=3D vsbits << 1;
> > +
> > +    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask |=3D vsbits << 1;
> > +
> > +    wr_mask_mie =3D wr_mask & alias_mask;
> > +    wr_mask_vsie =3D wr_mask & nalias_mask;
> > +
> > +    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask_mie);
> > +
> > +    rval_vs =3D env->vsie & nalias_mask;
> > +    env->vsie =3D (env->vsie & ~wr_mask_vsie) | (new_val & wr_mask_vsi=
e);
> >
> > -    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
> >       if (ret_val) {
> > -        *ret_val =3D (rval & mask) >> 1;
> > +        rval &=3D alias_mask;
> > +        vsbits =3D rval & VS_MODE_INTERRUPTS;
> > +        rval &=3D ~VS_MODE_INTERRUPTS;
> > +        *ret_val =3D rval | (vsbits >> 1) | rval_vs;
> >       }
> >
> >       return ret;
> > @@ -2812,15 +2839,26 @@ static RISCVException rmw_vsip64(CPURISCVState =
*env, int csrno,
> >   {
> >       RISCVException ret;
> >       uint64_t rval, mask =3D env->hideleg & VS_MODE_INTERRUPTS;
> > +    uint64_t vsbits;
> >
> > -    /* Bring VS-level bits to correct position */
> > -    new_val =3D (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
> > -    wr_mask =3D (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
> > +    /* Add virtualized bits into vsip mask. */
> > +    mask |=3D env->hvien & ~env->hideleg;
> >
> > -    ret =3D rmw_mip64(env, csrno, &rval, new_val,
> > -                    wr_mask & mask & vsip_writable_mask);
> > +    /* Bring VS-level bits to correct position */
> > +    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
> > +    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
> > +    new_val |=3D vsbits << 1;
> > +    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask |=3D vsbits << 1;
> > +
> > +    ret =3D rmw_hvip64(env, csrno, &rval, new_val,
> > +                     wr_mask & mask & vsip_writable_mask);
> >       if (ret_val) {
> > -        *ret_val =3D (rval & mask) >> 1;
> > +        rval &=3D mask;
> > +        vsbits =3D rval & VS_MODE_INTERRUPTS;
> > +        rval &=3D ~VS_MODE_INTERRUPTS;
> > +        *ret_val =3D rval | (vsbits >> 1);
> >       }
> >
> >       return ret;
> > @@ -3112,6 +3150,52 @@ static RISCVException write_hedeleg(CPURISCVStat=
e *env, int csrno,
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +static RISCVException rmw_hvien64(CPURISCVState *env, int csrno,
> > +                                    uint64_t *ret_val,
> > +                                    uint64_t new_val, uint64_t wr_mask=
)
> > +{
> > +    uint64_t mask =3D wr_mask & hvien_writable_mask;
> > +
> > +    if (ret_val) {
> > +        *ret_val =3D env->hvien;
> > +    }
> > +
> > +    env->hvien =3D (env->hvien & ~mask) | (new_val & mask);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException rmw_hvien(CPURISCVState *env, int csrno,
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_m=
ask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret =3D rmw_hvien64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val =3D rval;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_hvienh(CPURISCVState *env, int csrno,
> > +                                   target_ulong *ret_val,
> > +                                   target_ulong new_val, target_ulong =
wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret =3D rmw_hvien64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val =3D rval >> 32;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >   static RISCVException rmw_hideleg64(CPURISCVState *env, int csrno,
> >                                       uint64_t *ret_val,
> >                                       uint64_t new_val, uint64_t wr_mas=
k)
> > @@ -3157,16 +3241,94 @@ static RISCVException rmw_hidelegh(CPURISCVStat=
e *env, int csrno,
> >       return ret;
> >   }
> >
> > +/*
> > + * The function is written for two use-cases:
> > + * 1- To access hvip csr as is for HS-mode access.
> > + * 2- To access vsip as a combination of hvip, and mip for vs-mode.
> > + *
> > + * Both report bits 2, 6, 10 and 13:63.
> > + * vsip needs to be read-only zero when both hideleg[i] and
> > + * hvien[i] are zero.
> > + */
> >   static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
> >                                    uint64_t *ret_val,
> >                                    uint64_t new_val, uint64_t wr_mask)
> >   {
> >       RISCVException ret;
> > +    uint64_t old_hvip;
> > +    uint64_t ret_mip;
> > +
> > +    /*
> > +     * For bits 10, 6 and 2, vsip[i] is an alias of hip[i]. These bits=
 are
> > +     * present in hip, hvip and mip. Where mip[i] is alias of hip[i] a=
nd hvip[i]
> > +     * is OR'ed in hip[i] to inject virtual interrupts from hypervisor=
. These
> > +     * bits are actually being maintained in mip so we read them from =
there.
> > +     * This way we have a single source of truth and allows for easier
> > +     * implementation.
> > +     *
> > +     * For bits 13:63 we have:
> > +     *
> > +     * hideleg[i]  hvien[i]
> > +     *   0           0      No delegation. vsip[i] readonly zero.
> > +     *   0           1      vsip[i] is alias of hvip[i], sip bypassed.
> > +     *   1           X      vsip[i] is alias of sip[i], hvip bypassed.
> > +     *
> > +     *  alias_mask denotes the bits that come from sip (mip here given=
 we
> > +     *  maintain all bits there). nalias_mask denotes bits that come f=
rom
> > +     *  hvip.
> > +     */
> > +    uint64_t alias_mask =3D (env->hideleg | ~env->hvien) | VS_MODE_INT=
ERRUPTS;
> > +    uint64_t nalias_mask =3D (~env->hideleg & env->hvien);
> > +    uint64_t wr_mask_hvip;
> > +    uint64_t wr_mask_mip;
> > +
> > +    /*
> > +     * Both alias and non-alias mask remain same for vsip except:
> > +     *  1- For VS* bits if they are zero in hideleg.
> > +     *  2- For 13:63 bits if they are zero in both hideleg and hvien.
> > +     */
> > +    if (csrno =3D=3D CSR_VSIP) {
> > +        /* zero-out VS* bits that are not delegated to VS mode. */
> > +        alias_mask &=3D (env->hideleg | ~VS_MODE_INTERRUPTS);
> > +
> > +        /*
> > +         * zero-out 13:63 bits that are zero in both hideleg and hvien=
.
> > +         * nalias_mask mask can not contain any VS* bits so only secon=
d
> > +         * condition applies on it.
> > +         */
> > +        nalias_mask &=3D (env->hideleg | env->hvien);
> > +        alias_mask &=3D (env->hideleg | env->hvien);
> > +    }
> > +
> > +    wr_mask_hvip =3D wr_mask & nalias_mask & hvip_writable_mask;
> > +    wr_mask_mip =3D wr_mask & alias_mask & hvip_writable_mask;
> > +
> > +    /* Aliased bits, bits 10, 6, 2 need to come from mip. */
> > +    ret =3D rmw_mip64(env, csrno, &ret_mip, new_val, wr_mask_mip);
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> > +    old_hvip =3D env->hvip;
> > +
> > +    if (wr_mask_hvip) {
> > +        env->hvip =3D (env->hvip & ~wr_mask_hvip) | (new_val & wr_mask=
_hvip);
> > +
> > +        /*
> > +         * Given hvip is separate source from mip, we need to trigger =
interrupt
> > +         * from here separately. Normally this happen from riscv_cpu_u=
pdate_mip.
> > +         */
> > +        riscv_cpu_interrupt(env);
> > +    }
> >
> > -    ret =3D rmw_mip64(env, csrno, ret_val, new_val,
> > -                    wr_mask & hvip_writable_mask);
> >       if (ret_val) {
> > -        *ret_val &=3D VS_MODE_INTERRUPTS;
> > +        /* Only take VS* bits from mip. */
> > +        ret_mip &=3D alias_mask;
> > +
> > +        /* Take in non-delegated 13:63 bits from hvip. */
> > +        old_hvip &=3D nalias_mask;
> > +
> > +        *ret_val =3D ret_mip | old_hvip;
> >       }
> >
> >       return ret;
> > @@ -4527,14 +4689,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
> >                             .min_priv_ver =3D PRIV_VERSION_1_12_0      =
          },
> >
> >       /* Virtual Interrupts and Interrupt Priorities (H-extension with =
AIA) */
> > -    [CSR_HVIEN]       =3D { "hvien",       aia_hmode, read_zero, write=
_ignore },
> > +    [CSR_HVIEN]       =3D { "hvien",       aia_hmode, NULL, NULL, rmw_=
hvien },
> >       [CSR_HVICTL]      =3D { "hvictl",      aia_hmode, read_hvictl,
> >                             write_hvictl                               =
       },
> >       [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,
> >                             write_hviprio1                             =
       },
> >       [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,
> >                             write_hviprio2                             =
       },
> > -
> >       /*
> >        * VS-Level Window to Indirectly Accessed Registers (H-extension =
with AIA)
> >        */
> > @@ -4549,8 +4710,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
> >       /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) =
*/
> >       [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL,
> >                             rmw_hidelegh                               =
       },
> > -    [CSR_HVIENH]      =3D { "hvienh",      aia_hmode32, read_zero,
> > -                          write_ignore                                =
      },
> > +    [CSR_HVIENH]      =3D { "hvienh",      aia_hmode32, NULL, NULL, rm=
w_hvienh },
> >       [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL, r=
mw_hviph },
> >       [CSR_HVIPRIO1H]   =3D { "hviprio1h",   aia_hmode32, read_hviprio1=
h,
> >                             write_hviprio1h                            =
       },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index dd7bdbb691..3fff230a1c 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper =3D {
> >           VMSTATE_UINTTL(env.hgatp, RISCVCPU),
> >           VMSTATE_UINTTL(env.hgeie, RISCVCPU),
> >           VMSTATE_UINTTL(env.hgeip, RISCVCPU),
> > +        VMSTATE_UINT64(env.hvien, RISCVCPU),
> > +        VMSTATE_UINT64(env.hvip, RISCVCPU),
> >           VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> >           VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
> >
> > @@ -106,6 +108,7 @@ static const VMStateDescription vmstate_hyper =3D {
> >           VMSTATE_UINTTL(env.vstval, RISCVCPU),
> >           VMSTATE_UINTTL(env.vsatp, RISCVCPU),
> >           VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
> > +        VMSTATE_UINT64(env.vsie, RISCVCPU),
> >
> >           VMSTATE_UINTTL(env.mtval2, RISCVCPU),
> >           VMSTATE_UINTTL(env.mtinst, RISCVCPU),

