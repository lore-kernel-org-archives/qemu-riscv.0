Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B521DEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:41:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgpk-0007F1-GZ; Sun, 09 Jul 2023 22:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgph-0007EN-77; Sun, 09 Jul 2023 22:41:01 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgpc-0004Sp-Hn; Sun, 09 Jul 2023 22:41:00 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-579efc32377so44918877b3.1; 
 Sun, 09 Jul 2023 19:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688956853; x=1691548853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPCSHBwkAiBW3sUoc4GI+S6kAfG1xTcmLVvBTaheKYE=;
 b=UEiKUmte0eRylunnA2KhEL7mUgtf9Nyldg9hVXWbzqTT/ZVo7Ywm2tXt2fPyn3Ph+c
 hwdPT6/cKXqnrJDgFLxybX/XFmnPL9gF1+GLUTO+o4DY+c9aeowfxpze+WR/dcxko542
 Js6nYnm9Oth8rujgV3r28RLpq+O49lwzotkRfjmQuoPGdqBcW0JjPJgyh/NbhGTCwPUv
 umy2+o4kySiGqeUd72w9f7haBiOMDIeeT69zECk9Agdo4RSDn5gkVEngxLDXhljlUGl9
 0LbTu8NF67ByxdywqaiBLad89eC/TxZIME7GvbGShkYwDPcNg1s5cWS7ActEYX701NE0
 yrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688956853; x=1691548853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPCSHBwkAiBW3sUoc4GI+S6kAfG1xTcmLVvBTaheKYE=;
 b=Fn3eSQ3f/HVG268r72JxBxv6+oZTMgf+Je/w2LjQZdaLt8OCeOWmXCTDh1C9k13r66
 Phpc/4b3od+ogXjgQoiNtWM9UGwy4Lr+tl2zFXtGD3qeJIBWsMdM4MnqyNGfJk2Gbq6B
 LrVnlOewIyIgpmIQxNqNlt/FX7R4QDYHn40wTOjZ3A8+9YhbjZdqOacTwHRfHCELHBov
 7pn5zYDBVtFqQOERBbJ89o+gBeHEel+ETcFJK5w9NUgpo6Ogrs0ECBpoV3B14edaXAme
 vQdtTcdf+9qcV9zjbTFAYBIqeDFHcLLH3x7/00aYy8RHpuOv4QyLUp/92CvWzCJxq32K
 gy/w==
X-Gm-Message-State: ABy/qLa2FhqPWnZNoZmj82jXKfoayQ1mK1B6soH4wskDhYpY6H1K0b65
 60r3dPtu2jG5X2HUt01rS1eoQgJCqZT9mIj/JHc=
X-Google-Smtp-Source: APBJJlEezU9JGBFdDqZRbnZ9hKplE+XzZE/+s6o/ul51SaJVa9vek/5K+BgyAoXAQC9/A9Hgb1fNnFU0WuQ+FHT6U78=
X-Received: by 2002:a0d:ef42:0:b0:576:888e:6219 with SMTP id
 y63-20020a0def42000000b00576888e6219mr10300498ywe.34.1688956853096; Sun, 09
 Jul 2023 19:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-15-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-15-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:40:27 +1000
