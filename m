Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvOUO-0000Bw-D0
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 12:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38719)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvOUM-0000A6-0S
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:08:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvOUL-0006xs-1N
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:08:33 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44989)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvOUK-0006wa-Sh
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:08:32 -0400
Received: by mail-ot1-x344.google.com with SMTP id b7so56229684otl.11
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ZCkxkytWinsMyVRfWhsDZx6isZVn4x+oSVRiGbRPWA=;
 b=D+21YdEiHGd2h9Ug53f9imY1D4X4S6n+M8+ufv/b/ir7SDBqpZ3FqIpSXwKRhQ1/Ud
 6qJRJr2YWFE2L7v7P0CUShMVzBJHOZ3Ja9EY97W7ElDmgdPODZGosQw3cJRx2Mza4uKY
 vmwPIDF7AMyx9uKPQnDycj7uZ9fFRJHTaBO2Z/H04EMSsemBonquEVY1jAG9uClpTqvY
 eKCVCR74N3Zc+c0Rnfji88qLqPE1aMDnFSj4NJF9qjmATj2FkAJ3pTgtuuE37yiMsQMh
 LMnmLv0hVVVbpuWGZuzpjsxgdhTbXF5VEKl+JyIlwY2yEPw/FDqs/OLF5315DSWE/698
 LS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZCkxkytWinsMyVRfWhsDZx6isZVn4x+oSVRiGbRPWA=;
 b=bTuiQuKRi6C3PDjQi+GcrQBnRQn7EsvhkDHdVHXw0/8v8AxEvdUv3JmjyBuGvnWWTN
 5JgOAXaxQJnfo2f5sPDGt0Q/76ptXAhRJ9+Qp0XEgoFjpcS4E+S315p6C1WFQfaOpiac
 ijXW9ARNVuqopuimRJ0FgHw2rrLS5jF5Pd75hCFexIhHynXiPx+oZ3h4AQjdIOCnz8I0
 4wiCJ5QnX04lQcZe9BoZNNQ0p+j5wORkptdKINhSWB9KdpmTUROY8ESCkAei/DBjujuO
 RXAXfb3nvnPvbEYIcpAvhRSLfYtctdo1MqY6HaemvonQYhHVoSPNH+fw1yayq00YkGoP
 MGEA==
X-Gm-Message-State: APjAAAXqM1fTuo+ZSFBL6i4+Eo2J7gBVK5t4lSoIuIAsa1IcD0/ayrz5
 nZDHjKiXDhEkdX7Qr/YxXg18p95vXvCsxbhqaNOCm5S9
X-Google-Smtp-Source: APXvYqwQ7Xyytx7/4Owovq4vlqgWiKbbgxvu7x6KJ/3waZhjst4dJKX+t6FUbAHvp/UMJ+scCF9cJwn07tmokQK8R/w=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr494521oij.98.1565194111851; 
 Wed, 07 Aug 2019 09:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190807145939.1281-1-palmer@sifive.com>
In-Reply-To: <20190807145939.1281-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 17:08:20 +0100
Message-ID: <CAFEAcA8q-NSx51TkcbLSgVTyHNYjDe5pK5+u9HXABxANQEhT1w@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <Atish.Patra@wdc.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1] RISC-V: Ignore the S
 and U extensions when formatting ISA strings
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
X-List-Received-Date: Wed, 07 Aug 2019 16:08:35 -0000

On Wed, 7 Aug 2019 at 16:02, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The ISA strings we're providing from QEMU aren't actually legal RISC-V
> ISA strings, as both the S and U extensions cannot exist as
> single-letter extensions and must instead be multi-letter strings.
> We're still using the ISA strings inside QEMU to track the availiable
> extensions, so this patch just strips out the S and U extensions when
> formatting ISA strings.
>
> This boots Linux on top of 4.1-rc3, which no longer has the U extension
> in /proc/cpuinfo.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
> This is another late one, but I'd like to target it for 4.1 as we're
> providing illegal ISA strings and I don't want to bake that into a bunch
> of other code.

Sorry, you've missed the 4.1 train by about 24 hours. There
will be no further changes to 4.1 unless they are absolute
showstoppers (security bugs, bad data loss, etc), and this doesn't
count, judging by the description.

thanks
-- PMM

