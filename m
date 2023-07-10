Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152F1EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:23:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgYw-0000LA-8a; Sun, 09 Jul 2023 22:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgYt-0000KQ-Tq; Sun, 09 Jul 2023 22:23:39 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgYs-000725-Cm; Sun, 09 Jul 2023 22:23:39 -0400
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-766b22593faso281921585a.2; 
 Sun, 09 Jul 2023 19:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688955817; x=1691547817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+mlSpHvJIBGgOpUVVkcev+9DV2NgIgK0ftuFnUTkKA=;
 b=R9aw9DgX2K4EIZD27SVv6wv0gzI1L1eUvUunx36MOF6PrOHXRBi9Rc2V/wG7U0zK+9
 3XpHFeIa6SzVWv94vbARuRsJ6kOC7c37/GOaoCKHxkeUD50QxLYhT3vH/HlVrOIeUxHH
 Fh4VjjSTZlmiNnz7PcpYMf77VcCJu2MrcaGAMZdBHSGOeXzlQO+fTxACXDkQLSmj5o4t
 GbfsJzzlsW8EyD2uY8GBMsH8zWmmoyNEToZDtm7xgIU/Sb3zJGYF/OVI8/b+/GaEy9dZ
 ieq/+2W7y0MWv6BYc93JxLwdcrFty/LwP6oqVYsbj9IM3YjQlGt4KRO3CEcgfRobJ9jy
 BV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688955817; x=1691547817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+mlSpHvJIBGgOpUVVkcev+9DV2NgIgK0ftuFnUTkKA=;
 b=SQ6RWqPivku8YpFDFKHr8yTsPe3UIHb79l6MttYrpavRAETkL9VNnsCadQIVnaDNov
 xQJIoTCmR9qcdIS9OpPXaAUYQFL7aou4OplPAKXOcMGcpBfEy8QzxYu2rry6m5FJ7+v/
 iPddsqpQYZI2Xm72pHINbtZPc20PqMDowYBFX+GGQPHRBzkgC7tDbF8U63WvaL9+pFUB
 +86hnczsDSDV1ly81SjTnxdIExoYSPAYC8NjznDYiA1holG5qPtdI12BhCBORBolySN4
 HMAKGUo8r7O0gTXQZk30HeNX/YIgU0quveqUek70rjXoMsxzlto+pBvwHVw6ZikdAMwN
 UhmQ==
X-Gm-Message-State: ABy/qLZ2RbwLIF5OY9eGkFk32rTxwvM+lTgbqTpsrsyS5eAd072P2aFF
 VNzMbKLgGIxgr2SSk63X/GiuNQHmepisJQd4zHw=
X-Google-Smtp-Source: APBJJlFNifZCsAbGNY65SV3YdR09PnDIgiy3CgCCDxONG4bLzvH5XKxoAD+TKdLTBsPNZwA4NXQCAQoSlajxSpjaux8=
X-Received: by 2002:a05:620a:199b:b0:767:55c4:5725 with SMTP id
 bm27-20020a05620a199b00b0076755c45725mr11979931qkb.18.1688955816772; Sun, 09
 Jul 2023 19:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-14-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-14-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:23:10 +1000
Message-ID: <CAKmqyKPGVAV7N2gCCd_KoJiyGahDrnwUvwHu4GYXjoXbzt-seA@mail.gmail.com>
Subject: Re: [PATCH v9 13/20] target/riscv/kvm.c: update KVM MISA bits
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x730.google.com
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

On Thu, Jul 6, 2023 at 8:20=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Our design philosophy with KVM properties can be resumed in two main
> decisions based on KVM interface availability and what the user wants to
> do:
>
> - if the user disables an extension that the host KVM module doesn't
> know about (i.e. it doesn't implement the kvm_get_one_reg() interface),
> keep booting the CPU. This will avoid users having to deal with issues
> with older KVM versions while disabling features they don't care;
>
> - for any other case we're going to error out immediately. If the user
> wants to enable a feature that KVM doesn't know about this a problem that
> is worth aborting - the user must know that the feature wasn't enabled
> in the hart. Likewise, if KVM knows about the extension, the user wants
> to enable/disable it, and we fail to do it so, that's also a problem we
> can't shrug it off.
>
> In the case of MISA bits we won't even try enabling bits that aren't
> already available in the host. The ioctl() is so likely to fail that
> it's not worth trying. This check is already done in the previous patch,
> in kvm_cpu_set_misa_ext_cfg(), thus we don't need to worry about it now.
>
> In kvm_riscv_update_cpu_misa_ext() we'll go through every potential user
> option and do as follows:
>
> - if the user didn't set the property or set to the same value of the
> host, do nothing;
>
> - Disable the given extension in KVM. Error out if anything goes wrong.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index c55d0ec7ab..7afd6024e6 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -162,6 +162,41 @@ static void kvm_cpu_set_misa_ext_cfg(Object *obj, Vi=
sitor *v,
>                 "enabled in the host", misa_ext_cfg->name);
>  }
>
> +static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    uint64_t id, reg;
> +    int i, ret;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
> +        KVMCPUConfig *misa_cfg =3D &kvm_misa_ext_cfgs[i];
> +        target_ulong misa_bit =3D misa_cfg->offset;
> +
> +        if (!misa_cfg->user_set) {
> +            continue;
> +        }
> +
> +        /* If we're here we're going to disable the MISA bit */
> +        reg =3D 0;
> +        id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> +                              misa_cfg->kvm_reg_id);
> +        ret =3D kvm_set_one_reg(cs, id, &reg);
> +        if (ret !=3D 0) {
> +            /*
> +             * We're not checking for -EINVAL because if the bit is abou=
t
> +             * to be disabled, it means that it was already enabled by
> +             * KVM. We determined that by fetching the 'isa' register
> +             * during init() time. Any error at this point is worth
> +             * aborting.
> +             */
> +            error_report("Unable to set KVM reg %s, error %d",
> +                         misa_cfg->name, ret);
> +            exit(EXIT_FAILURE);
> +        }
> +        env->misa_ext &=3D ~misa_bit;
> +    }
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -632,8 +667,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
>
>      if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
>          ret =3D kvm_vcpu_set_machine_ids(cpu, cs);
> +        if (ret !=3D 0) {
> +            return ret;
> +        }
>      }
>
> +    kvm_riscv_update_cpu_misa_ext(cpu, cs);
> +
>      return ret;
>  }
>
> --
> 2.41.0
>
>

