Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouinW-0007sS-Sl
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouihh-0004sK-0a; Mon, 14 Nov 2022 18:17:25 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouQTD-00051S-GY; Sun, 13 Nov 2022 22:49:17 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id t14so10256387vsr.9;
 Sun, 13 Nov 2022 19:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tj0OglJFYBK6ir0ZAItWmnnVwojk+hPz9GAH8lBZy1w=;
 b=PvmHsEGdmk25aEM1blp/oppyKxnxT1/TTmxMYOgJ1MeeTuRBf8kecJJKKYpnQm1wjn
 KoRoBOx/R/SZBL9zY8cKkFslLvgePCr7c7JfFtQ8RyncaOhPKJl89sVsC+dRjWUvQVTO
 Oav8LhVeGBqhzsHKI3fAiOJmPo+R2cUbFEJ6zTRVDzl9Gsz0Ut+7/g1kamRGO3eKaJQ+
 +MlIViEU8jWdD9EmJGerAO0RHOCePf5DYJ+lI0HELGSyljbA6gWWf4DBOmSxL6VeEAKe
 6M7Z96aOM4m31ve6DVpoxf+s9OTukxrVh0GrkCXRBr3S6SgFysWrxB9woI1EzKBX0RnR
 LQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tj0OglJFYBK6ir0ZAItWmnnVwojk+hPz9GAH8lBZy1w=;
 b=vUWnsCfoNVVkNXCiUDz42dIBedFmjkab5wY57krvEoXFgplkemeTNAWaHL66wyMBwy
 Wko7eUWNf/VPGaAREDLaLciX4VX2Hb/uON36n89LUWlFHimEHipyCXuJk0ACazE2TRky
 3Af8Wqr8hvVoo4LqFvXmaTnAfDSuDwqd4PV58cN7kwJAbDmtfE8F+8PRXoRObfIjlEGm
 lej0DHjwWIKHCKno7Ghq6DLIWr80Bt8oDGjnr37Sl2bGAig5txJOSlfW9TCT2GNjmmap
 5G7Jkj4mOj0V8p5PfJHlezFVqCPlwPjz1IffHxACGZ5jWC3eM1kBxaVysr5CCIg7BSvx
 G1zQ==
X-Gm-Message-State: ANoB5pma42hxXFMULKPL/G+QfXdlNLbfkwiVhavo+QHtBRt7Ic/KX5DG
 PbHTO5W7EdHbZubJjTpKSVp3NQMJ29xifqIkCMZbZONjZl7zNQ==
X-Google-Smtp-Source: AA0mqf5djTgaRD+AW0QZiWsTOdCxT87uWSmdziuABCCDlo8sLns8Lxfti/wTjT/Fxj2sSpvWRxBa6aehZs0kNPneQfc=
X-Received: by 2002:a67:fb19:0:b0:3a6:fde0:cf74 with SMTP id
 d25-20020a67fb19000000b003a6fde0cf74mr4791379vsr.73.1668397753965; Sun, 13
 Nov 2022 19:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20221027054649.69228-1-mchitale@ventanamicro.com>
 <20221027054649.69228-4-mchitale@ventanamicro.com>
In-Reply-To: <20221027054649.69228-4-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 14 Nov 2022 13:48:47 +1000
Message-ID: <CAKmqyKOpCvVUwdaKDdTWw7kpw_xp2+iJAtCGd6EimDCTye_aEw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] target/riscv: kvm: Support selecting VCPU
 extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 14 Nov 2022 23:17:32 -0000

