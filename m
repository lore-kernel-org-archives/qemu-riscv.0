Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855EEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:41:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgqP-0007Za-DY; Sun, 09 Jul 2023 22:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgqO-0007Wy-5K; Sun, 09 Jul 2023 22:41:44 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgqK-0004Yz-9f; Sun, 09 Jul 2023 22:41:43 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-79414715edeso958953241.0; 
 Sun, 09 Jul 2023 19:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688956899; x=1691548899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgrJEPwSqQq8uVsfGUnG9j/+EWmxdEOkSxmCBCxlNl4=;
 b=AIW3tEjuq5lUvypU0XZBClF+Mt9DO7ojyp6uxQV1WWRC41zYElEW6cN4E8maYZzuyG
 lQdChsyILBS1hq6MSsht//gnh90vW6TirIAYwrIhK0qJrAp9eNrsdhXLQ4pKJNErL88S
 6x5PwuCxJRpu9j8VCjvIVw3jxOxxGnoK1xdfMDBXBF7eqXYIXvCNLxD8kK8mDFLyT0P/
 PTGsg17H6hETVhCjcXvOQaD/tG4FChmMmQqC3YI5vvpB3VFMKr0URBh1cFFos1BldsAV
 jftbjq6I2p6P8ri8cYuK66KFCfzNeKKodwM9TH300Iy626DeqUgTxG4LLTXq/vd72wD5
 VNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688956899; x=1691548899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgrJEPwSqQq8uVsfGUnG9j/+EWmxdEOkSxmCBCxlNl4=;
 b=JehOV5ol5dmJzUvvKpwfcDnInDJnUOh3R1TC08iYUdjbj4zIUIEuFSFeqgBzafoLC0
 0HKJeNo/kYzpLdA3JvJzX862Brm6TqcYwDz3pWzIIEe5S9jg5UvGLuGNg5F/p8p5vogt
 5yZXT9ksCBnL4spM81FsE9/Ig8KPW/+0qFnrmMQWF0beJ5H0E9DTNSPvvJfJGaZ8S+vV
 daxW6LOQszY9aSR+qDLTlT3W5Ye5xmDp5pjGqsph7F4ZhTjHW89wkMTgJjLbxVwCf4Mc
 8829QnYg59K0NKSWUsVyZGikXnBB/HVcg2Q80iiU0p8hWK67Tye+p6dcwn4vz4Qc17qj
 w3QA==
X-Gm-Message-State: ABy/qLbane5bQ2OHfuciB/ChNZuL+1QKQJmiYsFZXQVRTH+nRxW81m9G
 QR7uDKu3kx1sbIR4VKfj2ZJJu/3FJC391ny1BxE=
X-Google-Smtp-Source: APBJJlF5NdDowULkgGd21+XOsgkPwPQnoKH35/nty6vvfzRapdeA1AmjoA54U5B9g/TIuARZGwtYovmoFbn6+sMm+O0=
X-Received: by 2002:a1f:3f55:0:b0:471:4c5b:7a62 with SMTP id
 m82-20020a1f3f55000000b004714c5b7a62mr3395577vka.2.1688956898821; Sun, 09 Jul
 2023 19:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-15-dbarboza@ventanamicro.com>
 <20230706-b3ce7ed0f6265c69afad8d90@orel>
 <b414305b-5cdc-6be8-1a06-d50ae57db69d@ventanamicro.com>
In-Reply-To: <b414305b-5cdc-6be8-1a06-d50ae57db69d@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:41:12 +1000
Message-ID: <CAKmqyKPd6hUZXp4oTUNKOD=TOHHtTrQALAZqF_hnKLSw7GkNnQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/20] target/riscv/kvm.c: add multi-letter extension
 KVM properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

