Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ga203-0007im-CP
	for mharc-qemu-riscv@gnu.org; Thu, 20 Dec 2018 12:20:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ga202-0007hO-6Z
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 12:20:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ga201-0007bG-CU
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 12:20:42 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:41873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ga1zw-0007UJ-Q0; Thu, 20 Dec 2018 12:20:38 -0500
Received: by mail-lj1-x241.google.com with SMTP id k15-v6so2260580ljc.8;
	Thu, 20 Dec 2018 09:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7TJRU34rDdJScZsNogVMTOhXlBPPJ3lRbTxK99OhI4c=;
	b=BvLhhkjVttS1+nxzMa1U44KiipSAdglug6026lA1VbYenwrYdhuFEI6Bjy+9emOmNK
	PaMxdzVpLM9gYUzHngfdCi7XZQxJEkyXSct3m4YX7BxMUGDsqzkEEGpdBtdJkiRm4c5S
	mDppZHxaHnBxN5iJugEFecCIulNAHWST+z9JpMHRAQ8Ll/ECr+jyoBhK/PqETJv65He0
	G2ngjkOt6LXLqbwwFLKe6kjyR/XQEJtfjfW6ZQzGp/7WdjkHGAIX0HdBfAh+601Yc5ZO
	RnvmLeBj38MjEn+NCUuOJAhnw/qQIieYhT06AyV7bnfplHl3qBEUy35URmV9SBcw8rF3
	v59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7TJRU34rDdJScZsNogVMTOhXlBPPJ3lRbTxK99OhI4c=;
	b=Afm2+dE0xfHxUCPNf3y2y70CLF2uZMD+c2YAoKcCLRs+QbS03IbdVrCIlnDL46HGuE
	hKM9zfRdL3EIsW6IoX0jqzrWeglZ+s05ELnC0N78YbN1gNXNwg9nOkDcLuWoORwkSpTp
	ngEE1JImOmtLsHadyrsJoUlHwjpIhW+27Ja4ddAAR0YmTtZfhnBUfpt0csyLCQTquPfJ
	tVw0fcU+H6glEMX508xrqOt2BqrEuTPefE+Ywu+k9QXAK8B5Dk8eixcfHQN6or8CBi/0
	cTtyA2D2wsUlZPCA8KqgsLTN2Iwy6hr2fAXvX3LRrAR6ANSDfTOzLmB3vsaDcTpYihN1
	lV1A==
X-Gm-Message-State: AA+aEWZ5/vMIUncK6LCRq1LjZpBGqsP4HLnju3CoUiKGwbZq/PQd0w3S
	IvXxUyoYO16aSNpKEp81n6L9qM5T8DLNclLKaGs=
X-Google-Smtp-Source: AFSGD/XsLdki0Ucncl6wB+kPGgundE+0uy1/1DmhqmvICyaxXBNyuy8tPpzxeqdSNMeMUGnISW7aW6FUpWumqKqUQbE=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr17346173lja.111.1545326432084; 
	Thu, 20 Dec 2018 09:20:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545246859.git.alistair.francis@wdc.com>
	<19f7305e-ae63-3a5b-87dd-e0cfd835462f@linaro.org>
In-Reply-To: <19f7305e-ae63-3a5b-87dd-e0cfd835462f@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Dec 2018 09:20:05 -0800
Message-ID: <CAKmqyKNY4FCzXcpBMWawVA9RWGBZ7vctRLaQGhsODH6HCXkK9A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [PATCH v2 00/23] Add RISC-V TCG backend support
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
X-List-Received-Date: Thu, 20 Dec 2018 17:20:43 -0000

On Wed, Dec 19, 2018 at 10:07 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/19/18 11:16 AM, Alistair Francis wrote:
> > This patch set adds RISC-V backend support to QEMU. This is based on
> > Michael Clark's original work with extra work on top.
> >
> > This has been somewhat tested and can run other architecture softmmu
> > code. It seems that any complex OS will eventually hang, but we can
> > run the BIOS and OS startup code for a number of different operating
> > systems.
> >
> > I haven't tested linux user support at all yet. I think Michael had that
> > working reliably though and hopefully my changes haven't broken it.
> >
> > There are still some todos in the code (there are missing instructions
> > and byte swapping) but these should assert instead of generating invalid
> > code.
>
> Queued to tcg-next, with the extrh fix.

Thanks Richard!

>
> Some of those todos are no longer todos, since e.g. bswap is now optional.
> Those asserts should never fire (as a good assert should do, I suppose).
>
> The missing instructions are only for riscv32, which afaik is just now making
> its way to glibc.  So a chroot complete enough to build qemu is a ways away.
> I'm ok with leaving that incomplete for now.
>
>
> r~

