Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE6CEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGijl-0003Rd-CB; Tue, 04 Jul 2023 12:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qGijj-0003R3-U4
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 12:18:43 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qGijh-0005bI-3B
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 12:18:43 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so265040266b.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Jul 2023 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688487518; x=1691079518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oKLkCx4tl/A8o0iGgphfIMHOV/endOUf6B1yYvUPffc=;
 b=F48s1OLKW5okY1L4gRgCvHf2f5ZeVH5LYPppZpwvtRAFTUT/qR6+N/JQxIythyjS7K
 ZXzkZvRQNI9XETDOGNSgGq/JNXOtc7pPsrTnCPMxhCmjgui7p4lDCGbabmW6c489jjr7
 AZ2PjekF+qx0C5rFZ7g5hfCAwRmSbZ306Oe54HbqeN6xXkADLDvS9/ZEpuwpQjn6IDuz
 bo2CldSulanJIKjuWLACBacnQZ99AQQ31VQi7kLSw56JY5rCH+nkYZRUaMhdQsfm116J
 2z/ADarooHMzTS31p5DGgFwyXJg7tA8VDiwP0voYzuDXnaS6jyE+5qze4yKdpanbDVmn
 D2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688487518; x=1691079518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKLkCx4tl/A8o0iGgphfIMHOV/endOUf6B1yYvUPffc=;
 b=hXphRMweLYa85eRgwWSjnoVr47Wfbgs7WFz2rXhNEowUu0G3z6ZPYn13QMMhq5Q9mj
 cxKoOgGUCOg6bGlhDvArEBBI+j7f1mA8jrW46z87TRqEoRhYMZYbwcc6CRWpjYpEEXWk
 4jAp2RG7ZXM4MxC4+PYpkswMzZdlBjsOTfWA5nSO2tPBUv4z2pjmT9rRos8iM2G6EMOi
 C7zHYygiwPWKxIFGc2U69Z18PSLPJrc26dbdY28//u+9PDN3I4yYOZIrI2Bu3LpgJNTh
 wcaE1FEKVMmue4JlfLNBh+SbIsgcNIlBSiRaum+VeDWyMrgYCKeSRGX1lsWXw5bJpwHt
 jGsg==
X-Gm-Message-State: ABy/qLaoQlak/DY/kihKw24ADEIfaRuWIWETH9ru83CYT985hhmGOwyQ
 KEdRwcPSOpFktJG/lUMlCUfLvA==
X-Google-Smtp-Source: APBJJlESQiipaDalgP/FrECOMBmz+5wY8Vy99lmeQhdnAo2fEZ8H4KrLVnz+kv/SQvV4tIPm9eLovQ==
X-Received: by 2002:a17:906:6846:b0:979:65f0:cd12 with SMTP id
 a6-20020a170906684600b0097965f0cd12mr10334901ejs.15.1688487517897; 
 Tue, 04 Jul 2023 09:18:37 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 kt19-20020a170906aad300b009894b476310sm13570990ejb.163.2023.07.04.09.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:18:37 -0700 (PDT)
Date: Tue, 4 Jul 2023 18:18:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Alistair Francis <alistair.francis@wdc.com>, 
 Ivan Klokov <ivan.klokov@syntacore.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH v4 5/6] target/riscv: update APLIC and IMSIC to support
 KVM AIA
Message-ID: <20230704-ffe89ca7f752270ceb1a6d5c@orel>
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
 <20230621145500.25624-6-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621145500.25624-6-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 21, 2023 at 02:54:55PM +0000, Yong-Xuan Wang wrote:
> KVM AIA can't emulate APLIC only.

I think you mean "KVM AIA can't emulate the APLIC alone." ?

