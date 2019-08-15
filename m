Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hy4x6-0001t2-J4
	for mharc-qemu-riscv@gnu.org; Wed, 14 Aug 2019 21:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1hy4x3-0001rS-4d
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 21:53:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1hy4x1-00047s-NL
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 21:53:16 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42621)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hy4x1-000476-Hk
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 21:53:15 -0400
Received: by mail-pl1-x644.google.com with SMTP id y1so449617plp.9
 for <qemu-riscv@nongnu.org>; Wed, 14 Aug 2019 18:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CpKzhrAquFjqvLVLpjn2rxvsNuslhSSRhPlrp0w3atI=;
 b=Tzi78uWW8/azF0Iop9jVGosGeQ0ORJojZKjDqjiU5bvUT91O0xfeEn4xKjzWW5lNp4
 l/ThTzEJ2dl/5+UC9Bfv4WxTKLixbPIMpeZ8hg7skOLaOnXkmWc6IJB4DMhkkRV1vh83
 3LvDpC7cdNPhjiGlkONcBn+15hGbYANCQp90WsEx0mZhWPaFPg4CusBnRZRL2yJF1Rik
 VELwV1Jr1H8YY+LYMRve3Nw00IItav3EHKMBeaz1E5IgK6TQ0EkvrmQGybjQlaT5Ke1S
 v63Tw8iZJIX45CmTsSSpaCHDmNBdLFb/zTGT8/+kZgQQPo0TgJIFYyiGNWQdfpNAJqeM
 aBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CpKzhrAquFjqvLVLpjn2rxvsNuslhSSRhPlrp0w3atI=;
 b=Lm0tRyIH0Vd1FQbCz2I6OCqPNvAECrHomS57DWT/hntepUelk68uKXljEpeL9+WKq7
 PasbETY0ZPdsN4e2KsaFM6qzJuATOqifsIyMFlKaDyhZz6zcBPmPxJb+V+BVkg6q1dvt
 kLE9ekA//YBs1009KUvsUIkm6NO2THhlakQms9EDcl5rPkBs/t4tJcYBorMy8Ru5B+F5
 hlVv1VAlSK3nRhcMNyzMq9qqGsBUSNMJcSyaT3TQuF1ZP/ZaB4seA83NySfvD3qvl2P+
 Fs9gB24R88us7s9VVmJ86LN5i9ZPUA68hNxsgvx1ARDhcu3ILZP8cj6qmrBB1nEHVj4Q
 cuqQ==
X-Gm-Message-State: APjAAAW4etKYpUIjKclij4syVg1DjA39qkos/wSIhSq9okXOttYwlvkA
 UYiDXqN/JFfcrNID3wUbruxwbQ==
X-Google-Smtp-Source: APXvYqyVFbR6gMPUkUIexVoWKYrn9ixFmZ5cciUjb3bJFKxFELIiTaZTQSvdTLgO4ISi6TyxXHxauw==
X-Received: by 2002:a17:902:fe14:: with SMTP id
 g20mr2065514plj.54.1565833994067; 
 Wed, 14 Aug 2019 18:53:14 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c71sm1307258pfc.106.2019.08.14.18.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 18:53:13 -0700 (PDT)
Date: Wed, 14 Aug 2019 18:53:13 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Aug 2019 18:52:41 PDT (-0700)
In-Reply-To: <CAEUhbmVb-rfZ74mY_2QHTNw8R-FYTwxggHAPCCWviYpZZXNtAg@mail.gmail.com>
CC: linux@roeck-us.net, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-cb8e7951-7f1d-4168-8907-cff56ff9ca0f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Thu, 15 Aug 2019 01:53:18 -0000

On Wed, 14 Aug 2019 18:30:59 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Thu, Aug 15, 2019 at 1:06 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Mon, 12 Aug 2019 16:48:00 PDT (-0700), bmeng.cn@gmail.com wrote:
>> > Hi Palmer,
>> >
>> > On Tue, Aug 13, 2019 at 6:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >>
>> >> On Fri, 19 Jul 2019 06:40:43 PDT (-0700), linux@roeck-us.net wrote:
>> >> > Add support for loading initrd with "-initrd <filename>"
>> >> > to the sifive_u machine. This lets us boot into Linux without
>> >> > disk drive.
>> >> >
>> >> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> >> > ---
>> >> >  hw/riscv/sifive_u.c | 20 +++++++++++++++++---
>> >> >  1 file changed, 17 insertions(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> >> > index 71b8083..0657046 100644
>> >> > --- a/hw/riscv/sifive_u.c
>> >> > +++ b/hw/riscv/sifive_u.c
>> >> > @@ -67,7 +67,7 @@ static const struct MemmapEntry {
>> >> >
>> >> >  #define GEM_REVISION        0x10070109
>> >> >
>> >> > -static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>> >> > +static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>> >> >      uint64_t mem_size, const char *cmdline)
>> >> >  {
>> >> >      void *fdt;
>> >> > @@ -244,11 +244,14 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>> >> >          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>> >> >      }
>> >> >      g_free(nodename);
>> >> > +
>> >> > +    return fdt;
>> >> >  }
>> >> >
>> >> >  static void riscv_sifive_u_init(MachineState *machine)
>> >> >  {
>> >> >      const struct MemmapEntry *memmap = sifive_u_memmap;
>> >> > +    void *fdt;
>> >> >
>> >> >      SiFiveUState *s = g_new0(SiFiveUState, 1);
>> >> >      MemoryRegion *system_memory = get_system_memory();
>> >> > @@ -269,13 +272,24 @@ static void riscv_sifive_u_init(MachineState *machine)
>> >> >                                  main_mem);
>> >> >
>> >> >      /* create device tree */
>> >> > -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>> >> > +    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>> >> >
>> >> >      riscv_find_and_load_firmware(machine, BIOS_FILENAME,
>> >> >                                   memmap[SIFIVE_U_DRAM].base);
>> >> >
>> >> >      if (machine->kernel_filename) {
>> >> > -        riscv_load_kernel(machine->kernel_filename);
>> >> > +        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
>> >> > +
>> >> > +        if (machine->initrd_filename) {
>> >> > +            hwaddr start;
>> >> > +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
>> >> > +                                           machine->ram_size, kernel_entry,
>> >> > +                                           &start);
>> >> > +            qemu_fdt_setprop_cell(fdt, "/chosen",
>> >> > +                                  "linux,initrd-start", start);
>> >> > +            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>> >> > +                                  end);
>> >> > +        }
>> >> >      }
>> >> >
>> >> >      /* reset vector */
>> >>
>> >> Thanks.  I've queued all three of these.
>> >>
>> >
>> > Ah, looks I did a duplicate.
>> > http://patchwork.ozlabs.org/patch/1145247/
>> >
>> > Which git repo/branch should I rebase my series on?
>>
>> github.com/palmer-dabbelt/riscv-qemu -b for-master
>
> I did not see branch "for-master" in the riscv-qemu repo. However I
> did find the branch in the github.com/palmer-dabbelt/qemu repo.
>
> I assume that's the correct one I should rebase my patch series on.

Thanks, I've deleted that confusing fork.

