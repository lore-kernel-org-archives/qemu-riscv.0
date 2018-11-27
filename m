Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRlrK-0004yU-Ln
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 17:29:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRlrI-0004wy-Be
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:29:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRlrH-000375-AU
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:29:32 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:44191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRlrE-0002zi-L2; Tue, 27 Nov 2018 17:29:29 -0500
Received: by mail-lj1-x244.google.com with SMTP id k19-v6so21558396lji.11;
	Tue, 27 Nov 2018 14:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZNk9fD2XossD5M3VURfaaDa8v5UAFZ5ET64/vJWje0A=;
	b=DT1CVeBPXiJqT09r1DwbA4slYEJrRYVVBNxfGpA8FWugj3qBETuDHwjjeMv497gXku
	14lfew9ECReHBXbOf15p2IWdJfcflgakvKk0xayR3fh4ZyuzOaQVS6LjBb3itXL3yWkG
	IYa9fz7zvOti3LZLXX8onqb3ahhEtfcV38Iuk3dAMq2BPabcA9ML3lysy+6zuZPWD2B3
	53YLq8CW8rKaw8x1cJxHYrrqXDFmOoCXJqIKG9BA3BIk42i5dTAlmx1KaZ1Ub3DOZjO8
	6j7BafjJYv+wu81TN0lJqFDw2oM3WS0BpqGGlgnNAGygYJHD+tb94qOXDS3IhcNOW1+K
	Eu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZNk9fD2XossD5M3VURfaaDa8v5UAFZ5ET64/vJWje0A=;
	b=iuQtQ13kN7qPArmHTw0nEu3dOiUglT9aDZv2hT+25tMhQ+g7P6JmDXhrQpwWGuoAFx
	//TLBkmi0l+AkYQInP1CrDjf8lwj0feRyssTBf+CbKhI0DgPaMIjH0HlYKhwoCkrncKi
	SG0oZrbRDvCi/J2NA9pyP3wd9lo4A9kN9Gy2ugASXZrRzX+xPe+lFcN8R2Bj/tI5aQF5
	Ve6NnROei9yXRR2ZN5zkPFrbTaFfMqk5Y6dDx6i4fbwyCiHT1UiLeP2UTgbuw5RgkgJs
	n105cPvbEAcNbh84YPTtvgqAS55mls9MYY5T+2o49h5aKlxc4dcusQEbJVAZ63Uh1H0q
	w+Ew==
X-Gm-Message-State: AGRZ1gKwO8nAVhVVb1b1vuN79G7j9uDIlWV4aqVeCAn3WXaEW9Y5LxEj
	27pPwVfAjKDRiebmFXU2GgCBIa1NGYQAxu3VZDc6bRAX
X-Google-Smtp-Source: AFSGD/WQyzh0EQQJRc4C/dPBxz7TaicEjVBiwcBbewk2F7Nfj+8FI7V8mLA4IqQ2CZAh2kkK8d28AWO3UA5Q2NiHOC0=
X-Received: by 2002:a2e:7801:: with SMTP id
	t1-v6mr20892352ljc.84.1543357766414; 
	Tue, 27 Nov 2018 14:29:26 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKMdNs4etff7rc0vDy_tmZf5deP1Geu0GchkENu+em5=+w@mail.gmail.com>
	<mhng-b345219b-56ea-4aee-b25e-95c762c54b49@palmer-si-x1c4>
	<CAKmqyKPtn-C5rm3ggj5CvAAXh+Gq=u8YDh1S8Wmsb=tsLjcsXA@mail.gmail.com>
	<005a50f1-8270-ee52-d79e-321b03d841e4@suse.de>
	<CAKmqyKOaECi3vEpe8GbdG1y80TODUMMBzmQbo4RVY_jC5PhibA@mail.gmail.com>
In-Reply-To: <CAKmqyKOaECi3vEpe8GbdG1y80TODUMMBzmQbo4RVY_jC5PhibA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Nov 2018 14:28:59 -0800
Message-ID: <CAKmqyKP7+GmD7zWDzfECEd7gQp9DQx0bmjpw4WQmMZjvw6R5Jg@mail.gmail.com>
To: Alexander Graf <agraf@suse.de>
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
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
X-List-Received-Date: Tue, 27 Nov 2018 22:29:33 -0000

