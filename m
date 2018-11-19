Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOsdE-0003nm-2u
	for mharc-qemu-riscv@gnu.org; Mon, 19 Nov 2018 18:07:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gOsdB-0003mJ-Ls
	for qemu-riscv@nongnu.org; Mon, 19 Nov 2018 18:07:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gOsdB-0007in-05
	for qemu-riscv@nongnu.org; Mon, 19 Nov 2018 18:07:01 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gOsd8-0007h4-SQ; Mon, 19 Nov 2018 18:06:59 -0500
Received: by mail-lj1-x242.google.com with SMTP id t9-v6so27617430ljh.6;
	Mon, 19 Nov 2018 15:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DW1TDrWlnCRvV3sWzvfMX0C/+4c5C1Yu1ExYzLvk+gI=;
	b=Q+Cgcs3pJmZC+ANHYrFPvwMC7icvtcwnMBa1QDj5esxXO3dRG6AHk64CBjqjllkpVg
	Ig+NNDdvBjReVoxonQUWJEA2Zr64AZTOVfsYHtOPUQRM/UFDYNbi6KBxsjQkRfWquOwg
	5wAqZO9JZ/ElY2sTlAQZRJQRL0rllKOwW9wduc6kElqN3XDkZ426NlMHuOeixETZPl5H
	orwDVyTz5VMKxx8VzigvA8IrOPiVtmMe4DwLec2habTBJD2hBfNpXfaqqUDDoLD/2ax3
	83L6s79W0EYPhoHl/wk1aKEp2WcXzCtUS8ExdeBaUvnFBmY/B87oTiWT+iSxCq25VyY7
	l01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DW1TDrWlnCRvV3sWzvfMX0C/+4c5C1Yu1ExYzLvk+gI=;
	b=LMHlaCrqw5fjSiPmDt1qkbCmz/YeWp37OsYa0KHawVbf6bKUQy7YwCedLW3bekOl33
	an2RHWx6hVBOwATF5uNbHLi2uEpvah5EV5OeQXwd3BQOenN9imkdUMFh2BDe5yPrZo8f
	0q4ECLsrHEV9uqsjQj37mPGw6U3d0j1VaoLfp3XQqjlbvvoa5rdJThoqfM4aobpwWA6O
	x4knjzvmJixg5Q56lEOT7GxLDBooYuVOI8vJj0874FjPPJN6Och9lTIvaaUpxX88QDe8
	k6OHv5VcHnFvqw7N5rNKf4NzoIRzgwFv8i+PNbYJFR2jPP3ODucOZ8zU32sVUsk8xYy2
	YPjw==
X-Gm-Message-State: AGRZ1gKzIqtXQs1yCc6GsXxN3KwfJ0LiepoXzbjhaXcJqj5G4Ijazqlo
	KmjBPVh2Nq7QJIHnQetY+OXgAXSBNK2e+TXFQ7s=
X-Google-Smtp-Source: AJdET5enB4UMS5Ial7o6gDroL5T1geHTrA43t0tRRUCwl3bW4vGsioNRXUwQwarQRZjzIVrSAFx7OicQvrOdstpOw+8=
X-Received: by 2002:a2e:7801:: with SMTP id
	t1-v6mr12352028ljc.84.1542668817556; 
	Mon, 19 Nov 2018 15:06:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<ccb312eb986d846b1b0aa0be062833e5ae1bb5f4.1542321076.git.alistair.francis@wdc.com>
	<687076b9-a5ca-2821-3e24-8b08363f1b5c@linaro.org>
In-Reply-To: <687076b9-a5ca-2821-3e24-8b08363f1b5c@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Nov 2018 15:06:31 -0800
Message-ID: <CAKmqyKPsnX+RR1A6BTdXZ4-WFix5o9OKpXLyffe8Y_erZ=kYDA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 17/23] riscv: tcg-target: Add
 direct load and store instructions
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
X-List-Received-Date: Mon, 19 Nov 2018 23:07:02 -0000

On Fri, Nov 16, 2018 at 9:10 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/15/18 11:36 PM, Alistair Francis wrote:
> > +    tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
>
> Should avoid this when guest_base == 0, which happens fairly regularly for a
> 64-bit guest.
>
> > +        /* Prefer to load from offset 0 first, but allow for overlap.  */
> > +        if (TCG_TARGET_REG_BITS == 64) {
> > +            tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
> > +        } else {
> > +            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
> > +            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
> > +        }
>
> Comment sounds like two lines of code that's missing.

I can't figure out what this comment should be for. Why would we want
to prefer loading with an offset 0?

Alistair

>
> > +    const TCGMemOp bswap = opc & MO_BSWAP;
> > +
> > +    /* TODO: Handle byte swapping */
>
> Should assert rather than emit bad code.
>
> I do still plan to change tcg to allow backends to *not* handle byte swapping
> if they don't want.  This will make the i386 and arm32 backends less icky.
>
>
> r~

