Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D07AEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:32:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgh8-0003yO-Op; Sun, 09 Jul 2023 22:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgh7-0003xn-7v; Sun, 09 Jul 2023 22:32:09 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgh5-0001VN-Qh; Sun, 09 Jul 2023 22:32:08 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-47e844aac5bso985086e0c.3; 
 Sun, 09 Jul 2023 19:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688956326; x=1691548326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eaK8f3fgE/Ak5Gq+mcntuJ/xk+BIkeQK6b+IkuLMSwY=;
 b=AAKycLajgOijhB1I/7tDC1xHKQqPkJf0vyjWQvga+xpbvPwlU+U8DF+pftYenDcvA2
 Y7/JDO87t2aGYdZldtK83jcl1uFTl1tJVlLUlOfgVQ6IBGWcIfICZypbPQIi9nzKCkXn
 rOT3oZtFvw7MVoHEv5mBlJuYjYih/qTELOLgjDzIvTM3EVaViNhbzJIHpJc9bBNKsyP0
 k5E0aEIRUvMsyqlqrVbigk/fi8WYMOHhUOQJrWkIRD1qkhbtXvbev2lZx9Yzb/+dz869
 QCbgD80Fq/7P1U0dN4ldu9O6azrMmydnuiyV8DA7D/PV3v2yRok2H5zC3OJ3i/skUkrC
 QoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688956326; x=1691548326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eaK8f3fgE/Ak5Gq+mcntuJ/xk+BIkeQK6b+IkuLMSwY=;
 b=VwBKQVks1SN7Sz3SOTmpUMXyNETt95EYTyrx/FADI0y3lRi21eQNZphTgabtMnDzGm
 f6L9naKiGbMa/drPPW6UerGTKHotazOvMUyJIQy80t6aX+sKQY+Zgim7xH0TaGvleEO3
 rUNO7obP7x9I4shr5zdUWcC3IDnkplLTNnLcGA9DRtkdMbwLCGlldbVbOz7TnO5oeTgv
 tcMJBuYuOsVeEWljtj6LN9sS+7vgaI2HiDqzeysu60o9wEerGQwFv6CLlj6rIq6LmjJH
 KN2YsjyZuFj5fy+hAxUbRebRcEkAhxhwXE95mOzpr0+QkRMAO5N+SVN+2svsrHrG8Dim
 2Kew==
X-Gm-Message-State: ABy/qLaZGy3lCsDni19Ubq2kdEgZPdanOmKq4RMvS3PdVSHvrjryUXlf
 dHUXqLemYDYExqsaO9flsd91XY0UVy5VVS4O50g=
X-Google-Smtp-Source: APBJJlENm4qwo3oORMQhnMjFvDOpvK3YgEw6yrtj/4me0bkjOH6pqHNlRP9A1OFZeqW3w02uhVRB+11Ad7rU/C1wXu8=
X-Received: by 2002:a05:6102:3d7:b0:443:7bd9:3fea with SMTP id
 n23-20020a05610203d700b004437bd93feamr3465601vsq.23.1688956326259; Sun, 09
 Jul 2023 19:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-19-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-19-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:31:40 +1000
Message-ID: <CAKmqyKPrtfuyPns6w59pxsg_2wbNxULys5a1O-eReYvURLVXew@mail.gmail.com>
Subject: Re: [PATCH v9 18/20] target/riscv: update multi-letter extension KVM
 properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Thu, Jul 6, 2023 at 8:19=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're now ready to update the multi-letter extensions status for KVM.
>
> kvm_riscv_update_cpu_cfg_isa_ext() is called called during vcpu creation
> time to verify which user options changes host defaults (via the 'user_se=
t'
> flag) and tries to write them back to KVM.
>
> Failure to commit a change to KVM is only ignored in case KVM doesn't
> know about the extension (-EINVAL error code) and the user wanted to
> disable the given extension. Otherwise we're going to abort the boot
> process.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 2d39ec154f..ba940e570e 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -273,6 +273,32 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, V=
isitor *v,
>      kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
>  }
>
> +static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs=
)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    uint64_t id, reg;
> +    int i, ret;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        KVMCPUConfig *multi_ext_cfg =3D &kvm_multi_ext_cfgs[i];
> +
> +        if (!multi_ext_cfg->user_set) {
> +            continue;
> +        }
> +
> +        id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> +                              multi_ext_cfg->kvm_reg_id);
> +        reg =3D kvm_cpu_cfg_get(cpu, multi_ext_cfg);
> +        ret =3D kvm_set_one_reg(cs, id, &reg);
> +        if (ret !=3D 0) {
> +            error_report("Unable to %s extension %s in KVM, error %d",
> +                         reg ? "enable" : "disable",
> +                         multi_ext_cfg->name, ret);
> +            exit(EXIT_FAILURE);
> +        }
> +    }
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -792,6 +818,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>
>      kvm_riscv_update_cpu_misa_ext(cpu, cs);
> +    kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
>
>      return ret;
>  }
> --
> 2.41.0
>
>

