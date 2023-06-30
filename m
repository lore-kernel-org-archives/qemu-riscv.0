Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C4FEB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:42:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFAdY-00008u-Ux; Fri, 30 Jun 2023 05:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFAdX-000082-63
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:41:55 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFAdV-0005II-8B
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:41:54 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a04cb10465so1152490b6e.3
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688118110; x=1690710110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BgFC+Wn8GBmzBbkEB/AQvBBAaB8qMmyTNccJ018hoBY=;
 b=c8IXU/k6p15ju63La6vMIXYr/wYHrOSSRNdegp2fKB99SAQdcgWozYCLNf1lbJ3rvw
 whr/UvxytcSevbob02X7RTdogiuh72gRaSPy9za3uzqhkLlvG0ZyHu88lswjTm4l4YEw
 1CN5T6afeE+s4X7qacasFqEnHyC4itlxeYOFnoX1kQaGJBSLrNmgLPj67hCLF1g5Wx5K
 nJ5j/DvSs8qOq9ntfJ8X380f1mZDVXivHxtb+mlqm/d0HOTopp9H0pdKav0uJZtZ4weC
 ZOUE4JyMCsfn2U9GlvujEpWG1RX0UwzSmXGMnZ6O8iBSmPzHuOU7Z75ypFznVjE+BATI
 Eflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688118110; x=1690710110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BgFC+Wn8GBmzBbkEB/AQvBBAaB8qMmyTNccJ018hoBY=;
 b=JJ2jc9qkNkXzENC8bUvhXjXxp0mSMI8qZxnAKYmJ31TL9gf0JeqnXyFyXNHZtttPKO
 JmDdQF2iVZ3D8+Chtzp3mBENMuUwSWR25wQ8zgQkVaAfQ+d1LdnNLhvOZedSciO5NAeT
 F34j414+8wV/tdqshrMxiciHcNT//tmuJGKIfCdAGBS+VmIs1W/ZFbhiXKOHeCS2BPzE
 y29MzdXSb7C991jNYohkP3v+jJZkhNgvLEtkDUotU1AEJIOxLtDlSH1BWIltElu568OY
 wBdEfHIiQ2OrFrLXJpKlpA5Sbv63PsBgfNhRYgHOF49nVQ85gIDchVz/aJ05AqH6kk0q
 ZppA==
X-Gm-Message-State: AC+VfDyAg+moVXyR1cBFi/Ddk2uUBB77/MQD0APkCEtYhLhgvN/zGDt4
 hfiBlGFxeZOXBnLGD+YjzEmQcg==
X-Google-Smtp-Source: ACHHUZ5L+717GCplsZNC13Wm5Ybc7vhX3vyP2GIfE8H2GFMPHQEjGuyP532U0NAwu3yU1mRUdanhgg==
X-Received: by 2002:a05:6808:d4f:b0:3a1:df16:2f0b with SMTP id
 w15-20020a0568080d4f00b003a1df162f0bmr2560516oik.1.1688118110247; 
 Fri, 30 Jun 2023 02:41:50 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 i26-20020a54409a000000b003a1f444307esm3436700oii.58.2023.06.30.02.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 02:41:49 -0700 (PDT)
Message-ID: <bc2d6bb9-e3d9-4cfc-7fcb-7da2e245df00@ventanamicro.com>
Date: Fri, 30 Jun 2023 06:41:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 5/6] target/riscv: update APLIC and IMSIC to support
 KVM AIA
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Alistair Francis <alistair.francis@wdc.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
 <20230621145500.25624-6-yongxuan.wang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230621145500.25624-6-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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



On 6/21/23 11:54, Yong-Xuan Wang wrote:
> KVM AIA can't emulate APLIC only. When "aia=aplic" parameter is passed,
> APLIC devices is emulated by QEMU. For "aia=aplic-imsic", remove the
> mmio operations of APLIC when using KVM AIA and send wired interrupt
> signal via KVM_IRQ_LINE API.
> After KVM AIA enabled, MSI messages are delivered by KVM_SIGNAL_MSI API
> when the IMSICs receive mmio write requests.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aplic.c | 58 +++++++++++++++++++++++++++++++------------
>   hw/intc/riscv_imsic.c | 26 +++++++++++++++----
>   2 files changed, 63 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index afc5b54dbb..b1949636b6 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -31,6 +31,7 @@
>   #include "hw/irq.h"
>   #include "target/riscv/cpu.h"
>   #include "sysemu/sysemu.h"
> +#include "sysemu/kvm.h"
>   #include "migration/vmstate.h"
>   
>   #define APLIC_MAX_IDC                  (1UL << 14)
> @@ -148,6 +149,15 @@
>   
>   #define APLIC_IDC_CLAIMI               0x1c
>   
> +/*
> + * KVM AIA only supports APLIC.m, fallback to QEMU emulation if we want to use
> + * APLIC.w.
> + */
> +static bool is_kvm_aia(bool msimode)
> +{
> +    return kvm_irqchip_in_kernel() && msimode;
> +}
> +
>   static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
>                                               uint32_t word)
>   {
> @@ -471,6 +481,13 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
>       return topi;
>   }
>   
> +static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
> +{
> +    kvm_set_irq(kvm_state, irq, !!level);
> +
> +    return;
> +}
> +
>   static void riscv_aplic_request(void *opaque, int irq, int level)
>   {
>       bool update = false;
> @@ -801,29 +818,35 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
>       uint32_t i;
>       RISCVAPLICState *aplic = RISCV_APLIC(dev);
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
>           }
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
>       /*
>        * Only root APLICs have hardware IRQ lines. All non-root APLICs
>        * have IRQ lines delegated by their parent APLIC.
>        */
>       if (!aplic->parent) {
> -        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
> +        if (is_kvm_aia(aplic->msimode)) {
> +            qdev_init_gpio_in(dev, riscv_kvm_aplic_request, aplic->num_irqs);
> +        } else {
> +            qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
> +        }
>       }
>   
>       /* Create output IRQ lines for non-MSI mode */
> @@ -958,7 +981,10 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
>       qdev_prop_set_bit(dev, "mmode", mmode);
>   
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
> +    if (!is_kvm_aia(msimode)) {
> +        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +    }
>   
>       if (parent) {
>           riscv_aplic_add_child(parent, dev);
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index fea3385b51..00fdb60fc6 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -32,6 +32,7 @@
>   #include "target/riscv/cpu.h"
>   #include "target/riscv/cpu_bits.h"
>   #include "sysemu/sysemu.h"
> +#include "sysemu/kvm.h"
>   #include "migration/vmstate.h"
>   
>   #define IMSIC_MMIO_PAGE_LE             0x00
> @@ -283,6 +284,20 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
>           goto err;
>       }
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
>       /* Writes only supported for MSI little-endian registers */
>       page = addr >> IMSIC_MMIO_PAGE_SHIFT;
>       if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) == IMSIC_MMIO_PAGE_LE) {
> @@ -296,7 +311,6 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
>       riscv_imsic_update(imsic, page);
>   
>       return;
> -
>   err:
>       qemu_log_mask(LOG_GUEST_ERROR,
>                     "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
> @@ -320,10 +334,12 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>       CPUState *cpu = cpu_by_arch_id(imsic->hartid);
>       CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
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
>       memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
>                             imsic, TYPE_RISCV_IMSIC,

