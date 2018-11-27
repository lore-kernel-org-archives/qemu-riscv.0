Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRln4-0001QU-VJ
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 17:25:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRln2-0001NN-D7
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:25:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRln1-0008B1-FJ
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:25:08 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:41873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRlmz-0008AC-8Y; Tue, 27 Nov 2018 17:25:05 -0500
Received: by mail-lj1-x242.google.com with SMTP id z80-v6so21559798ljb.8;
	Tue, 27 Nov 2018 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TM8K2c4AOXBOwOS73+s6+87Mq+JUEX5u1N06Ir8MyZI=;
	b=qWQe5rOOxMyT+CnRCwzfN/TJKlCea0Uwfj2OOh7cseSuP0sD/VFPFIORs+4R7gyfD1
	5XwRJZSvTS5hMQAA233q8+scM/zb/rhFS0R7cIUkh4G4VMOU9FDV1UW8+qGe7ZoVSuJe
	xE+YW770uz4M9d3YXh/B0vFjlOO4EdFhf8040RD4u0VG7KXV+XOm4I7KN694m3MvGgXq
	vlkDyxDjEL6eIh8UQry92xj1++D4ZT8v1wJMfT3Y+BIwo9R5geBMwqROvtedbHPu73V8
	pk1PaeQWhjIJnArWEZEtO2NwV9xfEwyU6SWDOMFKQla/XwqUQHa5skUtSNEl3x2CxL9J
	OElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TM8K2c4AOXBOwOS73+s6+87Mq+JUEX5u1N06Ir8MyZI=;
	b=EBPEQIbr8yNbeu9NbkD7LmZdUr9aQ+WaG9QVBu3gAF1yNprTU+drFJt7QDEUjBj33I
	3vz7ZWAkVGpc4pWSJ8Zj9IamGygT9riPh+z/4BUjvA4JOH7bx/DYjR3N7unrJboFt2mp
	IWKy/ggTgNaKVG19pJQA85YZWvlH18be9h/aDwmkY0/tM3gyYbqdRiFozv13EPea2fky
	MjPhjPcorJf0PwjhdgcbyabCmpNT43JBceGUJ5pFQ1T1oJFbUXR1Qqrree1llr0Hicme
	awrkVVVBO7RlQSbdtpADrZrYOFZIgijQz+qQNxguFIQfC98U8hVVRXN+2JV2KcxonbE0
	uYbg==
X-Gm-Message-State: AA+aEWbuYJWyJHFER0Bb6eay9oLraRKekje9gIXX0RKz2ADmoiD63VX7
	hYm2srabkfdDnN2mHF/e3nlnd3kQ71zae6iSh/o=
X-Google-Smtp-Source: AJdET5dKbpYi1sSErzPg1wLZKpbj0oId7H3jTjUWF6KqktZKoEc/W2cJzhaI5u4DyS93r4kJyJo8+oV+8uSk1SzOhb8=
X-Received: by 2002:a2e:145a:: with SMTP id
	26-v6mr20920031lju.116.1543357503829; 
	Tue, 27 Nov 2018 14:25:03 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKMdNs4etff7rc0vDy_tmZf5deP1Geu0GchkENu+em5=+w@mail.gmail.com>
	<mhng-b345219b-56ea-4aee-b25e-95c762c54b49@palmer-si-x1c4>
	<CAKmqyKPtn-C5rm3ggj5CvAAXh+Gq=u8YDh1S8Wmsb=tsLjcsXA@mail.gmail.com>
	<005a50f1-8270-ee52-d79e-321b03d841e4@suse.de>
In-Reply-To: <005a50f1-8270-ee52-d79e-321b03d841e4@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Nov 2018 14:24:35 -0800
Message-ID: <CAKmqyKOaECi3vEpe8GbdG1y80TODUMMBzmQbo4RVY_jC5PhibA@mail.gmail.com>
To: Alexander Graf <agraf@suse.de>
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv: virt: Cast the
 initrd start address to target bit length
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2018 22:25:09 -0000

