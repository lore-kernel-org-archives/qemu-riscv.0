Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5wXb-0004Q6-T2
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 13:59:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h5wXZ-0004On-Jk
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 13:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h5wXY-00025i-Sj
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 13:59:13 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h5wXY-000248-Gv; Mon, 18 Mar 2019 13:59:12 -0400
Received: by mail-lj1-x242.google.com with SMTP id y6so6670642ljd.12;
	Mon, 18 Mar 2019 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jU5tuGMKIQoAHAopnFmKWgvxZo69QEY46Yj0vkDb3/8=;
	b=XMNH5nzk4cFXPMFA/aKrHbciRTWFwdwcJQ/Y6c795rBtVhFiq7BAKiRQPuT21/0d8b
	kibZXpQNeXAR2kbE5+u7scGXuMVX5B4zWQCpzAs2+7GHaPxnr5Mgt5Ar8PVz2ev2bI18
	/fD++m8fg0+1Ud72d724NnqQGm6Eb9TiwfD7DdXRHx43B19qblaQxQBylWe37xDT3vBM
	eKdMg3NPdikyn8Fbyrgh44kmgq0TrKPeX5pg6rXU51VVMgZIeCFImt4zx3kNPVPBvWAh
	Lq/ptTxLHppURMf7ZNDkXNYD4IU4/1D1OZE4AYbHd4M6XKQUsmyJzMm2ywV3lyIqG4lE
	k87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jU5tuGMKIQoAHAopnFmKWgvxZo69QEY46Yj0vkDb3/8=;
	b=nBPsfAWTVCn5t+UPvtQKb9jsvNZ20zhNcEyf4ItxeDUz8yNeE+udFopkXtbu/soJY4
	bpNrNSp672wipyQjRRwUNawvCJVpAuyvA5dsbqJYwIFEZIy2wm5YCCWNyA9+POIiMiso
	8Hq6sKUSKJU4L7lonjvIjfP+rJb568Fk0dTNHLkB1EkPCFo4kK9XaQE60x56ZnYxtrBo
	3SvZdPPn/GLE5K/dxKmkNk+b4HiNOgVRDnUTI36IfARl99AlnBQB9bvwT3xt8GXM3385
	W1LkbPNfunHsAFxhe53o9T9ugl4FkdQbaWy4tBV6ZnB745wgtzOppzMBkQqHctEIPxLj
	0pTg==
X-Gm-Message-State: APjAAAUs14pPI++EAfKu20cfwBVNEpzCvBtDfWyzf2cZq4HpjTYHIgzt
	Nc3jv7RNNuysPyqqv334weK1Gu3Cp5jfhQmxp+U=
X-Google-Smtp-Source: APXvYqwTERluz4m0ZjVztgAaixa1eTxFew0NYcjpcJTzMQKlvEdZ+YVzRNsPk/w817xsK8zl1GGdcOz7rivC1CyDMTY=
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr8973876ljj.116.1552931950534; 
	Mon, 18 Mar 2019 10:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <1552809791-7714-1-git-send-email-bmeng.cn@gmail.com>
	<1552809791-7714-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1552809791-7714-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Mar 2019 10:57:54 -0700
Message-ID: <CAKmqyKOqGCCcAhXpaTwpoU9YCRe4uuGVQgvUqpyYtas4OuD8Sg@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 2/2] riscv: sifive_u: Correct
 UART0's IRQ in the device tree
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
X-List-Received-Date: Mon, 18 Mar 2019 17:59:14 -0000

On Sun, Mar 17, 2019 at 1:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The UART0's interrupt vector is wrongly set to 1 in the device tree.
> Use SIFIVE_U_UART0_IRQ instead.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7bc2582..57741c2 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -244,7 +244,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
>                            SIFIVE_U_CLOCK_FREQ / 2);
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 1);
> +    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
> --
> 2.7.4
>
>

