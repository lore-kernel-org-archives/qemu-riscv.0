Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAtQS-00035x-7a
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 08:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAtQP-00035S-Hs
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 08:58:25 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAtQM-0007Sp-4X
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 08:58:25 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-14fb3809eaeso15780993fac.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 05:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=drOLqjRbfEuTKbkoPHDrnRGQ1i/mOIipnsz1tV3CckI=;
 b=cPD0Ccywxxk/cqVAw5xZi/UHbajy4UveHnA1e4D49aeVWq/8zjSqJb0OS9HigHj/gl
 Svds+R0qe7wlitfo6E3qU9OSnDcrKn81IkMTiTpxzVBETb0D3pNCkqnJHW6p2ACl0qMP
 lxtYDtKWQFejHxubxSbdd+zTd8652fi9IBMQ6/xokHAV9AjJlMwTPOUqs45l6szLKYrv
 rlwwFVbtCCyNB5fPjIPISJrFCuragB8xCDjjflIi2WmbUpVAK3bn2S+zL+uH9FJEFr9f
 ZSeXXEUr1gww3EgloL2GJfdfiLiNL7S408s0ClUPJbPrqmpXgmvmPkJqysJnYFf1ydeg
 cXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=drOLqjRbfEuTKbkoPHDrnRGQ1i/mOIipnsz1tV3CckI=;
 b=T26I9FBBTR5hauF54Iu2AhtAG5bwVh2bqcYnZYswFmGz+T5KR2bkUW0EtELLNC22cT
 VUStLT0SHs5PmaJIYTkk0fNOcU1tfw1qALvrB459oltML73QcBGXTa/E/r3De5UIae50
 gbK7ZKsO0ENaKmqSS9b2B2XoZH3qegfxABEuya1si/zrR6wowh6iAKBjE4FLTcnoA82i
 fb5xg6CO52JTU7qH5vg+4fI5Qv70/4P1TRrhClYGW4FrmLfuNw5svTXiNUnD8bcCe/2m
 vi1ym5yWa1TJTvbTA37C7MW9WKs0xNvtkV6GCK+0hEZeJorh7CRBXf/diGrUQQKQFL/l
 spXA==
X-Gm-Message-State: AFqh2kpDev55cY1Kv7oL7Uh3R+fMj2xLhti7Pq5BIP2NIH+T1r6kzjSO
 CSqukFZA5+6PVMe+cMUgHqDWQA==
X-Google-Smtp-Source: AMrXdXtWG1zMqibuOkvdfn6QjKNLuD0U8MgvCY0O/tVD7iXLu1PuuEVgMxKerpCoGHZOh/PSqYA2Ig==
X-Received: by 2002:a05:6870:8996:b0:14f:c6f4:ca3e with SMTP id
 f22-20020a056870899600b0014fc6f4ca3emr8549054oaq.0.1672322299687; 
 Thu, 29 Dec 2022 05:58:19 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05687015ce00b0014fd7e7c3fesm5566834oad.27.2022.12.29.05.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 05:58:19 -0800 (PST)
Message-ID: <b2cc588c-c2cc-29dc-d4f4-a28a4a2257e0@ventanamicro.com>
Date: Thu, 29 Dec 2022 10:58:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 12/12] hw/riscv: spike: Decouple create_fdt()
 dependency to ELF loading
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221229091828.1945072-13-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221229091828.1945072-13-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-List-Received-Date: Thu, 29 Dec 2022 13:58:25 -0000



