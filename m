Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcFX4-0002a9-V1
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 19:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcFX2-0002Zv-Ew; Sun, 17 Oct 2021 19:25:32 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcFX0-0005mW-RA; Sun, 17 Oct 2021 19:25:32 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d9so6092734pfl.6;
 Sun, 17 Oct 2021 16:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=swPSbS9Ll6thHBuAAIIk/olqL6ik3JwRXaZAwKVUQxc=;
 b=Is13soCpa6U2wAYAeqMBEu3q7ICsxdlXT+2R0Wt0n8L7XDT7V/ADovMS9KwBeMXnSr
 UmNChurT6Rx7J6lIbpNaBv9zj+qDjpF8LGNzLAW45QIdfQrOKmkv5zdseUQLoQ6C4oc7
 6GxLbQuGaYUBU6dVws5oaJEAnJ6ONhq9pMoVpJo5GQh64gotUKiM5cZwYJNjHESE559N
 hDlcO6JpVuFIPZ3NgiTEq18dpKwmNO+YGeJNdlhjikho90P6wIaDjIx/fHEC0Szo1OsQ
 jb+VpXUAiO4u+ZLbg0ILojeOjVOMmexOchrhy9YbKqqXG5MnJKvZ/asF1YQVWJSiwLLP
 HfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=swPSbS9Ll6thHBuAAIIk/olqL6ik3JwRXaZAwKVUQxc=;
 b=oAhGngSJdyl8NSMigVXc8hLApQ+nL7P9M+sV9MhoW/rKpWHtXrLhWN4l1hizMjclmP
 uc5Msrq5I3mPrSslyCsMkHf1BnCpFPANyThmMWmMuQd7axKrlLpFfmWZCP7FhtYzN887
 zro6yV3ypxjnThKKj4rmFN0Lrpn0edae39rBqEl+NcCE0TPeiOQ0GGHtrHwPlE2Q3iiz
 JDC0q9l5lsy3Kpqb4GxsCZVXW3FfcSkAmu/EbzYOxLq3NeopxRj5Tj/E0PG+kVIB0H+O
 kS9XSGQPkJtv1+/S1RmQ6LXmUq8mOJqVod7dPTZTMyq0IW0B073OYdageQwHsUPmMav/
 CqcA==
X-Gm-Message-State: AOAM531DE8X585o/Uw9gTyWIoeOeY9xAfLIM4hJVXoLMlJhNhjyHYRGf
 uBCKWSrm7QW8K2em7Fpy2niiHQdR/rybvjRREEk=
X-Google-Smtp-Source: ABdhPJwAAuIvZHrzmYZh0qAi9omO3op+1jmbw7iIvDfPDRoQOJijP4vxEhI4eU8kDCvrAjeQUkIDKeeAxLB3Jhkl8q0=
X-Received: by 2002:a63:7355:: with SMTP id d21mr8572625pgn.179.1634513128713; 
 Sun, 17 Oct 2021 16:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211016030908.40480-1-limingwang@huawei.com>
In-Reply-To: <20211016030908.40480-1-limingwang@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 09:25:02 +1000
Message-ID: <CAKmqyKOJ8xb7gYtRL6MWitR9EtewPosnQbwELPoxjy4S5nJe5Q@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Use machine->ram as the system memory
To: MingWang Li <limingwang@huawei.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>, 
 wanghaibin.wang@huawei.com, fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 23:25:32 -0000

On Sat, Oct 16, 2021 at 1:09 PM MingWang Li <limingwang@huawei.com> wrote:
>
> From: Mingwang Li <limingwang@huawei.com>
>
> If default main_mem is used to be registered as the system memory,
> other memory cannot be initialized. Therefore, the system memory
> should be initialized to the machine->ram, which consists of the
> default main_mem and other possible memory required by applications,
> such as shared hugepage memory in DPDK.
>
> Also, the mc->defaul_ram_id should be set to the default main_mem,
> such as "riscv_virt_board.ram" for the virt machine.
>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/virt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ec0cb69b8c..b3b431c847 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -771,7 +771,6 @@ static void virt_machine_init(MachineState *machine)
>      const MemMapEntry *memmap = virt_memmap;
>      RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      char *plic_hart_config, *soc_name;
>      target_ulong start_addr = memmap[VIRT_DRAM].base;
> @@ -890,10 +889,8 @@ static void virt_machine_init(MachineState *machine)
>      }
>
>      /* register system main memory (actual RAM) */
> -    memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
> -                           machine->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
> -        main_mem);
> +        machine->ram);
>
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> @@ -1032,6 +1029,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported = true;
> +    mc->default_ram_id = "riscv_virt_board.ram";
>
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>
> --
> 2.19.1
>
>