> When "aia=aplic" parameter is passed,
> APLIC devices is emulated by QEMU. For "aia=aplic-imsic", remove the
> mmio operations of APLIC when using KVM AIA and send wired interrupt
> signal via KVM_IRQ_LINE API.
> After KVM AIA enabled, MSI messages are delivered by KVM_SIGNAL_MSI API
> when the IMSICs receive mmio write requests.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/intc/riscv_aplic.c | 58 +++++++++++++++++++++++++++++++------------
>  hw/intc/riscv_imsic.c | 26 +++++++++++++++----
>  2 files changed, 63 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index afc5b54dbb..b1949636b6 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -31,6 +31,7 @@
>  #include "hw/irq.h"
>  #include "target/riscv/cpu.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/kvm.h"
>  #include "migration/vmstate.h"
>  
>  #define APLIC_MAX_IDC                  (1UL << 14)
> @@ -148,6 +149,15 @@
>  
>  #define APLIC_IDC_CLAIMI               0x1c
>  
> +/*
> + * KVM AIA only supports APLIC.m, fallback to QEMU emulation if we want to use
> + * APLIC.w.

I assume APLIC.m and APLIC.w mean "APLIC MSI" and "APLIC Wired". Can you
please spell that out?

> + */
> +static bool is_kvm_aia(bool msimode)
> +{
> +    return kvm_irqchip_in_kernel() && msimode;
> +}
> +
>  static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
>                                              uint32_t word)
>  {
> @@ -471,6 +481,13 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
>      return topi;
>  }
>  
> +static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
> +{
> +    kvm_set_irq(kvm_state, irq, !!level);
> +
> +    return;

Unnecessary 'return'

> +}
> +
>  static void riscv_aplic_request(void *opaque, int irq, int level)
>  {
>      bool update = false;
> @@ -801,29 +818,35 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
>      uint32_t i;
>      RISCVAPLICState *aplic = RISCV_APLIC(dev);
>  
> -    aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
> -    aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
> -    aplic->state = g_new0(uint32_t, aplic->num_irqs);
> -    aplic->target = g_new0(uint32_t, aplic->num_irqs);
> -    if (!aplic->msimode) {
> -        for (i = 0; i < aplic->num_irqs; i++) {
> -            aplic->target[i] = 1;
> +    if (!is_kvm_aia(aplic->msimode)) {
> +        aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
> +        aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
> +        aplic->state = g_new0(uint32_t, aplic->num_irqs);
> +        aplic->target = g_new0(uint32_t, aplic->num_irqs);
> +        if (!aplic->msimode) {
> +            for (i = 0; i < aplic->num_irqs; i++) {
> +                aplic->target[i] = 1;
> +            }
>          }
> -    }
> -    aplic->idelivery = g_new0(uint32_t, aplic->num_harts);
> -    aplic->iforce = g_new0(uint32_t, aplic->num_harts);
> -    aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
> +        aplic->idelivery = g_new0(uint32_t, aplic->num_harts);
> +        aplic->iforce = g_new0(uint32_t, aplic->num_harts);
> +        aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
>  
> -    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, aplic,
> -                          TYPE_RISCV_APLIC, aplic->aperture_size);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
> +        memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops,
> +                             aplic, TYPE_RISCV_APLIC, aplic->aperture_size);
> +        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
> +    }
>  
>      /*
>       * Only root APLICs have hardware IRQ lines. All non-root APLICs
>       * have IRQ lines delegated by their parent APLIC.
>       */
>      if (!aplic->parent) {
> -        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
> +        if (is_kvm_aia(aplic->msimode)) {
> +            qdev_init_gpio_in(dev, riscv_kvm_aplic_request, aplic->num_irqs);
> +        } else {
> +            qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
> +        }
>      }
>  
>      /* Create output IRQ lines for non-MSI mode */
> @@ -958,7 +981,10 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
>      qdev_prop_set_bit(dev, "mmode", mmode);
>  
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
> +    if (!is_kvm_aia(msimode)) {
> +        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +    }
>  
>      if (parent) {
>          riscv_aplic_add_child(parent, dev);
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index fea3385b51..00fdb60fc6 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -32,6 +32,7 @@
>  #include "target/riscv/cpu.h"
>  #include "target/riscv/cpu_bits.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/kvm.h"
>  #include "migration/vmstate.h"
>  
>  #define IMSIC_MMIO_PAGE_LE             0x00
> @@ -283,6 +284,20 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
>          goto err;
>      }
>  
> +#if defined(CONFIG_KVM)
> +    if (kvm_irqchip_in_kernel()) {
> +        struct kvm_msi msi;
> +
> +        msi.address_lo = extract64(imsic->mmio.addr + addr, 0, 32);
> +        msi.address_hi = extract64(imsic->mmio.addr + addr, 32, 32);
> +        msi.data = le32_to_cpu(value);
> +
> +        kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
> +
> +        return;
> +    }
> +#endif
> +
>      /* Writes only supported for MSI little-endian registers */
>      page = addr >> IMSIC_MMIO_PAGE_SHIFT;
>      if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) == IMSIC_MMIO_PAGE_LE) {
> @@ -296,7 +311,6 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
>      riscv_imsic_update(imsic, page);
>  
>      return;
> -

Stray line removal. IMO it's better to leave it.

>  err:
>      qemu_log_mask(LOG_GUEST_ERROR,
>                    "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
> @@ -320,10 +334,12 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>      CPUState *cpu = cpu_by_arch_id(imsic->hartid);
>      CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>  
> -    imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
> -    imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
> -    imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
> -    imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
> +    if (!kvm_irqchip_in_kernel()) {
> +        imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
> +        imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
> +        imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
> +        imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
> +    }
>  
>      memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
>                            imsic, TYPE_RISCV_IMSIC,
> -- 
> 2.17.1
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

