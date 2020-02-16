Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3RFo-000250-Pt
	for mharc-qemu-riscv@gnu.org; Sun, 16 Feb 2020 16:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3RFl-000243-RW
 for qemu-riscv@nongnu.org; Sun, 16 Feb 2020 16:15:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3RFk-0003sq-Eu
 for qemu-riscv@nongnu.org; Sun, 16 Feb 2020 16:15:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43445)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3RFk-0003rR-8c
 for qemu-riscv@nongnu.org; Sun, 16 Feb 2020 16:15:00 -0500
Received: by mail-ot1-x343.google.com with SMTP id p8so14154075oth.10
 for <qemu-riscv@nongnu.org>; Sun, 16 Feb 2020 13:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WjAQOGYs8PfmGKbMB5gCKxSvWX+UHkARCq7sgajpjuA=;
 b=eHedf1WUDV9AD3UPCR/YvXwo9C/fVN6GaiUs6q8fehYKW5AB20NYYONbWpnb4e7fvW
 vi3PXvvQ3bLQN+N2iV2uLCLtInSv5ba/mWNMmQQtD9XBzeNMys2TnMIKByoOxzLtxttm
 Wle9scEeiN/EBAqHEv6zHn6u+mi4dT3SZdXan61JGejVpLqlVUAUnsXO7l+ktcEhApK0
 MliLhNu32+o8K+4Anp1rYACcEX+EYvnO24IHKDWeC6Mu0pfIFZUj0dIx4y6WnQC7qOIA
 qpKyMvKybIzenugiDQFUL2pZ7OpkF3DMV9CzW/5v7sGYKD5++YSh5ziAEbxTjNr3w5mN
 8i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WjAQOGYs8PfmGKbMB5gCKxSvWX+UHkARCq7sgajpjuA=;
 b=DTp8Z1Rl6X1V3ZgeA0crOPsPrIckZDoWrfCy43Et5d1Mcr1NzSHoLonpE4Yin9MUhe
 Y6XyYxVGh3Zqg+gZ/9Q4HgYckvY97R2EwfAGwTMqIGzHKvjYQkdfTgN80rpxWlwTg9QS
 4j68nJEQSxySmJXFXX3gB6WWhAGA94Hyw9rKOO6yOMifMAB2gUV3gPCW9140HPZ1t2IB
 rlJSWbeV8lgvjMAYIZ2yV0p6SrMI29HW7zCQW3B+DNgFfTxjj8lBqPWVdMirszMxFVjV
 0WjIxvn9tE/ODkI18vpacuHSJENp+CVnYkZwwyTYPOzrYgPAKILZs0v/RYzo05I+uNLV
 4tSg==
X-Gm-Message-State: APjAAAVp/qDg0YvmwD6s/cAHG2o5MbSwsc+oB6d7Ux9z4wn5YWUX2u4U
 t9SXBx6kHl5XTa8zGvyDZsqI2vJu4hKY4lVCkShFyw==
X-Google-Smtp-Source: APXvYqwPUlJWumPHGQmHAOPWKrr2RABnnasrR2ItHASQVdKKbzeILQma88tq/Aa+P9Ilv3ojLvTIp1VRFnFjJ33oO4g=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr9344607otq.97.1581887698978; 
 Sun, 16 Feb 2020 13:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20200212172921.36796-1-palmerdabbelt@google.com>
In-Reply-To: <20200212172921.36796-1-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Feb 2020 21:14:47 +0000
Message-ID: <CAFEAcA_zQ=aw6Om=1ETn_y297nPqJh0UHgf1ppkAORkHdOADnA@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 2
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-List-Received-Date: Sun, 16 Feb 2020 21:15:03 -0000

On Wed, 12 Feb 2020 at 17:30, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> The following changes since commit 81a23caf47956778c5a5056ad656d1ef92bf9659:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2020-02-10 17:08:51 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf2
>
> for you to fetch changes up to 9c8fdcece53e05590441785ab22d91a22da36e29:
>
>   MAINTAINERS: Add maintainer entry for Goldfish RTC (2020-02-10 12:01:39 -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 5.0 Soft Freeze, Part 2
>
> This is a fairly light-weight pull request, but I wanted to send it out to
> avoid the Goldfish stuff getting buried as the next PR should contain the H
> extension implementation.
>
> As far as this PR goes, it contains:
>
> * The addition of syscon device tree nodes for reboot and poweroff, which
>   allows Linux to control QEMU without an additional driver.  The existing
>   device was already compatible with the syscon interface.
> * A fix to our GDB stub to avoid confusing XLEN and FLEN, specifically useful
>   for rv32id-based systems.
> * A device emulation for the Goldfish RTC device, a simple memory-mapped RTC.
> * The addition of the Goldfish RTC device to the RISC-V virt board.
>
> This passes "make check" and boots buildroot for me.
>
> ----------------------------------------------------------------
>
> Peter: I'm sending hw/rtc code because it was suggested that the Goldfish
> implementation gets handled via the RISC-V tree as our virt board is the only
> user.  I'm happy to do things differently in the future (maybe send
> goldfish-specific PRs?) if that's better for you.  Just LMK what makes sense, I
> anticipate that this'll be a pretty low traffic device so I'm fine with pretty
> much anything.

If it's a device that's only used in risc-v boards I'm happy for
you to just fold those patches into the main risc-v pullreq.

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

