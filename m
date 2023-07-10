Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26400EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:17:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgSv-0007SJ-Eg; Sun, 09 Jul 2023 22:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgSu-0007S6-P3; Sun, 09 Jul 2023 22:17:28 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgSs-0003G9-NS; Sun, 09 Jul 2023 22:17:28 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7659dc74d91so453308485a.0; 
 Sun, 09 Jul 2023 19:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688955445; x=1691547445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJdNwas8PWZsE0nSdlV1OSNeIuM5oLIMAtCbNOJIUAw=;
 b=LdwtZgwp0FgDMJ/sbrM1eUsAA6+fGE+/UnESZV4U8xb+RRErGjbLt1C8iVK13GPf8n
 yWQwYO8W9/OeBjUlyjPvAqjmGv4MUCjPAu9cQ+zRv1Lr3AN8+0seQOP9ZhO6DMVXbgwO
 aTFPg1SPjks3/ll7Jxh8lUj/ddbrKX90HGmaQ0kNg3t1Z49HB2jFG5SINjnZK9qiSuvT
 3qMxICJ/wnDAUHxJyAtuWc/qRqDRP/t8eQ/pVi5LFCqx7E1MSfLAQ0TroE+G/zaBOdEX
 IfnGWfdcLMVuW/VCWT20Ginevepz9MoY84ZDSYQVtVBqQfu2CvIFpMoXXK+PS1sc41K1
 1ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688955445; x=1691547445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yJdNwas8PWZsE0nSdlV1OSNeIuM5oLIMAtCbNOJIUAw=;
 b=jZgqycJCEATmkq5E+gP8t9B6Q+nSyJGSHHlMg79tPV8OruOMcTHsZCBiK3773bfSes
 XcsSf2aJr3V+GHoBRKrG+TVDsLWmKJvMLDqdpoOh825CPPkea4LIEija1B/0JUmddnsV
 ir3loUJ6hHMbiqsqoBYQjWjbYrDz4Fu2txZwObQyR7YZ1lzFKMLaEsPJ62RYZl0n1AZB
 Sv5KakuNtCHagOWksjOHQD5c+laU/Re/T0hjwvbsdGtpQtUoiRCUwj/YU36cpc2PkqjV
 l37yCRL+R1HCt9442kGAguM3gvuuWa3kKLi0GknxastLAYsRCnJc1Ytwrt6K0/6RUeB/
 agdQ==
X-Gm-Message-State: ABy/qLZlikHnUr/Lxmd2FAYMLzPUgrAXbcvwwDQlkQaUmctzgIIcRY6t
 d8T0bpdokfl25WGZjeSY8idkt7G5EuGqSXk3eteEAu4iwmFxJg==
X-Google-Smtp-Source: APBJJlHqEdDIJK+crRcT4mqk3DawmWFIDANejxN/KDsEo2yaTAzwfBDRPs0ZVysmBgJXEnYgh+tG9cegtuZ6BUFvhvk=
X-Received: by 2002:a05:620a:414b:b0:766:fd9f:17af with SMTP id
 k11-20020a05620a414b00b00766fd9f17afmr15015222qko.31.1688955444879; Sun, 09
 Jul 2023 19:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-13-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:16:58 +1000
Message-ID: <CAKmqyKNwBFHFT-dUorTujKBspdnJP1+EnFg7ubQJBS+vCHCEEw@mail.gmail.com>
Subject: Re: [PATCH v9 12/20] target/riscv: add KVM specific MISA properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x729.google.com
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

