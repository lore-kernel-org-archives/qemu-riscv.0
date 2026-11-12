Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BED606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTtEQUXQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRWRt-0002k2-IF; Thu, 12 Nov 2026 10:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xRWRV-0002Gp-D4
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 10:10:25 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xRWRK-0000qa-RU
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 10:10:19 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b429f71dbeso4921673a12.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 07:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496213; cv=none;
 d=google.com; s=arc-20260327;
 b=Ql5WflaDVVfPjlfCVuu/DpQyMaOOqeXDE0d9K0z6SoElqAyUdYLWG++TjfyQH4w4cK
 HPY1G2JhqdhUIJ6kGLryR2i1x2pq9DF3OYr/1KnpPGfHrKci3UdUIdjTJAgXXClFamzO
 EkAGPe6MX5ictQ8Yw9N0HbUI9z3hQaIIP/8hyeYi16f6EzMg0/MoQuxDy2/qHDJINt8t
 sf6eU1SzyrsiqN+PN/+93hzWB/1fLXOgEEAktFPnyYUktDRUEhW60iKiHHNEWWwoV9Bq
 F0SmEvSROAfjDJph7lpK0eobwvdql09NTQhqv+EesZIkLzw+a672EMDpqnFyQ1rpYyCm
 Nt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=k2+sEYHQGql+U6aTE3FKi6NKQHyu7BG1f3pvuEkm4F8=;
 fh=3R2o4c9170pHjJ/nE+WnNIiFr1ZuolOKsD17AKehHsI=;
 b=TEHpACOr1Zmi70PT8Jnp3uF/yZB/vayPq+cNZ8naYrqTmX+KwacVaOXUIkm550MVTd
 OA1OC4l4xz1McUmmkVCthY/upQIPggC4l8H/L/mR4zwMClNszejx156AnpHdQdl+mOJJ
 vUa/VjUV/2H1cVlevlPIIENNkhZeRU1n4H8WyFSn/ZJOQMuBgvEV+J0gnGqet+7sVUjx
 rL6bgc3RSPDA7ImB9Q9QNFco73vIm5fWbyTUzeS7YamQcgyqG8Khhno7H7aeysO6msU4
 t0BuFRpzZFUQ9sxsiVfy/9DJGGyj2sSWYuycll+1aPQod1Alrg6c6MfxNYC9rDdphRoi
 kjow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794496213; x=1795101013; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=k2+sEYHQGql+U6aTE3FKi6NKQHyu7BG1f3pvuEkm4F8=;
 b=eTtEQUXQzzSjOhMqnRW8PHdsg8glgoAlQTLBCO6yn5YZuTgmfgiXooJ32IKw2BZ+qx
 osJiYJKmV8HJvuIsbLlVo3Q/G+zoFYZ0woS6QIHnduf1P/qfokCyzDTMg6gTveyK4fvU
 cNGU49G5hZdcCF0mW6k63nFLUkBZ0MbCJEPKFcpFOFoXUzD8asJT8Q5jpDQXp8SfVNvk
 YyZqJz3tqhSPaXhQrz72KHj7XGKJTkWyHfCx9SRdq6M0y4vK6yTPhVf4pXG6TulThlli
 ixYVdlJw+lJGNQPYlDXms9HL2iD6AlcNNQoBk+LTkBFw4Pr0/pdUA6+zLwKQq/p8FdHu
 U0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794496213; x=1795101013;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=k2+sEYHQGql+U6aTE3FKi6NKQHyu7BG1f3pvuEkm4F8=;
 b=WFL5tbQtaSeqh7MLvj0lkQc/OKn7olwHnE+GgRcgfnxdxaBifE/yfO2MeO/TV/KAvG
 zWgaRc0NK+uoEGsRdAkIiLjVft0oXmpv4jAjxc1FVFFdObqSYOI2MjYIPxft/578Ujgr
 /JhiKslkT2ZHT/9xDPHYdzKtl9ONrRo8CBtZIrEUmjn/u/zGGjQxpbd2C1YViw1jJ5Wp
 21MutiMam/5ul3ljNOSjR5SqWSw2yd4MUSd68zjsIcfgQHsQVf9cwHo2cLtJ42PdmirC
 h8UxUBhvepQ+4GzMkhVeivUNs/3BgbG9oCm6oWM9gx+SK/cD9kVzFvg6NC6d3mve46Do
 YVVg==
