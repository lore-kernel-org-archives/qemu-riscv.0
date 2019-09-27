Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDy9w-00007s-S8
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 17:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iDy9p-0008Vq-FX
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 17:52:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iDy9m-0001AM-Aj
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 17:52:09 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41135)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iDy9b-0000tH-Bw; Fri, 27 Sep 2019 17:51:59 -0400
Received: by mail-lf1-x143.google.com with SMTP id r2so2965852lfn.8;
 Fri, 27 Sep 2019 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BLBr7qiWAfyYl/v8+1LEkv7+EHsq3wG4rWqEdWOyVVc=;
 b=UpnHg/fM814d+qRvJDmmYAtzTbvz/aI2wP9H2PNG8Q5GNfIM5HJdmhR20aTuq4byCa
 JA/aBTEgA5uHcUb6zZYcVXlVZTLbKj8hPZGjUBJD6Hf6EYfoUL15Ae/tEyVAthQCM4s3
 hz8GPGAuGl+F/PlI2od22POjinDuihHLGHfY1hWxkX36msLBFL6VLixn1SRnOU3plZpH
 gYw46Pu3czH9hA6iCq2ovrw8ADuJIDjKOzBHN1QSJJI/DRSbi9v/aOYV8hvCeU7PsldQ
 iqgr6+yViSRHC8f5LPEa46E3aR++7uv3/lkiQ/xTElk9Y1MncNG/YGI3q2LrHBtMvK2U
 GQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BLBr7qiWAfyYl/v8+1LEkv7+EHsq3wG4rWqEdWOyVVc=;
 b=rrg8d90wBCzAfXG4MSpI1MygDAXb6YGKxZOoazycKHbhVnz0fzyB8Y+1cZ2X/5iI52
 9WFcnIazCM9UdhT+pFK2cP1wAKbU03cKp8iVXTNKYb13AGcoN5ZMq1ZO27GvvqX9yVpP
 8q3wBwAqSd7oThBkn/BGZl9/cjhsXOQ/BgzVbCAZmH3nD1ow4wI3wrQb/dQ4eAwW/vLB
 4p+DNXj0Lsj0U1xd8rt2H5Ww0MHLKZ8uwIEICmwn1uGwMQ30dCZHLuFp13/K9OgFDcgm
 lx/Nr7iaFPEu68jEFwlS/g+b0g6tLRGjgV2TNdrUl6AhbP9wMN6B/BAR+em7MvpYhpRJ
 pTGg==
X-Gm-Message-State: APjAAAU0NzmP6anbEoUF+kOKAPQe2glLHAk9z1l+Fdrb5SETr382/4VG
 v4VtfFC9Lok65nK2fatEP0MLV2cu85l1n4Bsngc=
X-Google-Smtp-Source: APXvYqys1PzcQ0RXjf19NdGe/VFEyKwjB1ruDI/i7FPiNrI8itTEZEEI8CVWsGiyfFGxOHnFIzxeVZWzpmA6u7XnGDk=
X-Received: by 2002:a19:4912:: with SMTP id w18mr4049708lfa.93.1569621111014; 
 Fri, 27 Sep 2019 14:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569545046.git.alistair.francis@wdc.com>
 <bf4f869cab915364855a1c9ffadfeac16b151e4b.1569545046.git.alistair.francis@wdc.com>
 <CAEUhbmVBDs5dNH06BjA=Xsa_AEtqoaA6Nm04VtY9-nxJUhmkPQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVBDs5dNH06BjA=Xsa_AEtqoaA6Nm04VtY9-nxJUhmkPQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Sep 2019 14:47:04 -0700
Message-ID: <CAKmqyKMiZ6gNn6rgABfa=QWL_X4oXVN1Pd4itFzFoR66=hgQhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] riscv/sifive_u: Add L2-LIM cache memory
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Fri, 27 Sep 2019 21:52:12 -0000

On Fri, Sep 27, 2019 at 12:57 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 27, 2019 at 8:52 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > On reset only a single L2 cache way is enabled, the others are exposed
> > as memory that can be used by early boot firmware. This L2 region is
> > generally disabled using the WayEnable register at a later stage in the
> > boot process. To allow firmware to target QEMU and the HiFive Unleashed
> > let's add the L2 LIM (LooselyIntegrated Memory).
> >
> > Ideally we would want to adjust the size of this chunk of memory as the
> > L2 Cache Controller WayEnable register is incremented. Unfortunately I
> > don't see a nice way to handle reducing or blocking out the L2 LIM while
> > still allowing it be re returned to all enabled from a reset.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
>
> Please include a changelog in the future. otherwise it's hard to track
> what is changed between patch versions.

I normally just include one in the cover letter, individual patch
change logs can be a bit of a pain to maintain. I'll try to do a
better job in the future.

Alistair

>
> >  hw/riscv/sifive_u.c         | 16 ++++++++++++++++
> >  include/hw/riscv/sifive_u.h |  1 +
> >  2 files changed, 17 insertions(+)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

