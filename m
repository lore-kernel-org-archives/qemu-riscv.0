Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B0C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 04:01:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Yjo-0001gS-Lr; Mon, 12 Jun 2023 00:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YjL-0001b7-FX; Mon, 12 Jun 2023 00:00:39 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YjC-0005LG-NR; Mon, 12 Jun 2023 00:00:34 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-466021212d0so3016493e0c.1; 
 Sun, 11 Jun 2023 21:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686542424; x=1689134424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpT4EWI4EiNykgA/vEVveYwpcmcVUDfXaC1NjO7gkDk=;
 b=IQQ8/lARQfVFiGwhBheoKewUgG9LBdyqW1lupoMYzJdtok7dK1TLMtMlfz+QYlgel4
 vUSCrS/wZ+tCK6p5Wch/GppQSxD+Ka6umhd+/MjLNdSZPBbFlp8ZxAu/SxjFvelq7VWa
 ogZ8D3+cog6G2+xtwJh2TUPxlxlCyb1Vyn1TO62N6lu+IPdspyf9PfjClh/IdFvZx1wO
 V1hrawxR/T3yQlx19OjxWnly9RHDuFFIVBzJ8j6g0ZqzaNUM5mx9TJeK7zxobsZADfNW
 5ojS1or5+V5c0LCfK6bTL3XXz1im5Z0RjB4/C/SNAXOSUXlsRU9iohtMb8RBy4Yo3IMA
 uW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686542424; x=1689134424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpT4EWI4EiNykgA/vEVveYwpcmcVUDfXaC1NjO7gkDk=;
 b=htMzQKHCymzF8I0iqu2rjcOq+EI9u0XDUQVo8iXj7KcnoFmNDL21AlLmAxvko8rMXD
 u1Nz4Ma/Q0VxuC5AyTbl5Ay+GL2KlT+tlcGzvbBbbzhSf+Q5iZKVjsN+xLrYgLPJ+X0h
 jU7kRUlTbY70vU7xYLdoJonxLv7cSnQVIITboGosm480a7zmZenJZG2sXazr0Iphsjof
 HAy0cZ0whdvZYOneBboyCIzNKLSpgbbdjdLeeBS2YEDuV46zpSjIxE98arHYVuTnDwHU
 xo8sHQiEkz2O/5q4mgb0yL/M43vNIYXEFA2cFySgHzVkDed3c94v9MnV+1ptJc2bjrCJ
 uLNg==
X-Gm-Message-State: AC+VfDwb3Y+IJdmF4nUtsvHChkFg9sl8ukIBMf+WQ6TONwfLqy0MO4gF
 fAFnGOO/qHbFg55u55kWE1KjfEo6wpFSZ3Kzoxyv7h9cFWU=
X-Google-Smtp-Source: ACHHUZ45pf5xaXWCauFX0bM8+hMQSHB4D6Qdu9D2OT8drr0t9OYZmNGOxA+EpKuWwl5sRfCepnmz+K3A1qy5UB0bCGY=
X-Received: by 2002:a05:6122:c52:b0:446:b903:d76c with SMTP id
 i18-20020a0561220c5200b00446b903d76cmr3127401vkr.5.1686542424095; Sun, 11 Jun
 2023 21:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230530194623.272652-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:59:58 +1000
Message-ID: <CAKmqyKPn7Q8ERnZjrB0uo4NMc-82pnKqjGt=dGKEVcu2H2ZSgQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] target/riscv: use KVM scratch CPUs to init KVM
 properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, May 31, 2023 at 5:50=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Certain validations, such as the validations done for the machine IDs
