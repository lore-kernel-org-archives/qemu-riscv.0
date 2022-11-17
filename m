Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovomC-0002UO-CY
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 18:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ovomA-0002Ty-Kb
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 18:58:34 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ovom6-0004eq-5h
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 18:58:34 -0500
Received: by mail-oi1-x22f.google.com with SMTP id l127so3683271oia.8
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 15:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bCqTk7TcXULkTXWsEcW2EUD9lyDXvr12u5TzN2SDjy8=;
 b=bU/t+V0FsFRdltpX+p9sOEsRmcbdD69KPf35lISpsoZpufVAk23lcy0juVNOwLbY8V
 o68T2UNZaZFnj3fjAunGcsJEi/76DPBsC7uOOIH13PX/5u0EE9jDNLqewvzSHA5Zz96V
 gflZMye2HDXVTn7hk9Udi6KHt057MPKQnvRa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bCqTk7TcXULkTXWsEcW2EUD9lyDXvr12u5TzN2SDjy8=;
 b=a92dPGp9nOvu98NRaPmV0SDqWkL9cw76YTY7UYSEXF6VxLE4qfY6W2Iolv1cRn05NK
 DcAMx57Gnt1KdtM0pO/r/Zk3VEuAtpLyGP+5dCpjB5Tt+d9WvF7fNN1G5MTs+Fy86/Td
 nbtChpafXxZfFW/vR5c5Hqg0krQE1vBbVmop3HqOzcsDGkXFpCM+nieAY2MXDsuuXInQ
 sMfxrA375FaG78YDLCOiDivfCrzHrpPSGqOasNG+oBvLxF9lv8jSVtUedCGgqtFMRBn7
 vcQAXf2niG/ok0G1bze+dnzNACF+GmCNLt5ctDGzl7N5u8Hdd+Tykg5kSkKTJr8b7Gsy
 6jjQ==
X-Gm-Message-State: ANoB5pkonHvz87TiD+K08V75KVw/qGZmnjNujEX+yu3uBG4EYL3aCoDH
 TLIQ+WhqZBFkWGcq4Ni/aTcIoe7JUyUIY/tzj5yn
X-Google-Smtp-Source: AA0mqf5n9aTxdHG+IyX1Svyq/nKPup/72gcoAEmTUcAqyup+erHzQOBFTAb6bcZNlHvf+7QbydtwEKv6B6W3FfGjYHc=
X-Received: by 2002:a05:6808:f09:b0:354:8922:4a1a with SMTP id
 m9-20020a0568080f0900b0035489224a1amr2322692oiw.181.1668729507977; Thu, 17
 Nov 2022 15:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20221117072841.240839-1-alexghiti@rivosinc.com>
In-Reply-To: <20221117072841.240839-1-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 17 Nov 2022 15:58:17 -0800
Message-ID: <CAOnJCU+U-X-T_EsU8_jO8BPU43yCG76m3etofBhmTpGKQNHUBg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISCVCPUConfig.satp_mode to set sv48, sv57,
 etc.
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Ludovic Henry <git@ludovic.dev>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=atishp@atishpatra.org; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Thu, 17 Nov 2022 23:58:34 -0000

On Wed, Nov 16, 2022 at 11:29 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> RISC-V specifies multiple sizes for addressable memory and Linux probes for
> the machine's support at startup via the satp CSR register (done in
> csr.c:validate_vm).
>
> As per the specification, sv64 must support sv57, which in turn must
> support sv48...etc. So we can restrict machine support by simply setting the
> "highest" supported mode in the satp_mode property. And the bare mode is
> always supported.
>
> You can set this new property as follows:
> -cpu rv64,satp-mode=sv48 # Linux will boot using sv48 scheme
> -cpu rv64,satp-mode=sv39 # Linux will boot using sv39 scheme
>
> In addition, we now correctly set the device-tree entry 'mmu-type' using
> this new satp_mode property.
>
> Co-Developed-by: Ludovic Henry <git@ludovic.dev>
> Signed-off-by: Ludovic Henry <git@ludovic.dev>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  hw/riscv/virt.c    | 15 ++++++---------
>  target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  3 +++
>  target/riscv/csr.c |  6 ++++--
>  4 files changed, 58 insertions(+), 11 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b4..77484b5cae 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -228,7 +228,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name;
> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -236,14 +236,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    "riscv,none");
> -        }
> +
> +        sv_name = g_strdup_printf("riscv,%s",
> +                                  s->soc[socket].harts[cpu].cfg.satp_mode_str);
> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> +
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..efdb530ad9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -907,6 +907,48 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>  #endif
>
> +    /*
> +     * Either a cpu sets its supported satp_mode in XXX_cpu_init
> +     * or the user sets this value using satp_mode property.
> +     */
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +    if (cpu->cfg.satp_mode_str) {
> +        if (!g_strcmp0(cpu->cfg.satp_mode_str, "none"))
> +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv32") && rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV32;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv39") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV39;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv48") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV48;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv57") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV57;
> +        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv64") && !rv32)
> +            cpu->cfg.satp_mode = VM_1_10_SV64;
> +        else {
> +            error_report("Unknown option for satp_mode: %s",
> +                         cpu->cfg.satp_mode_str);
> +            exit(EXIT_FAILURE);
> +        }
> +    } else {
> +        /*
> +         * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
> +         * or sv57 for 64-bit when a MMU is present, and bare otherwise.
> +         */
> +        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> +            if (rv32) {
> +                cpu->cfg.satp_mode_str = g_strdup("sv32");
> +                cpu->cfg.satp_mode = VM_1_10_SV32;
> +            } else {
> +                cpu->cfg.satp_mode_str = g_strdup("sv57");
> +                cpu->cfg.satp_mode = VM_1_10_SV57;
> +            }
> +        } else {
> +            cpu->cfg.satp_mode_str = g_strdup("none");
> +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> +        }
> +    }
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>      qemu_init_vcpu(cs);
> @@ -1094,6 +1136,9 @@ static Property riscv_cpu_properties[] = {
>
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +
> +    DEFINE_PROP_STRING("satp-mode", RISCVCPU, cfg.satp_mode_str),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a9e25053f..a6c229470b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -480,6 +480,9 @@ struct RISCVCPUConfig {
>      bool debug;
>
>      bool short_isa_string;
> +
> +    uint8_t satp_mode;
> +    char *satp_mode_str;
>  };
>
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c9a7ee287..d26b830f1a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1109,10 +1109,12 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>
>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> +    vm &= 0xf;
> +
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        return valid_vm_1_10_32[vm & 0xf];
> +        return valid_vm_1_10_32[vm] && (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      } else {
> -        return valid_vm_1_10_64[vm & 0xf];
> +        return valid_vm_1_10_64[vm] && (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      }
>  }
>
> --
> 2.37.2
>
>
LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

