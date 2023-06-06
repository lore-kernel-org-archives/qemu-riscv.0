Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3C8C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 13:46:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6X0i-0007PE-D2; Tue, 06 Jun 2023 09:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6X0c-0007ON-Cr
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 09:46:02 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6X0a-0008SH-L9
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 09:46:02 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-39b86f95a66so1034834b6e.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686059159; x=1688651159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=itnC8pZM051W8Bgsl1usZo+NiqwRO3BOc/xPpYs/5bw=;
 b=EftOc5G3Pi6Ek+s0bjnh4Ve8UO2OhD/mPsb2xHvkVDtxBBsLfSi2xnOpKGbAPgGOrv
 S6QeNWflsdFv64bNNDVg8lqStN5/4bWe1YHr1NWcM4BRs5ieHF0jhi1AEXeLTA9gCcSG
 qlmR85+x4T2g6hFDzXNrfuvYTEkkSsVDCt+W9x59xRKi5e7OpJOQhANIfCSgWN95J+D3
 eyE8/CM0S2L1ByXwEjznVZJqxfMnfeUW0DI51PV9UqZeRf55H/l/wGAORxQuUravQ42v
 Lm2/ggBaELfkSALqirU85n4qBmPjkZSNaAbAkIEaVI4KKmVtJpQYCkvay3SRY4pyTE8d
 EOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686059159; x=1688651159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itnC8pZM051W8Bgsl1usZo+NiqwRO3BOc/xPpYs/5bw=;
 b=DgbiX2/aDoXZVsEw38Dl1WyKHD9J6tUOYdrNucFbUBAMuK1z/+MHwKSOiUuI5f/4pa
 3veaCCW/4D4Gv43ScOfRGMDvwc/4H1nsyV29DXuX2l2TG7aNwxbFc5JN7JWT7EKhYAxb
 s976GxhMLYmh11yyMKJXYsQv+3NVdHKvry/ChmmafdnY3ycjSxQHVTPvvZBl6frR6q7n
 WcNtzWhvuqNWuEogc3c4Phet38Pm14HS/ZIkbSFl94MuMoCwllW7/tOiOqDrF8J68PAo
 bAgI+hV4m0e42M8G67nbIl3kYfsFe4SfKPfHRPVhJ8uADk1a4kS5IOtTFZIJJwJ7a4nA
 hotQ==
X-Gm-Message-State: AC+VfDxsWvNrol8ZWUSiM4N8ZF+iPWut+afEesXOPipxV+cCgLk4wqsS
 rnTZs1x3Jldtx1frGo8NlRf6nQ==
X-Google-Smtp-Source: ACHHUZ7BiSKxVxnyhl5fKgvFGlkIlTbVdAE3sGePptPLlhsY1EjYMTnAGdlAAR6r/OXqA3hqz/euEQ==
X-Received: by 2002:a54:4715:0:b0:398:4336:4342 with SMTP id
 k21-20020a544715000000b0039843364342mr1499735oik.33.1686059158697; 
 Tue, 06 Jun 2023 06:45:58 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 y126-20020aca3284000000b0038cff7034c0sm4521181oiy.27.2023.06.06.06.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 06:45:58 -0700 (PDT)
Message-ID: <a715b6d1-d28a-1e04-34c5-5d6c1fb2696e@ventanamicro.com>
Date: Tue, 6 Jun 2023 10:45:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/6] target/riscv: Create an KVM AIA irqchip
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, rkanwal@rivosinc.com, anup@brainfault.org,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
References: <20230526062509.31682-1-yongxuan.wang@sifive.com>
 <20230526062509.31682-5-yongxuan.wang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230526062509.31682-5-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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



On 5/26/23 03:25, Yong-Xuan Wang wrote:
> implement a function to create an KVM AIA chip
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>   target/riscv/kvm.c       | 83 ++++++++++++++++++++++++++++++++++++++++
>   target/riscv/kvm_riscv.h |  3 ++
>   2 files changed, 86 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index eb469e8ca5..ead121154f 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -34,6 +34,7 @@
>   #include "exec/address-spaces.h"
>   #include "hw/boards.h"
>   #include "hw/irq.h"
> +#include "hw/intc/riscv_imsic.h"
>   #include "qemu/log.h"
>   #include "hw/loader.h"
>   #include "kvm_riscv.h"
> @@ -548,3 +549,85 @@ bool kvm_arch_cpu_check_are_resettable(void)
>   void kvm_arch_accel_class_init(ObjectClass *oc)
>   {
>   }
> +
> +void kvm_riscv_aia_create(DeviceState *aplic_s, bool msimode, int socket,
> +                          uint64_t aia_irq_num, uint64_t hart_count,
> +                          uint64_t aplic_base, uint64_t imsic_base)
> +{
> +    int ret;
> +    int aia_fd = -1;
> +    uint64_t aia_mode;
> +    uint64_t aia_nr_ids;
> +    uint64_t aia_hart_bits = find_last_bit(&hart_count, BITS_PER_LONG) + 1;
> +
> +    if (!msimode) {
> +        error_report("Currently KVM AIA only supports aplic_imsic mode");
> +        exit(1);
> +    }
> +
> +    aia_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_RISCV_AIA, false);
> +
> +    if (aia_fd < 0) {
> +        error_report("Unable to create in-kernel irqchip");
> +        exit(1);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_MODE,
> +                            &aia_mode, false, NULL);
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
> +                            &aia_nr_ids, false, NULL);
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_SRCS,
> +                            &aia_irq_num, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set number input irq lines");
> +        exit(1);
> +    }

I see that you didn't check 'ret' for the first 2 calls of kvm_device_access().
Is it intentional?

Since you're setting customized error messages for every step I think it's worth
also handling the case where we fail to set aia_mode and aia_nr_ids.


Thanks,


Daniel


> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_HART_BITS,
> +                            &aia_hart_bits, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set number of harts");
> +        exit(1);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
> +                            KVM_DEV_RISCV_AIA_ADDR_APLIC,
> +                            &aplic_base, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set the base address of APLIC");
> +        exit(1);
> +    }
> +
> +    for (int i = 0; i < hart_count; i++) {
> +        uint64_t imsic_addr = imsic_base + i * IMSIC_HART_SIZE(0);
> +        ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
> +                                KVM_DEV_RISCV_AIA_ADDR_IMSIC(i),
> +                                &imsic_addr, true, NULL);
> +        if (ret < 0) {
> +            error_report("KVM AIA: fail to set the base address of IMSICs");
> +            exit(1);
> +        }
> +    }
> +
> +    if (kvm_has_gsi_routing()) {
> +        for (uint64_t idx = 0; idx < aia_irq_num + 1; ++idx) {
> +            kvm_irqchip_add_irq_route(kvm_state, idx, socket, idx);
> +        }
> +        kvm_gsi_routing_allowed = true;
> +        kvm_irqchip_commit_routes(kvm_state);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CTRL,
> +                            KVM_DEV_RISCV_AIA_CTRL_INIT,
> +                            NULL, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: initialized fail");
> +        exit(1);
> +    }
> +}
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index 606968a4b7..6067adff51 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -21,6 +21,9 @@
>   
>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> +void kvm_riscv_aia_create(DeviceState *aplic_s, bool msimode, int socket,
> +                          uint64_t aia_irq_num, uint64_t hart_count,
> +                          uint64_t aplic_base, uint64_t imsic_base);
>   
>   #define KVM_DEV_RISCV_AIA_GRP_CONFIG            0
>   #define KVM_DEV_RISCV_AIA_CONFIG_MODE           0

