Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgaYz-0000KG-HD
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 16:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39281)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hgaYt-0000Jw-RK
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 16:00:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hgaYr-0005P1-8l
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 16:00:03 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:43476)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hgaYq-0005Lc-SS; Thu, 27 Jun 2019 16:00:01 -0400
Received: by mail-lf1-x141.google.com with SMTP id j29so2371255lfk.10;
 Thu, 27 Jun 2019 12:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rYjYxm+SVEDCvYa7FbIYeK0ER/2x8MIotQD4iyLmSrc=;
 b=AZNnRf5j6kBncSj/JZP59ulTbj2IuyED9Oc11eg7T8B4HBZTwLIO00479CgcynuJRe
 WcPZZS4ncOZ/8MC63UQcnLskBBE3agawkU9giTlUkmwDad2xGJ1nqwZuPThAMxLGsXav
 JiF/0RsE7L6tpQTJjy9kmU9fUYCYonaudSMQqsGohT0w5l9JVKJMbSUnlGJMlKX1GPUt
 y8Yxha6dChZpx9ibBLgc13SKnVOYeBSgEIXl6wISM/vtebmnRwGDka1RVh4dfbNs71sP
 s9kkpJsfSgRggxGi5/5eQ+feGDeMjSjW81tPSwe6a4D36/yMjN6tehGf0EI8Q3OB15JO
 ajCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rYjYxm+SVEDCvYa7FbIYeK0ER/2x8MIotQD4iyLmSrc=;
 b=GLCe70JDK8Cqsy7qM3+zsNs1YfhLFZdWrTY3uFZTybiwj33nIxYqa2z1K2/f1rC+xP
 MPTz25GlAxXBGKH0ZuV/JV1zoHu4+/TeclOQYoHMIK5QCPNzmey3ICZzVmK8iTP+Ou5H
 ShMhgtACw3IHpdXBmxKL5b0FGUWqcf69W/bix8q4k5IALhyJUhpO0u/f1M16ll8O42Hs
 lBktIeI7Q6noQjaBCAlkq2w2S+WXfkle0u/3l7nHgpTg4OO++RpShuMB+1tX6EPpbU+a
 TkzimfKRf1eoQiWhPDAWx6Bwn/pVieCsXBnXpl0GdNYVHvhWhFyBmIcVAWhA2D5fSYTE
 Igog==
X-Gm-Message-State: APjAAAULmi9OwhxNGwnQj+JLQtY7HIU1G+7WrtrVTYqJWG2X50FLYKzq
 oeFfDxkwn7300/CV/3/8fKg6u7LcZCkcuwKM+kg=
X-Google-Smtp-Source: APXvYqw34xBrTkX94WBDaG28yGsuQR3dFfFuhejcgn1ab8IUraX7s2LwNq3w/oBGRODyw1xZ7b5OhVTjmnlouWOkzR4=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr2970093lfu.141.1561665596272; 
 Thu, 27 Jun 2019 12:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmVZm-dhvT40Ck4d159SHin_D-U47+CHShjajzM1f-P9Gw@mail.gmail.com>
 <mhng-4265f77a-c58a-4851-871a-093b4212df1d@palmer-si-x1e>
In-Reply-To: <mhng-4265f77a-c58a-4851-871a-093b4212df1d@palmer-si-x1e>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 27 Jun 2019 12:56:57 -0700
Message-ID: <CAKmqyKMAGJFgJV1Y9W+ne_=jipqGMtZMKRHJmN5qpNVZrKUTeg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jonathan Behrens <fintelia@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v3] target/riscv:
 Expose time CSRs when allowed by [m|s]counteren
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
X-List-Received-Date: Thu, 27 Jun 2019 20:00:05 -0000

On Wed, Jun 26, 2019 at 1:25 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 25 Jun 2019 23:58:34 PDT (-0700), bmeng.cn@gmail.com wrote:
> > On Wed, Jun 26, 2019 at 4:23 AM Jonathan Behrens <fintelia@gmail.com> wrote:
> >>
> >> I just did some testing on a HiFive Unleashed board and can confirm what
> >> you are saying. The low 5 bits of both mcounteren and scounteren are
> >> writable (if you try to write 0xFFFFFFFF to them, they'll take on the value
> >> 0x1F) but even with the TM bit set in both mcounteren and scounteren the
> >> rdtime instruction always generates an illegal instruction exception.
> >>
> >
> > Then I would think the FU540 is not spec complaint :)
>
> Ya, it's an errata.  There's a handful of them :)
>
> >> Reading through the relevant chapter of the spec, I still think that having
> >> mcounteren.TM be writable but making rdtime unconditionally trap is
> >> non-conformant. If other people feel strongly that rdtime should always
> >
> > Agree. To test hardware (FU540) compatibility in QEMU, maybe we can
> > add a cpu property to allow hard-wiring mcounteren.TM to zero?
>
> In theory we should have properties to control the behavior of all WARL fields,
> but it's a lot of work.  I'd be happy to take a patch for any of them.

Hmmm... We should avoid taking patches that don't adhere to the spec
just to match some hardware. In the case that core/popular software
doesn't work it probably makes sense, but in general it's probably not
the best move.

Alistair

>
> >> require trapping into firmware then the natural change would be to simply
> >> hardwire mcounteren.TM to zero (the value in scounteren wouldn't matter in
> >> that case so it could be left writable). My own (biased) personal feeling
> >> is that this full implementation makes sense at least for the `virt`
> >> machine type because it represents a clear case where deviating from
> >> current hardware enables a performance boost, and would not break
> >> compatibility with any current software: both OpenSBI and BBL try to enable
> >> hardware handling of rdtime when the platform claims to support it.
> >>
> >
> > Regards,
> > Bin
>