X-Forwarded-Encrypted: i=1;
 AL+hErGgClQ6Y9Bmpq0MpMBfU59rcojaYjnUsZRDq3Q7LDcE3VWcMwRdf0ofFCdAHKcPtJNT4rWdMoXJb8D+@nongnu.org
X-Gm-Message-State: APuU4Z/yamXoPxE/6PZWowsAOSkFHjgFWRp3DhCb23hepslCnh+EWS/2
 iXP5tvz+MXafFKfPWwgg8WNgnRnqAQIeRYf47ay2EmPF38rgGq6nWnt6ASY3PmhI7nbftdgTX1B
 pwZX5xNx6KmtWypC8u4niDJ8tBsI6HnY=
X-Gm-Gg: AYBFou3l+oucp1/nF23Gb3kDsps69bPnYc/1NeqsrgniQqVLVccqnDDhqzBsQc8p+Zv
 DWRQ7d91b+GhsTTlcbgS0I9pH+rXFrtRZwMNF4Fv/qsX/HbjQ96CHHfKqjKtlA4XVruTKQQiRIu
 aXLeGotq2WoyPb7HNWVscuJ/PWkmRGnAmcmbJp7jEt0OTFpI8TuS8/LCk72M/aoTqJypRknvl00
 YSwMfTNjIJQJ2Mx+KnFWkP39+WTTeqCAPLpBvdygXoKa7BoIvO/xPmzA0xccatanw5tOmdw4miY
 /UvM4BIj5AIjUoZ6e+IGACmxDPBRGmiie1cm3aJrOVM7v4mb0OCECXJA4ATW8wyEGAwWk72EOlK
 ADsx8/MAy6qLTsK4edFG/qS+S7S34qEAb6b3w
X-Received: by 2002:a05:6402:c714:10b0:6b6:ee00:aed9 with SMTP id
 4fb4d7f45d1cf-6b777852cd5mr3130288a12.44.1794496212613; Thu, 12 Nov 2026
 07:10:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106023936.772-1-luoyonggang@gmail.com>
 <20261106023936.772-2-luoyonggang@gmail.com>
 <avXCZ6IxBXWEuugm@redhat.com>
