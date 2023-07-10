Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A27EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:37:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIglv-0005lp-DP; Sun, 09 Jul 2023 22:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIglt-0005l7-Su; Sun, 09 Jul 2023 22:37:05 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIglp-0003QX-TE; Sun, 09 Jul 2023 22:37:05 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-47e5025a55fso1278396e0c.0; 
 Sun, 09 Jul 2023 19:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688956620; x=1691548620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UeEy6GEhBXHb6vL7UBmPgdQ4j8Mofo//iYi4F06i1/Q=;
 b=XTt/VW/kln7gym5ro5AePq4sOlSucAvv5EXRslC602GJwPPhA3KFbY7yJCfcUGqLeK
 mquLDoTkmHerKsmPo3vDkpdi+xa4dpcz5rwhnaj8iq2UlKKtTehgx4GT61ElajKrxhc5
 57Ygg4M/hMS7ZclNHVEx0KLrkTYRpkhsIIr4KqONw5rxAe1BDOA7zB0QgearlencTjcJ
 +5w/HjGlhEkVTlCbFHLuP8kQ5wCDLWyCKihH3tyQIOvYrnRXzs3y0pFrwueoDkRcV9Y1
 vZp52/KbGT/HS3jva7xapqdxVg6c/JwdIJWkhHDoyg2m9KZQ97pqpDrHd6ifqsuqOkqn
 T+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688956620; x=1691548620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UeEy6GEhBXHb6vL7UBmPgdQ4j8Mofo//iYi4F06i1/Q=;
 b=f+/06tYG1VRBpTt0GNseBo/En1WEUlTnstlTJgUng/9NcYIeKKC9BjHqgB8BibOxee
 apKm5US8mhWhDvjBQ4SHixBuZQ1RrXS607SPoGYE2F5CrQLcdjHH027ysb95oeeIh8Wn
 h0jWrtq1DSwmqW7iy5HE51aGNNqHRFKOZ3qjtcUcI89Le4m51egmX3ngi1ibbLGrEvIJ
 akOUTwehA38LmT0lVO7UOJ5pwgvfkcLg21Y00TRMLubKYluTcTraScAYZoKUIJ3LDNiC
 Xc6onWzFxovEccbger3i/xOrW/JuHj+pwNX0QCO0qI5ZV+MZWfeh1LS1ZNljv5K2qVVQ
 AzVw==
X-Gm-Message-State: ABy/qLajNVYo3BOSoGX2e08xs7d1BBZf8/EgGceiUPrkc09MHcqDhkyU
 bEpQe6+iR3mBW8HYvMC5JhdWUJhuq4eu7ERpJUI=
X-Google-Smtp-Source: APBJJlGnJGKuVlFWrmqzIoLs4dK2PNPVSj7z0lgyngiw02tMCGpHgrZKKQP70y8m6rzAf38rpKpNzbnwuIeCH+epyT0=
X-Received: by 2002:a1f:d0c2:0:b0:471:b3f3:9bf9 with SMTP id
 h185-20020a1fd0c2000000b00471b3f39bf9mr5219978vkg.6.1688956620498; Sun, 09
 Jul 2023 19:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-21-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-21-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:36:34 +1000
Message-ID: <CAKmqyKNp9Kvmd2QGkERMvvLX8yDsC=HQzv00gf1ws+z0GQb2UQ@mail.gmail.com>
Subject: Re: [PATCH v9 20/20] target/riscv/kvm.c: read/write
 (cbom|cboz)_blocksize in KVM
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
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

On Thu, Jul 6, 2023 at 8:20=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> If we don't set a proper cbom_blocksize|cboz_blocksize in the FDT the
> Linux Kernel will fail to detect the availability of the CBOM/CBOZ
> extensions, regardless of the contents of the 'riscv,isa' DT prop.
>
> The FDT is being written using the cpu->cfg.cbom|z_blocksize attributes,
> so let's expose them as user properties like it is already done with
> TCG.
>
> This will also require us to determine proper blocksize values during
> init() time since the FDT is already created during realize(). We'll
> take a ride in kvm_riscv_init_multiext_cfg() to do it. Note that we
> don't need to fetch both cbom and cboz blocksizes every time: check for
> their parent extensions (icbom and icboz) and only read the blocksizes
> if needed.
>
> In contrast with cbom|z_blocksize properties from TCG, the user is not
> able to set any value that is different from the 'host' value when
> running KVM. KVM can be particularly harsh dealing with it: a ENOTSUPP
> can be thrown for the mere attempt of executing kvm_set_one_reg() for
> these 2 regs.
>
> Hopefully we don't need to call kvm_set_one_reg() for these regs.
> We'll check if the user input matches the host value in
> kvm_cpu_set_cbomz_blksize(), the set() accessor for both blocksize
> properties. We'll fail fast since it's already known to not be
> supported.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index cfeab5a4c0..d831ee9b5d 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -276,6 +276,42 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, V=
isitor *v,
>      kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
>  }
>
> +static KVMCPUConfig kvm_cbom_blocksize =3D {
> +    .name =3D "cbom_blocksize",
> +    .offset =3D CPUCFG(cbom_blocksize),
> +    .kvm_reg_id =3D KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)
> +};
> +
> +static KVMCPUConfig kvm_cboz_blocksize =3D {
> +    .name =3D "cboz_blocksize",
> +    .offset =3D CPUCFG(cboz_blocksize),
> +    .kvm_reg_id =3D KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
> +};
> +
> +static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
> +                                      const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *cbomz_cfg =3D opaque;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint16_t value, *host_val;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    host_val =3D kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
> +
> +    if (value !=3D *host_val) {
> +        error_report("Unable to set %s to a different value than "
> +                     "the host (%u)",
> +                     cbomz_cfg->name, *host_val);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    cbomz_cfg->user_set =3D true;
> +}
> +
>  static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs=
)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -329,6 +365,14 @@ static void kvm_riscv_add_cpu_user_properties(Object=
 *cpu_obj)
>                              kvm_cpu_set_multi_ext_cfg,
>                              NULL, multi_cfg);
>      }
> +
> +    object_property_add(cpu_obj, "cbom_blocksize", "uint16",
> +                        NULL, kvm_cpu_set_cbomz_blksize,
> +                        NULL, &kvm_cbom_blocksize);
> +
> +    object_property_add(cpu_obj, "cboz_blocksize", "uint16",
> +                        NULL, kvm_cpu_set_cbomz_blksize,
> +                        NULL, &kvm_cboz_blocksize);
>  }
>
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> @@ -644,6 +688,24 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *c=
pu,
>      env->misa_ext =3D env->misa_ext_mask;
>  }
>
> +static void kvm_riscv_read_cbomz_blksize(RISCVCPU *cpu, KVMScratchCPU *k=
vmcpu,
> +                                         KVMCPUConfig *cbomz_cfg)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +
> +    reg.id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              cbomz_cfg->kvm_reg_id);
> +    reg.addr =3D (uint64_t)kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
> +    ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret !=3D 0) {
> +        error_report("Unable to read KVM reg %s, error %d",
> +                     cbomz_cfg->name, ret);
> +        exit(EXIT_FAILURE);
> +    }
> +}
> +
>  static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kv=
mcpu)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -675,6 +737,14 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cp=
u, KVMScratchCPU *kvmcpu)
>
>          kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
>      }
> +
> +    if (cpu->cfg.ext_icbom) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
> +    }
> +
> +    if (cpu->cfg.ext_icboz) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
> +    }
>  }
>
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
> --
> 2.41.0
>
>

