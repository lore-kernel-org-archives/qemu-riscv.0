Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTswG-0005K6-1D
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 16:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jTswE-0005Jl-C8
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jTswD-0007qt-NL
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:04:09 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:38735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jTswD-0007qX-2M
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:04:09 -0400
Received: by mail-oi1-x230.google.com with SMTP id r66so3006162oie.5
 for <qemu-riscv@nongnu.org>; Wed, 29 Apr 2020 13:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pc6uCheg5bSUEvPzOOBqyBuV/BB4vFhQg6Zv0nEjVmg=;
 b=dV67b3At6N479/JxbeEs57SY7oeTlEOpZVjZQMUAwTOo+tg5U19yiQhgh1wKkxSQSz
 VmVEmAllSWC/0AfRPJ4LKo/y3q38FU779Z1tIs6akc/j2O12NovclDrihLCzUmSgGMiH
 ZxK9mhhzGPy9kFKj1qaYBirYBN4XlK/wgPyDstmA9QrU0bb6jAg30OvowQPp+rFKxhBq
 mSRVm0XOEeAvEI5BKlAv+t4qTDcH5/I07LApPGPYBL4CevuYWUweNLaShY9G5x7qBwql
 K7zA640priY1O7ys9fzf2K1bS4m+PhTlj1Wz8LEDrrubvPrXKJu6UoBlivPOF0CY7GYx
 yZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pc6uCheg5bSUEvPzOOBqyBuV/BB4vFhQg6Zv0nEjVmg=;
 b=okDvf6zLWSwgiG42xbsMj81U2USoxMjrCCFimlb51wYtIetegh+JPHWxfwY8/HalhG
 BAouMRT6i+QvBU8q9DR6pBVHIVMOLn2t+u/C5lpykE0De6MQRexLwAWcs1Ns3VvmfwSc
 kNI/Kqf1qyXQNcXJURMFuUw9KEMGwaILCBE6pP14cjEcswEEW80B++bd/GfskGw6ABWs
 bbWMr0F3iTWqR1XnsiJc1yrzJaEzsiylkS6NbEa46mEXpxrjRTvrGF4EnvbWtuH059I6
 NiMANR7PEP6CGMXGEe6vAO648GnA9Dy4jhIjNuULv7F7Z2wFY8gCV9YYrRpD/eQuKQW5
 SLZg==
X-Gm-Message-State: AGi0PuZCFBz5qBHeg8PVVHPkhDySFXrBt/5YQoI+stctBCDSn6aQtxeC
 4yKJEe78twBdHIMC00ndmivYF1h4yVxMv7Ib1KgdCw==
X-Google-Smtp-Source: APiQypLjlg31JL2vWmJcHt2cV9/x5v0DYBI8ckZ36ssXbKqtO9zjftBu40w6jRvHeadXMePaCCfN8nXZe//J2flKpeA=
X-Received: by 2002:aca:3441:: with SMTP id b62mr2854732oia.146.1588190647622; 
 Wed, 29 Apr 2020 13:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200429182856.2588202-1-alistair.francis@wdc.com>
In-Reply-To: <20200429182856.2588202-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Apr 2020 21:03:56 +0100
Message-ID: <CAFEAcA-ZqDFo=D3YZgqLpvhzW+Jq8h-JNynDS05E2bSa6FOLEg@mail.gmail.com>
Subject: Re: [PULL 00/14] RISC-V Patch Queue for 5.1
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x230.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::230
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Apr 2020 20:04:10 -0000

On Wed, 29 Apr 2020 at 19:37, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit a7922a3c81f34f45b1ebc9670a7769edc4c42a43:
>
>   Open 5.1 development tree (2020-04-29 15:07:10 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20200429-1
>
> for you to fetch changes up to 23766b6a35d5b1664ab782c02624bf2435c4ed5d:
>
>   hw/riscv/spike: Allow more than one CPUs (2020-04-29 11:23:44 -0700)
>
> ----------------------------------------------------------------
> RISC-V pull request for 5.1
>
> This is the first pull request for the 5.1 development period. It
> contains all of the patches that were sent during the 5.0 timeframe.
>
> This is an assortment of fixes for RISC-V, including fixes for the
> Hypervisor extension, the Spike machine and an update to OpenSBI.
>
> --------------------------------------------------------------

Hi; this doesn't apply to current master. The conflict looks like
it's probably pretty easy to fix up, but could you fix it and resend,
please?

thanks
-- PMM

