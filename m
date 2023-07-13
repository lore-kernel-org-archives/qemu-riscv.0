Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565FAEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 09:36:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJskd-0004Qp-Vb; Thu, 13 Jul 2023 05:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qJskc-0004QE-OZ
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 05:36:42 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qJska-00086u-RR
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 05:36:42 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b70bfc8db5so6552411fa.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689240999; x=1691832999;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DnqOGtMbUybzYXNNEiUJ2lUCWcqOCGWVPCl4WonSRms=;
 b=ltWamSs606+x+tu5bpb9jKWGE6Tx4J+Evk3uRY7j64up/aS0BZtJkbGC55p7NxvEkf
 WGtsdY8uoyG9UbbWexq+c/soXRnkEg6OUrkyz+3sOIvmQVOZU+7xsZ9rRehYHv05hJvw
 WU5/+A6wckEkZ3jtKXdL12bBtAGu26lJi9zYJSbxw5F8M6YozwISw7juQfI5tsa8rteA
 5PwW6uMGCVKDH4sIDJf+zwDDlxkJbyojuJduEl7h+/FJLhMe84UfkX1US5ZLO3cdvftb
 JYezAZvzMzNIMBQSvCWkUQMSjUjtFWKYgSudzS4KOgtUXKw0yvAlZT/0OrUkOI3dwjKq
 51nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689240999; x=1691832999;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnqOGtMbUybzYXNNEiUJ2lUCWcqOCGWVPCl4WonSRms=;
 b=c38NvzoYG14bkV06P3tM5JQ2ZOwF1VrxzVco/mwkX0g16LnTpebFQM+M4r6eLVUOU0
 9CuQYZqgSlpZonuq1yOCyl+FCj2NZ/Sqr1B7FIpqrykurWRoREFlPjHTIBIg6z9/UVgn
 KhEWwM2zmvRr+j0yfASCEyCSeA6eqw2X19BH1KtJB/RsoEfrIbhnEiTBjPUGxfz7bkmW
 CEAUu4gQCWUxx/HfoWh9L4wQo3UbWwZOdLrswT/gdOLoEgLpVa8lCEE8NK3p+aq4Ti0K
 fNR8sj9VkLcv6CCNUBxc1VIU14uhG+zIgYZ7LR90eL81bgzSIyY9eJKTfF56rq9Z+mKv
 AeVQ==
X-Gm-Message-State: ABy/qLZ4CXsPaX7pXnaG513U9rDrEto1rbEOhQ804g6cM6lhQvA40HmI
 NM+lrOxM3a1XwuS/eGXx3Bnf6w==
X-Google-Smtp-Source: APBJJlE7mABvpfEwzlK0wiBB3C/JO2huIm8KKuk9N3ImcWBXDjWnQi4gpRaV6WIrNXB42fgqYBXqBw==
X-Received: by 2002:a2e:a318:0:b0:2b6:ce35:2e9e with SMTP id
 l24-20020a2ea318000000b002b6ce352e9emr867017lje.44.1689240998829; 
 Thu, 13 Jul 2023 02:36:38 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ov15-20020a170906fc0f00b0099364d9f0e6sm3748389ejb.117.2023.07.13.02.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 02:36:38 -0700 (PDT)
Date: Thu, 13 Jul 2023 11:36:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PATCH v5 3/5] target/riscv: Create an KVM AIA irqchip
Message-ID: <20230713-71df3bff303a42341f4d3687@orel>
References: <20230713084405.24545-1-yongxuan.wang@sifive.com>
 <20230713084405.24545-4-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713084405.24545-4-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x22d.google.com
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