On Thu, Jul 6, 2023 at 8:21=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Using all TCG user properties in KVM is tricky. First because KVM
> supports only a small subset of what TCG provides, so most of the
> cpu->cfg flags do nothing for KVM.
>
> Second, and more important, we don't have a way of telling if any given
> value is an user input or not. For TCG this has a small impact since we
> just validating everything and error out if needed. But for KVM it would
> be good to know if a given value was set by the user or if it's a value
> already provided by KVM. Otherwise we don't know how to handle failed
> kvm_set_one_regs() when writing the configurations back.
>
> These characteristics make it overly complicated to use the same user
> facing flags for both KVM and TCG. A simpler approach is to create KVM
> specific properties that have specialized logic, forking KVM and TCG use
> cases for those cases only. Fully separating KVM/TCG properties is
> unneeded at this point - in fact we want the user experience to be as
> equal as possible, regardless of the acceleration chosen.
>
> We'll start this fork with the MISA properties, adding the MISA bits
> that the KVM driver currently supports. A new KVMCPUConfig type is
> introduced. It'll hold general information about an extension. For MISA
> extensions we're going to use the newly created getters of
> misa_ext_infos[] to populate their name and description. 'offset' holds
> the MISA bit (RVA, RVC, ...). We're calling it 'offset' instead of
> 'misa_bit' because this same KVMCPUConfig struct will be used to
> multi-letter extensions later on.
>
> This new type also holds a 'user_set' flag. This flag will be set when
> the user set an option that's different than what is already configured
> in the host, requiring KVM intervention to write the regs back during
> kvm_arch_init_vcpu(). Similar mechanics will be implemented for
> multi-letter extensions as well.
>
> There is no need to duplicate more code than necessary, so we're going
> to use the existing kvm_riscv_init_user_properties() to add the KVM
> specific properties. Any code that is adding a TCG user prop is then
> changed slightly to verify first if there's a KVM prop with the same
> name already added.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c |  5 +++
>  target/riscv/kvm.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 35ba220c8f..5c8832a030 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1726,6 +1726,11 @@ static void riscv_cpu_add_misa_properties(Object *=
cpu_obj)
>          misa_cfg->name =3D riscv_get_misa_ext_name(bit);
>          misa_cfg->description =3D riscv_get_misa_ext_description(bit);
>
> +        /* Check if KVM already created the property */
> +        if (object_property_find(cpu_obj, misa_cfg->name)) {
> +            continue;
> +        }
> +
>          object_property_add(cpu_obj, misa_cfg->name, "bool",
>                              cpu_get_misa_ext_cfg,
>                              cpu_set_misa_ext_cfg,
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 4d0808cb9a..c55d0ec7ab 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -22,8 +22,10 @@
>  #include <linux/kvm.h>
>
>  #include "qemu/timer.h"
> +#include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "qapi/visitor.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/kvm_int.h"
> @@ -105,6 +107,81 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env,=
 uint64_t type,
>          } \
>      } while (0)
>
> +typedef struct KVMCPUConfig {
> +    const char *name;
> +    const char *description;
> +    target_ulong offset;
> +    int kvm_reg_id;
> +    bool user_set;
> +} KVMCPUConfig;
> +
> +#define KVM_MISA_CFG(_bit, _reg_id) \
> +    {.offset =3D _bit, .kvm_reg_id =3D _reg_id}
> +
> +/* KVM ISA extensions */
> +static KVMCPUConfig kvm_misa_ext_cfgs[] =3D {
> +    KVM_MISA_CFG(RVA, KVM_RISCV_ISA_EXT_A),
> +    KVM_MISA_CFG(RVC, KVM_RISCV_ISA_EXT_C),
> +    KVM_MISA_CFG(RVD, KVM_RISCV_ISA_EXT_D),
> +    KVM_MISA_CFG(RVF, KVM_RISCV_ISA_EXT_F),
> +    KVM_MISA_CFG(RVH, KVM_RISCV_ISA_EXT_H),
> +    KVM_MISA_CFG(RVI, KVM_RISCV_ISA_EXT_I),
> +    KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
> +};
> +
> +static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
> +                                     const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *misa_ext_cfg =3D opaque;
> +    target_ulong misa_bit =3D misa_ext_cfg->offset;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    bool value, host_bit;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    host_bit =3D env->misa_ext_mask & misa_bit;
> +
> +    if (value =3D=3D host_bit) {
> +        return;
> +    }
> +
> +    if (!value) {
> +        misa_ext_cfg->user_set =3D true;
> +        return;
> +    }
> +
> +    /*
> +     * Forbid users to enable extensions that aren't
> +     * available in the hart.
> +     */
> +    error_setg(errp, "Enabling MISA bit '%s' is not allowed: it's not "
> +               "enabled in the host", misa_ext_cfg->name);
> +}
> +
> +static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
> +        KVMCPUConfig *misa_cfg =3D &kvm_misa_ext_cfgs[i];
> +        int bit =3D misa_cfg->offset;
> +
> +        misa_cfg->name =3D riscv_get_misa_ext_name(bit);
> +        misa_cfg->description =3D riscv_get_misa_ext_description(bit);
> +
> +        object_property_add(cpu_obj, misa_cfg->name, "bool",
> +                            NULL,
> +                            kvm_cpu_set_misa_ext_cfg,
> +                            NULL, misa_cfg);
> +        object_property_set_description(cpu_obj, misa_cfg->name,
> +                                        misa_cfg->description);
> +    }
> +}
> +
>  static int kvm_riscv_get_regs_core(CPUState *cs)
>  {
>      int ret =3D 0;
> @@ -427,6 +504,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>          return;
>      }
>
> +    kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>
> --
> 2.41.0
>
>

