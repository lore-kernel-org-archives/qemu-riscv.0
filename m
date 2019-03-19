Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6FsJ-0008Ln-Fb
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 10:37:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6FsD-00083F-Gn
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 10:37:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6FfS-0008V8-K4
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 10:24:39 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:38240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h6FfS-0008UK-7Y
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 10:24:38 -0400
Received: by mail-oi1-x235.google.com with SMTP id w137so4091823oiw.5
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Q+lN4kuCazKaLaxoM4Pdl4SF9fzRqGoQ3e7wHPtLVE=;
	b=pnq8xNV2/EX0reUveVxvWyG3s8q+G8Fh++ZACnRrgLiYre7lX4ubIQn0XKtHAgukFN
	J8NMjlmePrdK/XKbUOiomvJppbcQqx8gxNypsqVaTk0ZMANVlcx0NsAi6IXGL2QNMfw4
	WKzKdVlCOclihXLI/pKQI+9O6nxaQoHPlZNhfoHxQWGL/eQyRtWiRchTjy9Mxf+T3srR
	4Z93HktlqFflabmg+qfPS5eQ+LYrh3Tu9UhTd3zpJwj7f2LwagDDEzTarZYag8o9oG/R
	qNBgysj6HbwwrrVDfGQPY/4lpebbw6mKkdWLXSHuMGjenpA1rpC+YQFiXZ4QTdbfxpbG
	Cw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Q+lN4kuCazKaLaxoM4Pdl4SF9fzRqGoQ3e7wHPtLVE=;
	b=HbIJGqYk1+8F3xYL9CEU8SDGx5S5g5BffaVZMIxF7Up2BfToSUAGtnSdLgabfpoq5A
	WCOFARunX84AxYs9e/qwDBDZnbeuFHXQu+BhNdq7k+oVx0PcO+4fkY7ztCUPiFxnzJGZ
	+YM5limdoXO1fWExueCpvWFJUI9IffcKKU8kUBzLN0drWDhfHX8q6BQxu9bfGYnkJurv
	MX6/WuUSdqUIa2ih+XDQJmmc4TtUZ8Sh+miX5Abim0gOUedY2XQ8r7YHsOyd9UbPWdnM
	QY8aRCc8rUEH8g0ZjTSIF7R0CWYSvdZM34lmGhTiD73VbD7pTtHo9HXJ8qzl76ApEZxu
	yNrQ==
X-Gm-Message-State: APjAAAUqliR7fkncITEsuVu3wmjAq1Ofyoy7UG5Q91boG1EbCqJexHpY
	6e6yeBFTQrMPLj+PPftWUsg9YQrlxWmCyIsGBVGE5A==
X-Google-Smtp-Source: APXvYqxTJwp8LofCV4lGT+17KNCduehKBq16I5gqIvfp3A0RvuFkko23v/P0njMUgqpesAGI582VYTAU8zgUsqFuUKY=
X-Received: by 2002:aca:4c88:: with SMTP id z130mr1650183oia.170.1553005476958;
	Tue, 19 Mar 2019 07:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190319124803.13826-1-palmer@sifive.com>
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2019 14:24:25 +0000
Message-ID: <CAFEAcA_caoHB+_D+KUANOMr=TyUFx_XQ+q464_Ts-Ch2RCQRTQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::235
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for 4.0-rc0, Part 2
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
X-List-Received-Date: Tue, 19 Mar 2019 14:37:51 -0000

On Tue, 19 Mar 2019 at 12:54, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 86e2fca2d7f163c50b80254e0afdd4e16378b3bb:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.0-20190319' into staging (2019-03-19 10:52:45 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc0-2
>
> for you to fetch changes up to a9ec1c76d57491602b4d3b521f898905825ca848:
>
>   riscv: sifive_u: Correct UART0's IRQ in the device tree (2019-03-19 05:18:42 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for 4.0-rc0, Part 2
>
> This patch set contains three major sources of bug fixes:
>
> * Jim has added support for GDB XML files, as well as fixing access to
>   CSRs via the GDB stub.
> * Alistair has rebased a large set of fixes from Michael that were still
>   in his patch queue.  These fix bugs all over our tree, including:
>     * Logging of PMP errors.
>     * User ABI cleanups and fixes, most notably on RVE guests.
>     * Fixes for interrupt emulation fidelity.
>     * Improvements to the emulation fidelity of the sifive_u machine.
> * Bin Meng has improved the emulation fidelity of the SiFive UART, which
>   now supports both TX and RX interrupts (as well as setting the correct
>   interrupt line).
>
> This should clear out the bug fix queue that piled up after the
> decodetree conversion.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

