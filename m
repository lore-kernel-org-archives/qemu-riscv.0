Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ga3dP-0001eK-4j
	for mharc-qemu-riscv@gnu.org; Thu, 20 Dec 2018 14:05:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ga3dM-0001Zn-F3
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 14:05:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ga3dJ-0003Fi-Jz
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 14:05:23 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:41459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ga3dF-0002zH-Lf; Thu, 20 Dec 2018 14:05:19 -0500
Received: by mail-lj1-x243.google.com with SMTP id k15-v6so2535176ljc.8;
	Thu, 20 Dec 2018 11:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jxcdrXH+CWH1qC/gWGrGv0EejsEg/vzHadk+Ps3Lbvg=;
	b=j3omkOr9a4FmM10yPs8itw19WZ6qPLWKn+gHOdDgRpXpBPra5uq3V6fOGLjM+VZQk9
	yq3iDHyUsFwww2L1M+P3NbdFGiBQJqbN8M2u3jkOktoKt8LNKGi2Fv8pur+7Ijxva/bE
	y2bEiykCwUbeOG9bTtI9B3y7AOmTTe9MkpJjC1nhF9zCo06NyZF4uyQC8KYNnaxN0Xip
	9kLanNPfAKkWtlgq8BAjbNk1iTsrCl2ckKn4s65BZdV2KoOm13PlrBcLmO0FAkMP+qzx
	D73zSGQ3qTrhJaGlOMaTGF1fpx7fgfPLsYuHul4WoTA6WPEec8npub+edYCVIPHP2cRt
	0H0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jxcdrXH+CWH1qC/gWGrGv0EejsEg/vzHadk+Ps3Lbvg=;
	b=PGxYUbXIiV5oUQqmhIDtgYE0hlO7+Y/X8ZYBHGWMpLBB/3NF/nTzHYma/wCYYV6EZR
	TuWEVGZN741kSh4NRZ4cIGl0ZD1AlenMhYD091TQempWAb3IhHjIFNs6Jchb+zdlMPgu
	lLdbg/LTiJKPPrxkIoBhB5QQ/1oZ5ZYKrYgCyWoTZans5mM3VzEjir7rPoYOens82w4u
	5vz02cLrGOsxNKJ9uosaZHBc1GYV9ADvgEh9HEPvw4QrF1Fygoty7wWKdvNisOynjkzn
	tTJqaZ5N0y+wV/VZ6F05dSre41ybmTnAG9abAaZ8KkfenJehmtIs05iQhdcKexFdCahg
	/uMA==
X-Gm-Message-State: AA+aEWayd1nxM2TsdLispXTXVfarZ1xSQn5q73kfgMpblPNEmonBq+S4
	t5DfnRWr15GZzlf929S/4AIPMELvJQJVN0ukTCw=
X-Google-Smtp-Source: AFSGD/WiIpCyDnY6DmcnuS6KmLlhnb0dxj4bRHxLcFWDMBsCr2XVAogZ4IoHQWX6o4G4/QsHV8KDoP3zrnED4lVcaxU=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr17553249lja.111.1545332708389; 
	Thu, 20 Dec 2018 11:05:08 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKNY4FCzXcpBMWawVA9RWGBZ7vctRLaQGhsODH6HCXkK9A@mail.gmail.com>
	<mhng-9f966fb7-686c-4427-a39c-850368f88f0e@palmer-si-x1c4>
In-Reply-To: <mhng-9f966fb7-686c-4427-a39c-850368f88f0e@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Dec 2018 11:04:41 -0800
Message-ID: <CAKmqyKPXri6faCRjXnp7WCyRYcuBhiEU=W_VrW4LYUe1O_c4Pw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/23] Add RISC-V TCG
 backend support
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
X-List-Received-Date: Thu, 20 Dec 2018 19:05:25 -0000

On Thu, Dec 20, 2018 at 10:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 20 Dec 2018 09:20:05 PST (-0800), alistair23@gmail.com wrote:
> > On Wed, Dec 19, 2018 at 10:07 PM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 12/19/18 11:16 AM, Alistair Francis wrote:
> >> > This patch set adds RISC-V backend support to QEMU. This is based on
> >> > Michael Clark's original work with extra work on top.
> >> >
> >> > This has been somewhat tested and can run other architecture softmmu
> >> > code. It seems that any complex OS will eventually hang, but we can
> >> > run the BIOS and OS startup code for a number of different operating
> >> > systems.
> >> >
> >> > I haven't tested linux user support at all yet. I think Michael had that
> >> > working reliably though and hopefully my changes haven't broken it.
> >> >
> >> > There are still some todos in the code (there are missing instructions
> >> > and byte swapping) but these should assert instead of generating invalid
> >> > code.
> >>
> >> Queued to tcg-next, with the extrh fix.
> >
> > Thanks Richard!
>
> Sounds good to me.  I'm still attempting to collect the RISC-V patches to get a
> PR out, a few things came up but I should have time now.  This was the biggest
> patch set, so it should be a lot easier now.
>
> Thanks for picking this up!
>
> >> Some of those todos are no longer todos, since e.g. bswap is now optional.
> >> Those asserts should never fire (as a good assert should do, I suppose).
> >>
> >> The missing instructions are only for riscv32, which afaik is just now making
> >> its way to glibc.  So a chroot complete enough to build qemu is a ways away.
> >> I'm ok with leaving that incomplete for now.
>
> We've decided to delay the rv32i glibc port until after the next glibc release,
> which is targeted for the beginning of February.  glibc should freeze at the
> end of the year, at which point we're going to do a rv32i glibc prerelease and
> try to build a proper userspace with the theory being that we'll shake out ABI
> bugs that way.

Yocto/OE has full support for building 32-bit userspaces with the
latest 32-bit glibc patchset so that is probably a good place to start
testing. It even runs QEMU!

Alistair

