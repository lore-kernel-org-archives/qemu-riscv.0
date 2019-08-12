Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxJ3a-0000rM-4T
	for mharc-qemu-riscv@gnu.org; Mon, 12 Aug 2019 18:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55145)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hxJ3X-0000qj-LE
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 18:44:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hxJ3W-0006Rf-K5
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 18:44:47 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37752)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hxJ3W-0006RI-El
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 18:44:46 -0400
Received: by mail-pf1-f194.google.com with SMTP id 129so3521739pfa.4
 for <qemu-riscv@nongnu.org>; Mon, 12 Aug 2019 15:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=VRLnfTSmpbAwWsgfsAvbH2bJEn8ECtiUgsox1iOBdZY=;
 b=JWSlULakKwg1cf+7fFaYdqZ6I2kh4W/fPEVTSujPW3PJy7GbRbL8qL/+80P4boGkeE
 rwFCYgKLRF+EOS9o7Hx3agT9/tWWQYdq9E86MtuuEwPvT8r0ofwMkB5xv6McGxZj9HJB
 xCR4HRXIkvZ5qNRMiQTvuW6bsI+tZTYw4J2kAzzpjULP3mxrDLU0cjnPN3VNZ1KUUQfO
 66KWP/QO5r5FeHsOhwfyVEdYcVF/AoXp4q8e9mILCjum9KhrWjtF80LmZzUDhpT7M940
 zcRewIJwGG7ZnviSK+A4/Ob6V+ewyolaSbOUelknlex9I5Z2yINyzw9a7oL2amYzS7Vu
 DG9A==
X-Gm-Message-State: APjAAAXkRu+id+/9jK8XGM0SpUXUabSUCswYYK7IAYcCmmgnvh02frcC
 ZFR2rJ0+n+Pj21WUDCkswLIgUA==
X-Google-Smtp-Source: APXvYqyEPA92VZhS3xxQeFKScVEsUj7mIQ8rFuTx0ebpXyWIj6ArhDkXBEq/yZKbA0DxdhRp247jmg==
X-Received: by 2002:a17:90a:256d:: with SMTP id
 j100mr1398633pje.126.1565649884352; 
 Mon, 12 Aug 2019 15:44:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y16sm7675156pfc.36.2019.08.12.15.44.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 15:44:43 -0700 (PDT)
Date: Mon, 12 Aug 2019 15:44:43 -0700 (PDT)
X-Google-Original-Date: Mon, 12 Aug 2019 15:41:46 PDT (-0700)
In-Reply-To: <1563543645-20804-1-git-send-email-linux@roeck-us.net>
CC: Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux@roeck-us.net
From: Palmer Dabbelt <palmer@sifive.com>
To: linux@roeck-us.net
Message-ID: <mhng-ed1aa538-1ac8-4013-a274-f9c3a9a71fd0@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-riscv] [PATCH 1/3] riscv: sifive_u: Add support for
 loading initrd
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
X-List-Received-Date: Mon, 12 Aug 2019 22:44:48 -0000

On Fri, 19 Jul 2019 06:40:43 PDT (-0700), linux@roeck-us.net wrote:
> Add support for loading initrd with "-initrd <filename>"
> to the sifive_u machine. This lets us boot into Linux without
> disk drive.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/riscv/sifive_u.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 71b8083..0657046 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -67,7 +67,7 @@ static const struct MemmapEntry {
>
>  #define GEM_REVISION        0x10070109
>
> -static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
> +static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      uint64_t mem_size, const char *cmdline)
>  {
>      void *fdt;
> @@ -244,11 +244,14 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>      g_free(nodename);
> +
> +    return fdt;
>  }
>
>  static void riscv_sifive_u_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap = sifive_u_memmap;
> +    void *fdt;
>
>      SiFiveUState *s = g_new0(SiFiveUState, 1);
>      MemoryRegion *system_memory = get_system_memory();
> @@ -269,13 +272,24 @@ static void riscv_sifive_u_init(MachineState *machine)
>                                  main_mem);
>
>      /* create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
> +    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>
>      riscv_find_and_load_firmware(machine, BIOS_FILENAME,
>                                   memmap[SIFIVE_U_DRAM].base);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename);
> +        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size, kernel_entry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> +                                  end);
> +        }
>      }
>
>      /* reset vector */

Thanks.  I've queued all three of these.

