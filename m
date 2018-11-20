Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPFQx-0005gG-3a
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 18:27:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPFQv-0005ff-Jc
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:27:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPFQu-0007AW-L2
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:27:53 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:33998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPFLs-0008Sv-Ot; Tue, 20 Nov 2018 18:22:41 -0500
Received: by mail-lf1-x143.google.com with SMTP id p6so2618611lfc.1;
	Tue, 20 Nov 2018 15:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hJLG0Lt13Fwng9QdezJGMW0XHOBpYSs2iP9oHVcGs28=;
	b=DyCuYRfG+dHGpx0SK+zqTNfPZAKYJ+6SkcParrQDPoPtLe3su/3uIBVJJfX8u++MCb
	06Kni52frrUaPuGoA+pj9TsBzNE1/e0XNDgPS9iaesGvdv7uxS/TXQKPlY7LF9PFnMrq
	xpaVx4lqNXr+uGsGu3iQKENUehMl+TeEnrIjoTjcY9zLwUl/BLF2RM9jjEIPDfg1Qb5t
	K68n3l2/9raJSoO//kkA10C7UHLbNpFztxacPthRsW2YZKUOuX8QVf0bQdL6W5HXyndS
	aGY/XPbJpPEdSgmVZ/5ZWMBgdHs0I400BWOxtmRrAa1BlOvrv9zrAXGRima1laK31HIk
	PQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hJLG0Lt13Fwng9QdezJGMW0XHOBpYSs2iP9oHVcGs28=;
	b=MRV/XWeG4pxeLBGL3lSvv2PP/5keJk7DKHUci89cG42wV1/pHOA3HaQHsQlxbdcn01
	+GdhnrR52c4ThBRvIZacJ5ht4aJewfuYyw3dSgMBuYcxUF4mGAxH6QccyOV62T+rRzNa
	5kFb4u+a9c4nSpMmrantvK7d3+noe0NYqFhuoTDA+HlZiXzL7oWPF0mxL+qmKEddRoye
	mIABKGbuZ4Zie7BNDR7STOVeCNs9h8MhwcKdRuY5woIs4TuffXsnIqORidsd38B6aSTa
	oIwiEBeNemHqTH3qHm0Sd/Nfgi3NaH0fZGjSWLnZcMb/Pl/C/8AGFXQPG0Z7Y4a2pMpr
	Hflg==
X-Gm-Message-State: AGRZ1gLCTDWoe+TlYMCfsSvR3O/nHqqg3ioZmbw5M7nY+FK++aijzMuW
	RxaAzLD1uuv7FJ8lBJmhBiGRIgWQx9cZbloUJB0=
X-Google-Smtp-Source: AJdET5cRMvXQeY70BHH8wsrAxtgN//f4EMIuGKmzn6z9o7bL/zBYdW2xYbdZXiRo7ozYkeQBbxAw5MRBj0OvgF3dhgE=
X-Received: by 2002:a19:5782:: with SMTP id l124mr2132995lfb.91.1542756156280; 
	Tue, 20 Nov 2018 15:22:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<cd89e90aeb79ed438aaee6cfa02ca42a36d633b6.1542321076.git.alistair.francis@wdc.com>
	<2aa0f464-c9c4-3d59-81da-952279f56843@linaro.org>
	<CAKmqyKN9DQkZUp=+hRwC5AwaX+X0oYgt4=L2Pw8dWAauzS59QQ@mail.gmail.com>
	<e04bac07-ad25-2715-1262-28e9324126a8@linaro.org>
In-Reply-To: <e04bac07-ad25-2715-1262-28e9324126a8@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Nov 2018 15:22:09 -0800
Message-ID: <CAKmqyKMSg34-p_9h6GhW-TqMLhq3GM0yH68cjDG7VyFcZJkwsA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 20/23] riscv: tcg-target: Add
 the target init code
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
X-List-Received-Date: Tue, 20 Nov 2018 23:27:54 -0000

On Mon, Nov 19, 2018 at 10:55 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/20/18 12:04 AM, Alistair Francis wrote:
> > On Fri, Nov 16, 2018 at 9:26 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 11/15/18 11:36 PM, Alistair Francis wrote:
> >>> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L0);
> >>> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L1);
> >>> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);
> >>
> >> Why are these three reserved?
> >
> > Do these not need to be? I thought we had to reserve them.
>
> The return address, I presume, has been saved by the prologue.  I see no reason
> why it can't be yet another call-clobbered register.

Ok, removed.

>
> As for the other two... what are they supposed to be?

They were old temp registers. L1 wasn't even used and I have replace
L0 with TMP0 as we have enough tmp registers.

Alistair

>
>
> r~