In-Reply-To: <avXCZ6IxBXWEuugm@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 12 Nov 2026 23:09:59 +0800
X-Gm-Features: AclHuK8zx48gvNZacwMEyoMqy6tiJnU5RrHg_R4wHWLBJQ7Fo_HS6qalBRB4L8w
Message-ID: <CAE2XoE-snYamK4sAxDvheS8zq1U-fPTZNN5b7Ls+arPUcPgZbw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] accel: register CPU parent only for AccelCPU
 subclasses
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Chao Liu <chao.liu@processmission.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 9:43=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Fri, Nov 06, 2026 at 10:39:33AM +0800, Yonggang Luo wrote:
> > accel_cpu_register_type() creates the abstract parent
> > accel-<cpu type>. A subclass names that parent, and
> > type_initialize() aborts when the parent is missing. The old
> > type_init registered only target_cpu_type(), which is one name
> > in a multi-target process. Call the helper from the CPU type
> > init of each target that has an AccelCPU subclass.
> >
> > ARM calls it because whpx-common.c parents accel-arm-cpu on
> > aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
> > MSHV. i386-softmmu and x86_64-softmmu each pass their own
> > CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
> > accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
> > calls it for KVM.
> >
> > Other targets have no AccelCPU subclass. Machine init looks up
> > tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
> > class, so those targets do not need the parent.
> >
> > No extra tests is needed, as these QOM types already be
> > tested by the existing logic instantiating all QOM types.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  accel/accel-common.c      | 6 ++----
> >  include/accel/accel-cpu.h | 2 ++
> >  target/arm/cpu.c          | 2 ++
> >  target/i386/cpu.c         | 2 ++
> >  target/ppc/cpu_init.c     | 2 ++
> >  target/riscv/cpu.c        | 8 ++++++++
> >  6 files changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/accel/accel-common.c b/accel/accel-common.c
> > index 00a400243f..441d1b77fa 100644
> > --- a/accel/accel-common.c
> > +++ b/accel/accel-common.c
> > @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] =3D {
> >
> >  DEFINE_TYPES(accel_types)
> >
> > -static void register_accel_target_type(void)
> > +void accel_cpu_register_type(const char *cpu_type)
> >  {
> > -    g_autofree char *name =3D g_strconcat("accel-", target_cpu_type(),=
 NULL);
> > +    g_autofree char *name =3D g_strconcat("accel-", cpu_type, NULL);
> >      const TypeInfo accel_cpu_type =3D {
> >          .name =3D name,
> >          .parent =3D TYPE_OBJECT,
> > @@ -142,5 +142,3 @@ static void register_accel_target_type(void)
> >
> >      type_register_static(&accel_cpu_type);
> >  }
>
> Is there a reason why we need to register this base class
> repeatedly for each target ? This class is defined in target
> independent code and the target specific behaviour is provided
> by subclasses AFAICT, so I'm not seeing why we need to
> duplicate the class per target.
>
> I just proposed changing its name to "accel-cpu" so that
> it is always available:


Yeap, this is my first choice:

https://lore.kernel.org/qemu-devel/20260823150731.896-2-luoyonggang@gmail.c=
om/#r

If there is no strong objection, I like this.

>
>   https://lists.gnu.org/archive/html/qemu-devel/2026-11/msg02741.html
>
> > diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
> > index 9e7eede7c3..2fdb64d2ae 100644
> > --- a/include/accel/accel-cpu.h
> > +++ b/include/accel/accel-cpu.h
> > @@ -20,4 +20,6 @@ typedef struct AccelCPUClass {
> >      bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
> >  } AccelCPUClass;
> >
> > +void accel_cpu_register_type(const char *cpu_type);
> > +
> >  #endif /* ACCEL_CPU_H */
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 71681447b2..725f1f3a5f 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -28,6 +28,7 @@
> >  #include "qemu/module.h"
> >  #include "qapi/error.h"
> >  #include "cpu.h"
> > +#include "accel/accel-cpu.h"
> >  #ifdef CONFIG_TCG
> >  #include "exec/translation-block.h"
> >  #include "accel/tcg/cpu-ops.h"
> > @@ -2753,6 +2754,7 @@ static const TypeInfo arm_cpu_type_info =3D {
> >
> >  static void arm_cpu_register_types(void)
> >  {
> > +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
> >      type_register_static(&arm_cpu_type_info);
> >  }
> >
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index eab0d5a4d4..31b09e6f8e 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -23,6 +23,7 @@
> >  #include "qemu/qemu-print.h"
> >  #include "qemu/hw-version.h"
> >  #include "cpu.h"
> > +#include "accel/accel-cpu.h"
> >  #include "tcg/helper-tcg.h"
> >  #include "exec/translation-block.h"
> >  #include "system/hvf.h"
> > @@ -11093,6 +11094,7 @@ static void x86_cpu_register_types(void)
> >  {
> >      int i;
> >
> > +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
> >      type_register_static(&x86_cpu_type_info);
> >      for (i =3D 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
> >          x86_register_cpudef_types(&builtin_x86_defs[i]);
> > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > index 7f3036d903..fe3f2549b7 100644
> > --- a/target/ppc/cpu_init.c
> > +++ b/target/ppc/cpu_init.c
> > @@ -43,6 +43,7 @@
> >  #include "exec/page-protection.h"
> >  #include "exec/watchpoint.h"
> >  #include "helper_regs.h"
> > +#include "accel/accel-cpu.h"
> >  #include "internal.h"
> >  #include "spr_common.h"
> >  #include "power8-pmu.h"
> > @@ -7589,6 +7590,7 @@ static const TypeInfo ppc_vhyp_type_info =3D {
> >
> >  static void ppc_cpu_register_types(void)
> >  {
> > +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
> >      type_register_static(&ppc_cpu_type_info);
> >  #ifndef CONFIG_USER_ONLY
> >      type_register_static(&ppc_vhyp_type_info);
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 362e561809..10e24f20e8 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -25,6 +25,7 @@
> >  #include "qemu/guest-random.h"
> >  #include "qemu/atomic.h"
> >  #include "cpu.h"
> > +#include "accel/accel-cpu.h"
> >  #include "cpu_vendorid.h"
> >  #include "target/riscv/tcg/csr.h"
> >  #include "internals.h"
> > @@ -3931,3 +3932,10 @@ static const TypeInfo riscv_cpu_type_infos[] =3D=
 {
> >  };
> >
> >  DEFINE_TYPES(riscv_cpu_type_infos)
> > +
> > +static void riscv_accel_cpu_register_type(void)
> > +{
> > +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
> > +}
> > +
> > +type_init(riscv_accel_cpu_register_type)
> > --
> > 2.55.0.windows.3
> >
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

