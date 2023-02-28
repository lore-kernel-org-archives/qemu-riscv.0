Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWw5a-0001S7-6I
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 04:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWw5X-0001Lp-2T
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 04:15:59 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWw5V-0007dZ-9H
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 04:15:58 -0500
Received: by mail-oi1-x230.google.com with SMTP id y184so7412948oiy.8
 for <qemu-riscv@nongnu.org>; Tue, 28 Feb 2023 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677575755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yLTAXG6BelqZwJSXjS0QiCc/UWzQB7XI3YjB1bVNiUI=;
 b=lY/zAZ2Oa/W25YwJvBKe5Bbay144YKyajFb0Ddh8SsP+U3Tluvk6oMmFr3UkBblYRR
 yHDHHkQFJXwfqgQ5Qm+YpLl+xqGuU2I46pbr5r+s6E/wa4GGY0CscWMkexRjC7DelLay
 sruLa+76UzX5RkUoeCqVeD76uobA1+5dDT5Wo4FryyTH7ATto/eepyaTSwe9B7uuCCfr
 3kCnYsCOtAPSK+dyhbphcHFi0s13mzaoe6/8YYin1mNPg7rmHF3w1ngj1vUCu2rcbufI
 qES/8Ac/ZHdSN1L23t4udBs0T4LfarscW7TzYMFtvE0jxrwl/vMkidzr34HTrqdHhy0t
 Clcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677575755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yLTAXG6BelqZwJSXjS0QiCc/UWzQB7XI3YjB1bVNiUI=;
 b=OJpPNb60Ho+NweQRK6VgfIKY9/Z+AeZUxWVNUn5T5pmfjrn82WF+n/1GwjjR3iB7EN
 ddfg8K1LVdXVPby7pYIPZy+jG4VWLV8mBKfrng1mWwGeSc/UaQAKdlUaOsJOmd/Kdy4/
 fRni7b/aQ6wB4AJGOugfhtskSflxGqRu37ulgVVPs4gvXC9fZYgBkUw2eaLezdeO62/5
 dxXH5yLVyIuNzHwxesJEXLvFkGpSY2lgtNPLujBw5lPiWMGwniWUwI3XS5uJJYh0/sQC
 HHG55GuceJD+MAeEzaSURudLYJpzxtG8C781JvXZpcVFYUno1tV1WlEgSFV5yjMIFYFv
 iZzQ==
X-Gm-Message-State: AO0yUKX49JYuAQRhZZrvB7Q/ISipzlozeQTCBbIaomYjG7RZAgmkvZ8d
 H4REZaNaNwpKulgj7DFZAgcUqA==
X-Google-Smtp-Source: AK7set9E13CbHWeFvSMh4eXifwLVv3iqZ0MV+oYjF5J3K3C2/tORVdE1f953ParVtRdky5EJZT88HQ==
X-Received: by 2002:a05:6808:b19:b0:37f:9d35:779 with SMTP id
 s25-20020a0568080b1900b0037f9d350779mr1098678oij.16.1677575755411; 
 Tue, 28 Feb 2023 01:15:55 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 bl12-20020a056808308c00b0038451502f92sm272599oib.58.2023.02.28.01.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 01:15:54 -0800 (PST)
Message-ID: <b1147365-ac93-2857-d2f6-039307543207@ventanamicro.com>
Date: Tue, 28 Feb 2023 06:15:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] hw/riscv: Move the dtb load bits outside of
 create_fdt()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
References: <20230228074522.1845007-1-bmeng@tinylab.org>
 <20230228074522.1845007-2-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230228074522.1845007-2-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Tue, 28 Feb 2023 09:16:00 -0000



On 2/28/23 04:45, Bin Meng wrote:
> Move the dtb load bits outside of create_fdt(), and put it explicitly
> in sifive_u_machine_init() and virt_machine_init(). With such change
> create_fdt() does exactly what its function name tells us.
> 
> Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
> Changes in v2:
> - new patch: Move the dtb load bits outside of create_fdt()
> 
>   include/hw/riscv/sifive_u.h |  1 +
>   hw/riscv/sifive_u.c         | 31 +++++++++++++++----------------
>   hw/riscv/virt.c             | 29 ++++++++++++++---------------
>   3 files changed, 30 insertions(+), 31 deletions(-)
> 
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 65af306963..0696f85942 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -68,6 +68,7 @@ typedef struct SiFiveUState {
>   
>       /*< public >*/
>       SiFiveUSoCState soc;
> +    int fdt_size;
>   
>       bool start_in_flash;
>       uint32_t msel;
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 76db5ed3dd..35a335b8d0 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -99,7 +99,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>       MachineState *ms = MACHINE(s);
>       uint64_t mem_size = ms->ram_size;
>       void *fdt;
> -    int cpu, fdt_size;
> +    int cpu;
>       uint32_t *cells;
>       char *nodename;
>       uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
> @@ -112,19 +112,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>           "sifive,plic-1.0.0", "riscv,plic0"
>       };
>   
> -    if (ms->dtb) {
> -        fdt = ms->fdt = load_device_tree(ms->dtb, &fdt_size);
> -        if (!fdt) {
> -            error_report("load_device_tree() failed");
> -            exit(1);
> -        }
> -        return;
> -    } else {
> -        fdt = ms->fdt = create_device_tree(&fdt_size);
> -        if (!fdt) {
> -            error_report("create_device_tree() failed");
> -            exit(1);
> -        }
> +    fdt = ms->fdt = create_device_tree(&s->fdt_size);
> +    if (!fdt) {
> +        error_report("create_device_tree() failed");
> +        exit(1);
>       }
>   
>       qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
> @@ -561,8 +552,16 @@ static void sifive_u_machine_init(MachineState *machine)
>       qdev_connect_gpio_out(DEVICE(&(s->soc.gpio)), 10,
>                             qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
>   
> -    /* create device tree */
> -    create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
> +    /* load/create device tree */
> +    if (machine->dtb) {
> +        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
> +        if (!machine->fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +    } else {
> +        create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
> +    }
>   
>       if (s->start_in_flash) {
>           /*
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 0c7b4a1e46..53ed2e8369 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1008,19 +1008,10 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
>       uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
>       uint8_t rng_seed[32];
>   
> -    if (ms->dtb) {
> -        ms->fdt = load_device_tree(ms->dtb, &s->fdt_size);
> -        if (!ms->fdt) {
> -            error_report("load_device_tree() failed");
> -            exit(1);
> -        }
> -        return;
> -    } else {
> -        ms->fdt = create_device_tree(&s->fdt_size);
> -        if (!ms->fdt) {
> -            error_report("create_device_tree() failed");
> -            exit(1);
> -        }
> +    ms->fdt = create_device_tree(&s->fdt_size);
> +    if (!ms->fdt) {
> +        error_report("create_device_tree() failed");
> +        exit(1);
>       }
>   
>       qemu_fdt_setprop_string(ms->fdt, "/", "model", "riscv-virtio,qemu");
> @@ -1505,8 +1496,16 @@ static void virt_machine_init(MachineState *machine)
>       }
>       virt_flash_map(s, system_memory);
>   
> -    /* create device tree */
> -    create_fdt(s, memmap);
> +    /* load/create device tree */
> +    if (machine->dtb) {
> +        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
> +        if (!machine->fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +    } else {
> +        create_fdt(s, memmap);
> +    }
>   
>       s->machine_done.notify = virt_machine_done;
>       qemu_add_machine_init_done_notifier(&s->machine_done);