On Thu, Jul 6, 2023 at 10:47=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 7/6/23 09:14, Andrew Jones wrote:
> > On Thu, Jul 06, 2023 at 07:17:32AM -0300, Daniel Henrique Barboza wrote=
:
> >> Let's add KVM user properties for the multi-letter extensions that KVM
> >> currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
> >> svinval and svpbmt.
> >>
> >> As with MISA extensions, we're using the KVMCPUConfig type to hold
> >> information about the state of each extension. However, multi-letter
> >> extensions have more cases to cover than MISA extensions, so we're
> >> adding an extra 'supported' flag as well. This flag will reflect if a
> >> given extension is supported by KVM, i.e. KVM knows how to handle it.
> >> This is determined during KVM extension discovery in
> >> kvm_riscv_init_multiext_cfg(), where we test for ENOENT errors. Any
> >                                                     ^ EINVAL
>
> Alistair, let me know if you want me to send a v10 with this commit msg f=
ix.

I can make the fix when I apply it

Alistair

>
>
> Thanks,
>
> Daniel
>
> >
> >> other error will cause an abort.
> >>
> >> The use of the 'user_set' is similar to what we already do with MISA
> >> extensions: the flag set only if the user is changing the extension
> >> state.
> >>
> >> The 'supported' flag will be used later on to make an exception for
> >> users that are disabling multi-letter extensions that are unknown to
> >> KVM.
> >>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   target/riscv/cpu.c |   8 +++
> >>   target/riscv/kvm.c | 119 +++++++++++++++++++++++++++++++++++++++++++=
++
> >>   2 files changed, 127 insertions(+)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 5c8832a030..31e591a938 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -1860,6 +1860,14 @@ static void riscv_cpu_add_user_properties(Objec=
t *obj)
> >>       riscv_cpu_add_misa_properties(obj);
> >>
> >>       for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) =
{
> >> +#ifndef CONFIG_USER_ONLY
> >> +        if (kvm_enabled()) {
> >> +            /* Check if KVM created the property already */
> >> +            if (object_property_find(obj, prop->name)) {
> >> +                continue;
> >> +            }
> >> +        }
> >> +#endif
> >>           qdev_property_add_static(dev, prop);
> >>       }
> >>
> >> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> >> index 7afd6024e6..2d39ec154f 100644
> >> --- a/target/riscv/kvm.c
> >> +++ b/target/riscv/kvm.c
> >> @@ -113,6 +113,7 @@ typedef struct KVMCPUConfig {
> >>       target_ulong offset;
> >>       int kvm_reg_id;
> >>       bool user_set;
> >> +    bool supported;
> >>   } KVMCPUConfig;
> >>
> >>   #define KVM_MISA_CFG(_bit, _reg_id) \
> >> @@ -197,6 +198,81 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCP=
U *cpu, CPUState *cs)
> >>       }
> >>   }
> >>
> >> +#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
> >> +
> >> +#define KVM_EXT_CFG(_name, _prop, _reg_id) \
> >> +    {.name =3D _name, .offset =3D CPUCFG(_prop), \
> >> +     .kvm_reg_id =3D _reg_id}
> >> +
> >> +static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
> >> +    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
> >> +    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
> >> +    KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIH=
INTPAUSE),
> >> +    KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
> >> +    KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
> >> +    KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
> >> +    KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
> >> +    KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
> >> +};
> >> +
> >> +static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
> >> +                            uint32_t val)
> >> +{
> >> +    int cpu_cfg_offset =3D multi_ext->offset;
> >> +    bool *ext_enabled =3D (void *)&cpu->cfg + cpu_cfg_offset;
> >> +
> >> +    *ext_enabled =3D val;
> >> +}
> >> +
> >> +static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
> >> +                                KVMCPUConfig *multi_ext)
> >> +{
> >> +    int cpu_cfg_offset =3D multi_ext->offset;
> >> +    bool *ext_enabled =3D (void *)&cpu->cfg + cpu_cfg_offset;
> >> +
> >> +    return *ext_enabled;
> >> +}
> >> +
> >> +static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
> >> +                                      const char *name,
> >> +                                      void *opaque, Error **errp)
> >> +{
> >> +    KVMCPUConfig *multi_ext_cfg =3D opaque;
> >> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> >> +    bool value, host_val;
> >> +
> >> +    if (!visit_type_bool(v, name, &value, errp)) {
> >> +        return;
> >> +    }
> >> +
> >> +    host_val =3D kvm_cpu_cfg_get(cpu, multi_ext_cfg);
> >> +
> >> +    /*
> >> +     * Ignore if the user is setting the same value
> >> +     * as the host.
> >> +     */
> >> +    if (value =3D=3D host_val) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (!multi_ext_cfg->supported) {
> >> +        /*
> >> +         * Error out if the user is trying to enable an
> >> +         * extension that KVM doesn't support. Ignore
> >> +         * option otherwise.
> >> +         */
> >> +        if (value) {
> >> +            error_setg(errp, "KVM does not support disabling extensio=
n %s",
> >> +                       multi_ext_cfg->name);
> >> +        }
> >> +
> >> +        return;
> >> +    }
> >> +
> >> +    multi_ext_cfg->user_set =3D true;
> >> +    kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
> >> +}
> >> +
> >>   static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
> >>   {
> >>       int i;
> >> @@ -215,6 +291,15 @@ static void kvm_riscv_add_cpu_user_properties(Obj=
ect *cpu_obj)
> >>           object_property_set_description(cpu_obj, misa_cfg->name,
> >>                                           misa_cfg->description);
> >>       }
> >> +
> >> +    for (i =3D 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> >> +        KVMCPUConfig *multi_cfg =3D &kvm_multi_ext_cfgs[i];
> >> +
> >> +        object_property_add(cpu_obj, multi_cfg->name, "bool",
> >> +                            NULL,
> >> +                            kvm_cpu_set_multi_ext_cfg,
> >> +                            NULL, multi_cfg);
> >> +    }
> >>   }
> >>
> >>   static int kvm_riscv_get_regs_core(CPUState *cs)
> >> @@ -530,6 +615,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU=
 *cpu,
