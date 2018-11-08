Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKpFY-0002cB-U6
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 13:41:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKpFX-0002bz-3u
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKpFV-0000ev-P7
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:41:50 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:39459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gKpFV-00078h-BY; Thu, 08 Nov 2018 13:41:49 -0500
Received: by mail-lf1-x142.google.com with SMTP id n18so14946170lfh.6;
	Thu, 08 Nov 2018 10:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xDxk2i+j511tRau6oS17ZWr0pBduwtQjtV3HEVlj04c=;
	b=GiS2sxqgLslTHRSvObtpjfk4rLJMrF5DTuZQkbaSGjNK3cjjtvPHt6a6U782XVGdBj
	Yexla1aA16Wg3AFzEveuxhD9b0s0i9kofMX+vMwnu23jDgakFIg2YOZ/l+eN++aS6TmZ
	tK1WLmljws7/ep8QrifXq/D8SBT/OJtCJQVkxiRmW3xbC6Qo3s3j+cKdsYtaupVio50Z
	5gRFa9aVQa4q3N6ASQ/jpuTsU1SgAlGix3QTxcNR9ZgvN4ofBRhfLG9hQE8q4+pdH5vd
	yedJqFhJXG2siczXz1/lh291JCALg7yzH4nz29kVkNjpMB1htm+iEeOjV2bLAK+/Lx1C
	Z80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xDxk2i+j511tRau6oS17ZWr0pBduwtQjtV3HEVlj04c=;
	b=XuWshsg12PMkHCC4Myog9ugjhcI+t+tB7GrZsbesLDoSTpXjtNpQOIvrTynos1HUbG
	/cQ3FwOc4tih5lKuVB5odA0dOzxqbE6/qONMCf6VDzhZCyrqHFwqMV2YowBczgEwMmiH
	Afvh5iOlzKGVORKGc3nQBNiaoiM2JCcqPHRAELBbYUqcH6wU8PIpf3ARCbNHzLLrsfT2
	6so2Jdn+voZnM1NflriEMeKHhTVcAU1PFxpzOLyU61TJKJQdGL0DhC5lRB/uzzHld334
	e4BM4NDg6MHelBzkoJJ1EdoF7z5dPbNTsu6Z2rAYeAvkzGH5p++mg2JH+WbimrK4Jz4a
	jlpg==
X-Gm-Message-State: AGRZ1gJB0kKSFeISRgAkqYDl3x6hm1uOuGdLdQZlOGr3uVVO6AqfLrRJ
	UDwsgTssGLeDVfc2jyST+xpCAp/WGsavPWMC+rY=
X-Google-Smtp-Source: AJdET5dVFoH7IS8s6iXFOVmTJ7pXcSsWDVm02iL4vC+fgBG4V0rkQeJsRqy0HqLjx5lbhztCthpoJpduB2J3jIhUbz4=
X-Received: by 2002:a19:4e59:: with SMTP id c86mr3641773lfb.132.1541702358704; 
	Thu, 08 Nov 2018 10:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20181108183306.4361-1-palmer@sifive.com>
In-Reply-To: <20181108183306.4361-1-palmer@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Nov 2018 10:38:51 -0800
Message-ID: <CAKmqyKPHDx7iTQRaY7+5v13oE-ARzpqFDOo4e98Y4bHGH7s+Ww@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL] A Single RISC-V Patch for
 3.1-rc1
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
X-List-Received-Date: Thu, 08 Nov 2018 18:41:52 -0000

On Thu, Nov 8, 2018 at 10:35 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit a7ce790a029bd94eb320d8c69f38900f5233997e:
>
>   tcg/tcg-op.h: Add multiple include guard (2018-11-08 15:15:32 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc1
>
> for you to fetch changes up to 00a014ac01feac875468d38c376f7e06f050f992:
>
>   riscv: spike: Fix memory leak in the board init (2018-11-08 08:41:06 -0800)
>
> ----------------------------------------------------------------
> A Single RISC-V Patch for 3.1-rc1
>
> This tag contains a single patch that I'd like to target for rc1: a fix
> for a memory leak that was detected by static code analysis.
>
> There are still three patch sets that I'd like to try to get up for 3.1:
>
> * The patch set Basian just published that contains fixes for a pair of
>   issues he found when converting our port to decodetree.
> * An as-of-yet-unwritten fix to the third issue that Basian pointed out.
> * A fix to our fflags bug, which is currently coupled to some CSR
>   refactoring that I don't think is OK for 3.1.

There is one more patch fixing a memory leak in the virt board as well.

>
> I'm at Plumbers next week (and I think Alistair is there too?), but I'll
> try to find a way to squeeze in as much as possible.

Yep! I'll be there.

Alistair

>
> ----------------------------------------------------------------
> Alistair Francis (1):
>       riscv: spike: Fix memory leak in the board init
>
>  hw/riscv/spike.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
>