Message-ID: <CAKmqyKM6mFiwEgfYyEw190REMZNOpz+ZYXGnpq_YWHxkv=XiDw@mail.gmail.com>
Subject: Re: [PATCH v9 14/20] target/riscv/kvm.c: add multi-letter extension
 KVM properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=alistair23@gmail.com; helo=mail-yw1-x1129.google.com
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
> Let's add KVM user properties for the multi-letter extensions that KVM
> currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
> svinval and svpbmt.
>
> As with MISA extensions, we're using the KVMCPUConfig type to hold
> information about the state of each extension. However, multi-letter
> extensions have more cases to cover than MISA extensions, so we're
> adding an extra 'supported' flag as well. This flag will reflect if a
> given extension is supported by KVM, i.e. KVM knows how to handle it.
> This is determined during KVM extension discovery in
> kvm_riscv_init_multiext_cfg(), where we test for ENOENT errors. Any
> other error will cause an abort.
>
> The use of the 'user_set' is similar to what we already do with MISA
> extensions: the flag set only if the user is changing the extension
> state.
>
> The 'supported' flag will be used later on to make an exception for
> users that are disabling multi-letter extensions that are unknown to
> KVM.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c |   8 +++
>  target/riscv/kvm.c | 119 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 127 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5c8832a030..31e591a938 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1860,6 +1860,14 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>      riscv_cpu_add_misa_properties(obj);
>
>      for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> +#ifndef CONFIG_USER_ONLY
> +        if (kvm_enabled()) {
> +            /* Check if KVM created the property already */
> +            if (object_property_find(obj, prop->name)) {
> +                continue;
> +            }
> +        }
> +#endif
>          qdev_property_add_static(dev, prop);
>      }
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 7afd6024e6..2d39ec154f 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -113,6 +113,7 @@ typedef struct KVMCPUConfig {
>      target_ulong offset;
>      int kvm_reg_id;
>      bool user_set;
> +    bool supported;
>  } KVMCPUConfig;
>
>  #define KVM_MISA_CFG(_bit, _reg_id) \
> @@ -197,6 +198,81 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *=
cpu, CPUState *cs)
>      }
>  }
>
> +#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
> +
> +#define KVM_EXT_CFG(_name, _prop, _reg_id) \
> +    {.name =3D _name, .offset =3D CPUCFG(_prop), \
> +     .kvm_reg_id =3D _reg_id}
> +
> +static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
> +    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
> +    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
> +    KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
> +    KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
> +    KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
> +    KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
> +    KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
> +    KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
> +};
> +
> +static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
> +                            uint32_t val)
> +{
> +    int cpu_cfg_offset =3D multi_ext->offset;
> +    bool *ext_enabled =3D (void *)&cpu->cfg + cpu_cfg_offset;
> +
> +    *ext_enabled =3D val;
> +}
> +
> +static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
> +                                KVMCPUConfig *multi_ext)
> +{
> +    int cpu_cfg_offset =3D multi_ext->offset;
> +    bool *ext_enabled =3D (void *)&cpu->cfg + cpu_cfg_offset;
> +
> +    return *ext_enabled;
> +}
> +
> +static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
> +                                      const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *multi_ext_cfg =3D opaque;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    bool value, host_val;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    host_val =3D kvm_cpu_cfg_get(cpu, multi_ext_cfg);
> +
> +    /*
> +     * Ignore if the user is setting the same value
> +     * as the host.
> +     */
> +    if (value =3D=3D host_val) {
> +        return;
> +    }
> +
> +    if (!multi_ext_cfg->supported) {
> +        /*
> +         * Error out if the user is trying to enable an
> +         * extension that KVM doesn't support. Ignore
> +         * option otherwise.
> +         */
> +        if (value) {
> +            error_setg(errp, "KVM does not support disabling extension %=
s",
> +                       multi_ext_cfg->name);
> +        }
> +
> +        return;
> +    }
> +
> +    multi_ext_cfg->user_set =3D true;
> +    kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -215,6 +291,15 @@ static void kvm_riscv_add_cpu_user_properties(Object=
 *cpu_obj)
>          object_property_set_description(cpu_obj, misa_cfg->name,
>                                          misa_cfg->description);
>      }
> +
> +    for (i =3D 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        KVMCPUConfig *multi_cfg =3D &kvm_multi_ext_cfgs[i];
> +
> +        object_property_add(cpu_obj, multi_cfg->name, "bool",
> +                            NULL,
> +                            kvm_cpu_set_multi_ext_cfg,
> +                            NULL, multi_cfg);
> +    }
>  }
>
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> @@ -530,6 +615,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *c=
pu,
>      env->misa_ext =3D env->misa_ext_mask;
>  }
>
> +static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kv=
mcpu)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    uint64_t val;
> +    int i, ret;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        KVMCPUConfig *multi_ext_cfg =3D &kvm_multi_ext_cfgs[i];
> +        struct kvm_one_reg reg;
> +
> +        reg.id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> +                                  multi_ext_cfg->kvm_reg_id);
> +        reg.addr =3D (uint64_t)&val;
> +        ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret !=3D 0) {
> +            if (errno =3D=3D EINVAL) {
> +                /* Silently default to 'false' if KVM does not support i=
t. */
> +                multi_ext_cfg->supported =3D false;
> +                val =3D false;
> +            } else {
> +                error_report("Unable to read ISA_EXT KVM register %s, "
> +                             "error %d", multi_ext_cfg->name, ret);
> +                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> +                exit(EXIT_FAILURE);
> +            }
> +        } else {
> +            multi_ext_cfg->supported =3D true;
> +        }
> +
> +        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
> +    }
> +}
> +
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cpu_obj);
> @@ -542,6 +660,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>      kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
> +    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
>
>      kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>  }
> --
> 2.41.0
>
>