On Thu, Oct 27, 2022 at 3:53 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Set the state of each ISA extension on the vcpu depending on what
> is set in the CPU property and what is allowed by KVM for that extension.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c       | 11 ++++-
>  target/riscv/kvm.c       | 88 ++++++++++++++++++++++++++++++++++------
>  target/riscv/kvm_riscv.h |  2 +-
>  3 files changed, 87 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 35320a8547..e52577d59d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1191,10 +1191,19 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str)
>  {
>      char *old = *isa_str;
>      char *new = *isa_str;
> -    int i;
> +    int i, offset;
>
>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
> +            offset = isa_edata_arr[i].ext_enable_offset;
> +            if (kvm_enabled() && !kvm_riscv_ext_supported(offset)) {
> +#ifndef CONFIG_USER_ONLY
> +                info_report("disabling %s extension for hart 0x%lx because "
> +                            "kvm does not support it", isa_edata_arr[i].name,
> +                            (unsigned long)cpu->env.mhartid);
> +#endif
> +                    continue;
> +            }
>              if (isa_edata_arr[i].multi_letter) {
>                  if (cpu->cfg.short_isa_string) {
>                      continue;
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 30f21453d6..ea0715c9e4 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -42,6 +42,29 @@
>  #include "migration/migration.h"
>  #include "sysemu/runstate.h"
>
> +struct isa_ext_info {
> +    const char *name;
> +    target_ulong misa_bit;
> +    int ext_enable_offset;
> +};
> +
> +#define ISA_EXT_DATA_ENTRY(_name, _bit, _prop) \
> +    {#_name, _bit, offsetof(struct RISCVCPUConfig, _prop)}
> +
> +static const struct isa_ext_info isa_info_arr[] = {
> +    ISA_EXT_DATA_ENTRY(a, RVA, ext_a),
> +    ISA_EXT_DATA_ENTRY(c, RVC, ext_c),
> +    ISA_EXT_DATA_ENTRY(d, RVD, ext_d),
> +    ISA_EXT_DATA_ENTRY(f, RVF, ext_f),
> +    ISA_EXT_DATA_ENTRY(h, RVH, ext_h),
> +    ISA_EXT_DATA_ENTRY(i, RVI, ext_i),
> +    ISA_EXT_DATA_ENTRY(m, RVM, ext_m),
> +    ISA_EXT_DATA_ENTRY(svpbmt, 0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(sstc, 0, ext_sstc),
> +    ISA_EXT_DATA_ENTRY(svinval, 0, ext_svinval),
> +    ISA_EXT_DATA_ENTRY(zihintpause, 0, ext_zihintpause),
> +};
> +
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>                                   uint64_t idx)
>  {
> @@ -394,25 +417,66 @@ void kvm_arch_init_irq_routing(KVMState *s)
>  {
>  }
>
> +bool kvm_riscv_ext_supported(int offset)
> +{
> +    int i;
> +
> +    for (i = 0; i < KVM_RISCV_ISA_EXT_MAX; ++i) {
> +        if (isa_info_arr[i].ext_enable_offset == offset) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static void kvm_riscv_set_isa_ext(CPUState *cs, CPURISCVState *env)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    unsigned long isa_ext_out;
> +    bool *ext_state;
> +    uint64_t id;
> +    int i, ret;
> +
> +    env->misa_ext = 0;
> +    for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
> +        ext_state = (void *)&cpu->cfg + isa_info_arr[i].ext_enable_offset;
> +        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT, i);
> +        ret = kvm_get_one_reg(cs, id, &isa_ext_out);
> +        if (ret) {
> +            warn_report("Disabling ext %s due to failure.",
> +                        isa_info_arr[i].name);
> +            *ext_state = false;
> +            continue;
> +        }
> +        if (isa_ext_out != (*ext_state)) {
> +            isa_ext_out = *ext_state;
> +            ret = kvm_set_one_reg(cs, id, &isa_ext_out);
> +            if (ret) {
> +                warn_report("Could not %s ext %s.",
> +                            (isa_ext_out ? "enable" : "disable"),
> +                            isa_info_arr[i].name);
> +                *ext_state = !isa_ext_out;
> +            }
> +        }
> +        /*
> +         * If the sigle letter extension is supported by KVM then set
> +         * the corresponding misa bit for the guest vcpu.
> +         */
> +        if (isa_info_arr[i].misa_bit && (*ext_state)) {
> +            env->misa_ext |= isa_info_arr[i].misa_bit;
> +        }
> +    }
> +}
> +
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
> -    int ret = 0;
> -    target_ulong isa;
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> -    uint64_t id;
>
>      qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
>
> -    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> -                          KVM_REG_RISCV_CONFIG_REG(isa));
> -    ret = kvm_get_one_reg(cs, id, &isa);
> -    if (ret) {
> -        return ret;
> -    }
> -    env->misa_ext = isa;
> -
> -    return ret;
> +    kvm_riscv_set_isa_ext(cs, env);
> +    return 0;
>  }
>
>  int kvm_arch_msi_data_to_gsi(uint32_t data)
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index ed281bdce0..bdcccc0da4 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -21,5 +21,5 @@
>
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> -
> +bool kvm_riscv_ext_supported(int offset);
>  #endif
> --
> 2.34.1
>
>

