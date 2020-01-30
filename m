Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ix8WL-0001z2-1W
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 07:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ix8WJ-0001yE-Ef
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 07:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ix8WI-0000Au-Al
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 07:02:03 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ix8WI-000093-1h
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 07:02:02 -0500
Received: by mail-ot1-x344.google.com with SMTP id r16so2887694otd.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Jan 2020 04:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxw7LGpjcS0XvMQAfylVU83imD07D+/OPuhF16qkAtM=;
 b=YshytP5YvPMF6g4/ODj5mUzXQnGZz2vRH9SIsRAo1ofSVFz/k5MTSbE4R4keAfgkV1
 PGyRK9QTrpPg1jysz/lC5YjWr66E8Xf26t4vHmt2UqiyZk93cMOsjbw89dylFFOya+dC
 G/rktwaUkQ7sawV0r0uL7fMaBXeXBe0us+hCjZEGzxSFBC4VIFHcVtnkPpZIsXn/32Ig
 nASueKGc0+IBoWQzrkTDQfL/nHxozb9G7EHY5TRmUdpXomgxhdglwYt2ZdW1YSBbCkW8
 YdFgjDj61BnN3nQCHVFKfupMnrDyPKj2Rl2L3H8VflJpOR2flNr3JqqkPWK5tfLvJHPg
 owFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxw7LGpjcS0XvMQAfylVU83imD07D+/OPuhF16qkAtM=;
 b=RlrcuL6YADKfWb5CiyO+M+0cQ0HRfkTIHXkJYgZkmfsb6S6XNjk/ip0XWEgRGF7X56
 hJuY2KKxKYevVdhGummKtogzR9LBVpefmhQz2ky2wxZcB5fggMIjDudDzv3U6EdZg73o
 J6Z7L0mkr/lSuao7g9apLd0MLfYtkPx8mw9uj1S0+7iFyWNTktiVMUmdvUvbmDw3SRpI
 FHeVkKcpyoX1S30t3Fa8RFuAp7AQLQnV7sNMd5p40X5UORg5Zm2Hu26bnXpLg5ZwzTmW
 wrub0OvQsyd+o75BBvBXbifm/vS19Gm7mwqHxfHq8efPv3r1jLcPuwgSJgflCGinDpbz
 GecQ==
X-Gm-Message-State: APjAAAVXyh5nOcqTQ50Zx6zZjfuOWH6AW4pDZTDMUZk+5LI8jjR4tayY
 MEoZvnGVtCCDDA6mnEbgncRYe21NMyB7DSmk2lDiEg==
X-Google-Smtp-Source: APXvYqwbN4WOCluiYyP0XrbXsjQX/o5vt4l1tTZteBNV/cms8NgBm8cP9T2sb82ph1mo9yNceB+ircdO3Wb0C5r2tvI=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr3202538otd.91.1580385720791; 
 Thu, 30 Jan 2020 04:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20200128233224.515233-1-keithp@keithp.com>
 <CAFEAcA_dD3eAfKvOGOoXe3NWKg1PiW8=s2Xk41w19Tk67R-R4A@mail.gmail.com>
 <877e1arz2w.fsf@keithp.org>
 <CAFEAcA8Vs5Bp7tPgxLOG_T0350-Y_w7SitNzNuvHZN6AB=b0gg@mail.gmail.com>
 <mhng-e399eb36-5106-485c-972c-db2610e42dff@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-e399eb36-5106-485c-972c-db2610e42dff@palmerdabbelt-glaptop1>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2020 12:01:49 +0000
Message-ID: <CAFEAcA_df6Uc_kqAvbELOQyUSnv-n+bDvJtYf2s5wCxwNXm-eg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add semihosting support [v4]
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Keith Packard <keithp@keithp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Thu, 30 Jan 2020 12:02:04 -0000

On Thu, 30 Jan 2020 at 11:38, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> * The semihosting comment doesn't define the semihosting call numbers, just the
>   sequence to get to a call.  That said, we haven't written down the Linux ABI
>   either -- though there's a much larger breadth of software out there that
>   implements it and won't break ABI compatibility, so maybe that's considered
>   sufficient in Linux land where it's not for semihosting.

I think the difference with Linux is that there's a clear
single authoritative source for what the ABI is -- Linus's
'mainline' kernel (so for instance random out-of-tree forks,
syscall patch proposals, etc that have not yet hit mainline
don't count as being fixed-in-stone ABI). Semihosting doesn't
have the same single clear "owning project", at least on
the Arm side of things.

I don't think a semihosting specification for RISC-V needs
necessarily to be a very heavyweight thing -- it is, after
all, a debug API at heart -- but I do agree that you should
have one.

thanks
-- PMM