On Tue, Nov 27, 2018 at 2:24 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Nov 27, 2018 at 2:12 PM Alexander Graf <agraf@suse.de> wrote:
> >
> >
> >
> > On 27.11.18 23:05, Alistair Francis wrote:
> > > On Mon, Nov 26, 2018 at 11:02 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> > >>
> > >> On Wed, 21 Nov 2018 18:09:27 PST (-0800), alistair23@gmail.com wrote:
> > >>> On Wed, Nov 21, 2018 at 5:58 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> > >>>>
> > >>>> On Wed, 21 Nov 2018 14:34:44 PST (-0800), Alistair Francis wrote:
> > >>>>> Ensure that the calculate initrd offset points to a valid address for
> > >>>>> the architecture.
> > >>>>>
> > >>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > >>>>> Suggested-by: Alexander Graf <agraf@suse.de>
> > >>>>> Reported-by: Alexander Graf <agraf@suse.de>
> > >>>>> ---
> > >>>>>  hw/riscv/virt.c | 7 ++++++-
> > >>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
> > >>>>>
> > >>>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > >>>>> index 2b38f89070..4467195fac 100644
> > >>>>> --- a/hw/riscv/virt.c
> > >>>>> +++ b/hw/riscv/virt.c
> > >>>>> @@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
> > >>>>>       * halfway into RAM, and for boards with 256MB of RAM or more we put
> > >>>>>       * the initrd at 128MB.
> > >>>>>       */
> > >>>>> -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> > >>>>> +    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
> > >>>>> +#if defined(TARGET_RISCV32)
> > >>>>> +    *start = (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB));
> > >>>>> +#elif defined(TARGET_RISCV64)
> > >>>>> +    *start = (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
> > >>>>> +#endif
> > >>>>>
> > >>>>>      size = load_ramdisk(filename, *start, mem_size - *start);
> > >>>>>      if (size == -1) {
> > >>>>> --
> > >>>>> 2.19.1
> > >>>>
> > >>>> Maybe I'm missing something, but wouldn't something like
> > >>>>
> > >>>>     uint64_t start_unclobbered = kernel_entry + MIN(mem_size / 2, 128ULL * MiB);
> > >>>>     assert(start_unclobbered == (hwaddr)start_unclobbered);
> > >>>>     *start = (hwaddr)start_unclobbered;
> > >>>>
> > >>>> work better?  That should actually check this all lines up, as opposed to just
> > >>>> silently truncating a bad address.
> > >>>
> > >>> The problem is that hwaddr is always 64-bit.
> > >>>
> > >>> Stupidly I forgot about target_ulong, which should work basically the
> > >>> same as above. An assert() seems a little harsh though, Alex reported
> > >>> problem was fixed with just a cast.
> > >>
> > >> OK, I must be misunderstanding the problem, then.  With the current code, isn't
> > >> it possible to end up causing start to overflow a 32-bit address?  This would
> > >> happen if kernel_entry is high, with IIUC is coming from the ELF to load and is
> > >> therefor user input.  I think that's worth some sort of assertion, as it'll
> > >> definitely blow up trying to enter the kernel (and possible before that,
> > >> assuming there's no target memory where it overflows into).
> > >
> > > I don't have a setup to reproduce this unfortunately, but Alex
> > > reported that he saw start being excessively high (0xffffffff88000000)
> > > when loading an initrd.
> >
> > Sorry for only jumping in so late.
> >
> > I didn't actually propose the cast as a solution. The problem must be
> > sign extension of some variable in the mix. I didn't find out quickly
> > which one it was, so I figured I'd leave it for someone else to debug :).
> >
> > The issue is very easy to reproduce: Build U-Boot for the virt machine
> > for riscv32. Then run it with
> >
> >   $ qemu-system-riscv32 -M virt -kernel u-boot -nographic -initrd <a file>
>
> Ah, cool I can reproduce it now.
>
> It happens in load_elf32() (which is actually glue(load_elf, SZ)).
>
> This line ends up sign extending the value:
>     *pentry = (uint64_t)(elf_sword)ehdr.e_entry;
>
> and we just continue it from there.
>
> So I think this diff is a much better solution:
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e7f0716fb6..348ecc39d5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -62,7 +62,7 @@ static const struct MemmapEntry {
>      [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
>  };
>
> -static uint64_t load_kernel(const char *kernel_filename)
> +static target_ulong load_kernel(const char *kernel_filename)
>  {
>      uint64_t kernel_entry, kernel_high;
>
>
>
> Alistair
>
> >
> > You can find the initrd address with
> >
> >   U-Boot# fdt addr $fdtcontroladdr
> >   U-Boot# fdt ls /chosen
> >
> > Then take a peek at that address:
> >
> >   U-Boot# md.b <addr>
> >
> > and you will see that there is nothing there without this patch. The
> > reason is that the binary was loaded to a negative address. Again,
> > probably some misguided sign extension.
> >
> > > It looks like the kernel entry address ends up being converted to
> > > 0xffffffff80000000 incorrectly instead of being a real overflow.
> >
> > Yeah, so we seem to cast from int32_t to int64_t somewhere. Can you spot
> > where exactly? That's where the bug is :).

Actually this diff looks like a better more generic fix:

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 81cecaf27e..7c1930e7a3 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -342,8 +342,9 @@ static int glue(load_elf, SZ)(const char *name, int fd,
             }
     }

-    if (pentry)
-       *pentry = (uint64_t)(elf_sword)ehdr.e_entry;
+    if (pentry) {
+        *pentry = (uint64_t)(elf_word)ehdr.e_entry;
+    }

     glue(load_symbols, SZ)(&ehdr, fd, must_swab, clear_lsb, sym_cb);

My only concern is that it will break some other 32-bit guest. It
seems odd that no one else has seen this before.

Alistair

> >
> >
> > Alex

