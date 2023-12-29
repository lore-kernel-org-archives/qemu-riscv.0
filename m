Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E5C46CD3
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 11:24:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJAxh-0005cr-ER; Fri, 29 Dec 2023 06:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJAxg-0005cX-6k; Fri, 29 Dec 2023 06:23:32 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJAxV-0000Ar-8H; Fri, 29 Dec 2023 06:23:31 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 647AFC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703848980;
 bh=Qo/2XjpqJZK1TJJYaUzI1Bm+eOVgGVW77/m4nRms5Ys=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
 b=cEqxc/RAgs+x1aEjZ+ItEJVuN+GGYVj4ysddnTZCjst9PnowuNop5TmsiU5HwM1Hl
 3g1edl/23cRC68OZ+0L5QjfEdsk1/Ow/NkrH2AYYMiIQPelh6mSgSI6uSlOyKWW718
 j059T+OGHVPY0aCYeNqn6XxKDs/r5kX+eS2nbi8KjBwK02bioYV7KmdaspgTQyDGC5
 Qzis+tjFALajsV+T8OKwtxPfyS6X+CIR7s5QNWGz+GVTjOGMNitLIxDzP7N14H4wlM
 mzENXbdBgUTA5rLl7L6I2VE1ywJ0fe/nagx2zqQ9vO/+hmStYT49iz3afYD3E1r439
 7fTxMmBeGs78Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703848980;
 bh=Qo/2XjpqJZK1TJJYaUzI1Bm+eOVgGVW77/m4nRms5Ys=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
 b=a/vZvnKu857wqTh8nL8lOt4ZxktvnOgrGGMk72lmH6ktvKRdmtyBlU3c6m6CK8xCh
 wkmlqMsim/hEuPNjhOp59dohbE3ftnnzGHJBuQ525o73BaIoU0riREK+cLlr1hfhhz
 XMU/ruHyEhdebsBfm8kBgsIgU1diH0k0qiOvWluvuvADEF26TwZlOjJ0aH8kF553Cr
 bnDCuEX5mHDRh+bImtw3BgfLCIKr0xB719L+dMl5Y3mZhy3Qmilrs/4ZGhvBdI4aAU
 8DtDLhoVXIwfKkL7Z872aIe+SXB8LNoJ3I3bmaEZZHI6lcJErpXfQ2dKxK/N0qzoi0
 1Xo4iSdhwWilg==
Message-ID: <1905a7c9-b59f-4392-9a27-74c292668856@syntacore.com>
Date: Fri, 29 Dec 2023 14:22:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: Re: [PATCH v2 10/16] target/riscv: create finalize_features() for KVM
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <bmeng@tinylab.org>, 
 <liwei1518@gmail.com>, <zhiwei_liu@linux.alibaba.com>,
 <palmer@rivosinc.com>, <ajones@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
 <20231222122235.545235-11-dbarboza@ventanamicro.com>
Content-Language: en-US, ru-RU
In-Reply-To: <20231222122235.545235-11-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: T-EXCH-09.corp.yadro.com (172.17.11.59) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=vladimir.isaev@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

22.12.2023 15:22, Daniel Henrique Barboza wrote:
> To turn cbom_blocksize and cboz_blocksize into class properties we need
> KVM specific changes.
> 
> KVM is creating its own version of these options with a customized
> setter() that prevents users from picking an invalid value during init()
> time. This comes at the cost of duplicating each option that KVM
> supports. This will keep happening for each new shared option KVM
> implements in the future.
> 
> We can avoid that by using the same property TCG uses and adding
> specific KVM handling during finalize() time, like TCG already does with
> riscv_tcg_cpu_finalize_features(). To do that, the common CPU property
> offers a way of knowing if an option was user set or not, sparing us
> from doing unneeded syscalls.
> 
> riscv_kvm_cpu_finalize_features() is then created using the same
> KVMScratch CPU we already use during init() time, since finalize() time
> is still too early to use the official KVM CPU for it. cbom_blocksize
> and cboz_blocksize are then handled during finalize() in the same way
> they're handled by their KVM specific setter.
> 
> With this change we can proceed with the blocksize changes in the common
> code without breaking the KVM driver.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c           | 16 +++++++---
>  target/riscv/cpu.h           |  1 +
>  target/riscv/kvm/kvm-cpu.c   | 59 ++++++++++++++++++++++++++++++++++++
>  target/riscv/kvm/kvm_riscv.h |  1 +
>  4 files changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8be619b6f1..f49d31d753 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -63,6 +63,11 @@ static void cpu_option_add_user_setting(const char *optname, uint32_t value)
>                          GUINT_TO_POINTER(value));
>  }
> 
> +bool riscv_cpu_option_set(const char *optname)
> +{
> +    return g_hash_table_contains(general_user_opts, optname);
> +}
> +

