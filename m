Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6F5C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:30:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAfnS-0000NP-BC; Tue, 05 Dec 2023 19:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfnP-0000Mj-OU; Tue, 05 Dec 2023 19:29:47 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfnO-0001ZJ-35; Tue, 05 Dec 2023 19:29:47 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54d048550dfso1936619a12.0; 
 Tue, 05 Dec 2023 16:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701822583; x=1702427383; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29vaCTzsnUoSVjpgAeKT8u8cXEmHcytaL/KSpp4ab5M=;
 b=cjjFf/QHl0ZWoagB6qREb3XLP596qBcFd3iPLJv3trkxpSxD4cJEgEp8NmYS9BKfU5
 RUN2GDyRT6LTdKDAAwMoS5FVeYb+IdOYurddzVF2FlbpRM8vlOpyeS/Nx8ny2J7fGge6
 TLdSDNzVt0vDhR+4FbsklOtHp+lyGNzY8iOBK2847rOqNt6Zb1KtMA8kpxG6wpp5WeuZ
 r49fbJm7/U71GpyWHNlyZGs/kd6IaxIg47vP7qOmeWSjVq+AbJrUw+BXH+EXCnD2NLNo
 bQJMoFdfz46vON25sjJP0jUKZ71udNzuO+WZvCGP0IIQiTrhUIvf6GniFiGd3eoi8DWl
 lxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701822583; x=1702427383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29vaCTzsnUoSVjpgAeKT8u8cXEmHcytaL/KSpp4ab5M=;
 b=Gg9kzeUt1Ho9BE8uO4ufacYWfZ7nC90eT/92OpUvBCX13W/9mio8+Z8UUjFt8LRAdq
 Os6u56c/DNipHNGEGK0oQATC3yN7+FmySbQfiqrnvNaOOBv0iNnCGdEi7yIa8x20pCNW
 jRAc3Ya/khKKbShmx6KuEaxLlsRn/mR7SJaw6KBw3Ntyj1Nad37R8SiIv0y1bE05u0Dp
 0dAKftqHfkT7poSOtzM08uduyz0/7BKys47q7vphTPhGTkQoFIe4wFaAkAhJMX+rtrIN
 pcDXZtuiM5g01dLStSNjL9UADAw6WLk0/yhXeJ3F6jCk61IWlfacLql3M/JXVgZPEsUF
 Lg9Q==
X-Gm-Message-State: AOJu0Yw7VmzrUg7EFaZnw7KRck1GhUva9K+TRnBNjpJFVqRFvgAJ+mrD
 aHTE5lGeeG/57oW/U1uSmRktVc3SaX/V+CspmuHR/2g/UXW5vg==
X-Google-Smtp-Source: AGHT+IELcIbRZzSFGbh4IRGq0rmkO/WgPVCrAukVsYuFD1lmze3domMwwTc52qwvd0Ur/70t1xa8/yTqw0kD8mMwIrI=
X-Received: by 2002:a50:d602:0:b0:54c:dff9:98ce with SMTP id
 x2-20020a50d602000000b0054cdff998cemr54852edi.14.1701822582852; Tue, 05 Dec
 2023 16:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20231130182748.1894790-1-dbarboza@ventanamicro.com>
 <20231130182748.1894790-5-dbarboza@ventanamicro.com>
In-Reply-To: <20231130182748.1894790-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 10:29:15 +1000
Message-ID: <CAKmqyKMJMmoJj4fTqJMducewvfqdukbueyaenXLaTWcT1_ou4A@mail.gmail.com>
Subject: Re: [PATCH for-9.0 4/4] target/riscv/kvm: add RVV and Vector CSR regs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
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

On Fri, Dec 1, 2023 at 5:40=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add support for RVV and Vector CSR KVM regs vstart, vl and vtype.
>
> Support for vregs[] requires KVM side changes and an extra reg (vlenb)
> and will be added later.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 74 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 273c71baea..5408ead81c 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -89,6 +89,10 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, u=
int64_t type,
>
>  #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP=
_D, idx)
>
> +#define RISCV_VECTOR_CSR_REG(env, name) \
> +    kvm_riscv_reg_id(env, KVM_REG_RISCV_VECTOR, \
> +                     KVM_REG_RISCV_VECTOR_CSR_REG(name))
> +
>  #define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
>      do { \
>          int _ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg);=
 \
> @@ -142,6 +146,7 @@ static KVMCPUConfig kvm_misa_ext_cfgs[] =3D {
>      KVM_MISA_CFG(RVH, KVM_RISCV_ISA_EXT_H),
>      KVM_MISA_CFG(RVI, KVM_RISCV_ISA_EXT_I),
>      KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
> +    KVM_MISA_CFG(RVV, KVM_RISCV_ISA_EXT_V),
>  };
>
>  static void kvm_cpu_get_misa_ext_cfg(Object *obj, Visitor *v,
> @@ -688,6 +693,65 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
>      env->kvm_timer_dirty =3D false;
>  }
>
> +static int kvm_riscv_get_regs_vector(CPUState *cs)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
> +    target_ulong reg;
> +    int ret =3D 0;
> +
> +    if (!riscv_has_ext(env, RVV)) {
> +        return 0;
> +    }
> +
> +    ret =3D kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vstart), &reg)=
;
> +    if (ret) {
> +        return ret;
> +    }
> +    env->vstart =3D reg;
> +
> +    ret =3D kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vl), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->vl =3D reg;
> +
> +    ret =3D kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vtype), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->vtype =3D reg;
> +
> +    return 0;
> +}
> +
> +static int kvm_riscv_put_regs_vector(CPUState *cs)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
> +    target_ulong reg;
> +    int ret =3D 0;
> +
> +    if (!riscv_has_ext(env, RVV)) {
> +        return 0;
> +    }
> +
> +    reg =3D env->vstart;
> +    ret =3D kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vstart), &reg)=
;
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg =3D env->vl;
> +    ret =3D kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vl), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg =3D env->vtype;
> +    ret =3D kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vtype), &reg);
> +
> +    return ret;
> +}
> +
>  typedef struct KVMScratchCPU {
>      int kvmfd;
>      int vmfd;
> @@ -989,6 +1053,11 @@ int kvm_arch_get_registers(CPUState *cs)
>          return ret;
>      }
>
> +    ret =3D kvm_riscv_get_regs_vector(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      return ret;
>  }
>
> @@ -1029,6 +1098,11 @@ int kvm_arch_put_registers(CPUState *cs, int level=
)
>          return ret;
>      }
>
> +    ret =3D kvm_riscv_put_regs_vector(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      if (KVM_PUT_RESET_STATE =3D=3D level) {
>          RISCVCPU *cpu =3D RISCV_CPU(cs);
>          if (cs->cpu_index =3D=3D 0) {
> --
> 2.41.0
>
>

