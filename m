Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pF13k-0007Nm-Mk
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 17:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF13S-0007GP-67; Mon, 09 Jan 2023 17:55:48 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF13Q-0008AA-C3; Mon, 09 Jan 2023 17:55:45 -0500
Received: by mail-vs1-xe29.google.com with SMTP id a64so10449529vsc.2;
 Mon, 09 Jan 2023 14:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uSd4nickcnF2PN5PBY4LlFHIMczV9y5pOQwPfKCt6bw=;
 b=R1FPlbuRYJCfqxuiWVakIP9SSLpA/THTOdIZQM6Qit+Kf+OovMleNk5llHZAvpAnEa
 hRtzZ60bbw3DQ+PhQ14WSUhAv/Zou6wb0d+m8iU5YWzM+YJAXc+2993Kf6ip92OfG0Ni
 UxFWA7qWBxJaPGWJIhEYsYu3YOZ21mjqIKjkX4GYb91IWd4XO9cBDciPCMnuuSLjfC24
 ekgoap+PYkcN0CDlhCG5PFVSIKo3L9eGajoK8BgVeOG7uh2ovnXeKkTLKqQm8M23OYVM
 wXZD0tyPE08JVtv4UYT0JjIrVqPGOJjqWTGk5YfdZ9iyvpmQKjMjjDQekBJV78caNVLS
 hKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSd4nickcnF2PN5PBY4LlFHIMczV9y5pOQwPfKCt6bw=;
 b=nVT0j6otVid495ExuUkwqxJfG8g6ycqcWjy6opMlxh9vvSbtgzDJhUklF3mnoIaCjO
 GUKy5lgMYa96tisX6g+IcsyJdbwFd6Em0TCgtbVZHme0js/f1k8oqbdQk5MiV0P/xkJu
 xccTEOJ4rJezzzBF9UlfQ+kfvWJ4w69iwSRiBCL442sJMy8Df7wjyMMhXmD7VW9iqRe7
 XxjIIXZLlPYIk3n8X8rnulDf5bXH1rallFVDkclySmGBpEdFC6sJ6nYlalzqWlPFB2JN
 8mHW5lL6fJFABWEXrEFzHxnHcj0pmooD/KpgXUVGoxx+8EYhhRiGhniJ+yYsaOxKsfC3
 bUvA==
X-Gm-Message-State: AFqh2koCFhSbBSXLqizwS3NFs8dzajpXu16Yn4tTATmQ7Plgx+8/aHcy
 UvUyxNphDyTzZQ6AMIlT7UeRns+s6KmlxpbyEx8=
X-Google-Smtp-Source: AMrXdXvhNocXySNj0fy9H8TsyCr0WI+Phrbpwwg2h3qsQ8gdIzfoKPFNjOpDrwJmVX/b4Jk4752XZCKCBRBAnIq3WpY=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr7211260vsv.73.1673304938058; Mon, 09
 Jan 2023 14:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20221229091828.1945072-1-bmeng@tinylab.org>
 <20221229091828.1945072-13-bmeng@tinylab.org>
In-Reply-To: <20221229091828.1945072-13-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 08:55:11 +1000
Message-ID: <CAKmqyKMpNKdgc2GsFqK+gh3U1-8H7nXB91Z1uXWhuTKpUXpOwQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] hw/riscv: spike: Decouple create_fdt()
 dependency to ELF loading
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Mon, 09 Jan 2023 22:56:02 -0000

