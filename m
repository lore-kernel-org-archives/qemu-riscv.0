Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E68EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:40:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFAc6-0007Be-FP; Fri, 30 Jun 2023 05:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFAc4-0007Av-Ov
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:40:24 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFAc2-0004wd-UO
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:40:24 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5634db21a58so1103087eaf.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688118021; x=1690710021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NYp1hcFtgX7WNbxKorlpjCFpKcBSALVGo1SsXkYlX08=;
 b=PP3dstgwgOGIeuNCyTzr3Hz1iSL0j7Q2vHISTqPdnXmNRQhfgBvoGvcW9S46IP1HQ4
 tG8hVvHcysjr1KfaOGIVSBKaGrD/wCQ2CP/o41hH0poXctNxa1u63XacqIcxKNCNktnt
 g4Em5JAq4PuDaIoBA03YV3JOC1B9bDjw6gBrrOg3QnkbXtXPdoHwzbBz6ZkIZuyN4xsJ
 9ToTj/twP10HseHFh6Ydz/iqF21qPgv1xF0RPCrzjsWMacBxAs4T17xa9E+mXEwntiMD
 BujfyGfmtSCcfLAmz5oUTGBGH5JNbDUQxzFcQ8hx6dzYOnzMwZcqK7snMHSBNCCog0+f
 2SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688118021; x=1690710021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NYp1hcFtgX7WNbxKorlpjCFpKcBSALVGo1SsXkYlX08=;
 b=Na+/j1E9D7vHDyvAakaZOV6BMoC80on/N3dH9dUQsrSp13at2zVl/796pDfSI1Mt5d
 IjAFJmUEx6vQUp6bRdbF3GHwMF9WMMRO0EbWYRLg57o1XQshBrTdoJr9VM/h8ycUuXOb
 GPdpiGCRV2tftI0SDIPPiE72UIHOhkpoLhpSXM4KuvcI4nk6xHY0jk2m0MZYsiVnVOqZ
 Zwzo+YEQVwkcTRVthzbV681rsRgIJcAOoQhfczWfFRk57L+ItSj0+VNvPLfZJx4VW8Bn
 ZrIFBsCO21sPV8a3MNx+YmJSMalX/ZrF3+pEBpPatE0dtSNAAUtEuv3jNhjectb4ew9V
 TXlg==
X-Gm-Message-State: AC+VfDyTiNhE5k0Fi+64KFZ3UGcpV9CebI/8c89Ox3xC4jfnygJI4tRV
 FH89HnXT8BSfaOwe9pWkQOHJlw==
X-Google-Smtp-Source: ACHHUZ5gKAQw6Y5xGv2QyvJJt0bAbxvMyp6HdVUKtLpCf21TFhgqo8lC9xYyunX93m/nN4LZC09L6w==
X-Received: by 2002:a05:6808:23c6:b0:3a1:e3d9:17ed with SMTP id
 bq6-20020a05680823c600b003a1e3d917edmr2476349oib.51.1688118021703; 
 Fri, 30 Jun 2023 02:40:21 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056808048e00b003a3645e9ebbsm2437501oid.40.2023.06.30.02.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 02:40:21 -0700 (PDT)
Message-ID: <14a9a851-f9d1-e73f-ff80-1f6b0e272447@ventanamicro.com>
Date: Fri, 30 Jun 2023 06:40:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/6] target/riscv: Create an KVM AIA irqchip
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
 <20230621145500.25624-5-yongxuan.wang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230621145500.25624-5-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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



On 6/21/23 11:54, Yong-Xuan Wang wrote:
> implement a function to create an KVM AIA chip
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/kvm.c       | 163 +++++++++++++++++++++++++++++++++++++++
>   target/riscv/kvm_riscv.h |   6 ++
>   2 files changed, 169 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index eb469e8ca5..3dd8467031 100644
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
> @@ -41,6 +42,7 @@
>   #include "chardev/char-fe.h"
>   #include "migration/migration.h"
>   #include "sysemu/runstate.h"
> +#include "hw/riscv/numa.h"
>   
>   static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>                                    uint64_t idx)
> @@ -548,3 +550,164 @@ bool kvm_arch_cpu_check_are_resettable(void)
>   void kvm_arch_accel_class_init(ObjectClass *oc)
>   {
>   }
> +
> +char *kvm_aia_mode_str(uint64_t aia_mode)
> +{
> +    const char *val;
> +
> +    switch (aia_mode) {
> +    case KVM_DEV_RISCV_AIA_MODE_EMUL:
> +        val = "emul";
> +        break;
> +    case KVM_DEV_RISCV_AIA_MODE_HWACCEL:
> +        val = "hwaccel";
> +        break;
> +    case KVM_DEV_RISCV_AIA_MODE_AUTO:
> +    default:
> +        val = "auto";
> +        break;
> +    };
> +
> +    return g_strdup(val);
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
> +        error_report("KVM AIA: fail to get current KVM AIA mode");
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
> +            warn_report("KVM AIA: fail to set KVM AIA mode");
> +        else
> +            qemu_log("KVM AIA: set current mode to %s\n",
> +                     kvm_aia_mode_str(aia_mode));
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_SRCS,
> +                            &aia_irq_num, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set number of input irq lines");
> +        exit(1);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
> +                            &aia_msi_num, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set number of msi");
> +        exit(1);
> +    }
> +
> +    socket_bits = find_last_bit(&socket_count, BITS_PER_LONG) + 1;
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_BITS,
> +                            &socket_bits, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set group_bits");
> +        exit(1);
> +    }
> +
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_SHIFT,
> +                            &group_shift, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set group_shift");
> +        exit(1);
> +    }
> +
> +    guest_bits = guest_num == 0 ? 0 :
> +                 find_last_bit(&guest_num, BITS_PER_LONG) + 1;
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_GUEST_BITS,
> +                            &guest_bits, true, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: fail to set guest_bits");
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
> +                error_report("KVM AIA: fail to set the address of IMSICs");
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
> +        error_report("KVM AIA: fail to set hart_bits");
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
> +}
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index ed281bdce0..a61f552d1d 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -21,5 +21,11 @@
>   
>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> +char *kvm_aia_mode_str(uint64_t aia_mode);
> +void kvm_riscv_aia_create(MachineState *machine,
> +                          uint64_t aia_mode, uint64_t group_shift,
> +                          uint64_t aia_irq_num, uint64_t aia_msi_num,
> +                          uint64_t aplic_base, uint64_t imsic_base,
> +                          uint64_t guest_num);
>   
>   #endif