This function may work in unexpected way for future developer since we can check just somehow restricted
number of options using it, like vlen/elen/cbom/cboz size, but not vext_spec or pmu-num/mask.

>  #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>      {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
> 
> @@ -1056,17 +1061,18 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>  {
>      Error *local_err = NULL;
> 
> -    /*
> -     * KVM accel does not have a specialized finalize()
> -     * callback because its extensions are validated
> -     * in the get()/set() callbacks of each property.
> -     */
>      if (tcg_enabled()) {
>          riscv_tcg_cpu_finalize_features(cpu, &local_err);
>          if (local_err != NULL) {
>              error_propagate(errp, local_err);
>              return;
>          }
> +    } else if (kvm_enabled()) {
> +        riscv_kvm_cpu_finalize_features(cpu, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
>      }
> 
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 53101b82c5..988471c7ba 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -495,6 +495,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          bool probe, uintptr_t retaddr);
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
> +bool riscv_cpu_option_set(const char *optname);
> 
>  #define cpu_list riscv_cpu_list
>  #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 62a1e51f0a..70fb075846 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1490,6 +1490,65 @@ static void kvm_cpu_instance_init(CPUState *cs)
>      }
>  }
> 
> +void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    KVMScratchCPU kvmcpu;
> +    struct kvm_one_reg reg;
> +    uint64_t val;
> +    int ret;
> +
> +    /* short-circuit without spinning the scratch CPU */
> +    if (!cpu->cfg.ext_zicbom && !cpu->cfg.ext_zicboz) {
> +        return;
> +    }
> +
> +    if (!kvm_riscv_create_scratch_vcpu(&kvmcpu)) {
> +        error_setg(errp, "Unable to create scratch KVM cpu");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zicbom &&
> +        riscv_cpu_option_set(kvm_cbom_blocksize.name)) {
> +
> +        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
> +                                        kvm_cbom_blocksize.kvm_reg_id);
> +        reg.addr = (uint64_t)&val;
> +        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret != 0) {
> +            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
> +            return;
> +        }
> +
> +        if (cpu->cfg.cbom_blocksize != val) {
> +            error_setg(errp, "Unable to set cbom_blocksize to a different "
> +                       "value than the host (%lu)", val);
> +            return;
> +        }
> +    }
> +
> +    if (cpu->cfg.ext_zicboz &&
> +        riscv_cpu_option_set(kvm_cboz_blocksize.name)) {
> +
> +        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
> +                                        kvm_cboz_blocksize.kvm_reg_id);
> +        reg.addr = (uint64_t)&val;
> +        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret != 0) {
> +            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
> +            return;
> +        }
> +
> +        if (cpu->cfg.cboz_blocksize != val) {
> +            error_setg(errp, "Unable to set cboz_blocksize to a different "
> +                       "value than the host (%lu)", val);
> +            return;
> +        }
> +    }
> +
> +    kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
> +}
> +
>  static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>  {
>      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> index 8329cfab82..4bd98fddc7 100644
> --- a/target/riscv/kvm/kvm_riscv.h
> +++ b/target/riscv/kvm/kvm_riscv.h
> @@ -27,5 +27,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                            uint64_t guest_num);
>  void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>  int kvm_riscv_sync_mpstate_to_kvm(RISCVCPU *cpu, int state);
> +void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
> 
>  #endif
> --
> 2.43.0
> 
> 

