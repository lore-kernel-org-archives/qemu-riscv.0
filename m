Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyNWi-0007wv-2v
	for mharc-qemu-riscv@gnu.org; Thu, 15 Aug 2019 17:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1hyNWe-0007so-Ev
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 17:43:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hyNWc-0000sW-Mp
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 17:43:16 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:44882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hyNWc-0000qp-Fp; Thu, 15 Aug 2019 17:43:14 -0400
Received: by mail-lf1-x141.google.com with SMTP id v16so691782lfg.11;
 Thu, 15 Aug 2019 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/+c8Nbw+bFOYPr5aQg/CMUm/D+sQebTcSx7yxtjjGYI=;
 b=MvM7FbZuMBpuwXlbAlZjCkg08xH7JF8uRsMQZpl9CIjJtU1cMpphplWPKlmPVN5CwA
 YTiJqmQKPp9fKDSFEmlodEhMmArhihyN/Ga0YQAlRZa25WUGaiufNybckiJLlB4xfWI9
 haOsga1qoSpZGW6H5YCsScFDIOXl18MNedUlSwjLxQMqw/cUYdqjRreHLfAwJynkXo5G
 XNmD/ChMoZ7DOmAexyg4ry4oTMAooEO3t4mRDz9+IF/ZjHKHvc0gNy5Qh8gSsIVLK84w
 Jq2ytq1kGydepoxf5hsmJCNPR3PQIyccwOXGzSvFhXiMYE4aGW+gSGM10vgLTmDaz8G3
 NARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/+c8Nbw+bFOYPr5aQg/CMUm/D+sQebTcSx7yxtjjGYI=;
 b=Kwr9iucq/pm+D93BdGU/h2hFn3/spkumUJiaiG2Sdfe37R66UwFTG8Y1HkulnxnUAp
 pRt7u9LTOxh6yQo3DYaeHceNTcmH9+++eTr9el40s2Z91Ay4KWhBn0jNbglaGlbkpwfU
 Ir/6UYqHFD23NdGw6bCs1f/wdYOeCTlZEjReKVsbkyBVfAWQtZQUezxjNUta/Z7ynJjq
 qvZ3yc044mJPhzS/OybgqaAtlgWCZTj+MeUns5NgrqeNJcLxT8YoNdpNSG0h6kUBU1DV
 zkXU5pj5BCSdlV/U9Z6Lwg5S4w5CGdAKLjxuHRu3ZMSFvQuyLSO+VhXXgL1Uo4cOJ2vG
 TU5A==
X-Gm-Message-State: APjAAAUICTbj0XrJh+lMkiwAi9zXikBu3r4spwQqyu7xIQppb/1KcK0D
 wCeRNOV0wp+sCpcHpBQc1MBMKSeWHA6uHoz7vSM=
X-Google-Smtp-Source: APXvYqyHJoi37ZbXpVAo+5uKlDTXhllZArPZCc6oAHwSRkW1OtPWsFIWPEGHX4XWofzpYjdkwv8Bdiu2RmMWpcgDcWA=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr3420355lfy.141.1565905392888; 
 Thu, 15 Aug 2019 14:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-A5P+2XE49dg582CRtDPH0CXevyYfkGkaDH3HN=NFYcg@mail.gmail.com>
 <mhng-19b0dd58-7f8d-45a6-ac6b-049be291d2a7@palmer-si-x1e>
In-Reply-To: <mhng-19b0dd58-7f8d-45a6-ac6b-049be291d2a7@palmer-si-x1e>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Aug 2019 14:39:18 -0700
Message-ID: <CAKmqyKMyv8gt8Gb6y0DMktnWnSKBw4ePwOXBzWkEpw5GVmyG0A@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 04/32] target/riscv: Implement
 riscv_cpu_unassigned_access
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
X-List-Received-Date: Thu, 15 Aug 2019 21:43:18 -0000

On Tue, Aug 13, 2019 at 3:44 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 01 Aug 2019 08:39:17 PDT (-0700), Peter Maydell wrote:
> > On Wed, 3 Jul 2019 at 09:41, Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> From: Michael Clark <mjc@sifive.com>
> >>
> >> This patch adds support for the riscv_cpu_unassigned_access call
> >> and will raise a load or store access fault.
> >>
> >> Signed-off-by: Michael Clark <mjc@sifive.com>
> >> [Changes by AF:
> >>  - Squash two patches and rewrite commit message
> >>  - Set baddr to the access address
> >> ]
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> >
> > Oops, I missed seeing this go by. The do_unassigned_access
> > hook is deprecated and you should drop this and use
> > the do_transaction_failed hook instead.

Argh!

> >
> > The distinction between the two is that do_unassigned_access
> > will end up being called for any failing access, including
> > not just "normal" guest accesses but also for bad accesses
> > that happen during page table walks (which often want to
> > be reported to the guest differently) and also accesses
> > by random devices like DMA controllers (where throwing a
> > cpu exception is always a bug).
> >
> > Changing the hook implementation itself should be straightforward;
> > commit 6ad4d7eed05a1e23537f is an example of doing that on Alpha.
> > You also want to check all the places in your target code that
> > do physical memory accesses, determine what the right behaviour
> > if they get a bus fault is, and implement that (or at least put
> > in TODO comments).
>
> Sorry, updating that has been on my TODO list for a while now.  I figured it
> was better to have the deprecated version in there than nothing at all.  I've
> written some patches to fix this, but I want to give them another look before
> sending them out.

I was going to start looking into this, but if you already have
patches I won't bother. Let me know if you want a hand with the
conversion.

Alistair

>

