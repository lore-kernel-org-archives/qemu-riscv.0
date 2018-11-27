Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRlUf-0002fK-23
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 17:06:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRlUc-0002dy-Tf
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:06:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRlUb-0004QB-LU
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:06:06 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:38303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRlUY-0004OR-Rz; Tue, 27 Nov 2018 17:06:03 -0500
Received: by mail-lf1-x141.google.com with SMTP id p86so17817342lfg.5;
	Tue, 27 Nov 2018 14:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v81vrwaGZVW59Urn75YYTsWzDK/m4kr8kOw3gkLlZsg=;
	b=g1ZvOPw64GwS2/QIVgDV4gPofVfJ1KdOT+GoEF9N3uSDnJtoNkATKtVFkazf8lG3jW
	CGDu4iBFUJg10sQrXiFIgYq3bkATVlrdYjklvutABp1fGirgxYhjuGA+tqQWiKjezoWr
	WQbtOOFTNIRIBy4e2nHtt4u5uDTz4fpfTAlNThCndjU6RTjERSgky4Y5iCwqFjjA8xo0
	MDriuEWudhVMiRfhdbnao/YZJioguiX+kAOizzYp30cm1wJEjTsM5Cn9grfhoQzvQNae
	LJuCUy4JrZelLK5NBd5dRbAKUGBN3giwXGfbgr7fOWG1BxQ6SMMf3Dh+Pw+OyQPoH6jQ
	udhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v81vrwaGZVW59Urn75YYTsWzDK/m4kr8kOw3gkLlZsg=;
	b=p9oPyqPTRhRObmh+V2u0XDwRZ2T05Xae5ADZ2Xz0cPvlEnQ7lIeT5GD+G7Pa5b6Duv
	5FVH3ylfTwUEEeWryT+k6DlOYIebN8/CMrqneFiyjtKpW6YLuEUSVRtpZkq3VZE1DJvh
	B55n3KEE9d2B2R25dz3XYM8C7D8cvTASnTnrhhZkukH124lKV4RvD5GwY9KtDlyZPulp
	dImqxeLzzHPu2ti3swvjdnW+tICb5lqG91wBA4JbmNNd3iT5CMiun1OUMu0Hcxc0WT5V
	hG0Zg8+omVEsjf6GUjiU8SBhNdiMsqyEFgPWpBe/fnhbrZu88D1fZbWEUyDe49MFzMiZ
	oxzg==
X-Gm-Message-State: AGRZ1gKNth4Ig5lpdBCD2/skykxeJ5xs8+3fl1d51SbssBFjViYjx3Z1
	l4XbOT8Hr1k/RItt0fyiRWnMk+NByfsckEtjqhY=
X-Google-Smtp-Source: AJdET5fIA3175kIPNllsqEU6CGfUKiSEudjwEO2Row7UHt90O5KRe0m6nlCZdplwOK6fSCsirbf8wnYdP6kn40Yd0QE=
X-Received: by 2002:a19:8fce:: with SMTP id s75mr19333397lfk.151.1543356360878;
	Tue, 27 Nov 2018 14:06:00 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKMdNs4etff7rc0vDy_tmZf5deP1Geu0GchkENu+em5=+w@mail.gmail.com>
	<mhng-b345219b-56ea-4aee-b25e-95c762c54b49@palmer-si-x1c4>
In-Reply-To: <mhng-b345219b-56ea-4aee-b25e-95c762c54b49@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Nov 2018 14:05:33 -0800
Message-ID: <CAKmqyKPtn-C5rm3ggj5CvAAXh+Gq=u8YDh1S8Wmsb=tsLjcsXA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
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
X-List-Received-Date: Tue, 27 Nov 2018 22:06:08 -0000

On Mon, Nov 26, 2018 at 11:02 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 21 Nov 2018 18:09:27 PST (-0800), alistair23@gmail.com wrote:
> > On Wed, Nov 21, 2018 at 5:58 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Wed, 21 Nov 2018 14:34:44 PST (-0800), Alistair Francis wrote:
> >> > Ensure that the calculate initrd offset points to a valid address for
> >> > the architecture.
> >> >
> >> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> > Suggested-by: Alexander Graf <agraf@suse.de>
> >> > Reported-by: Alexander Graf <agraf@suse.de>
> >> > ---
> >> >  hw/riscv/virt.c | 7 ++++++-
> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> >> > index 2b38f89070..4467195fac 100644
> >> > --- a/hw/riscv/virt.c
> >> > +++ b/hw/riscv/virt.c
> >> > @@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
> >> >       * halfway into RAM, and for boards with 256MB of RAM or more we put
> >> >       * the initrd at 128MB.
> >> >       */
> >> > -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> >> > +    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
> >> > +#if defined(TARGET_RISCV32)
> >> > +    *start = (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB));
> >> > +#elif defined(TARGET_RISCV64)
> >> > +    *start = (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
> >> > +#endif
> >> >
> >> >      size = load_ramdisk(filename, *start, mem_size - *start);
> >> >      if (size == -1) {
> >> > --
> >> > 2.19.1
> >>
> >> Maybe I'm missing something, but wouldn't something like
> >>
> >>     uint64_t start_unclobbered = kernel_entry + MIN(mem_size / 2, 128ULL * MiB);
> >>     assert(start_unclobbered == (hwaddr)start_unclobbered);
> >>     *start = (hwaddr)start_unclobbered;
> >>
> >> work better?  That should actually check this all lines up, as opposed to just
> >> silently truncating a bad address.
> >
> > The problem is that hwaddr is always 64-bit.
> >
> > Stupidly I forgot about target_ulong, which should work basically the
> > same as above. An assert() seems a little harsh though, Alex reported
> > problem was fixed with just a cast.
>
> OK, I must be misunderstanding the problem, then.  With the current code, isn't
> it possible to end up causing start to overflow a 32-bit address?  This would
> happen if kernel_entry is high, with IIUC is coming from the ELF to load and is
> therefor user input.  I think that's worth some sort of assertion, as it'll
> definitely blow up trying to enter the kernel (and possible before that,
> assuming there's no target memory where it overflows into).

I don't have a setup to reproduce this unfortunately, but Alex
reported that he saw start being excessively high (0xffffffff88000000)
when loading an initrd.

It looks like the kernel entry address ends up being converted to
0xffffffff80000000 incorrectly instead of being a real overflow.

Alistair

>
> This won't happen with the default Linux setup, but could happen if users are
> trying to do something weird.

