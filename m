Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuyvQ-0004Rf-3J
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 08:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iuyvN-0004RJ-3v
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 08:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iuyvM-00045p-0b
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 08:23:01 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iuyvL-00044r-RV
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 08:22:59 -0500
Received: by mail-ot1-x341.google.com with SMTP id z9so1567932oth.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2020 05:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZfZNubndxTwD4Z8P2Tco1rSJrq5QdrlRCT/CLQh4dE4=;
 b=I4ZoS0q4pCnJRQsZUdPYyd3lf2TPU4W/U1Htw7LmEib8X67qeZ8QBbFkXzSlIJc9Rs
 I9s+gbvyUCrurSAi6eZm+g67aDzs3tl/71q0d2gyvVHs+OehE2ypaUMUjNmUuqBMMQIr
 I83t46C4fzLD7t15OqmZ+1Xpr8ioDR2nNUCsjjuCxMBcASHe6gAX3hG3n/dtfNtiwPTm
 Ws+wINmTdUT2/028tRJc+dy4dc79MdCl+f0CE90nqwgklVUsEvZafXT8BRbr1BCs9ci/
 5GcUSpWLmejKqERrjQSMv596u23feZ5XFqdQL+PNZEeSBv8HJO5z32eZVW1eu9Itc9jJ
 8mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZfZNubndxTwD4Z8P2Tco1rSJrq5QdrlRCT/CLQh4dE4=;
 b=kmsja4u5rJJE3cjW4VWReGOB7jjZ3RuKo0a+PYK+KLfucoA6Y0N3Rok0TGJvoec8SP
 Z/6X9AgT7gsNyvzTq3YiYU9eEslNCS70aV3YVhIom9ZosTuzcSF4/rGXnAC3Yx7nOoBs
 2HXhyjKBJDscjo2nt2YPWIJgUMhyy8N3Lr1cIyYOi4p902UKYfBvMwBLX2JKi1f60QPL
 cZRZAvm/JlU2ZHc5Z7GVbTEK4PYrVe2Hnen/47JyZ2wqtuHkVGx80c11oHrFjs1OGpLA
 bIyvKvw9cE3rm0XVAgPMaFfvpmxfrObk9jDaQ1Xvm+hw+m2WaCsoq1/kEl2jwovb9J8q
 xK+w==
X-Gm-Message-State: APjAAAWreluN6uaX25enI+Vl2fHmZYSBPv6kVpECgRI+CL8PEvvak9Az
 S4rKlQ+cQvpk++DQyT2tqrd7hHbQnnQQ2qG9GthNSXvUVfA=
X-Google-Smtp-Source: APXvYqwIA+fB1f41fYWZjwTmvfA+wnNJbKU7duh3cS62X45h0e6LDzN73JAFZ8eoQeMzeaCFWThKWq6PsEzYsGWMA9o=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr2638018otd.91.1579872178423; 
 Fri, 24 Jan 2020 05:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20200121225703.148465-1-palmerdabbelt@google.com>
In-Reply-To: <20200121225703.148465-1-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2020 13:22:47 +0000
Message-ID: <CAFEAcA_UKdGYLRPQd2rChqG5vJ=OCsjRzGNf1j3VcJznJ4YLxQ@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 1
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-List-Received-Date: Fri, 24 Jan 2020 13:23:02 -0000

On Tue, 21 Jan 2020 at 23:41, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> The following changes since commit 28b58f19d269633b3d14b6aebf1e92b3cd3ab56e:
>
>   ui/gtk: Get display refresh rate with GDK version 3.22 or later (2020-01-16 14:03:45 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf1
>
> for you to fetch changes up to 82f014671cf057de51c4a577c9e2ad637dcec6f9:
>
>   target/riscv: update mstatus.SD when FS is set dirty (2020-01-16 10:03:15 -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 5.0 Soft Freeze, Part 1
>
> This patch set contains a handful of collected fixes that I'd like to target
> for the 5.0 soft freeze (I know that's a long way away, I just don't know what
> else to call these):
>
> * A fix for a memory leak initializing the sifive_u board.
> * Fixes to privilege mode emulation related to interrupts and fstatus.
>
> Notably absent is the H extension implementation.  That's pretty much reviewed,
> but not quite ready to go yet and I didn't want to hold back these important
> fixes.  This boots 32-bit and 64-bit Linux (buildroot this time, just for fun)
> and passes "make check".
>
> ----------------------------------------------------------------
> Pan Nengyuan (1):
>       riscv/sifive_u: fix a memory leak in soc_realize()
>
> ShihPo Hung (3):
>       target/riscv: Fix tb->flags FS status
>       target/riscv: fsd/fsw doesn't dirty FP state
>       target/riscv: update mstatus.SD when FS is set dirty
>
> Yiting Wang (1):
>       riscv: Set xPIE to 1 after xRET
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

