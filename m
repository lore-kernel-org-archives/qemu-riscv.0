Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hxwjY-000686-H9
	for mharc-qemu-riscv@gnu.org; Wed, 14 Aug 2019 13:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1hxwjV-00065G-KF
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 13:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1hxwjS-0007cm-3i
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 13:06:45 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39271)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hxwjR-0007bp-TP
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 13:06:42 -0400
Received: by mail-pg1-x544.google.com with SMTP id u17so53387296pgi.6
 for <qemu-riscv@nongnu.org>; Wed, 14 Aug 2019 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PEBEqNJnBX2a01paAgfoN/R9hhRL6hRf2pblNogkX80=;
 b=G2RaldHSi07fZ6oNUvM9xz9oDne6epapEe/8e0c5+qUFO9SXuHJtchzJ/U5P2adS+G
 U/Hwk9Rx4vHuKs/MToTuTj7KV/10938JYtbQ3RZSQQhO3gq+CNIxtIWjejzYG/6D8/xs
 T0iXRQojwaoUhfs4KCVei53A0j+GDKsGL/34btA1aj7ZOnqB90rT+mYefNvX0HegJSNh
 CLi7DmDrli7a7y886NfNWj3RBUgwSb9C3uV3NUtbIMfHrKpywJO9dyYWAMDpKD79Qkuc
 0DGx0961RM1tYqU6nzqfTtRyJNyXVaQlbySwKgk+wa2+K7ddoRih7eiUPqvlluje3sJX
 05IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PEBEqNJnBX2a01paAgfoN/R9hhRL6hRf2pblNogkX80=;
 b=BY2pzTqtB8MmH8l0iiEdlLVTfTM6TmWQpGwbTMXEkI9/HQBjfUgg+3XiWjzB8BLGzE
 3kpspUnYYNS6EaVAcpKPsJ2IeIxcvWCzIftCBqvHRvVaxM9+huD1FqtOsJZmDwZgMOop
 MGs9ytghWqn9unSl0V/BwKpypfLns5E222PqF5ufeGCEjV3HGsK62QKy4CYr+swdmFVq
 T9gW3kzBY9uRn/U+m0/k1khDtKMhx7mqFS+71qNDlQjD1+7YKIScFJzWbmlmF9qdy+HF
 0xgUTlPcoiarrfeGFwYHqtl6pMrpxvQrXDtz10BN7NT7Z4jKZtWuRLfiIomyaSXmRy5e
 c3ZQ==
X-Gm-Message-State: APjAAAUt0Aqo717MKF2STs7vPRBvwUA9Ql74Bo9lLNpLwTo2V1JFn2ef
 Couj5cCaEfgcvUlIJ7hnEfMpvA==
X-Google-Smtp-Source: APXvYqwX+4db6GbAZ3+iCPsjC3ixInEzut7LemFdJVBE8vQ+AxfUh/qU0eRqfQxV6SQpUZ68lVimTw==
X-Received: by 2002:a65:6108:: with SMTP id z8mr151734pgu.289.1565802399873;
 Wed, 14 Aug 2019 10:06:39 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n7sm353495pff.59.2019.08.14.10.06.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:06:39 -0700 (PDT)
Date: Wed, 14 Aug 2019 10:06:39 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Aug 2019 10:03:21 PDT (-0700)
In-Reply-To: <CAEUhbmU8s5cEt4J-ae0wqfgFHEWe=YWQaDn_Au_MhtK1J7OntA@mail.gmail.com>
CC: linux@roeck-us.net, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-b7d8bc3c-3d03-4b2a-910f-8a9ceb18a046@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/3] riscv: sifive_u: Add
 support for loading initrd
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
X-List-Received-Date: Wed, 14 Aug 2019 17:06:47 -0000

On Mon, 12 Aug 2019 16:48:00 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Tue, Aug 13, 2019 at 6:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Fri, 19 Jul 2019 06:40:43 PDT (-0700), linux@roeck-us.net wrote:
>> > Add support for loading initrd with "-initrd <filename>"
>> > to the sifive_u machine. This lets us boot into Linux without
>> > disk drive.
>> >
>> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> > ---
>> >  hw/riscv/sifive_u.c | 20 +++++++++++++++++---
>> >  1 file changed, 17 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> > index 71b8083..0657046 100644
>> > --- a/hw/riscv/sifive_u.c
>> > +++ b/hw/riscv/sifive_u.c
>> > @@ -67,7 +67,7 @@ static const struct MemmapEntry {
>> >
>> >  #define GEM_REVISION        0x10070109
>> >
>> > -static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>> > +static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>> >      uint64_t mem_size, const char *cmdline)
>> >  {
>> >      void *fdt;
>> > @@ -244,11 +244,14 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>> >          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>> >      }
>> >      g_free(nodename);
>> > +
>> > +    return fdt;
>> >  }
>> >
>> >  static void riscv_sifive_u_init(MachineState *machine)
>> >  {
>> >      const struct MemmapEntry *memmap = sifive_u_memmap;
>> > +    void *fdt;
>> >
>> >      SiFiveUState *s = g_new0(SiFiveUState, 1);
>> >      MemoryRegion *system_memory = get_system_memory();
>> > @@ -269,13 +272,24 @@ static void riscv_sifive_u_init(MachineState *machine)
>> >                                  main_mem);
>> >
>> >      /* create device tree */
>> > -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>> > +    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>> >
>> >      riscv_find_and_load_firmware(machine, BIOS_FILENAME,
>> >                                   memmap[SIFIVE_U_DRAM].base);
>> >
>> >      if (machine->kernel_filename) {
>> > -        riscv_load_kernel(machine->kernel_filename);
>> > +        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
>> > +
>> > +        if (machine->initrd_filename) {
>> > +            hwaddr start;
>> > +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
>> > +                                           machine->ram_size, kernel_entry,
>> > +                                           &start);
>> > +            qemu_fdt_setprop_cell(fdt, "/chosen",
>> > +                                  "linux,initrd-start", start);
>> > +            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>> > +                                  end);
>> > +        }
>> >      }
>> >
>> >      /* reset vector */
>>
>> Thanks.  I've queued all three of these.
>>
>
> Ah, looks I did a duplicate.
> http://patchwork.ozlabs.org/patch/1145247/
>
> Which git repo/branch should I rebase my series on?

github.com/palmer-dabbelt/riscv-qemu -b for-master

