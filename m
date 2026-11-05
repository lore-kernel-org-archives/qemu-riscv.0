Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE9606A6F7
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 19:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDLZRh4x
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP3YC-0001ZL-P6; Thu, 05 Nov 2026 14:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP3YA-0001Yc-Dk
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:55:06 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP3Y5-0002uq-Gp
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:55:04 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6b56c3677f8so2275959a12.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 11:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908499; cv=none;
 d=google.com; s=arc-20260327;
 b=QOxFLmdGps/hk3evCMwhgAfRCkDlhhqKmbtzQatkUNknOExI9OZx7JCo1zE4jlmRwQ
 kuO0YTh5mbk7pEgTmKtlcQmVFlclvDUpELkhUWq36TCWvcjr8Ah114tiXbPTwFTjZErZ
 swrEDr3nTAeN4SrknmVnYP4mV5fTZq6mRCwO7ns/xjxE8udKqXtKVjzDpZPnvyNAypem
 zEpgFooFr1AJA73aBpRPxJYiqxuiqL5faAiLr0ZN/BLFTiANCIEbSOycYlIG9H19NR4D
 jD63yq9IKlDIlpggQLWZ65s5AmqBL2QdX4m7Sg2hqy0BfHPT5gsdcvmUqX7W9gSXjdJB
 sSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=DUQ/OhW23DadLrLQG6cnt0jAQnuavW/fvwkL6ALX/24=;
 fh=CJlPv4uHGCP//DEJ347yUpDe1CVwLiZKg9FT3klSyHk=;
 b=Yt/alVlZ01PCHUHIDKoi4kQTbRMQb6HY+ED+HYovRuQNtNEWjGknUQK/+vP0x/yh4R
 1sMlsqQruLwpKYuvaquhfKPwXBTu7BGoDW7rm4NQpc1UvBNV9NfK99Zrigk2S/ee5xkd
 JcldnXhE/dI80tfFtuPrvZEiQ5mS2UNee3kstfURZLVoNjrBE2rgtsLUm9yL60A9vkNg
 uy7lV4PT7n5rCzm65PyKes3TmvMtdbZSKfbqpN0twCwjsMgVNrBwPt+Y+nlDfI/FBKVF
 D7HOj/pKsVg4qZRD4tkg2NdZPvfpYK9RvwqQFl4rVN7prxmq4q+2JajJpLhrQH58SE7e
 t89A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793908499; x=1794513299; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DUQ/OhW23DadLrLQG6cnt0jAQnuavW/fvwkL6ALX/24=;
 b=NDLZRh4xJ6s6hmTXXZPuDryd9l9nwQL1U1GO9YbCuStfLNminqrx/jUhL89lG+Mkjw
 QDNbn/Q/k9LzrzL2Vqi1tyIhfPe3++OY1duOi6aav3dxWCyM2XTYtOY39xlopB9N8CkI
 vfabcjd9IXbjCinIGNmgj4bnv0PNPfPkqU3XsKBSXb4U3mw05jzCyIgpWLDvXWKjsefI
 /OJMNaTTtcu/+67qZWJmypMPLdXLPaoNTLvtSHbCNcyDLpQn3+ws8QINA00Rcb0IeT5y
 emiIxzCrurIoVd5kFupf2dfro8Ezee5INWFGHlJd79/7rqVn6e6Mi1Zgf2xgWzrykhPd
 G1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793908499; x=1794513299;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DUQ/OhW23DadLrLQG6cnt0jAQnuavW/fvwkL6ALX/24=;
 b=0RuTnADkZ1wviWSzu/Pl+4iUDGZmxKnXJLI0VcxKIZN7iPDVfA2ONPqQPGpr7YfNid
 OUy28icDIue5uDh1aYbrZ5nJUSdrjYqyow3BISGhCN+hGV5ZBepnwGnalByXehtDdtSE
 izZFmosnLqoPmG2LaeNUBO/LDK4PHxAMPnKy82ofx1pG1ww7ZndoKelOvFt6ExebC0zn
 laNOvuXg1+mnirOKR4dmi0YHhnAbN0gk8UuNgIMi89i1A7sbVNi1PiAE99Smu+HdknA3
 RNgYMogu67gtee6zh+8ujGgrRL5JsCV46fUK9p8RZXGZB0lqXEqfB0aNE+bbPUI/yBVs
 uZkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXBlbWXyAorg0qauuZNmBPZnrZ9RmGFGbwvNwPrbgjhSkX/+QyF0PTbH7GC/jc63eTNQiVs3nx0a7C@nongnu.org
X-Gm-Message-State: APuU4Z/2xg5IGT0HGa6bLM4SkZdqPAdfuXzxscbrFMNCdp48f1A4sV5Q
 YipxtZOR5sENK1l9l4SZonL0jiYnhq0U22L7NsPL9nDgwF4rsa0MH1zXp4YW2gSyhp0/M4MZZHF
 NEi+l4uqvgLksrXXBCwSX9brIb/f0xe4=
