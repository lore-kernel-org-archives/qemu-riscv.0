Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2DXW-0000U8-7K
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 10:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p2DXU-0000Tl-3R; Mon, 05 Dec 2022 10:37:52 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p2DXO-0003Fb-LC; Mon, 05 Dec 2022 10:37:51 -0500
Received: by mail-lj1-x22f.google.com with SMTP id n1so13964534ljg.3;
 Mon, 05 Dec 2022 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SZ1UB0w/0GI5pdNx99XAy+cevxVojoeNSLCm2at3RgI=;
 b=BiBK4Uc+DjokGg+r7VwA0/2+7SD9GuC9WWDx99nuW6jP1aleSLdpy37env98TXNaOs
 VOqDasYTgI2O7Be/ATBWqJ25beRpIOkNpyk9awIPT8fnnH8Vvn01RMzOhcsuKIosvaQb
 InMSPXTUssQa/pV6QQZVW+jE5OO2Y39wDL2KS1uSVIP93NJbwCCzPe9dcnlU+OoMX8+Z
 rqwrs5Hm300jpOHIaCoSD8YQedrWrVZnjGwK4+nQJvYR4qHg9fskJV0dzGgRSWDwYI3S
 fDPePyC6L4mIm+prfnPI9nWHytzLUA8poiJ8w/1XOWarCdU/9UsIT76jQ5CGX4HBiCgL
 m8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZ1UB0w/0GI5pdNx99XAy+cevxVojoeNSLCm2at3RgI=;
 b=cpvPcpvFpdObbfViGAtErrJy86CAb+uXDZXfdCSwfbniqRSVQqC9xZ3av68dTAOBbZ
 H17Z3vPYHJa+k+BIAcwZA/LaieOTo2BTFaJfld4ekk6c6Rfh3G2X1l7W8XBi4qNb+p/M
 iecK7qeTHrjpYGdOVodme70bbeJ/oQbiN/P+eFp3S7pLTJan1ADm8Gr6h62yYJ/K2sXa
 wzFthVLbABvTROpbGw8nIhJmxJWmLf/XEZxl7odHhsFwlzA4K879Kb3wuNJks+sHv/Hb
 +FHPf/innnV3FplMneDxO8meW1Ixy1cqrLJPouB1B+FtvSxoHigrAthpRUyusewOFUzj
 vRWQ==
X-Gm-Message-State: ANoB5pmwIjwX0N9pn5BDNQ7yub4ZOzZ79pwkW/iYOOR4wG+e/Khz/R5N
 iyxm4kR1blaPbTkT1M1g2IIEDwNE4o8+brgAjUc=
X-Google-Smtp-Source: AA0mqf7DRZcYtYqiKEw7w5vXMFUH9B4R76M8ZqjKP8HDIeOcyueLWMIVI5sjTPV9GWxRibpCwlFA+GFDTmX3g4/+OEo=
X-Received: by 2002:a2e:9002:0:b0:27a:618:1b34 with SMTP id
 h2-20020a2e9002000000b0027a06181b34mr751056ljg.99.1670254663861; Mon, 05 Dec
 2022 07:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20221205102509.504520-1-mchitale@ventanamicro.com>
 <20221205102509.504520-4-mchitale@ventanamicro.com>
In-Reply-To: <20221205102509.504520-4-mchitale@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Dec 2022 23:37:32 +0800
Message-ID: <CAEUhbmWVenRnAXoukBpZ1DEuj13znpMyv-F7S1_Gtga+rnWedA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/riscv: kvm: Support selecting VCPU
 extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 05 Dec 2022 15:37:52 -0000

On Mon, Dec 5, 2022 at 6:37 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Set the state of each ISA extension on the vcpu depending on what
> is set in the CPU property and what is allowed by KVM for that extension.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c       | 11 ++++-
>  target/riscv/kvm.c       | 88 ++++++++++++++++++++++++++++++++++------
>  target/riscv/kvm_riscv.h |  2 +-
>  3 files changed, 87 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8c8f085a80..4e0e96ce71 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1205,10 +1205,19 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str)
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

Use TARGET_FMT_lx for mhartid otherwise it will lose accuracy on
32-bit hosts for rv64.

> +                            "kvm does not support it", isa_edata_arr[i].name,
> +                            (unsigned long)cpu->env.mhartid);
> +#endif
> +                    continue;

incorrect indentation level

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

Use ARRAY_SIZE(isa_info_arr) otherwise if there is potential mismatch,
it will cause out-of-bound access

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

Please report the "ret" in the warning message too.

nits: remove ending .

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

Please report the "ret" in the warning message too.

nits: remove ending .

> +                *ext_state = !isa_ext_out;
> +            }
> +        }
> +        /*
> +         * If the sigle letter extension is supported by KVM then set

typo: sigle

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

Regards,
Bin