On Tue, Nov 27, 2018 at 2:12 PM Alexander Graf <agraf@suse.de> wrote:
>
>
>
> On 27.11.18 23:05, Alistair Francis wrote:
> > On Mon, Nov 26, 2018 at 11:02 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Wed, 21 Nov 2018 18:09:27 PST (-0800), alistair23@gmail.com wrote:
> >>> On Wed, Nov 21, 2018 at 5:58 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>>>
> >>>> On Wed, 21 Nov 2018 14:34:44 PST (-0800), Alistair Francis wrote:
> >>>>> Ensure that the calculate initrd offset points to a valid address for
> >>>>> the architecture.
> >>>>>
> >>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>>>> Suggested-by: Alexander Graf <agraf@suse.de>
> >>>>> Reported-by: Alexander Graf <agraf@suse.de>
> >>>>> ---
> >>>>>  hw/riscv/virt.c | 7 ++++++-
> >>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> >>>>> index 2b38f89070..4467195fac 100644
> >>>>> --- a/hw/riscv/virt.c
> >>>>> +++ b/hw/riscv/virt.c
> >>>>> @@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
> >>>>>       * halfway into RAM, and for boards with 256MB of RAM or more we put
> >>>>>       * the initrd at 128MB.
> >>>>>       */
> >>>>> -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> >>>>> +    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
> >>>>> +#if defined(TARGET_RISCV32)
> >>>>> +    *start = (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB));
> >>>>> +#elif defined(TARGET_RISCV64)
> >>>>> +    *start = (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
> >>>>> +#endif
> >>>>>
> >>>>>      size = load_ramdisk(filename, *start, mem_size - *start);
> >>>>>      if (size == -1) {
> >>>>> --
> >>>>> 2.19.1
> >>>>
> >>>> Maybe I'm missing something, but wouldn't something like
> >>>>
> >>>>     uint64_t start_unclobbered = kernel_entry + MIN(mem_size / 2, 128ULL * MiB);
> >>>>     assert(start_unclobbered == (hwaddr)start_unclobbered);
> >>>>     *start = (hwaddr)start_unclobbered;
> >>>>
> >>>> work better?  That should actually check this all lines up, as opposed to just
> >>>> silently truncating a bad address.
> >>>
> >>> The problem is that hwaddr is always 64-bit.
> >>>
> >>> Stupidly I forgot about target_ulong, which should work basically the
> >>> same as above. An assert() seems a little harsh though, Alex reported
> >>> problem was fixed with just a cast.
> >>
> >> OK, I must be misunderstanding the problem, then.  With the current code, isn't
> >> it possible to end up causing start to overflow a 32-bit address?  This would
> >> happen if kernel_entry is high, with IIUC is coming from the ELF to load and is
> >> therefor user input.  I think that's worth some sort of assertion, as it'll
> >> definitely blow up trying to enter the kernel (and possible before that,
> >> assuming there's no target memory where it overflows into).
> >
> > I don't have a setup to reproduce this unfortunately, but Alex
> > reported that he saw start being excessively high (0xffffffff88000000)
> > when loading an initrd.
>
> Sorry for only jumping in so late.
>
> I didn't actually propose the cast as a solution. The problem must be
> sign extension of some variable in the mix. I didn't find out quickly
> which one it was, so I figured I'd leave it for someone else to debug :).
>
> The issue is very easy to reproduce: Build U-Boot for the virt machine
> for riscv32. Then run it with
>
>   $ qemu-system-riscv32 -M virt -kernel u-boot -nographic -initrd <a file>

Ah, cool I can reproduce it now.

It happens in load_elf32() (which is actually glue(load_elf, SZ)).

This line ends up sign extending the value:
    *pentry = (uint64_t)(elf_sword)ehdr.e_entry;

and we just continue it from there.

So I think this diff is a much better solution:

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e7f0716fb6..348ecc39d5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -62,7 +62,7 @@ static const struct MemmapEntry {
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
 };

-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;



Alistair

>
> You can find the initrd address with
>
>   U-Boot# fdt addr $fdtcontroladdr
>   U-Boot# fdt ls /chosen
>
> Then take a peek at that address:
>
>   U-Boot# md.b <addr>
>
> and you will see that there is nothing there without this patch. The
> reason is that the binary was loaded to a negative address. Again,
> probably some misguided sign extension.
>
> > It looks like the kernel entry address ends up being converted to
> > 0xffffffff80000000 incorrectly instead of being a real overflow.
>
> Yeah, so we seem to cast from int32_t to int64_t somewhere. Can you spot
> where exactly? That's where the bug is :).
>
>
> Alex

