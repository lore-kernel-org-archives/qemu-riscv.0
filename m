Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE83EB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:35:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC9Dw-0002Xz-Fl; Wed, 21 Jun 2023 21:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9Du-0002XJ-Ux; Wed, 21 Jun 2023 21:34:58 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9Dr-0005dY-7t; Wed, 21 Jun 2023 21:34:58 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-784f7f7deddso2130821241.3; 
 Wed, 21 Jun 2023 18:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687397694; x=1689989694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3DPAyejqKUYY+NANkrdsXUcjGzxaSQbhyVr0OXxiy7M=;
 b=rdbSPFsDaMlea7bOsiURTdNiJkf2EbzXpuXCXPCywTt6LY3w5B7Br8YifPVK3Sc+UQ
 qulCNy2fsMYJ/Gsx3qmj2PSHQrFe+kY5OYqg2Es7PUdoyJ9MHDs39gdLlU5KCWs2PPWs
 iIIx5haKlMR5gKPaqjKFGKFduazoElw1c5/LPWCAi3tEbQDSOaAwHE1Ihs6AG9xWOXE2
 bLyxU/l8H2eDXtv/Ndnv4QzDY8VZwjKlg4DmaVYCCJthc0q27z/wox48uYpNoUjhgM3I
 5ig15R6SNeKmwUb4pV6P7wFGHDbxJqqmyHL17XRozbkfeBfQhRVg6Q/BzziEmsVDZ33V
 cG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687397694; x=1689989694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3DPAyejqKUYY+NANkrdsXUcjGzxaSQbhyVr0OXxiy7M=;
 b=U8iYxXINsIn58M9r77dSNKInY7ZKW7HN+fmq/qxNmj2MvRE6bO33F3N2f2sbcsvuPn
 +vZCY/xiOD3B2MfOsL/oT+qMpAlu10hvMVUmXaJYYuRIaxRns/+h3aqDOiB0hrJt3Gbq
 zczpJKis+gKtx8abZmlI3iQ2DTp5aFht5a+Sn8eCZYhcmnadrJn/VIboxBFNelR/IZ7x
 FSGXH4vUvoVXWYvH0+pfAZPCweWtz024Oq5OHUIRT65Yn2xwyehnKiDf6iprpZg4y85V
 DvDewzDB6M05xCM9u2QPdqXD+DDfN0D0Rb5H3W6jArNMC32Eu8f8u7pd6QrFEAJwE38M
 GQyw==
X-Gm-Message-State: AC+VfDyLHfgQuGuawACXmweV+Fadr6rZtKKbozwcyEg+YtIsfyeafotn
 Z9WufDED/0EkzUvtdiFP78sZX7SchZEgHpvUR1E=
X-Google-Smtp-Source: ACHHUZ7w/IU4TWh6wupJK5AtnVOhWmd3XkhC5SdKp5sMlaLzBeb8oeAnhr/gAwZriuIbjrQWCRQfmyoNKLENRsnNVFA=
X-Received: by 2002:a67:f746:0:b0:43f:ac81:a43a with SMTP id
 w6-20020a67f746000000b0043fac81a43amr8109883vso.25.1687397693644; Wed, 21 Jun
 2023 18:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230613205857.495165-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:34:27 +1000
Message-ID: <CAKmqyKNVb5mdvWJjNudmuEacbkArXnfWpaubJWJN_QeCF1JU8A@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] target/riscv/kvm.c: init 'misa_ext_mask' with
 scratch CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Wed, Jun 14, 2023 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment we're retrieving env->misa_ext during
> kvm_arch_init_cpu(), leaving env->misa_ext_mask behind.
>
> We want to set env->misa_ext_mask, and we want to set it as early as
> possible. The reason is that we're going to use it in the validation
> process of the KVM MISA properties we're going to add next. Setting it
> during arch_init_cpu() is too late for user validation.
>
> Move the code to a new helper that is going to be called during init()
> time, via kvm_riscv_init_user_properties(), like we're already doing for
> the machine ID properties. Set both misa_ext and misa_ext_mask to the
> same value retrieved by the 'isa' config reg.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 602727cdfd..4d0808cb9a 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -396,6 +396,28 @@ static void kvm_riscv_init_machine_ids(RISCVCPU *cpu=
, KVMScratchCPU *kvmcpu)
>      }
>  }
>
> +static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
> +                                         KVMScratchCPU *kvmcpu)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +
> +    reg.id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              KVM_REG_RISCV_CONFIG_REG(isa));
> +    reg.addr =3D (uint64_t)&env->misa_ext_mask;
> +    ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +
> +    if (ret) {
> +        error_report("Unable to fetch ISA register from KVM, "
> +                     "error %d", ret);
> +        kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    env->misa_ext =3D env->misa_ext_mask;
> +}
> +
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cpu_obj);
> @@ -406,6 +428,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>      }
>
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
> +    kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>
>      kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>  }
> @@ -525,21 +548,10 @@ static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, =
CPUState *cs)
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
>      int ret =3D 0;
> -    target_ulong isa;
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    uint64_t id;
>
>      qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
>
> -    id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> -                          KVM_REG_RISCV_CONFIG_REG(isa));
> -    ret =3D kvm_get_one_reg(cs, id, &isa);
> -    if (ret) {
> -        return ret;
> -    }
> -    env->misa_ext =3D isa;
> -
>      if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
>          ret =3D kvm_vcpu_set_machine_ids(cpu, cs);
>      }
> --
> 2.40.1
>
>