On 12/29/22 07:31, Bin Meng wrote:
> At present create_fdt() calls htif_uses_elf_symbols() to determine
> whether to insert a <reg> property for the HTIF. This unfortunately
> creates a hidden dependency to riscv_load_{firmware,kernel} that
> create_fdt() must be called after the ELF {firmware,kernel} image
> has been loaded.
>
> Decouple such dependency be adding a new parameter to create_fdt(),
> whether custom HTIF base address is used. The flag will be set if
> non ELF {firmware,kernel} image is given by user.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
> Changes in v2:
> - initialize firmware_end_addr to memmap[SPIKE_DRAM].base
> - rework the htif_custom_base detection logic
>
>   include/hw/char/riscv_htif.h |  5 +--
>   hw/char/riscv_htif.c         | 17 +++++-----
>   hw/riscv/spike.c             | 61 ++++++++++++++++++++++++++++++------
>   3 files changed, 59 insertions(+), 24 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 9e8ebbe017..5958c5b986 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -44,11 +44,8 @@ typedef struct HTIFState {
>   void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>       uint64_t st_size);
>   
> -/* Check if HTIF uses ELF symbols */
> -bool htif_uses_elf_symbols(void);
> -
>   /* legacy pre qom */
>   HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> -                        uint64_t nonelf_base);
> +                        uint64_t nonelf_base, bool custom_base);
>   
>   #endif
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 1477fc0090..098de50e35 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -52,20 +52,17 @@
>   #define PK_SYS_WRITE            64
>   
>   static uint64_t fromhost_addr, tohost_addr;
> -static int address_symbol_set;
>   
>   void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>                             uint64_t st_size)
>   {
>       if (strcmp("fromhost", st_name) == 0) {
> -        address_symbol_set |= 1;
>           fromhost_addr = st_value;
>           if (st_size != 8) {
>               error_report("HTIF fromhost must be 8 bytes");
>               exit(1);
>           }
>       } else if (strcmp("tohost", st_name) == 0) {
> -        address_symbol_set |= 2;
>           tohost_addr = st_value;
>           if (st_size != 8) {
>               error_report("HTIF tohost must be 8 bytes");
> @@ -275,19 +272,19 @@ static const MemoryRegionOps htif_mm_ops = {
>       .write = htif_mm_write,
>   };
>   
> -bool htif_uses_elf_symbols(void)
> -{
> -    return (address_symbol_set == 3) ? true : false;
> -}
> -
>   HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> -                        uint64_t nonelf_base)
> +                        uint64_t nonelf_base, bool custom_base)
>   {
>       uint64_t base, size, tohost_offset, fromhost_offset;
>   
> -    if (!htif_uses_elf_symbols()) {
> +    if (custom_base) {
>           fromhost_addr = nonelf_base;
>           tohost_addr = nonelf_base + 8;
> +    } else {
> +        if (!fromhost_addr || !tohost_addr) {
> +            error_report("Invalid HTIF fromhost or tohost address");
> +            exit(1);
> +        }
>       }
>   
>       base = MIN(tohost_addr, fromhost_addr);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 810a18f283..dd5f912e3d 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -50,7 +50,8 @@ static const MemMapEntry spike_memmap[] = {
>   };
>   
>   static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
> -                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> +                       uint64_t mem_size, const char *cmdline,
> +                       bool is_32_bit, bool htif_custom_base)
>   {
>       void *fdt;
>       uint64_t addr, size;
> @@ -78,7 +79,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>   
>       qemu_fdt_add_subnode(fdt, "/htif");
>       qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
> -    if (!htif_uses_elf_symbols()) {
> +    if (htif_custom_base) {
>           qemu_fdt_setprop_cells(fdt, "/htif", "reg",
>               0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
>       }
> @@ -184,18 +185,33 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>       }
>   }
>   
> +static bool spike_test_elf_image(char *filename)
> +{
> +    Error *err = NULL;
> +
> +    load_elf_hdr(filename, NULL, NULL, &err);
> +    if (err) {
> +        error_free(err);
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
>   static void spike_board_init(MachineState *machine)
>   {
>       const MemMapEntry *memmap = spike_memmap;
>       SpikeState *s = SPIKE_MACHINE(machine);
>       MemoryRegion *system_memory = get_system_memory();
>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> -    target_ulong firmware_end_addr, kernel_start_addr;
> -    const char *firmware_name;
> +    target_ulong firmware_end_addr = memmap[SPIKE_DRAM].base;
> +    target_ulong kernel_start_addr;
> +    char *firmware_name;
>       uint32_t fdt_load_addr;
>       uint64_t kernel_entry;
>       char *soc_name;
>       int i, base_hartid, hart_count;
> +    bool htif_custom_base = false;
>   
>       /* Check socket count limit */
>       if (SPIKE_SOCKETS_MAX < riscv_socket_count(machine)) {
> @@ -257,10 +273,34 @@ static void spike_board_init(MachineState *machine)
>       memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
>                                   mask_rom);
>   
> -    firmware_name = riscv_default_firmware_name(&s->soc[0]);
> -    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
> -                                                     memmap[SPIKE_DRAM].base,
> -                                                     htif_symbol_callback);
> +    /* Find firmware */
> +    firmware_name = riscv_find_firmware(machine->firmware,
> +                        riscv_default_firmware_name(&s->soc[0]));
> +
> +    /*
> +     * Test the given firmware or kernel file to see if it is an ELF image.
> +     * If it is an ELF, we assume it contains the symbols required for
> +     * the HTIF console, otherwise we fall back to use the custom base
> +     * passed from device tree for the HTIF console.
> +     */
> +    if (!firmware_name && !machine->kernel_filename) {
> +        htif_custom_base = true;
> +    } else {
> +        if (firmware_name) {
> +            htif_custom_base = !spike_test_elf_image(firmware_name);
> +        }
> +        if (!htif_custom_base && machine->kernel_filename) {
> +            htif_custom_base = !spike_test_elf_image(machine->kernel_filename);
> +        }
> +    }
> +
> +    /* Load firmware */
> +    if (firmware_name) {
> +        firmware_end_addr = riscv_load_firmware(firmware_name,
> +                                                memmap[SPIKE_DRAM].base,
> +                                                htif_symbol_callback);
> +        g_free(firmware_name);
> +    }
>   
>       /* Load kernel */
>       if (machine->kernel_filename) {
> @@ -280,7 +320,7 @@ static void spike_board_init(MachineState *machine)
>   
>       /* Create device tree */
>       create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> +               riscv_is_32bit(&s->soc[0]), htif_custom_base);
>   
>       /* Load initrd */
>       if (machine->kernel_filename && machine->initrd_filename) {
> @@ -308,7 +348,8 @@ static void spike_board_init(MachineState *machine)
>                                 fdt_load_addr);
>   
>       /* initialize HTIF using symbols found in load_kernel */
> -    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
> +    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base,
> +                 htif_custom_base);
>   }
>   
>   static void spike_machine_instance_init(Object *obj)


