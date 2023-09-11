Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4687EE57DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 07:53:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfbjF-0004OY-5r; Mon, 11 Sep 2023 03:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qfbjE-0004OG-5l
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 03:53:04 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qfbjB-00009Z-Or
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 03:53:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401d24f1f27so47020745e9.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Sep 2023 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694418780; x=1695023580; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=phlYOETUxpS8A4VuWQQDPlEGK5X3O5JBnH7916aaiLQ=;
 b=Dn70/uKHYMkzG8LZjYOhfywYLyMDmXgCxEPA9izgjIR7YqMW28gCBrSbrvNakZFQrL
 1JGu631Evn4Hc43cNkz8f6Dkab+Rx+0IIRtojnIZoyw/fq4gkUtnMeRLJEYOXgeBnJpC
 tNHuI1Qy6V9VrN3R64o40UwEVkjqD4kPMpdWfYmkbq0JxjGelLemvKXd8dhAkUmg9Wlv
 HEOXY7uTJ7NTEjZpc70R2kKAw8bxLZEYS5oHGsa5FiDhoQVmfth54lCHy9lvSKYbRDnv
 wLNEZ4sMky50dSfahEDTXDm/6F5cy9vUiyLwmZFlv9WLc0AJGOEgIMRtn7Fqz55+6oh1
 8HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694418780; x=1695023580;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phlYOETUxpS8A4VuWQQDPlEGK5X3O5JBnH7916aaiLQ=;
 b=AdH0vqHRc2nLZGGB/Y+uXdJln5Dl4iIvKm0R9Y8uVaxJRYFs+9UQZms8pjae77ieIx
 eyn0SXrQBTYKrfBgJthDfF3ayB2XjCJCOs4OzL5P9E0q4gmbHZXMknZwCM0MLMVV7Q1n
 YAPrJPVQJCPU8PNxw12s2n2iHt6pIeBAow35mKSQY8+sPCnDio6DAYYiEaI3LafIuunx
 JIE3gtRrobsjxZoQo6d8Wl1Ta4pG1Ulx7OZ/yFJ0OAOflHSLUTkOddw9O3OmLMd85dPz
 3EnPmb08aQvp1HHM//gG8PUjofjY+wuHJ7PBfgpVLhsjk9LABDIQvYLHsR2DPpWwsItZ
 xQPg==
X-Gm-Message-State: AOJu0YxZcGjd1zHHeJdTcV1Amw8kx8Sjd/71ZsPI0I3Sx7e/95gdiKc5
 0zyxcYcz2i+w4+4H43URJuJEAg==
X-Google-Smtp-Source: AGHT+IEegxIcqz6JS2eyskhdGlLJv4fmt4Dc7A5A2ZlFdktHI7IQik5NVNGwNduQ3QRXAOBRyURf4w==
X-Received: by 2002:a1c:7716:0:b0:3fb:b248:67c with SMTP id
 t22-20020a1c7716000000b003fbb248067cmr7806077wmi.22.1694418779605; 
 Mon, 11 Sep 2023 00:52:59 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c471200b004030e8ff964sm3001794wmo.34.2023.09.11.00.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 00:52:59 -0700 (PDT)
Date: Mon, 11 Sep 2023 09:52:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v2 11/19] target/riscv: introduce KVM AccelCPUClass
Message-ID: <20230911-5e64cfe746f0dbd010bd60e9@orel>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-12-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906091647.1667171-12-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Sep 06, 2023 at 06:16:38AM -0300, Daniel Henrique Barboza wrote:
> Add a KVM accelerator class like we did with TCG. The difference is
> that, at least for now, we won't be using a realize() implementation for
> this accelerator.
> 
> We'll start by assiging kvm_riscv_cpu_add_kvm_properties(), renamed to
> kvm_cpu_instance_init(), as a 'cpu_instance_init' implementation. Change
> riscv_cpu_post_init() to invoke accel_cpu_instance_init(), which will go
> through the 'cpu_instance_init' impl of the current acceleration (if
> available) and execute it. The end result is that the KVM initial setup,
> i.e. starting registers and adding its specific properties, will be done
> via this hook.
> 
> Add a 'tcg_enabled()' condition in riscv_cpu_post_init() to avoid
> calling riscv_cpu_add_user_properties() when running KVM. We'll remove
> this condition when the TCG accel class get its own 'cpu_instance_init'
> implementation.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c       |  8 +++-----
>  target/riscv/kvm.c       | 26 ++++++++++++++++++++++++--
>  target/riscv/kvm_riscv.h |  6 ------
>  3 files changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 50be127f36..c8a19be1af 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1219,7 +1219,9 @@ static bool riscv_cpu_has_user_properties(Object *cpu_obj)
>  
>  static void riscv_cpu_post_init(Object *obj)
>  {
> -    if (riscv_cpu_has_user_properties(obj)) {
> +    accel_cpu_instance_init(CPU(obj));
> +
> +    if (tcg_enabled() && riscv_cpu_has_user_properties(obj)) {
>          riscv_cpu_add_user_properties(obj);
>      }
>  
> @@ -1589,10 +1591,6 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>  static void riscv_cpu_add_user_properties(Object *obj)
>  {
>  #ifndef CONFIG_USER_ONLY
> -    if (kvm_enabled()) {
> -        kvm_riscv_cpu_add_kvm_properties(obj);
> -        return;
> -    }
>      riscv_add_satp_mode_properties(obj);
>  #endif
>  
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index ef6b2cfffe..492b97d19b 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -31,6 +31,7 @@
>  #include "sysemu/kvm_int.h"
>  #include "cpu.h"
>  #include "trace.h"
> +#include "hw/core/accel-cpu.h"
>  #include "hw/pci/pci.h"
>  #include "exec/memattrs.h"
>  #include "exec/address-spaces.h"
> @@ -1274,8 +1275,9 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>  }
>  
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> +static void kvm_cpu_instance_init(CPUState *cs)
>  {
> +    Object *obj = OBJECT(RISCV_CPU(cs));
>      DeviceState *dev = DEVICE(obj);
>  
>      riscv_init_user_properties(obj);
> @@ -1287,7 +1289,7 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
>      riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
>  
>      for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
> -        /* Check if KVM created the property already */
> +        /* Check if we have a specific KVM handler for the option */
>          if (object_property_find(obj, prop->name)) {
>              continue;
>          }
> @@ -1295,6 +1297,26 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
>      }
>  }
>  
> +static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> +
> +    acc->cpu_instance_init = kvm_cpu_instance_init;
> +}
> +
> +static const TypeInfo kvm_cpu_accel_type_info = {
> +    .name = ACCEL_CPU_NAME("kvm"),
> +
> +    .parent = TYPE_ACCEL_CPU,
> +    .class_init = kvm_cpu_accel_class_init,
> +    .abstract = true,
> +};
> +static void kvm_cpu_accel_register_types(void)
> +{
> +    type_register_static(&kvm_cpu_accel_type_info);
> +}
> +type_init(kvm_cpu_accel_register_types);
> +
>  static void riscv_host_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index c9ecd9a967..8fe6e3e6fb 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -20,7 +20,6 @@
>  #define QEMU_KVM_RISCV_H
>  
>  #ifdef CONFIG_KVM
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>  void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> @@ -29,11 +28,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                            uint64_t guest_num);
>  void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>  #else
> -static inline void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> -{
> -    g_assert_not_reached();
> -}
> -
>  static inline void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>  {
>      g_assert_not_reached();
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

