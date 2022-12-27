Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAB1Q-0004oL-9E
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 09:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAB1F-0004kj-4J
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 09:33:30 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAB1B-0001e3-6o
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 09:33:28 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1447c7aa004so15613742fac.11
 for <qemu-riscv@nongnu.org>; Tue, 27 Dec 2022 06:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6eij0VIWJ8NByESgScM2pnE0xIoYV4hdIc4QUJg9eQ8=;
 b=bq+Mo67JobiGOC0hAVI2LXKkaslIB3Rh9A2M1VZsIqdiNSA4XuE4HgMr83i4WSOu/g
 RF1VTPjU0+n1up27Gm+LB7Dm5mY2ohN7yJM9xwPfeKje3IqRcn+Dyn0ORTsXbWW4RBaB
 B1XfLrUGGkaC7waEF5uyvsZfp3+5mNRAOUAjaNUe/g/oweSeu2zwF7+ZO+4vDfmxMs1A
 KPOlObh8sr1pkyWgy6BShLoX88bkbfhpKvCdwlzhpKZFJ/uqOTb3MQU32v1OkzlhD20n
 z+aaY3GRfb/1nbtLSV5tu9w3lOKlpdt9mrcThzdEJvIBpqjH7qfWSGnE+USibXBJLmeC
 vOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6eij0VIWJ8NByESgScM2pnE0xIoYV4hdIc4QUJg9eQ8=;
 b=Lf4bl4+YSOjB+fELFZsoaYmt9zhH4nnsIgVCGs7aZ1VCDzcGwkkzatIpyw5oRvZ2Iq
 8kvTNiFSQ27//HLiyMTIPJQv7ZGvhXIwjc9U1x559BuHf9g3cdOzI/dQlYlmN98HxKFE
 Yyy+PiOdPxUQ8vmOFjO6RG3VE9UhQeu8m4dZWCCCPFZL+JRJEswBIiaSUz2Uda8zVpAD
 VBH0nrBzWHVw5QpFwcqOxbvq651Eyfr2mzZK7mTH1JC7Aj5wq9dn7DamjOO8CyxghlHP
 yrZVGvVYHeCslJPw0N7EGXZ3DsGSAFGLYU4NkBxHCX6ERShWFP0cXJfeyPR4UENT3M8e
 rZPQ==
X-Gm-Message-State: AFqh2krJysCWU0bAzhXoPk2KFJsJKTdTIxU/7Ody3lotFL6zbflVFaHP
 B5YGHzCMKrRGF86C09UyW1n+mA==
X-Google-Smtp-Source: AMrXdXvu4PRpO1dKuzW+GV3RfK/NI8ZvQG3vrXm4Gr5IL6tPyWZu4y+xL7Hr9LBTMK9qShJXHC6Lvg==
X-Received: by 2002:a05:6870:ed8c:b0:144:dad7:80f3 with SMTP id
 fz12-20020a056870ed8c00b00144dad780f3mr11495127oab.37.1672151597712; 
 Tue, 27 Dec 2022 06:33:17 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056870350b00b0012b298699dbsm6196947oah.1.2022.12.27.06.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 06:33:17 -0800 (PST)
Message-ID: <d501aa56-31c1-0efb-009c-bc0a991397eb@ventanamicro.com>
Date: Tue, 27 Dec 2022 11:33:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 12/12] hw/riscv: spike: Decouple create_fdt() dependency
 to ELF loading
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-13-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-13-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Tue, 27 Dec 2022 14:33:31 -0000

Hi Bin,

On 12/27/22 03:48, Bin Meng wrote:
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
>
>   include/hw/char/riscv_htif.h |  5 +---
>   hw/char/riscv_htif.c         | 17 +++++-------
>   hw/riscv/spike.c             | 54 ++++++++++++++++++++++++++++++------
>   3 files changed, 53 insertions(+), 23 deletions(-)
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
> index 810a18f283..90f9e581e4 100644
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
> @@ -184,6 +185,21 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>       }
>   }
>   
> +static bool spike_test_elf_image(char *filename)
> +{
> +    Error *err = NULL;
> +
> +    if (filename) {
> +        load_elf_hdr(filename, NULL, NULL, &err);
> +        if (err) {
> +            error_free(err);
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
>   static void spike_board_init(MachineState *machine)
>   {
>       const MemMapEntry *memmap = spike_memmap;
> @@ -191,11 +207,12 @@ static void spike_board_init(MachineState *machine)
>       MemoryRegion *system_memory = get_system_memory();
>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>       target_ulong firmware_end_addr, kernel_start_addr;
> -    const char *firmware_name;
> +    char *firmware_name;
>       uint32_t fdt_load_addr;
>       uint64_t kernel_entry;
>       char *soc_name;
>       int i, base_hartid, hart_count;
> +    bool htif_custom_base;
>   
>       /* Check socket count limit */
>       if (SPIKE_SOCKETS_MAX < riscv_socket_count(machine)) {
> @@ -257,10 +274,28 @@ static void spike_board_init(MachineState *machine)
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
> +    htif_custom_base = !spike_test_elf_image(firmware_name);
> +    if (!htif_custom_base) {
> +        htif_custom_base = !spike_test_elf_image(machine->kernel_filename);
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

'make' is giving me a maybe-uninitialized error in this point:

../hw/riscv/spike.c: In function ‘spike_board_init’:
../hw/riscv/spike.c:301:29: error: ‘firmware_end_addr’ may be used uninitialized [-Werror=maybe-uninitialized]
   301 |         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   302 | firmware_end_addr);
       | ~~~~~~~~~~~~~~~~~~
../hw/riscv/spike.c:208:18: note: ‘firmware_end_addr’ was declared here
   208 |     target_ulong firmware_end_addr, kernel_start_addr;
       |                  ^~~~~~~~~~~~~~~~~


The full context:


     /* Load firmware */
     if (firmware_name) {
         firmware_end_addr = riscv_load_firmware(firmware_name,
memmap[SPIKE_DRAM].base,
htif_symbol_callback);
         g_free(firmware_name);
     }

     /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
firmware_end_addr);

         kernel_entry = riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
     } else {


The error is happening because, with this patch, 'firmware_end_addr' may not be
initialized via riscv_load_firmware() because we're not guaranteeing that
'firmware_name' will be valid.

riscv_load_firmware() is guaranteed to either return > 0 or error out with exit(1),
so a simple fix would be to initialize 'firmware_end_addr' with 0.



Thanks,

Daniel


> @@ -280,7 +315,7 @@ static void spike_board_init(MachineState *machine)
>   
>       /* Create device tree */
>       create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> +               riscv_is_32bit(&s->soc[0]), htif_custom_base);
>   
>       /* Load initrd */
>       if (machine->kernel_filename && machine->initrd_filename) {
> @@ -308,7 +343,8 @@ static void spike_board_init(MachineState *machine)
>                                 fdt_load_addr);
>   
>       /* initialize HTIF using symbols found in load_kernel */
> -    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
> +    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base,
> +                 htif_custom_base);
>   }
>   
>   static void spike_machine_instance_init(Object *obj)


