Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVaEI-0005xz-FZ
	for mharc-qemu-riscv@gnu.org; Tue, 28 May 2019 07:25:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVaEG-0005xQ-9m
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 07:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVaEE-0003qP-Cj
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 07:25:16 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:37588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hVaEE-0003no-3X
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 07:25:14 -0400
Received: by mail-oi1-x22d.google.com with SMTP id f4so13940614oib.4
	for <qemu-riscv@nongnu.org>; Tue, 28 May 2019 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SoBCmq6KJRDdwJy2NVFbtI5+rDtxojn1N5JjLeHUq8Q=;
	b=E9qqxPK1KT41tmg/S8/dkIb6FmdRjHETZuVGugy5XyNTcl1k++3BgXfBn7RBgfzFD3
	7SVwWlCHQVhhXXs4YDjzwoKGaMI4/1aw5cIkTebGjYkgEcrMHhagJhwgwVsYiMnvBecZ
	VMGlMsup6sXxfTwmIwNAktFWLkc0M5O07qyQPedpGcEGmdkSguqvYjGHrW/gUAsranrw
	6pn/I2xuMveVWEdIJBTt+FNLBiC5itXKnd5rRr1xv8tkCG3vPSc/b0BGPu7zvTVjWcC7
	lx5dY0aA4KfC/sSAwBGsBYmADys6Wgbuo6mKQr/snz789vdtDSpYrO2zLH8iKE2GG+4m
	8syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SoBCmq6KJRDdwJy2NVFbtI5+rDtxojn1N5JjLeHUq8Q=;
	b=Vo7bPpuNptcMtRKQl5Ae6zmkI1ZUn4opP1rPGlPA/W0TL0a/4pPCWvSIprw2ytzxbS
	7Jz1CS0HAjCu/N0TwuJoo1s6XUfHuH2rfH2B2ZQV8QJ4+ANoLxpLRClt2jgJvTlp6ewr
	c2AGFTirboy+DxVBczVG6atHcFaFKf/IYmckMHTtZmVwhJKYiSjOFTcIHKkStrvhk55H
	G3Udwj8T3LrFx/DHCso7zcF+1F3NW1OHu8NiwRJNsh7ZvkDtaHgAamGMDEQnNuPSZCR/
	9q/rMTVgmGwAD+TLf9E+ZVN0s/k92p3PbpS/GYUDhRRryKSQCZmr6cynztc7x3A96V58
	iHig==
X-Gm-Message-State: APjAAAVCZkpKG1CJsOnIXEgeIwtoATCurG9K8NMLzgdTpIGNgxujxmmj
	xvUfL/GWJA+h08FQpu3c3MKEEKKT9VBVYnqvXOCQYQ==
X-Google-Smtp-Source: APXvYqw2R4XN/hqLW8HXB6RxJzGaPdWf8ri8hiSm4I5S6baQA2Ii4sJZ0p1tqpYNc02fmPYg30/SDOTq/YP5fd2rrJU=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr2388915oib.170.1559042713221; 
	Tue, 28 May 2019 04:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190526010948.3923-1-palmer@sifive.com>
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2019 12:25:01 +0100
Message-ID: <CAFEAcA95yeJg6qFY_ES=N-YzF=L88hAZgUhc=ashibnhAMekhA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22d
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for the 4.1 Soft Freeze,
 Part 1
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
X-List-Received-Date: Tue, 28 May 2019 11:25:17 -0000

On Sun, 26 May 2019 at 02:10, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit a7b21f6762a2d6ec08106d8a7ccb11829914523f:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-4.1-pull-request' into staging (2019-05-24 12:47:49 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-sf0
>
> for you to fetch changes up to 1e0d985fa9136a563168a3da66f3d17820404ee2:
>
>   target/riscv: Only flush TLB if SATP.ASID changes (2019-05-24 12:09:25 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 4.1 Soft Freeze, Part 1


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

PS: softfreeze isn't for another month or so.

-- PMM

