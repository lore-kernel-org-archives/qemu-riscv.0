Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUGrS-0000tY-DE
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 17:36:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jUGrO-0000s2-7D
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 17:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jUGrJ-000104-9K
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 17:36:45 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:40577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jUGrH-0000sA-QB; Thu, 30 Apr 2020 17:36:39 -0400
Received: by mail-il1-x144.google.com with SMTP id e8so2830128ilm.7;
 Thu, 30 Apr 2020 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UyLTuFayAbRQrUMDIYQwwzsYELaOLZE/QXiaMBIfEwU=;
 b=d7zweM9uuufN+GetVWltArvZC6J2rd/Rlw+FuoZpY4CUVw4Fzd5LQKofpjx37d4OaO
 nHLP6u9W4rGjgvwIDQ1DsFKMl8Lp/lH/SNFxPjf7MMfAHqFI7v88Z9aM2d6YwvcsRWRI
 4+h1f3z5tfD5+dVLrxPgJoerw1g30hvrs9InApZg/4vi7UE+/yIw8zeCajti+eTZYFrd
 itU6Od8jVVp4y3RWdZJrumyIyh0YHgDqKf6yHkaspbAIWxWPJvQtiiiLcIEl1Nv2SLmY
 FjHOIiDD0iPEJoFygeVF+DKldMmArLCxZzt0sUl1eT1Xu0nQQCWFdNPs6FmZ5bdTqyd6
 Xr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyLTuFayAbRQrUMDIYQwwzsYELaOLZE/QXiaMBIfEwU=;
 b=NpM7Y0ytzupNpdYFgllIAWplHgVDjxKs0GLXhzjCWdFyzCe1AbDiDk4q8wFb05unGl
 bom4xjTj6mv818BLw8C3syIfaleTjy2rKl02LwaQiJljJzvSLRV3Jmg8wW4125bUntky
 Lh9iaVWiFHZWq4klY6xrwGuYPDp7pzB7PKyJxJ0Dcn2DxcFz7KmRG1vI5bkiounOY3Fc
 8nNygfuqEmJ3s+pvjxed03ZhCHzvr/VIRqUcn3inxkLp9AcYk0InZ38ixyq+kk4ebA/E
 5qELjp3DdDFTGTSOYA4Fg1kuDurXaZSJWQ7Vu/ANgd7ZzRzum8UQg0z9szgCyougeE61
 mt8w==
X-Gm-Message-State: AGi0PuYyxb5gLCWBxF6363AOw2vc9EB3ImvTPVx4MCiE9a6nw9UlXdEB
 PC2+j7kaINvxNjXj6ElulMbNyUtSaBXKSU64JTc=
X-Google-Smtp-Source: APiQypIDXevnY2BbG+fgFOffSxVvPvGjSVBUc/pGvNVeJghJpDaGkWNu1W3Fx66PObmkaY12aa9MVcbhPH0WG/VpLSQ=
X-Received: by 2002:a92:d0c6:: with SMTP id y6mr464988ila.227.1588282597089;
 Thu, 30 Apr 2020 14:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2LfTQZnor5haAgBg=h34qv50xf8Bs1bgSeGESfr-E2ng@mail.gmail.com>
 <CAKmqyKNMiD6VJ1D-ty-q_HMyiZ7oj7F0XraKTaYy78-xjhAN4A@mail.gmail.com>
In-Reply-To: <CAKmqyKNMiD6VJ1D-ty-q_HMyiZ7oj7F0XraKTaYy78-xjhAN4A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Apr 2020 14:28:02 -0700
Message-ID: <CAKmqyKO=edmrotcVa_tMO-VcTpdWEq7=0=EYiQquVhqwkS2F=g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix check of guest pa top bits
To: Jose Martins <josemartins90@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::144
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
X-List-Received-Date: Thu, 30 Apr 2020 21:36:49 -0000

On Thu, Apr 30, 2020 at 12:45 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Apr 24, 2020 at 8:10 AM Jose Martins <josemartins90@gmail.com> wrote:
> >
> > The spec states that on sv39x4 guest physical  "address bits 63:41
> > must all be zeros, or else a guest-page-fault exception occurs.".
> > However, the check performed for these top bits of the virtual address
> > on the second stage is the same as the one performed for virtual
> > addresses on the first stage except with the 2-bit extension,
> > effectively creating the same kind of "hole" in the guest's physical
> > address space. I believe the following patch fixes this issue:
> >
> > Signed-off-by: Jose Martins <josemartins90@gmail.com>
>
> Thanks for the patch.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> > ---
> >  target/riscv/cpu_helper.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index d3ba9efb02..da879f5656 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -421,15 +421,21 @@ static int get_physical_address(CPURISCVState
> > *env, hwaddr *physical,
>
> There seems to be a strange wrapping here, that corrupts the patch.
> For future patches can you please check your git send-email setup?
>
> Applied to the RISC-V tree with the above line fixed up.

This patch also fails checkpatch.

Do you mind resending a v2 with the check patch issues fixed?

Alistair

>
> Alistair
>
> >      int va_bits = PGSHIFT + levels * ptidxbits + widened;
> >      target_ulong mask, masked_msbs;
> >
> > -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> > -        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> > +    if(!first_stage){
> > +        if ((addr >> va_bits) != 0) {
> > +            return TRANSLATE_FAIL;
> > +        }
> >      } else {
> > -        mask = 0;
> > -    }
> > -    masked_msbs = (addr >> (va_bits - 1)) & mask;
> > +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> > +            mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> > +        } else {
> > +            mask = 0;
> > +        }
> > +        masked_msbs = (addr >> (va_bits - 1)) & mask;
> >
> > -    if (masked_msbs != 0 && masked_msbs != mask) {
> > -        return TRANSLATE_FAIL;
> > +        if (masked_msbs != 0 && masked_msbs != mask) {
> > +            return TRANSLATE_FAIL;
> > +        }
> >      }
> >
> >      int ptshift = (levels - 1) * ptidxbits;
> > --
> > 2.17.1
> >
> > Jose
> >

