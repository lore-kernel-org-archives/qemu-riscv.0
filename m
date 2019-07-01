Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hi40n-0003Ce-57
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jul 2019 17:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi40j-000396-5M
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 17:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi40i-0003n4-3d
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 17:38:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46654)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi40h-0003li-R6
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 17:38:51 -0400
Received: by mail-ot1-f68.google.com with SMTP id z23so15003466ote.13
 for <qemu-riscv@nongnu.org>; Mon, 01 Jul 2019 14:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W8795A1pwOViSCWz1XBqs1T8IqRWO2Ds5kmBMPEZLI4=;
 b=v4EZ0Nbl+SmW3fn/AY9Fg08WXYJ/sMj2juEwN3ISuBZPGAX1wGa6SH6F/VYHlnbEGC
 Clr5wTGQ5aU+0J8ObP9RfaGebhhAC3EB2bRsgXc1Yud0sV1VqvczITQWElDrA2QzRIPa
 cjUu7/Yv9qhe3kqBzOapCiTXzrMmR4MWDkUmlfPiC4Mctl3VXKiCvXGpSRptqRe874hN
 Pd59pRfSAxKAXNVUQs7ykPb7drHrRnYuxUuXIq8G8dIsRkiwEQBhSIzyj+3dJ9JiWm5P
 ZYcBBi0btbIl8Diw5loHeBR12Ggxn4AylD/6RMXycl3hOrKkaY9+dT4wd0I7HGKFj02Z
 Brmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W8795A1pwOViSCWz1XBqs1T8IqRWO2Ds5kmBMPEZLI4=;
 b=EsfsC9l/fAH9hEGMiBAOmOcx4WsnlmlkKwlvoS+pKwt1y3Quu77Ljc5ILxppkazCjc
 sIfBskXuHA3QMREljvQLBdVEqMDBXhXAPyGHS+OwzTWe0AZCILtio41lXpmrLQINKWo5
 FEbU+1c7t+AIhylDoBQDl1hyL9q3Dj0LjLJtm+io8xd7K2VaefnKSmSL8ZG7Fd78NFQf
 nvldAzvcLzWi20QT4zEqUNODXYGrVmC6QbesmcgIYDMz4W/aWHtJ894sqTohS6c1IhMu
 L+I9a/y3K3IXetFGnIwpZiK3CpnFEjKyD2I91El7Es+JyA6w1rtf+IfGt7zmuzg3PBFM
 hrDQ==
X-Gm-Message-State: APjAAAVayq2av7pYw4mT7Gfm6BOnZvQlqTvi8DTfaAAGZ7MS+ED20sc2
 LuCHTe4FYFsp6t28ibu0ox9G/uJJ/YBsyy+R2V3RiIfat/o=
X-Google-Smtp-Source: APXvYqzT7KIi+tGQIrOHSMjSPbaI/TSJJW+3RrUrMt2b8Cyb6jjA/Tl4/JqMlccyz3LWeKBMXwCG81Quj+jm+RrmqvU=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr21354692otk.232.1562000171096; 
 Mon, 01 Jul 2019 09:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190628173227.31925-1-palmer@sifive.com>
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 17:55:59 +0100
Message-ID: <CAFEAcA_C8DM51ac-hOU++OUyMEdSgJQaEMnazsCDn3=Cb2vOqA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.68
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for the 4.1 Soft Freeze,
 Part 2 v2
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
X-List-Received-Date: Mon, 01 Jul 2019 21:38:56 -0000

On Fri, 28 Jun 2019 at 18:32, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'mips-queue-jun-21-2019'
> The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-sf1-v2
>
> for you to fetch changes up to 56bf43fc565a2fa3e0a618ab45e1c82896d0782a:
>
>   hw/riscv: Load OpenSBI as the default firmware (2019-06-28 10:10:30 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 4.1 Soft Freeze, Part 2 v2
>
> This pull request contains a handful of patches that I'd like to target
> for the 4.1 soft freeze.  There are a handful of new features:
>
> * The -bios option now works sanely, including both a built-in copy of
>   OpenSBI and the ability to load external versions.  Users no longer
>   need to figure out how to build their own firmware.
> * Support for the 1.11.0, the latest privileged specification.
> * Support for reading and writing the PRCI registers.
> * Better control over the ISA of the target machine.
> * Support for the cpu-topology device tree node.
>
> Additionally, there are a handful of bug fixes including:
>
> * Load reservations are now broken by both store conditional and by
>   scheduling, which fixes issues with parallel applications.
> * Various fixes to the PMP implementation.
> * Fixes to the 32-bit linux-user syscall ABI.
> * Various fixes for instruction decodeing.
> * A fix to the PCI device tree "bus-range" property.
>
> This boots 32-bit and 64-bit OpenEmbedded.
>
> Changes since v1 [riscv-for-master-4.1-sf1]:
>
> * Contains a fix to the sifive_u OpenSBI integration.

Hi; I had some comments about the opensbi blobs (and in particular
a question about the licensing), so I'm not going to apply this.
You might want to send a v2 which has everything except the new
blobs, while we figure out what we want to do about them.

thanks
-- PMM