> (mvendorid/marchid/mimpid), are done before starting the CPU.
> Non-dynamic (named) CPUs tries to match user input with a preset
> default. As it is today we can't prefetch a KVM default for these cases
> because we're only able to read/write KVM regs after the vcpu is
> spinning.
>
> Our target/arm friends use a concept called "scratch CPU", which
> consists of creating a vcpu for doing queries and validations and so on,
> which is discarded shortly after use [1]. This is a suitable solution
> for what we need so let's implement it in target/riscv as well.
>
> kvm_riscv_init_machine_ids() will be used to do any pre-launch setup for
> KVM CPUs, via riscv_cpu_add_user_properties(). The function will create
> a KVM scratch CPU, fetch KVM regs that work as default values for user
> properties, and then discard the scratch CPU afterwards.
>
> We're starting by initializing 'mvendorid'. This concept will be used to
> init other KVM specific properties in the next patches as well.
>
> [1] target/arm/kvm.c, kvm_arm_create_scratch_host_vcpu()
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c       |  4 ++
>  target/riscv/kvm.c       | 85 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  3 files changed, 90 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d6e23bfd83..749d8bf5eb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1703,6 +1703,10 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>      Property *prop;
>      DeviceState *dev =3D DEVICE(obj);
>
> +    if (riscv_running_KVM()) {
> +        kvm_riscv_init_user_properties(obj);
> +    }
> +
>      riscv_cpu_add_misa_properties(obj);
>
>      for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0f932a5b96..37f0f70794 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -309,6 +309,91 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
>      env->kvm_timer_dirty =3D false;
>  }
>
> +typedef struct KVMScratchCPU {
> +    int kvmfd;
> +    int vmfd;
> +    int cpufd;
> +} KVMScratchCPU;
> +
> +/*
> + * Heavily inspired by kvm_arm_create_scratch_host_vcpu()
> + * from target/arm/kvm.c.
> + */
> +static bool kvm_riscv_create_scratch_vcpu(KVMScratchCPU *scratch)
> +{
> +    int kvmfd =3D -1, vmfd =3D -1, cpufd =3D -1;
> +
> +    kvmfd =3D qemu_open_old("/dev/kvm", O_RDWR);
> +    if (kvmfd < 0) {
> +        goto err;
> +    }
> +    do {
> +        vmfd =3D ioctl(kvmfd, KVM_CREATE_VM, 0);
> +    } while (vmfd =3D=3D -1 && errno =3D=3D EINTR);
> +    if (vmfd < 0) {
> +        goto err;
> +    }
> +    cpufd =3D ioctl(vmfd, KVM_CREATE_VCPU, 0);
> +    if (cpufd < 0) {
> +        goto err;
> +    }
> +
> +    scratch->kvmfd =3D  kvmfd;
> +    scratch->vmfd =3D vmfd;
> +    scratch->cpufd =3D cpufd;
> +
> +    return true;
> +
> + err:
> +    if (cpufd >=3D 0) {
> +        close(cpufd);
> +    }
> +    if (vmfd >=3D 0) {
> +        close(vmfd);
> +    }
> +    if (kvmfd >=3D 0) {
> +        close(kvmfd);
> +    }
> +
> +    return false;
> +}
> +
> +static void kvm_riscv_destroy_scratch_vcpu(KVMScratchCPU *scratch)
> +{
> +    close(scratch->cpufd);
> +    close(scratch->vmfd);
> +    close(scratch->kvmfd);
> +}
> +
> +static void kvm_riscv_init_machine_ids(RISCVCPU *cpu, KVMScratchCPU *kvm=
cpu)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +
> +    reg.id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              KVM_REG_RISCV_CONFIG_REG(mvendorid));
> +    reg.addr =3D (uint64_t)&cpu->cfg.mvendorid;
> +    ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret !=3D 0) {
> +        error_report("Unable to retrieve mvendorid from host, error %d",=
 ret);
> +    }
> +}
> +
> +void kvm_riscv_init_user_properties(Object *cpu_obj)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cpu_obj);
> +    KVMScratchCPU kvmcpu;
> +
> +    if (!kvm_riscv_create_scratch_vcpu(&kvmcpu)) {
> +        return;
> +    }
> +
> +    kvm_riscv_init_machine_ids(cpu, &kvmcpu);
> +
> +    kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
> +}
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
>      KVM_CAP_LAST_INFO
>  };
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index ed281bdce0..e3ba935808 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -19,6 +19,7 @@
>  #ifndef QEMU_KVM_RISCV_H
>  #define QEMU_KVM_RISCV_H
>
> +void kvm_riscv_init_user_properties(Object *cpu_obj);
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>
> --
> 2.40.1
>
>

