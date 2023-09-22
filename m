Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F19EE7D0CE
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 06:09:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjZLd-0000fQ-EQ; Fri, 22 Sep 2023 02:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZLb-0000eX-GA; Fri, 22 Sep 2023 02:09:03 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZLZ-0004Dk-Pq; Fri, 22 Sep 2023 02:09:03 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7a50a1d1246so719842241.3; 
 Thu, 21 Sep 2023 23:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695362940; x=1695967740; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBLneNxOAvtpfozu5uMbazUpX/oS89zzQ07hqYthoMo=;
 b=JYP6oIcm0Iwiy1/+YWulazzr1aLyfns4RsgU47LHs42RpvlAL9g1/UMuJ8WDN4M0vg
 Yn5eefa8+AIEA1Bo4sN6Tpdcfno4l8eO6ACmwYuOIX3+s/2Bd0X+HgVBKMe8yvktlJXF
 Rb/AJtdAzJDNj6bgPmwewv/01TF406WR4AyFuDJKfr6YhrNWFia1o4Pb5LiH+kQO1QHQ
 jan8RzPsWHSTLq504z3lUPj0d8Wn/BaxUf6GjOu7RFPub3vLi8kwhk0GMQJA/i1HBiys
 c6Rvbliqs9v/fRcr2COv41MGPPA+K4jUuS9NuSlnKhRVqG2l00rK/Bvo87J3hTe/7vDs
 iRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695362940; x=1695967740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBLneNxOAvtpfozu5uMbazUpX/oS89zzQ07hqYthoMo=;
 b=rLc53CWhyY45gs40/hchsWw2jenFr+SR9ZY2j1qzjG3z1At8uQIVk8CNZFvcq4kXwj
 TYnbaEx4dclCt2QvesoidFAfCnpfQv9cv5Yb37eOrzMeEQ2n3mJfB7BRz02bkHpFcXDq
 vKxr+54ycip67jGG2smaoZRIzQ6wMHETsJ8Hyrvn3LC4NLbJ0Sqq2e4N9YAfmj1Rxo3m
 H2yYxZTQ4KALJY9Sk1h8gtHRBxMq32TbGXzjLKWlFUmE5hkMT/5I0oeIYBvNYa2H2Gj5
 VEh9LI8gU2TDzzDTsNUd3Jth3EwhRDA41r0s5WkGYOy8s2wkanaAIDDaG+w3C5iiyxPc
 qNRQ==
X-Gm-Message-State: AOJu0YyhFWgnZh7FpJPalm+vQ/zP0ltMqXhgFEzUE20Alo+Wc6pX6jXn
 k+40HRNyH8hGLM+mRScVPrHIWGDWPgCf3MX6b0Y=
X-Google-Smtp-Source: AGHT+IG8DB/K+tqwDkXxvM/I2OuJvq5xyiqZR7VPDbT3I+U5fLSCGtqjG/XaAkryUg2h+VmctFtcjILgxR/y/YA2p5A=
X-Received: by 2002:a67:eb16:0:b0:452:8ee0:659f with SMTP id
 a22-20020a67eb16000000b004528ee0659fmr7298323vso.28.1695362940186; Thu, 21
 Sep 2023 23:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 16:08:33 +1000
Message-ID: <CAKmqyKP-NhsnOMnqEnKHq6gKzWbyQ3tVCR_xRFHj3jq7QLU3HQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/19] target/riscv: introduce KVM AccelCPUClass
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, Sep 20, 2023 at 9:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a KVM accelerator class like we did with TCG. The difference is
> that, at least for now, we won't be using a realize() implementation for
> this accelerator.
>
> We'll start by assiging kvm_riscv_cpu_add_kvm_properties(), renamed to
> kvm_cpu_instance_init(), as a 'cpu_instance_init' implementation. Change
> riscv_cpu_post_init() to invoke accel_cpu_instance_init(), which will go
> through the 'cpu_instance_init' impl of the current acceleration (if
> available) and execute it. The end result is that the KVM initial setup,
> i.e. starting registers and adding its specific properties, will be done
> via this hook.
>
> Add a 'tcg_enabled()' condition in riscv_cpu_post_init() to avoid
> calling riscv_cpu_add_user_properties() when running KVM. We'll remove
> this condition when the TCG accel class get its own 'cpu_instance_init'
> implementation.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c       |  8 +++-----
>  target/riscv/kvm.c       | 26 ++++++++++++++++++++++++--
>  target/riscv/kvm_riscv.h |  1 -
>  3 files changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 50be127f36..c8a19be1af 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1219,7 +1219,9 @@ static bool riscv_cpu_has_user_properties(Object *c=
pu_obj)
>
>  static void riscv_cpu_post_init(Object *obj)
>  {
> -    if (riscv_cpu_has_user_properties(obj)) {
> +    accel_cpu_instance_init(CPU(obj));
> +
> +    if (tcg_enabled() && riscv_cpu_has_user_properties(obj)) {
>          riscv_cpu_add_user_properties(obj);
>      }
>
> @@ -1589,10 +1591,6 @@ static void riscv_cpu_add_multiext_prop_array(Obje=
ct *obj,
>  static void riscv_cpu_add_user_properties(Object *obj)
>  {
>  #ifndef CONFIG_USER_ONLY
> -    if (kvm_enabled()) {
> -        kvm_riscv_cpu_add_kvm_properties(obj);
> -        return;
> -    }
>      riscv_add_satp_mode_properties(obj);
>  #endif
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index e5e957121f..606fdab223 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -31,6 +31,7 @@
>  #include "sysemu/kvm_int.h"
>  #include "cpu.h"
>  #include "trace.h"
> +#include "hw/core/accel-cpu.h"
>  #include "hw/pci/pci.h"
>  #include "exec/memattrs.h"
>  #include "exec/address-spaces.h"
> @@ -1318,8 +1319,9 @@ void kvm_riscv_aia_create(MachineState *machine, ui=
nt64_t group_shift,
>      kvm_msi_via_irqfd_allowed =3D kvm_irqfds_enabled();
>  }
>
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> +static void kvm_cpu_instance_init(CPUState *cs)
>  {
> +    Object *obj =3D OBJECT(RISCV_CPU(cs));
>      DeviceState *dev =3D DEVICE(obj);
>
>      riscv_init_user_properties(obj);
> @@ -1331,7 +1333,7 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
>      riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_ext=
s);
>
>      for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
> -        /* Check if KVM created the property already */
> +        /* Check if we have a specific KVM handler for the option */
>          if (object_property_find(obj, prop->name)) {
>              continue;
>          }
> @@ -1339,6 +1341,26 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
>      }
>  }
>
> +static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc =3D ACCEL_CPU_CLASS(oc);
> +
> +    acc->cpu_instance_init =3D kvm_cpu_instance_init;
> +}
> +
> +static const TypeInfo kvm_cpu_accel_type_info =3D {
> +    .name =3D ACCEL_CPU_NAME("kvm"),
> +
> +    .parent =3D TYPE_ACCEL_CPU,
> +    .class_init =3D kvm_cpu_accel_class_init,
> +    .abstract =3D true,
> +};
> +static void kvm_cpu_accel_register_types(void)
> +{
> +    type_register_static(&kvm_cpu_accel_type_info);
> +}
> +type_init(kvm_cpu_accel_register_types);
> +
>  static void riscv_host_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index da9630c4af..8329cfab82 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -19,7 +19,6 @@
>  #ifndef QEMU_KVM_RISCV_H
>  #define QEMU_KVM_RISCV_H
>
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>  void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> --
> 2.41.0
>
>

