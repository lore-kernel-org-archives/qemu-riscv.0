Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mafRA-000801-HI
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 10:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mafR5-0007zf-5U; Wed, 13 Oct 2021 10:40:51 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mafR2-0005Xb-Io; Wed, 13 Oct 2021 10:40:50 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id s64so6907713yba.11;
 Wed, 13 Oct 2021 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XlzF+VUaE63wYF0uLpR2sbsrI8q8iRkUCxXQWzsIv0=;
 b=nM8r2HgpfCPMNb6+uV9wxIDiC+mO+RWUfDKayZdUu09WGK643FCcTKCUtkREk5WAX9
 wNIDLcEm00kG51E792hi02r0iVf59pgtbxqnjMeIBcRuom1P5DGaJV6j+tZNJHh/pHgi
 dVUJkkj2HGUdwBt/rrkRIPyAr4+ChBxDhA9SQ81BSwS7uWnRByhRmIw3ZiOKL32j0ZiU
 Abuzx5MEy0HUuUsSpQLUOBDqTR/i+4013FXDfR4jcV2x/SfIVzEADdXJe7+J5YDDkV0/
 cv2cd2/XJxNZHhhdlofjnBjvN9DTNMqjItrHeumJTXFN73r1kOl8vDGbRNGyF80RUfXv
 lQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XlzF+VUaE63wYF0uLpR2sbsrI8q8iRkUCxXQWzsIv0=;
 b=T1+3duv24o/drwICm4ccbC8JlNXD1RfnG+SJLAP5/4NEr81n5kClTtag6gAgJGO1yl
 enkFMPC8nBHelVCTlh+tGfJvMb8O4qL34anB9nFACRNNCUL4yEyI87s5Ssh/B7Pslv+f
 GtJTsSVitkerJOf7bSx7pSc/KKQVd2G41jkM/lajeHsfR62ZZucVpjwTqJjefg9luter
 4qSFwgPptw44NR6Nim8Ukyw17wxFkfDLTFomaAGzo+FSJl43D/VbfmNAWNiJ+WcR+MUv
 Ap/kFGM8Sr8jFNC8cJgwg2gdz8slgH2JoLiVbB0E+Ki987cNcQkoqpS2Ie8dRxGQQQgL
 KXmQ==
X-Gm-Message-State: AOAM531JUxRbDDrhipy+J0qenzwWB5LepI1kOYS6GMFiTxk7GEZagzZX
 3qavYTtoiW5zQMDpvan9lnopWq7nCOidsXobjCQ=
X-Google-Smtp-Source: ABdhPJxM69L8YasIAXPldEWzszZcyYGCAKf9KFtw4M5Z2pRAs7rH7DSEdtG92KDzFGJ27yz/ZfX3on/yn7d9irNqImc=
X-Received: by 2002:a25:502:: with SMTP id 2mr36443314ybf.40.1634136046696;
 Wed, 13 Oct 2021 07:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211012014501.24996-1-limingwang@huawei.com>
In-Reply-To: <20211012014501.24996-1-limingwang@huawei.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Oct 2021 22:40:35 +0800
Message-ID: <CAEUhbmX=A4LPgzNgNPcxzzg=veU0=3vXyZQrwikxMFvb_Rcxzw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file command
 is invalid
To: MingWang Li <limingwang@huawei.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 jiangyifei@huawei.com, wanghaibin.wang@huawei.com, 
 fanliang@huawei.com, wu.wubin@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 13 Oct 2021 14:40:51 -0000

On Tue, Oct 12, 2021 at 9:46 AM MingWang Li <limingwang@huawei.com> wrote:
>
> From: Mingwang Li <limingwang@huawei.com>
>
> When I start the VM with the following command:
> $ ./qemu-system-riscv64 -M virt,accel=kvm -m 4096M -cpu host -nographic \
>     -name guest=riscv-guset \
>     -smp 2 \
>     -bios none \
>     -kernel ./Image \
>     -drive file=./guest.img,format=raw,id=hd0 \
>     -device virtio-blk-device,drive=hd0 \
>     -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
>     -object memory-backend-file,id=mem,size=4096M,mem-path=/dev/hugepages,share=on \
>     -numa node,memdev=mem -mem-prealloc \
>     -chardev socket,id=char0,path=/mnt/vhost-net0 \
>     -netdev type=vhost-user,id=mynet1,chardev=char0,vhostforce \
>     -device virtio-net-pci,mac=52:54:00:00:00:01,netdev=mynet1,mrg_rxbuf=on,csum=on,guest_csum=on,guest_ecn=on \
>
> Then, QEMU displays the following error information:
> qemu-system-riscv64: Failed initializing vhost-user memory map, consider using -object memory-backend-file share=on

I see your command line parameters already contain "-object
memory-backend-file share=on", so this error message is not accurate.
Should this message be altered to mention things like what this patch
does?

> qemu-system-riscv64: vhost_set_mem_table failed: Interrupted system call (4)
> qemu-system-riscv64: unable to start vhost net: 4: falling back on userspace virtio
>
> Note that, before starting the kvm-acceled QEMU VM, following
> temporarily unaccepted QEMU patches should be used:
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02516.html
>
> This error was made bacause default main_mem is used to be registered

typo: because

> as the system memory, other memory cannot be initialized. Therefore,
> the system memory should be initialized to the machine->ram, which
> consists of the default main_mem and other possible memory required
> by applications, such as shared hugepage memory in DPDK.
> Also, the mc->defaul_ram_id should be set to the default main_mem,
> such as "riscv_virt_board.ram" for the virt machine.
>

How about changing the commit title to: "Use machine->ram as the
system memory" ??

> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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

Regards,
Bin

