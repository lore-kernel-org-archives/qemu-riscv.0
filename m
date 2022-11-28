Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozXK1-0000tg-Av
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 01:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ozXK0-0000tU-Ch; Mon, 28 Nov 2022 01:08:52 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ozXJy-0005nQ-Ff; Mon, 28 Nov 2022 01:08:52 -0500
Received: by mail-qt1-x82f.google.com with SMTP id cg5so6038124qtb.12;
 Sun, 27 Nov 2022 22:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UsGlqL+j6zt96CowIkRZCseL5j6oNE7VZv4retndg7s=;
 b=QuHDdOQ7XzZ9e4Vbg0t7VV6cmQWfr7qXdn8IJ7FbADNrjaLjLAkA3H3E8GjI9qcBRH
 17wJY0FfxX4tRiA4eBeqLgRkKrRzHMCc0nuMAp2daCDbUZnRkQVX1me6k4M/kx8RB1F6
 xngRNxVivhMHCOOQ5tICwYW4XjByRZKZ2x1Q4vFtaYZykdyAC8Q6HG603QUqNlWMxtd1
 uws0mITPTCPjopxW+v1OCptsMeijMvQk2X43BExNg4DdXr0GJvI/QrpeyEFLhjuLK4BM
 LH5Wp9GRvL8vYMF3W6RNigmKRiXg+qTpxx0Ni7Ba1hg1xj9DIwi3rNxbiP3/BcuY8xyy
 H6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UsGlqL+j6zt96CowIkRZCseL5j6oNE7VZv4retndg7s=;
 b=sXWf5FI3MHEouEGvXQvuc13KDJLNYwKtAjMuRBtIPn3/3tvj3iXRBniHiD4YKZ0smW
 g1tL9trrLYGBihKjOl7nQtqBa/j420Qvwqn47VkhLuN0DEQrq5es32bu8hiybTUtvozN
 m0bNs6ea5uiPt6cPk6oEEHWFpKHQz9jVm9ZfWaEMWzQR6UU3QaED5lC25Rl69AfP8/DP
 ftDnn71CXzzGbyqaiq5e6hdvC5RBTHs5UU4BmEXkmBUpaf4EzYIKfjBRzgEi0j0DsTc8
 no5QTvKjmXeqYgBpleVhOuxUDC7vaEAsGo8KbWwcH2H5EMnsZANkGW93CisSbV/ZnqyD
 aBMg==
X-Gm-Message-State: ANoB5plHxcnO+nb1Aa4SdORv/++FWFbfqSLTXH/aieWoH/Oz97Yu+/Zv
 yCByoX9CcMGfLy67h6/5LDCc24Np9Knmvq4OkXO0xg7e
X-Google-Smtp-Source: AA0mqf5/xl5D13UgUcII1tAYRouwbFLRQYfnEq+XU7oYi6d0LS20WXc0HP3j9GJpEDZzTHiTqqhaSJYpiX67G9ZK8IQ=
X-Received: by 2002:ac8:74d2:0:b0:3a5:26e0:ffc3 with SMTP id
 j18-20020ac874d2000000b003a526e0ffc3mr47495071qtr.391.1669615728586; Sun, 27
 Nov 2022 22:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20221125105954.149267-1-alexghiti@rivosinc.com>
In-Reply-To: <20221125105954.149267-1-alexghiti@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Nov 2022 14:08:38 +0800
Message-ID: <CAEUhbmWqxb9DTO2QTh6nCTt0xqLhqk3hmJ8STK5PQ9i42S6sgg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Add RISCVCPUConfig.satp_mode to set sv48, sv57,
 etc.
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@rivosinc.com>, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82f.google.com
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
X-List-Received-Date: Mon, 28 Nov 2022 06:08:52 -0000

On Fri, Nov 25, 2022 at 7:01 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
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
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>
> v2:
> - Use error_setg + return as suggested by Alistair
> - Add RB from Atish
> - Fixed checkpatch issues missed in v1
> - Replaced Ludovic email address with the rivos one
>
>  hw/riscv/virt.c    | 15 ++++++---------
>  target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  3 +++
>  target/riscv/csr.c |  8 ++++++--
>  4 files changed, 60 insertions(+), 11 deletions(-)
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

Missing sv_name free

>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..c86dc5058d 100644
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
> +            error_setg(errp, "Unknown option for satp_mode: %s",
> +                       cpu->cfg.satp_mode_str);
> +            return;
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
> index 5c9a7ee287..d2aab1627e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1109,10 +1109,14 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>
>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> +    vm &= 0xf;
> +
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        return valid_vm_1_10_32[vm & 0xf];
> +        return valid_vm_1_10_32[vm] &&
> +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      } else {
> -        return valid_vm_1_10_64[vm & 0xf];
> +        return valid_vm_1_10_64[vm] &&
> +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      }
>  }

Regards,
Bin

