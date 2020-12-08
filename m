Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlRC-0001tp-Jp
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlQz-0001qf-61; Tue, 08 Dec 2020 17:26:16 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:45500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlQw-0002A6-Ai; Tue, 08 Dec 2020 17:26:12 -0500
Received: by mail-il1-x142.google.com with SMTP id p5so13230859ilm.12;
 Tue, 08 Dec 2020 14:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nvhw8YEQnOsEM2ufhYf0GgAhv/pW4JqRL5UjftTmw/M=;
 b=Uk/uAhvDfDJ6t8g9F+k+Ym93eLV7KgNWSRxWsITG+//MbDS7Bvjp2gDIWzwvLe8v5i
 D+gsKBUZRuCf3BY3tPSipbj3tu0WkVgH01BM5NuuJWa6Y2m+AG/41las8TjwAbL9kbc6
 rdZmx9kIcDXAJoJ0fsTVQnGaDwnkQMLKMup/fPYFBmCsXoBf+TIEXya4cl6RfD5l28/E
 kb0qPZsBGXfkbaKIdSxCSdCivvcrzVGKnTMXOxKKa2ZPtNG+90VOc1yX8+/Z5VKTnKH3
 /IUehixTPLx5r7i3L22p2hnT3bpQb8tdVx08mD2KINndVwo/XKnfuAcQu30B8rycWVWY
 3cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nvhw8YEQnOsEM2ufhYf0GgAhv/pW4JqRL5UjftTmw/M=;
 b=C63xbc1o13KwQq/BUqnjLbBQEJ3sAgKgAiZHi9ZeNi1let9I3dCKHRz/xeI2kc1MJn
 B1l727BczimNqWdIW519IdpETsErutXYC+NVptafNg5N9xRaPCiLBpKb8z0TjVCdVJao
 st9Pme74ecRdxi8wXoBa/Yc8nKpGxC74gQ9B/dBkMm8Cw11k+tycMPkGXSITXZV2cw7M
 SruCj/vyBfnG86EsxFu5WmG1xd2iP5eptFDRLQJL7y09nCGIujuZe87duceMIkjFL+z3
 BjxPAcsEM3Xukv+rVkxz+3Acw2US/AcLEZVy5UQ0sORJc6wYiY0Q04PJX9vpBVmkkCPM
 74Bg==
X-Gm-Message-State: AOAM533+mGlyzBoRYf7IB2da2xwPEuLfemII2riqlWda5Ud63CltocEO
 GIg7osiZKTZg8IIBtjQVwlPo2rZC2iCOti4PUZU=
X-Google-Smtp-Source: ABdhPJxZ7foBcYZvriR58kHDDcy8oEOtSu1qfXVNDS4FT7lPq7QmetodLQ2vF7NhQaRUyaleZyeYKebiC+4U/shGAHI=
X-Received: by 2002:a92:490d:: with SMTP id w13mr23827ila.227.1607466368027;
 Tue, 08 Dec 2020 14:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20201203124703.168-1-jiangyifei@huawei.com>
 <20201203124703.168-14-jiangyifei@huawei.com>
In-Reply-To: <20201203124703.168-14-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Dec 2020 14:25:41 -0800
Message-ID: <CAKmqyKM5m3_w6=Jd+EdTatY9G0YBm1mFjh+5FodnVmFfKydyZw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 13/15] target/riscv: Introduce dynamic time
 frequency for virt machine
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 "dengkai (A)" <dengkai1@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Dec 2020 22:26:16 -0000

On Thu, Dec 3, 2020 at 4:57 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Currently, time base frequency was fixed as SIFIVE_CLINT_TIMEBASE_FREQ.
> Here introduce "time-frequency" property to set time base frequency dynamically
> of which default value is still SIFIVE_CLINT_TIMEBASE_FREQ. The virt machine
> uses frequency of the first cpu to create clint and fdt.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  hw/riscv/virt.c    | 18 ++++++++++++++----
>  target/riscv/cpu.c |  3 +++
>  target/riscv/cpu.h |  2 ++
>  3 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 47b7018193..788a7237b6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -178,7 +178,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
>  }
>
>  static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> -    uint64_t mem_size, const char *cmdline)
> +    uint64_t mem_size, const char *cmdline, uint64_t timebase_frequency)
>  {
>      void *fdt;
>      int i, cpu, socket;
> @@ -225,7 +225,7 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -                          SIFIVE_CLINT_TIMEBASE_FREQ);
> +                          timebase_frequency);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> @@ -510,6 +510,7 @@ static void virt_machine_init(MachineState *machine)
>      target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
> +    uint64_t timebase_frequency = 0;
>      DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
>      int i, j, base_hartid, hart_count;
>      CPUState *cs;
> @@ -553,12 +554,20 @@ static void virt_machine_init(MachineState *machine)
>                                  hart_count, &error_abort);
>          sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
>
> +        if (!timebase_frequency) {
> +            timebase_frequency = RISCV_CPU(first_cpu)->env.frequency;
> +        }
> +        /* If vcpu's time frequency is not specified, we use default frequency */
> +        if (!timebase_frequency) {
> +            timebase_frequency = SIFIVE_CLINT_TIMEBASE_FREQ;
> +        }
> +
>          /* Per-socket CLINT */
>          sifive_clint_create(
>              memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
>              memmap[VIRT_CLINT].size, base_hartid, hart_count,
>              SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> -            SIFIVE_CLINT_TIMEBASE_FREQ, true);
> +            timebase_frequency, true);
>
>          /* Per-socket PLIC hart topology configuration string */
>          plic_hart_config_len =
> @@ -610,7 +619,8 @@ static void virt_machine_init(MachineState *machine)
>          main_mem);
>
>      /* create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> +               timebase_frequency);
>
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 439dc89ee7..66f35bcbbf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -494,6 +494,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
> +    env->user_frequency = env->frequency;
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>
> @@ -531,6 +533,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +    DEFINE_PROP_UINT64("time-frequency", RISCVCPU, env.frequency, 0),

Why not set the default to SIFIVE_CLINT_TIMEBASE_FREQ?

Also, QEMU now has a clock API, is using that instead a better option?

Alistair

>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 16d6050ead..f5b6c34176 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -243,6 +243,8 @@ struct CPURISCVState {
>      uint64_t kvm_timer_time;
>      uint64_t kvm_timer_compare;
>      uint64_t kvm_timer_state;
> +    uint64_t user_frequency;
> +    uint64_t frequency;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> --
> 2.19.1
>
>