On Thu, Dec 29, 2022 at 8:33 PM Bin Meng <bmeng@tinylab.org> wrote:
>
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

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
> Changes in v2:
> - initialize firmware_end_addr to memmap[SPIKE_DRAM].base
> - rework the htif_custom_base detection logic
>
>  include/hw/char/riscv_htif.h |  5 +--
>  hw/char/riscv_htif.c         | 17 +++++-----
>  hw/riscv/spike.c             | 61 ++++++++++++++++++++++++++++++------
>  3 files changed, 59 insertions(+), 24 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 9e8ebbe017..5958c5b986 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -44,11 +44,8 @@ typedef struct HTIFState {
>  void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>      uint64_t st_size);
>
> -/* Check if HTIF uses ELF symbols */
> -bool htif_uses_elf_symbols(void);
> -
>  /* legacy pre qom */
>  HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> -                        uint64_t nonelf_base);
> +                        uint64_t nonelf_base, bool custom_base);
>
>  #endif
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 1477fc0090..098de50e35 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -52,20 +52,17 @@
>  #define PK_SYS_WRITE            64
>
>  static uint64_t fromhost_addr, tohost_addr;
> -static int address_symbol_set;
>
>  void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>                            uint64_t st_size)
>  {
>      if (strcmp("fromhost", st_name) == 0) {
> -        address_symbol_set |= 1;
>          fromhost_addr = st_value;
>          if (st_size != 8) {
>              error_report("HTIF fromhost must be 8 bytes");
>              exit(1);
>          }
>      } else if (strcmp("tohost", st_name) == 0) {
> -        address_symbol_set |= 2;
>          tohost_addr = st_value;
>          if (st_size != 8) {
>              error_report("HTIF tohost must be 8 bytes");
> @@ -275,19 +272,19 @@ static const MemoryRegionOps htif_mm_ops = {
>      .write = htif_mm_write,
>  };
>
> -bool htif_uses_elf_symbols(void)
> -{
> -    return (address_symbol_set == 3) ? true : false;
> -}
> -
>  HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> -                        uint64_t nonelf_base)
> +                        uint64_t nonelf_base, bool custom_base)
>  {
>      uint64_t base, size, tohost_offset, fromhost_offset;
>
> -    if (!htif_uses_elf_symbols()) {
> +    if (custom_base) {
>          fromhost_addr = nonelf_base;
>          tohost_addr = nonelf_base + 8;
> +    } else {
> +        if (!fromhost_addr || !tohost_addr) {
> +            error_report("Invalid HTIF fromhost or tohost address");
> +            exit(1);
> +        }
>      }
>
>      base = MIN(tohost_addr, fromhost_addr);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 810a18f283..dd5f912e3d 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -50,7 +50,8 @@ static const MemMapEntry spike_memmap[] = {
>  };
>
>  static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
> -                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> +                       uint64_t mem_size, const char *cmdline,
> +                       bool is_32_bit, bool htif_custom_base)
>  {
>      void *fdt;
>      uint64_t addr, size;
> @@ -78,7 +79,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/htif");
>      qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
> -    if (!htif_uses_elf_symbols()) {
> +    if (htif_custom_base) {
>          qemu_fdt_setprop_cells(fdt, "/htif", "reg",
>              0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
>      }
> @@ -184,18 +185,33 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>      }
>  }
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
>  static void spike_board_init(MachineState *machine)
>  {
>      const MemMapEntry *memmap = spike_memmap;
>      SpikeState *s = SPIKE_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> -    target_ulong firmware_end_addr, kernel_start_addr;
> -    const char *firmware_name;
> +    target_ulong firmware_end_addr = memmap[SPIKE_DRAM].base;
> +    target_ulong kernel_start_addr;
> +    char *firmware_name;
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>      char *soc_name;
>      int i, base_hartid, hart_count;
> +    bool htif_custom_base = false;
>
>      /* Check socket count limit */
>      if (SPIKE_SOCKETS_MAX < riscv_socket_count(machine)) {
> @@ -257,10 +273,34 @@ static void spike_board_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
>                                  mask_rom);
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
>      /* Load kernel */
>      if (machine->kernel_filename) {
> @@ -280,7 +320,7 @@ static void spike_board_init(MachineState *machine)
>
>      /* Create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> +               riscv_is_32bit(&s->soc[0]), htif_custom_base);
>
>      /* Load initrd */
>      if (machine->kernel_filename && machine->initrd_filename) {
> @@ -308,7 +348,8 @@ static void spike_board_init(MachineState *machine)
>                                fdt_load_addr);
>
>      /* initialize HTIF using symbols found in load_kernel */
> -    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
> +    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base,
> +                 htif_custom_base);
>  }
>
>  static void spike_machine_instance_init(Object *obj)
> --
> 2.34.1
>
>

