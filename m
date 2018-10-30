Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHbe8-0006Ly-Qp
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 17:33:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHbe7-0006Lr-8T
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHbe6-0003XU-8v
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:33:55 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHbe4-0003Vv-Ds; Tue, 30 Oct 2018 17:33:54 -0400
Received: by mail-lj1-x241.google.com with SMTP id g8-v6so9970361ljk.1;
	Tue, 30 Oct 2018 14:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e0yhxxgz8UbcfTiSJYTgrhV9YWbNmhwGRNgaEWccvpo=;
	b=g9TSps8Vf0N/WAa1QciMw/PUj9ReL1o9SBj00IMkd759LnGXC8l8qq7HaDnu4sgmm9
	ZNFlYx/8j+gTLCXXwP2xzMVMT6R1HVsaVVBxxoUNwD734fy9goz4zYwDHCGUYgxGvsmY
	//SLZnATqknuTt/kUW2Gjq7mZ7nYrcv1PZ/SCsO+0gJxak4ouJuEdYzrs7fx/tiU+zuA
	PFO4Ch4qfzAajx1UxOJJO3VEMXG44W/RMbQQ0ZbiPQ6Bxlgd1vuu5VcVeDJz7hZ4cG+3
	YKdLVbPEoo0KQ89Pae2jFoN2/1w5UcSX8HrqE7xB9JqyHetAspv4e6QLraMS2HbhWJFi
	/MmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e0yhxxgz8UbcfTiSJYTgrhV9YWbNmhwGRNgaEWccvpo=;
	b=ahJLFAOTI0WSvZyl+LVLouVjDSOqktjqAYsWR5+6tiee7CLMEIKAvGtSvNfDBnqB+M
	U4qXHqxKR067aghwhALkCFLn0lAc6/l7uFkXVr28AKceHdzn2UAOmUPRuG0L4UOTxZeI
	XOVYnYLBUZ955ofKR9RHnLjknNnu9sJqTnJQO+xVolrlhzu5Z3wqMq085+kmFXxCF5/4
	yoHxJYGuK+erWaUA2I/fKsjT60mik9uRdcpIMeylEogXeQYXfJF46MS2j1Vxwa3DPMHh
	uSjDCxYkDGnnvlX3fLftmDrAfFtqVP83pNa5aTbZ/9L+VEQ+wNx8PnhuZxNgu5UXHr4W
	BRgg==
X-Gm-Message-State: AGRZ1gI13ZIRs+E/l6d8cOUNz9VAVEQLq/d1DAxsytFlXs0Pv1FRdYFb
	eQNaxud8GmoSAzxWfEo8Yu7INBIfYIL+M2qzTtM=
X-Google-Smtp-Source: AJdET5e1PmekLyMiYUDSO3wxzG0mnU/Qx3l5KbsCLbzDzb3kSa4xtAOQ3f49tGf4g9foN7FsT1z3twyc6jF+vQTRN3Y=
X-Received: by 2002:a2e:1456:: with SMTP id 22-v6mr246497lju.116.1540935230817;
	Tue, 30 Oct 2018 14:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181030212249.7117-1-palmer@sifive.com>
	<20181030212249.7117-3-palmer@sifive.com>
In-Reply-To: <20181030212249.7117-3-palmer@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Oct 2018 14:33:23 -0700
Message-ID: <CAKmqyKP8sic_SEiqugH2=119GcyZQthv=QVds0c00J0W5uXc2A@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 2/3] Add Alistair as a RISC-V
 Maintainer
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
X-List-Received-Date: Tue, 30 Oct 2018 21:33:56 -0000

On Tue, Oct 30, 2018 at 2:23 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> Alistair has been contributing to the RISC-V QEMU port for a while now
> so I'd like him to be officially listed as a maintainer.  I've checked
> with the other RISC-V maintainers and there are no objections, and I've
> also checked with Alistair so he knows I'm volunteering him.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Hey Palmer,

It looks like you dropped a Reviewed by here. It's not super important
in this case but for future patches it could be an issue.

If you use QEMU's patches it should apply the tags for you:
https://github.com/stefanha/patches

Alistair

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d794bd7a66fe..d550fd8b809c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -241,6 +241,7 @@ F: disas/ppc.c
>  RISC-V
>  M: Michael Clark <mjc@sifive.com>
>  M: Palmer Dabbelt <palmer@sifive.com>
> +M: Alistair Francis <Alistair.Francis@wdc.com>
>  M: Sagar Karandikar <sagark@eecs.berkeley.edu>
>  M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>  S: Maintained
> --
> 2.18.1
>
>

