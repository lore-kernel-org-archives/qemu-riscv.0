Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPeRO-0004Ua-7e
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 21:10:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPeRL-0004Sd-BK
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:10:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPeRK-0000YL-KE
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:09:59 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:43662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPeRI-0000PP-Hk; Wed, 21 Nov 2018 21:09:56 -0500
Received: by mail-lj1-x241.google.com with SMTP id 83-v6so6530875ljf.10;
	Wed, 21 Nov 2018 18:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f1lsW4uFKratc9wu7qNGHAgJ/1IdaHsthdDOBYbxjno=;
	b=ASL7xbv8ZcJoSUx7ej+1qzCfsbOMV+ctEAEZgJttSk6A9OYirmPGLAe8uaQIgocVGy
	wtM0Sk0fIyD0la12bvjga7VXXkOA6XGgG2bHoYxSQwZxFwZIDpeJ2wsdDlHemn2H5qTS
	c4B9sw2m0e4APIGSo1ib8ZyHBQsv4dYjUI+yfi0kCsY8hauvAEkH8TPXwFaH5cV/D/Jw
	jLfDbWIUNJAG2odLrGhi5BoTLP0MWL4C1qAU+UK2/RsLsY3Cd4RhdaGBLutN7CrUOmFv
	/Vq4rwRRSMOxkL5K5Pl9SpQwrI37u17M8gvTgoPnPkzfr9LbXRtEYw+18bQGQO1uomoR
	Dgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f1lsW4uFKratc9wu7qNGHAgJ/1IdaHsthdDOBYbxjno=;
	b=m4NtA4smpL4SETXwlvldBTlUmsD5zeD6Wndc/4Pr4Xd/q4LR6oLvt++G/VohOowq7x
	uiMC5GvOo0v75vxcfEQSpG1rslCtYn7G5JSQEE/fjbNacTpR5AugpJF3iiWDayus86nO
	y4NLocLApnHwRafPh3e4fXOfLAnqsHf6AtedO39Pmi9hPnzJ/c9e+jOJfxpuxeaQ5orX
	KvMWPF/xwZi59uwggF+jbOfIy9ntqE8CfhyaAdGVHK8NGRATgbW4dY/uNrccPrLggbRa
	eEL1wjDt+UNccaqUwdm15kJeR6bCvi5bnm8A5ZPKOsmolA5Fwrh7/jYOFmsFP1fD/ULw
	6hcQ==
X-Gm-Message-State: AGRZ1gJ1f7l2o5Bn3E73//X32ljtKOpto9HNd33mSReHhO7DXx1dXA6u
	lwqxOi7sbqIpBANSlHNH+i8OKvT8KzINYZupVwE=
X-Google-Smtp-Source: AFSGD/VOtPoFHktXe9qCHVGn6OFCUt4sDoPyZGT0mXq50xXuHPGPZustJ7YuM+K1ndhhfkOf1mycdMXzE1Job9OZQpo=
X-Received: by 2002:a2e:7801:: with SMTP id t1-v6mr5426065ljc.84.1542852594408;
	Wed, 21 Nov 2018 18:09:54 -0800 (PST)
MIME-Version: 1.0
References: <6559716eae4b53d2cad39ec6011cdd7b1b32138a.1542839652.git.alistair.francis@wdc.com>
	<mhng-3aa4aa94-927c-4ff8-867b-10d341c90d52@palmer-si-x1c4>
In-Reply-To: <mhng-3aa4aa94-927c-4ff8-867b-10d341c90d52@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 18:09:27 -0800
Message-ID: <CAKmqyKMdNs4etff7rc0vDy_tmZf5deP1Geu0GchkENu+em5=+w@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Thu, 22 Nov 2018 02:10:00 -0000

On Wed, Nov 21, 2018 at 5:58 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 21 Nov 2018 14:34:44 PST (-0800), Alistair Francis wrote:
> > Ensure that the calculate initrd offset points to a valid address for
> > the architecture.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Suggested-by: Alexander Graf <agraf@suse.de>
> > Reported-by: Alexander Graf <agraf@suse.de>
> > ---
> >  hw/riscv/virt.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 2b38f89070..4467195fac 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
> >       * halfway into RAM, and for boards with 256MB of RAM or more we put
> >       * the initrd at 128MB.
> >       */
> > -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> > +    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
> > +#if defined(TARGET_RISCV32)
> > +    *start = (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB));
> > +#elif defined(TARGET_RISCV64)
> > +    *start = (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
> > +#endif
> >
> >      size = load_ramdisk(filename, *start, mem_size - *start);
> >      if (size == -1) {
> > --
> > 2.19.1
>
> Maybe I'm missing something, but wouldn't something like
>
>     uint64_t start_unclobbered = kernel_entry + MIN(mem_size / 2, 128ULL * MiB);
>     assert(start_unclobbered == (hwaddr)start_unclobbered);
>     *start = (hwaddr)start_unclobbered;
>
> work better?  That should actually check this all lines up, as opposed to just
> silently truncating a bad address.

The problem is that hwaddr is always 64-bit.

Stupidly I forgot about target_ulong, which should work basically the
same as above. An assert() seems a little harsh though, Alex reported
problem was fixed with just a cast.

Alistair