X-Gm-Gg: AYBFou3EeFpvRvFK6LXAxsKETSUYWRx7brMhkIUxYYQ4aqHzrwBZwolpsDxSvusHmZ2
 GkfX5oynIADEg9Q3ySijvEX+2gdUc5jy1zEKhcpa8xJF1+LxcrVu5+KPvbzzL5jgk1rsehkjE86
 24ANi4CUVxSkDMmu6CpHBOQcnTRm20ijcWEP3uiNv0nDnvSzgkVWi/dQLf1eUZDCSz55bjyoteL
 uUzlvyQhaqGKswoU2f6HMXOindh1YZtw+97HY/jCW8x9UbEAcB4syoqD/bUAP0aloIFw6maZ3ol
 jAsECHsS46sUHmRuqDF0yGl4nf5JYIhbgPqyXgkfjoiSHk1EHPuv5IZyIYKI5FVlvSp1f5Qz4PO
 33ssGnJEL91CsPinbUXjFwEcMCeTbrl6oXhhlyO+AOV2FOfu2kmAVxLQuwQ==
X-Received: by 2002:a05:6402:440b:b0:6b5:64b3:82d7 with SMTP id
 4fb4d7f45d1cf-6b59753c6fbmr232220a12.2.1793908498809; Thu, 05 Nov 2026
 11:54:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105183310.1614-1-luoyonggang@gmail.com>
 <20261105183310.1614-2-luoyonggang@gmail.com>
 <b9474466-d91a-413c-bedd-a976b8cfa31c@oss.qualcomm.com>
In-Reply-To: <b9474466-d91a-413c-bedd-a976b8cfa31c@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 6 Nov 2026 03:54:46 +0800
X-Gm-Features: AclHuK9MWRTpDRj-khNWrUXphmeIk7y6Z9Kj-oMyYwMkWuDmnNkC5Hjco2o3BAY
Message-ID: <CAE2XoE9KGLcegO5fONsnNd5ct-2V=AiuxGocrJ1XCMmymw4tOg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] accel: register CPU parent only for AccelCPU
 subclasses
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Glenn Miles <milesg@linux.ibm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x534.google.com
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

On Fri, Nov 6, 2026 at 3:42=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 11/5/2026 10:33 AM, Yonggang Luo wrote:
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
> > test-multi-target checks the parent only for the CPU types that
> > register it.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  accel/accel-common.c           |  6 ++----
> >  include/accel/accel-cpu.h      |  2 ++
> >  target/arm/cpu.c               |  2 ++
> >  target/i386/cpu.c              |  2 ++
> >  target/ppc/cpu_init.c          |  2 ++
> >  target/riscv/cpu.c             |  8 ++++++++
> >  tests/unit/test-multi-target.c | 25 +++++++++++++++++++++++++
> >  7 files changed, 43 insertions(+), 4 deletions(-)
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
> > -
> > -type_init(register_accel_target_type);
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
>
> This looks good to me.
>
> > +type_init(riscv_accel_cpu_register_type)
> > diff --git a/tests/unit/test-multi-target.c b/tests/unit/test-multi-tar=
get.c
> > index c7559827a0..fd44cf74ca 100644
> > --- a/tests/unit/test-multi-target.c
> > +++ b/tests/unit/test-multi-target.c
> > @@ -30,6 +30,28 @@
> >  /* stub for system/main.c */
> >  int (*qemu_main)(void);
> >
> > +static void test_accel_cpu_parent(const TargetInfo *ti)
> > +{
> > +    static const char * const needed[] =3D {
> > +        "arm-cpu",
> > +        "i386-cpu",
> > +        "powerpc-cpu",
> > +        "powerpc64-cpu",
> > +        "riscv-cpu",
> > +        "x86_64-cpu",
> > +    };
> > +    size_t i;
> > +    g_autofree char *name =3D NULL;
> > +
> > +    for (i =3D 0; i < ARRAY_SIZE(needed); i++) {
> > +        if (g_str_equal(ti->cpu_type, needed[i])) {
> > +            name =3D g_strconcat("accel-", ti->cpu_type, NULL);
> > +            g_assert_nonnull(object_class_by_name(name));
> > +            return;
> > +        }
> > +    }
> > +}
> > +
> >  static void test_qom_types_are_unique(const void *data)
> >  {
> >      const TargetInfo *ti =3D data;
> > @@ -49,6 +71,9 @@ static void test_qom_types_are_unique(const void *dat=
a)
> >      module_call_init(MODULE_INIT_QOM);
> >      /* trigger type_initialize for all types */
> >      object_class_get_list("", false);
> > +
> > +    /* Accel parent lookup depends on the QOM types above being unique=
. */
> > +    test_accel_cpu_parent(ti);
> >  }
> >
> >  int main(int argc, char **argv)
>
> This is not needed. When those targets will be added, it will already be
> tested by the existing logic instantiating all QOM types.
> That's fine to not cover that for i386/ppc until they are not part of
> multi target.

So we have no need to add tests for it, I'll drop it in the new version?


>
> Thanks,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