> >>       env->misa_ext =3D env->misa_ext_mask;
> >>   }
> >>
> >> +static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU =
*kvmcpu)
> >> +{
> >> +    CPURISCVState *env =3D &cpu->env;
> >> +    uint64_t val;
> >> +    int i, ret;
> >> +
> >> +    for (i =3D 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> >> +        KVMCPUConfig *multi_ext_cfg =3D &kvm_multi_ext_cfgs[i];
> >> +        struct kvm_one_reg reg;
> >> +
> >> +        reg.id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> >> +                                  multi_ext_cfg->kvm_reg_id);
> >> +        reg.addr =3D (uint64_t)&val;
> >> +        ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> >> +        if (ret !=3D 0) {
> >> +            if (errno =3D=3D EINVAL) {
> >> +                /* Silently default to 'false' if KVM does not suppor=
t it. */
> >> +                multi_ext_cfg->supported =3D false;
> >> +                val =3D false;
> >> +            } else {
> >> +                error_report("Unable to read ISA_EXT KVM register %s,=
 "
> >> +                             "error %d", multi_ext_cfg->name, ret);
> >> +                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> >> +                exit(EXIT_FAILURE);
> >> +            }
> >> +        } else {
> >> +            multi_ext_cfg->supported =3D true;
> >> +        }
> >> +
> >> +        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
> >> +    }
> >> +}
> >> +
> >>   void kvm_riscv_init_user_properties(Object *cpu_obj)
> >>   {
> >>       RISCVCPU *cpu =3D RISCV_CPU(cpu_obj);
> >> @@ -542,6 +660,7 @@ void kvm_riscv_init_user_properties(Object *cpu_ob=
j)
> >>       kvm_riscv_add_cpu_user_properties(cpu_obj);
> >>       kvm_riscv_init_machine_ids(cpu, &kvmcpu);
> >>       kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
> >> +    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
> >>
> >>       kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
> >>   }
> >> --
> >> 2.41.0
> >>
> >
> > Otherwise,
> >
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>

