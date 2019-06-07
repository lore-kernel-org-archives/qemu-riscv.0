Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZ4yF-0003dn-Iy
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jun 2019 22:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZ4yB-0003dO-Rh
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 22:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZ4yA-00027G-LY
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 22:51:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33701)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZ4y9-00021Q-2F
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 22:51:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n9so591537wru.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Jun 2019 19:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iR9Qzpwk7DjB6XO2UJkWE7zhNl2FqiN9AhAoa0DSBIY=;
 b=xKDGJQqw8uCeMlNs1IbX/lnPgWSgB84U7vHPWxlpZarjatI25isaklL0Ys2TtLwWm1
 ghNlRSVSf1fThSiQS3iQ+u8jrMYO5QH1b3EptNJch6OmEl2Eb5jzr9S9NlyH7O4OSAl1
 u0+3iXbqMx8LgPNafpaYvybA/smGQ9C5/2PxJXLoSzAQ0tb7Lv7Zo+HLx7lEKd+6x6sa
 0R6q1JQqNEHUII3pAu3h+kriNAchcnN7VqW0jcXqrfP0M+7Uusz3/dXfqkELvn6FXiSj
 NUzYNWBkYMhk+qt6IJ04XGDT63v+MGEkLRzA+Eqygj5Rzn8EcgGkJX0VKX61o2EuGaPm
 LDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iR9Qzpwk7DjB6XO2UJkWE7zhNl2FqiN9AhAoa0DSBIY=;
 b=tPKtnZJugIe5olUY+X13LjcMR70uX/7X2vIvfiw9UYHGEUFLf+yIVldxnndPc/s1Bn
 oa9lX1QGJ2+v+gvl7JUHuk23y7TYerdLtFmeZ8KIJAu3HspszU8uYFKDT0y5oATzmI/I
 uSghqQ5wVNNbf2pb+3XmnjQ4uCUM+hioSKDLWXsvNIOifHqiGhNYYvOO0pjaKPLaaLeA
 3MvSlCWy2XWoKRhzf05OeN91i0uhAY/f3JydbvyZKNvy3qJd7nCqIcfbSB3pzLrNkUtb
 PexKR8sFfpWGsb/pVmFSzW3iffz4hne/0OGCpRdpiQE8RZw9PSf003v1Lzagq+/OTk3k
 ro4w==
X-Gm-Message-State: APjAAAWQT0v0aSKy58a9ekMr1tznyXSDOtp7yQIW5QuGx31F4SAzjpQH
 Ps74ZffecavomfR760S3ccx8A0x4VmhFuEin63nHZQ==
X-Google-Smtp-Source: APXvYqxO9JGs6jSihPapMPEekjodV6ZXk/uOTtsUDh2KFG39Ou4iaql/Q3pJUGJZ/wRc5Ab9kA23pdeSRbMkq7OttWU=
X-Received: by 2002:adf:9062:: with SMTP id h89mr30956137wrh.20.1559875860223; 
 Thu, 06 Jun 2019 19:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <B1A3E8F6-F8C2-4EDB-A31B-EBB4CA636CA3@decred.org>
 <mhng-6493b48f-57c1-47cd-9157-50cb533f91df@palmer-si-x1e>
In-Reply-To: <mhng-6493b48f-57c1-47cd-9157-50cb533f91df@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Thu, 6 Jun 2019 21:50:57 -0500
Message-ID: <CAFXwXrkEVJgPEZtvzyekJEZDk90XvntHkdfUe0s37RZ-ir1MKw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: marco@decred.org, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008b0057058ab2e690"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: Re: [Qemu-riscv] [Qemu-devel] Fwd: [joel@sing.id.au: atomic
 failures on qemu-system-riscv64]
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
X-List-Received-Date: Fri, 07 Jun 2019 02:51:10 -0000

--0000000000008b0057058ab2e690
Content-Type: text/plain; charset="UTF-8"

>
> Also, unless I'm misunderstanding something our implementation of LR/SC is
>
pretty broken.  We're just using a CAS to check if the value changed, which
> suffers from the ABA problem that LR/SC is there to fix in the first
> place.  I
> might be missing something here, though, as it looks like MIPS is doing
> essentially the same thing.
>

All of our load-lock/store-conditional implementations do the same.

You are correct that we do not implement the exact correct semantics.
Correct semantics, as far as I know, cannot be modeled without emulating
everything in a serial context, including caches.

We therefore make a considered choice to observe that while ll/sc can be
used to do all kinds of wild and woolly things, no one actually does so.
What people actually do is write portable code, using c/c++ atomic
primitives. And that all of these can be done with cmpxchg, because that's
what x86 has.

Using that choice, we can provide multi-threaded smp emulation that,
demonstrably, works.

>

r~

>

--0000000000008b0057058ab2e690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Also, unless I&#39;m misunderstanding something our implementation of=
 LR/SC is<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
pretty broken.=C2=A0 We&#39;re just using a CAS to check if the value chang=
ed, which<br>
suffers from the ABA problem that LR/SC is there to fix in the first place.=
=C2=A0 I<br>
might be missing something here, though, as it looks like MIPS is doing<br>
essentially the same thing.<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">All of our load-lock/store-conditional implement=
ations do the same.</div><div dir=3D"auto"><br></div><div dir=3D"auto">You =
are correct that we do not implement the exact correct semantics.=C2=A0 Cor=
rect semantics, as far as I know, cannot be modeled without emulating every=
thing in a serial context, including caches.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">We therefore make a considered choice to observe that =
while ll/sc can be used to do all kinds of wild and woolly things, no one a=
ctually does so. What people actually do is write portable code, using c/c+=
+ atomic primitives. And that all of these can be done with cmpxchg, becaus=
e that&#39;s what x86 has.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Using that choice, we can provide multi-threaded smp emulation that, dem=
onstrably, works.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">r~</div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000008b0057058ab2e690--

