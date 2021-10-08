Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYgav-0007Jj-8d
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 23:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mYgau-0007JS-1B; Thu, 07 Oct 2021 23:30:48 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:33644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mYgaq-0006a2-TT; Thu, 07 Oct 2021 23:30:47 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v195so18160336ybb.0;
 Thu, 07 Oct 2021 20:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oWJF/zsYamnmlxg7UqK2w6ezeWVc/vFEzdeeiR+FQgg=;
 b=W+og4XFfPtWtEaS/oshVPxTPU/0WK7xBzRyLu/qAVRHZfoHFTQtZR2mbpOdISlcGdm
 0Hq7oPdc/sbMCnh6fqOqc0HKH9HmAu1GhdcxQExcW3I93rza/cQXzA5zDHvZrT+mSMlT
 f3HQaJ8IjRKHUh8Jctcw6qyT3AO9Aa5dqAWeRriXjDDZQ8u6f1Gq5MNjBqJHqKO743on
 Ul1AHPB13cFpEIk3O7pr7IqZKkYW713s113btFbzoieRvr7wT9+IlNXNUfusmCatj8DB
 DQLSdqeBvdDN4X1IYA92cfxjhFXXxykzpnaP5+uTjR+td2GiTUsqIQem/EnAS7f/ox7Z
 x0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWJF/zsYamnmlxg7UqK2w6ezeWVc/vFEzdeeiR+FQgg=;
 b=SvVACHIIO754KJyXp4dWcwWJbxYTMnl5XFizYQ4NniM3ksYmGVTbG5e1HMwhie6+pG
 JoDktaKjcBX6yF4+S/i0H0+gBxKnDb5SIh0hgW5CBaQFR2nMFDWkRVhGYWXgiZm3DBDp
 8YfRYUAncfni8G7CIx08+8WoDICWQJZQappyZUKaKtyr+C1ao/8W+S2yvG5N+hg5DDHE
 Soz8aaQW4fG/eGS+isiUGAxHHa/eJvhEwir4BrbpT+T84nOUl0Ldve3jwSQmBQuvKZoR
 M95j3vz6RhHnDJgoNHrt4fgVU9NcLwv+EquKNk0OUkI3I84MVo9knZbKHRks7H66bqYt
 BiWQ==
X-Gm-Message-State: AOAM533cEa0yp4RIm8pGfFY0BTBL4fPfOoY+alQTMIIzFEb02wYMlbZ4
 JgJlob7NpKuS+1ateh8XHEtH2n7gOWzr5uqr/ck=
X-Google-Smtp-Source: ABdhPJzDFblC1hEpQBG7btzao2J8OmaJZv1raVl6cA+PEnyU01V/T+kmwhc6VFmdmjjnx2TG/DImVXpwsiAmHGzR8to=
X-Received: by 2002:a05:6902:1242:: with SMTP id
 t2mr915066ybu.467.1633663843458; 
 Thu, 07 Oct 2021 20:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210929091244.75988-1-limingwang@huawei.com>
In-Reply-To: <20210929091244.75988-1-limingwang@huawei.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 8 Oct 2021 11:30:32 +0800
Message-ID: <CAEUhbmV+UiASGY+qgTW7LjBf0sPRqB1g321qQML0w1RcSES6MQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: bugfix the memory-backend-file command is
 invalid
To: MingWang Li <limingwang@huawei.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 jiangyifei@huawei.com, wanghaibin.wang@huawei.com, 
 fanliang@huawei.com, wu.wubin@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Fri, 08 Oct 2021 03:30:48 -0000

On Wed, Sep 29, 2021 at 10:03 PM MingWang Li <limingwang@huawei.com> wrote:
>
> From: Mingwang Li <limingwang@huawei.com>
>
> If default main_mem is used to be registered as the system memory,
> other memory cannot be initialized. Therefore, the system memory
> should be initialized to the machine->ram, which consists of the
> default main_mem and other possible memory required by applications,
> such as shared hugepage memory in DPDK.

Which command did you use to expose the error? It looks like not every
machine is done like this patch does.

Please reword the commit summary a little bit to help the understanding.

> Also, the mc->defaul_ram_id should be set to the default main_mem,
> which is named as "riscv_virt_board.ram".
>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
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

Regards,
Bin