On Thu, Jul 13, 2023 at 08:43:55AM +0000, Yong-Xuan Wang wrote:
> We create a vAIA chip by using the KVM_DEV_TYPE_RISCV_AIA and then set up
> the chip with the KVM_DEV_RISCV_AIA_GRP_* APIs.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c       | 160 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/kvm_riscv.h |   6 ++
>  2 files changed, 166 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 005e054604..64156c15ec 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -36,6 +36,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
>  #include "hw/irq.h"
> +#include "hw/intc/riscv_imsic.h"
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_riscv.h"
> @@ -43,6 +44,7 @@
>  #include "chardev/char-fe.h"
>  #include "migration/migration.h"
>  #include "sysemu/runstate.h"
> +#include "hw/riscv/numa.h"
>  
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>                                   uint64_t idx)
> @@ -1026,3 +1028,161 @@ bool kvm_arch_cpu_check_are_resettable(void)
>  void kvm_arch_accel_class_init(ObjectClass *oc)
>  {
>  }
> +
> +char *kvm_aia_mode_str(uint64_t aia_mode)
> +{
> +    const char *val;
> +
> +    switch (aia_mode) {
> +    case KVM_DEV_RISCV_AIA_MODE_EMUL:
> +        return "emul";
> +    case KVM_DEV_RISCV_AIA_MODE_HWACCEL:
> +        return "hwaccel";
> +    case KVM_DEV_RISCV_AIA_MODE_AUTO:
> +    default:
> +        return "auto";
> +    };
> +}
> +
> +void kvm_riscv_aia_create(MachineState *machine,
> +                          uint64_t aia_mode, uint64_t group_shift,
> +                          uint64_t aia_irq_num, uint64_t aia_msi_num,
> +                          uint64_t aplic_base, uint64_t imsic_base,
> +                          uint64_t guest_num)
> +{
> +    int ret, i;
> +    int aia_fd = -1;
> +    uint64_t default_aia_mode;
> +    uint64_t socket_count = riscv_socket_count(machine);
> +    uint64_t max_hart_per_socket = 0;
> +    uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
> +    uint64_t socket_bits, hart_bits, guest_bits;
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
> +                            &default_aia_mode, false, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to get current KVM AIA mode");
> +        exit(1);
> +    }
> +    qemu_log("KVM AIA: default mode is %s\n",
> +             kvm_aia_mode_str(default_aia_mode));
> +
> +    if (default_aia_mode != aia_mode) {
> +        ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                                KVM_DEV_RISCV_AIA_CONFIG_MODE,
> +                                &aia_mode, true, NULL);
> +        if (ret < 0)
> +            warn_report("KVM AIA: failed to set KVM AIA mode");
> +        else
> +            qemu_log("KVM AIA: set current mode to %s\n",
> +                     kvm_aia_mode_str(aia_mode));
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_SRCS,
> +                            &aia_irq_num, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to set number of input irq lines");
> +        exit(1);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
> +                            &aia_msi_num, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to set number of msi");
> +        exit(1);
> +    }
> +
> +    socket_bits = find_last_bit(&socket_count, BITS_PER_LONG) + 1;
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_BITS,
> +                            &socket_bits, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to set group_bits");
> +        exit(1);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_SHIFT,
> +                            &group_shift, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to set group_shift");
> +        exit(1);
> +    }
> +
> +    guest_bits = guest_num == 0 ? 0 :
> +                 find_last_bit(&guest_num, BITS_PER_LONG) + 1;
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_GUEST_BITS,
> +                            &guest_bits, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to set guest_bits");
> +        exit(1);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
> +                            KVM_DEV_RISCV_AIA_ADDR_APLIC,
> +                            &aplic_base, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to set the base address of APLIC");
> +        exit(1);
> +    }
> +
> +    for (socket = 0; socket < socket_count; socket++) {
> +        socket_imsic_base = imsic_base + socket * (1U << group_shift);
> +        hart_count = riscv_socket_hart_count(machine, socket);
> +        base_hart = riscv_socket_first_hartid(machine, socket);
> +
> +        if (max_hart_per_socket < hart_count) {
> +            max_hart_per_socket = hart_count;
> +        }
> +
> +        for (i = 0; i < hart_count; i++) {
> +            imsic_addr = socket_imsic_base + i * IMSIC_HART_SIZE(guest_bits);
> +            ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
> +                                    KVM_DEV_RISCV_AIA_ADDR_IMSIC(i + base_hart),
> +                                    &imsic_addr, true, NULL);
> +            if (ret < 0) {
> +                error_report("KVM AIA: failed to set the address of IMSICs");

Maybe not worth respinning for, but I'd probably include the hart index in
this output

 error_report("KVM AIA: failed to set the IMSIC address for hart %d", i);

> +                exit(1);
> +            }
> +        }
> +    }
> +
> +    hart_bits = find_last_bit(&max_hart_per_socket, BITS_PER_LONG) + 1;
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_HART_BITS,
> +                            &hart_bits, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to set hart_bits");
> +        exit(1);
> +    }
> +
> +    if (kvm_has_gsi_routing()) {
> +        for (uint64_t idx = 0; idx < aia_irq_num + 1; ++idx) {
> +            /* KVM AIA only has one APLIC instance */
> +            kvm_irqchip_add_irq_route(kvm_state, idx, 0, idx);
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
> +
> +    kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
> +}
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index e3ba935808..c6745dd29a 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -22,5 +22,11 @@
>  void kvm_riscv_init_user_properties(Object *cpu_obj);
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> +char *kvm_aia_mode_str(uint64_t aia_mode);
> +void kvm_riscv_aia_create(MachineState *machine,
> +                          uint64_t aia_mode, uint64_t group_shift,
> +                          uint64_t aia_irq_num, uint64_t aia_msi_num,
> +                          uint64_t aplic_base, uint64_t imsic_base,
> +                          uint64_t guest_num);
>  
>  #endif
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

