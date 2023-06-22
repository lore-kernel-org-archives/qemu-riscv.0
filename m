Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562D8EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC8wi-0007qm-R7; Wed, 21 Jun 2023 21:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8wg-0007pz-Fw; Wed, 21 Jun 2023 21:17:10 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8we-0002Tc-QU; Wed, 21 Jun 2023 21:17:10 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-78cdb90aa66so2462790241.3; 
 Wed, 21 Jun 2023 18:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687396627; x=1689988627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pvqtfrpc9QM+ZatjoVr+jdhtEyqjughpXYQd21AS0k0=;
 b=EesYqPVtOeVBXDJ06yn19VhuG1lP5Po7uiz+QWRx6JftzlLzYaGgbjv/tMqWjXyN13
 tM5ltMWiNv5L0DCzbs/MfqbLc4H4IgxxJA5PbCNrLUZm1/Lo4kOM/EEXMzck1ilw9kwK
 2vKNWKDgXRQS5nXfBoedGI9nMXS7etJwHCH/VetAMoyo+3vg5RTmYy5xaQcpb2WM2XWY
 OILqxQU+UVEPGKvQMR4zT/jvkQ+qAhHSFr5Xr9Q9iZVQUtaeLX3f98cGoOIjQEinigUc
 au46Zx3+aTOZwFgSEXbFfCqiVetcbeWNyA6ShcAAwlzHNLUD++7jSQZrqLP4AX/TYbI6
 sr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687396627; x=1689988627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pvqtfrpc9QM+ZatjoVr+jdhtEyqjughpXYQd21AS0k0=;
 b=GGjtIbFvvxkiUDf0NobZ2gYOsL1SIX06LZ3BDWgJ3wr7NSv0zkdVZFHC8RJuIjQlIC
 Sf/g4DKDxRA9gvwPenK47wmGamuIVQwDcreAw9HNVjA0QgW//Ze3MQBf2hAm8nJ2lv5I
 LKRQt2R7beOslcV/r/CLK/fRFtWXTm79Zxr/82KXrC56G9prnTxhTlaHW7O0q8vXRbR+
 yLKkcoAPGpa00nNXrerHnFCFnFedayDSWS9bg3THGyu40JflednUVhmLEiZrmy/GoZe0
 Thu3RVE0ssQSU6dajm9lyyuiMYtDPh9ODAzkaqefEmLIalS57GoPl3itx7FdDK9kzVV6
 dILA==
X-Gm-Message-State: AC+VfDyKTqKL9qR/YxPTgCwP00yAj9kOxdsDmcBT42OCItsCnK/PU1Qt
 moagVhdECoxanHdyb29FF3cWP0IrTAhAYFXXSfTR80X67Vg=
X-Google-Smtp-Source: ACHHUZ63rKBlpIDBUQVq+6VAXGP9WTISsEWHKUuC0WuuWkO5cJhBdAADJiKx3sYyPE4rXJDKXOKEXf6RIPxNd8DLPgc=
X-Received: by 2002:a67:f959:0:b0:43f:5aa0:6c8d with SMTP id
 u25-20020a67f959000000b0043f5aa06c8dmr5913988vsq.28.1687396627383; Wed, 21
 Jun 2023 18:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230613205857.495165-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:16:41 +1000
Message-ID: <CAKmqyKNr6Q-xafuKwLiZPK+LvRAgd_oOm7Av13wuQM6_ksZAwQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] target/riscv: handle mvendorid/marchid/mimpid
 for KVM CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
> After changing user validation for mvendorid/marchid/mimpid to guarantee
> that the value is validated on user input time, coupled with the work in
> fetching KVM default values for them by using a scratch CPU, we're
> certain that the values in cpu->cfg.(mvendorid|marchid|mimpid) are
> already good to be written back to KVM.
>
> There's no need to write the values back for 'host' type CPUs since the
> values can't be changed, so let's do that just for generic CPUs.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index cd2974c663..602727cdfd 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -495,6 +495,33 @@ void kvm_arch_init_irq_routing(KVMState *s)
>  {
>  }
>
> +static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    uint64_t id;
> +    int ret;
> +
> +    id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                          KVM_REG_RISCV_CONFIG_REG(mvendorid));
> +    ret =3D kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
> +    if (ret !=3D 0) {
> +        return ret;
> +    }
> +
> +    id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                          KVM_REG_RISCV_CONFIG_REG(marchid));
> +    ret =3D kvm_set_one_reg(cs, id, &cpu->cfg.marchid);
> +    if (ret !=3D 0) {
> +        return ret;
> +    }
> +
> +    id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                          KVM_REG_RISCV_CONFIG_REG(mimpid));
> +    ret =3D kvm_set_one_reg(cs, id, &cpu->cfg.mimpid);
> +
> +    return ret;
> +}
> +
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
>      int ret =3D 0;
> @@ -513,6 +540,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>      env->misa_ext =3D isa;
>
> +    if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
> +        ret =3D kvm_vcpu_set_machine_ids(cpu, cs);
> +    }
> +
>      return ret;
>  }
>
> --
> 2.40.1
>
>

