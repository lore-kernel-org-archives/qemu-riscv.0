Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iPN0n-0000bg-VQ
	for mharc-qemu-riscv@gnu.org; Tue, 29 Oct 2019 04:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iPN0k-0000Zi-TG
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2019 04:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iPN0j-0007rj-JK
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2019 04:37:54 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46258)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iPN0j-0007rI-E8
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2019 04:37:53 -0400
Received: by mail-oi1-x241.google.com with SMTP id c2so8213845oic.13
 for <qemu-riscv@nongnu.org>; Tue, 29 Oct 2019 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yKC5t88eETCtb8kh5uLAsqOlCAzQroOzJCHwfeADAL8=;
 b=DnbWO9eU6znlC7hapMb+zAWkV9U1X7yyJ1CPr4S14bO1txvJzd7AcycKUwn/w9cyME
 EQP9IZM+Of8mxomjJHJ/IaVPi8YWGfDFpiwPGRMgetL39fbQBUomjXmkaY7SH59fzrW9
 s5Lz/kwl4vkdCi9iL2Cc7c5uKGljiC4FgBsSUdhEkSu0NqgFSOwfXj+a7ki+eXCu7XqH
 S9TKdspoPlyt0pSPaBpEQGxOrpyd9cckeIiJJ6PFidnMcHHGOpl9woiH5K5iuD735SUX
 E6iLiDXGvRHyu4+Jzr6NNSXIdbpRYGgXrBNfXBAPZtmbOyz2hfvXwdu+YpKoDW6pwKBy
 +oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKC5t88eETCtb8kh5uLAsqOlCAzQroOzJCHwfeADAL8=;
 b=uVVhFdnJrSLpGXPYEFett3FJ2jTgmlTpgk8JKnFnKQUvsRe3x7zCIb3mBF6Z6WpCB3
 7sDyO9Rup1NiQXE7dnyNRqmt73CMds1T0G1WyXWvTjtor+BatLC+aw6/qagOluRkZ8Md
 T0qACCYxhFcnRMHnpmStWeT7Iwv1TsBitx4mLkKv+CyG6kRHFqngu4s+o2QLrPdCDso/
 w+MWaFyyFWOhik1jZO0UZkD/QSN8URP5MTnwH8wuORlDsmCLXfujDIU+zBuF4H5e5lP1
 bPxphxOeb4SHOXHrUAQZqN/Hcq2GFjLDjRHORjXY/V+u87m6n6/9smKy5UsyLqvU9A1w
 TlPQ==
X-Gm-Message-State: APjAAAXgNpia6gaQyyJmckXp0UhjOBxLYgnrDSgWlRF6+MM/zAnf+XLU
 n1QaeuiXTIyudQU79rZB+6KnS/sDyXvGmoUy6/xaBw==
X-Google-Smtp-Source: APXvYqx1iw+3ztVitlqD0b/yTRh1FoOXy54ULbYMLXWG8QEGCUr8nooeIILhfBvR0m3p2tB2EQijRQBNDj1abNqfDhI=
X-Received: by 2002:aca:2312:: with SMTP id e18mr3051852oie.98.1572338272287; 
 Tue, 29 Oct 2019 01:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191028154902.32491-1-palmer@sifive.com>
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Oct 2019 08:37:53 +0000
Message-ID: <CAFEAcA9S+BhrC4ZJHZHXJ-P0w3QJe90oyJALi14vSWOKk9+0Aw@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for the 4.2 Soft Freeze, Part 2
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-List-Received-Date: Tue, 29 Oct 2019 08:37:56 -0000

On Mon, 28 Oct 2019 at 15:58, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'for_upstream'
> Primary key fingerprint: 0270 606B 6F3C DF3D 0B17  0970 C350 3912 AFBE 8E67
>      Subkey fingerprint: 5D09 FD08 71C8 F85B 94CA  8A0D 281F 0DB8 D28D 5469
> The following changes since commit 9bb73502321d46f4d320fa17aa38201445783fc4:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2019-10-28 13:32:40 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-sf2
>
> for you to fetch changes up to 9667e53573f907d4fcd6accff1c8fe525544b749:
>
>   target/riscv: PMP violation due to wrong size parameter (2019-10-28 08:46:33 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 4.2 Soft Freeze, Part 2
>
> This patch set contains a handful of small fixes for RISC-V targets that
> I'd like to target for the 4.2 soft freeze.  They include:
>
> * A fix to allow the debugger to access the state of all privilege
>   modes, as opposed to just the currently executing one.
> * A pair of cleanups to implement cpu_do_transaction_failed.
> * Fixes to the device tree.
> * The addition of various memory regions to make the sifive_u machine
>   more closely match the HiFive Unleashed board.
> * Fixes to our GDB interface to allow CSRs to be accessed.
> * A fix to a memory leak pointed out by coverity.
> * A fix that prevents PMP checks from firing incorrectly.
>
> This passes "make chcek" and boots Open Embedded for me.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

