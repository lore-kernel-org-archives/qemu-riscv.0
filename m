Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42BAE743EA
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 05:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qm5mJ-0001H0-Gz; Fri, 29 Sep 2023 01:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qm5mI-0001Go-E6; Fri, 29 Sep 2023 01:11:02 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qm5mG-00056G-RP; Fri, 29 Sep 2023 01:11:02 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-45281e0b1cbso6510886137.0; 
 Thu, 28 Sep 2023 22:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695964257; x=1696569057; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHYCyfjtO8X7it+L5fSErtQgMzl+G4tCTstnWbzTfKo=;
 b=mTkOo01u6EIJ26OD4Ew20DlKtRf2JPhsZS/M3asBVqymP8qZH7Mtf0m0jdxvsXJQn6
 99LSPMvRoZZ2ew1S86ZbMwQZMTjA/5uE2vx69Y7pda5AbZuLGiuaQEtpGrMsXTiGHqcb
 uhTwPeCA/FjCjK56UMWOXBeLTO0sHWnAxSUnrxo4iITnsDs5xHRL/4aSlMI7D2gqQ6z6
 4D2Nvt3h7i5rp4e10yzYp1NZ80S8Yxk+LKmESXwgBVAH+Eaa8U3XxzM+kNJHlW546azE
 1pZNtjZi/vkNTYVxfP5J0LmZ3gHAOMUsKjJf2uJ86rk0mH6/LwRC+3H5dUyGq0VHs2nc
 CfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695964257; x=1696569057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHYCyfjtO8X7it+L5fSErtQgMzl+G4tCTstnWbzTfKo=;
 b=SSWHfZtedq+9MZbeIaMfJLmU/gjqH02ug6E6jtQcPuAWl9YTgqbPH59haDfRLfOlwZ
 vcVY8pLh9CfyH9g+T6adlB/stUheCbiEJWYLIvh0Nn+8WsqQHsCIfNyAvjK2LYN6d7m0
 gI6CtPPnpk5Vha5metjA6rRaReizM2N82wL4DC+7xK8NFm4DoiQ5wmnwz55tXIDlrWVw
 s/tzm7VZYXscXTooZNik2/FsImkL2d46N74RVQb3bwAs6AQQq6d1L0f7bAiu+kS7DU+8
 xPYsAfuzh8Ca4Yso9hOsqRGl3bf0BOqrEjap8ThUmT3nYxQCsEZJnF9FXpeERFyQkFBk
 V/7A==
X-Gm-Message-State: AOJu0YwpA0tJ/43TBgqv3BdvbcpNcYZX/xSVF/4Dha7ZOL+S2ISJzHsV
 UuQ1SqFVxYc6w2anFcOo3pijJu7HdgrKHMffjz4=
X-Google-Smtp-Source: AGHT+IFN22DHcmfUv7qa5wRtJoIJ3MQDrepvCb1ZnY6L41n39YtQMesdtHobAgNoDemlJ/ErRNhYin0ZBh62aO5Rc5c=
X-Received: by 2002:a05:6102:134c:b0:451:60:2022 with SMTP id
 j12-20020a056102134c00b0045100602022mr2541172vsl.28.1695964257628; Thu, 28
 Sep 2023 22:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
 <20230926184019.166352-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230926184019.166352-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 29 Sep 2023 15:10:30 +1000
Message-ID: <CAKmqyKOtFTS-GEzeSfmOF5M814Re5mj5SvqxvJJmfiU+9xy94w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] target/riscv/kvm/kvm-cpu.c: add missing property
 getters()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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

On Wed, Sep 27, 2023 at 6:10=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We got along without property getters in the KVM driver because we never
> needed them. But the incoming query-cpu-model-expansion API will use
> property getters and setters to retrieve the CPU characteristics.
>
> Add the missing getters for the KVM driver for both MISA and
> multi-letter extension properties. We're also adding an special getter
> for absent multi-letter properties that KVM doesn't implement that
> always return false.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 40 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c6615cb807..b4c231f231 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -140,6 +140,19 @@ static KVMCPUConfig kvm_misa_ext_cfgs[] =3D {
>      KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
>  };
>
> +static void kvm_cpu_get_misa_ext_cfg(Object *obj, Visitor *v,
> +                                     const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *misa_ext_cfg =3D opaque;
> +    target_ulong misa_bit =3D misa_ext_cfg->offset;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    bool value =3D env->misa_ext_mask & misa_bit;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
>  static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
>                                       const char *name,
>                                       void *opaque, Error **errp)
> @@ -244,6 +257,17 @@ static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
>      return *ext_enabled;
>  }
>
> +static void kvm_cpu_get_multi_ext_cfg(Object *obj, Visitor *v,
> +                                      const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *multi_ext_cfg =3D opaque;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    bool value =3D kvm_cpu_cfg_get(cpu, multi_ext_cfg);
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
>  static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
>                                        const char *name,
>                                        void *opaque, Error **errp)
> @@ -346,6 +370,15 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCP=
U *cpu, CPUState *cs)
>      }
>  }
>
> +static void cpu_get_cfg_unavailable(Object *obj, Visitor *v,
> +                                    const char *name,
> +                                    void *opaque, Error **errp)
> +{
> +    bool value =3D false;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
>  static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>                                      const char *name,
>                                      void *opaque, Error **errp)
> @@ -376,7 +409,8 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *ob=
j, const char *prop_name)
>       * to enable any of them.
>       */
>      object_property_add(obj, prop_name, "bool",
> -                        NULL, cpu_set_cfg_unavailable,
> +                        cpu_get_cfg_unavailable,
> +                        cpu_set_cfg_unavailable,
>                          NULL, (void *)prop_name);
>  }
>
> @@ -406,7 +440,7 @@ static void kvm_riscv_add_cpu_user_properties(Object =
*cpu_obj)
>          misa_cfg->description =3D riscv_get_misa_ext_description(bit);
>
>          object_property_add(cpu_obj, misa_cfg->name, "bool",
> -                            NULL,
> +                            kvm_cpu_get_misa_ext_cfg,
>                              kvm_cpu_set_misa_ext_cfg,
>                              NULL, misa_cfg);
>          object_property_set_description(cpu_obj, misa_cfg->name,
> @@ -422,7 +456,7 @@ static void kvm_riscv_add_cpu_user_properties(Object =
*cpu_obj)
>          KVMCPUConfig *multi_cfg =3D &kvm_multi_ext_cfgs[i];
>
>          object_property_add(cpu_obj, multi_cfg->name, "bool",
> -                            NULL,
> +                            kvm_cpu_get_multi_ext_cfg,
>                              kvm_cpu_set_multi_ext_cfg,
>                              NULL, multi_cfg);
>      }
> --
> 2.41.0
>
>

