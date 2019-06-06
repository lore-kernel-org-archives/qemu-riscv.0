Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hYxlG-0004qJ-JL
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jun 2019 15:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53577)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hYxlC-0004e6-Jz
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 15:09:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hYxOv-0004hU-NB
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 14:46:14 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35155)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hYxOv-0004Xf-Aj; Thu, 06 Jun 2019 14:46:13 -0400
Received: by mail-lj1-x243.google.com with SMTP id h11so3043269ljb.2;
 Thu, 06 Jun 2019 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bhga0YIOBroMMDM2FCjwRLT+/LALmkhEyJF3XLvlVZI=;
 b=QAB7qUStfUGTNDJcRITAzVovVVgHT3ROcGg6dD3xG8pWoinzmx5kwipNNobbCEoGFd
 Sg700a/L19QzP8oMRpQwgZosQGYnnT5tdk2IFh5yo6vBdrPYkdn6O9/V981L0QlnKY9H
 hLQFZLTFFzhW5izxQO3JGEgL3Sp97rLBafB/Au6MokCpZlV1aoR0sIxuiPbJyHMMg2SS
 e6HeC3qoG8XXuCf0HgWMC5DKft8XYbteCQnycCY5MzqLWyyOzC42jD1e/ZAHlYu3JEO5
 Q5SAYeni9M5LybXa+p4SKmebpjaMS6VcWDXj72YtMYrG9BibKZbGappcEx9wIsd/xFgY
 XsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bhga0YIOBroMMDM2FCjwRLT+/LALmkhEyJF3XLvlVZI=;
 b=lyHUlN9F0uoX9K24SDAgBBTglsR4sYKN03GNxWifIj+uR8N5OkIBa/0U8nBP+zvNlz
 O3CdNFlNn15N6p5zsJp8XpN1Cz3euqP1rKUiL/3hI0gDa1jlQYapFHHaz3gNs5xqodPD
 g8iTlRTKWWIoyAphDqy7opMk0tWK4KF2OJeC4XD+RdhgqH+oJUYyJWshqeYnZDoub7Vn
 jXbibwnRV/AFe5N+K1yU8NqtBpsRBX9X7IqWKxbWtMaNmJok9vjZkyItrNu2vUPTAI2Z
 X1XAv8EhhHN9gTsaqcSEvbmW4VYq2+74w7ZeyUV/jw/dKCERj7nvYO/cmQiEkKcudo14
 20Ew==
X-Gm-Message-State: APjAAAXbYGKsc43sEcoV41dFrFZ+ZlsUXO5q/8tUNaaHhl+3bw3WhtYS
 QETb5KhE4QlqUTpcv6xNf8dBTDSeApmgkZ3+MY4=
X-Google-Smtp-Source: APXvYqwFWG4JjF8LIj9f9+z2Mr8jvQYD8U49gb+ZGBh3uL6MdBRJqkXJ1Mw5e20P01067vJJq2xIjeNCHsRCUnrT0QE=
X-Received: by 2002:a2e:6313:: with SMTP id x19mr16503011ljb.25.1559846771796; 
 Thu, 06 Jun 2019 11:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <1559119921-6098-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKNAL8KtVgfCx6yhaNYEL=_wnZ5Vf1eSjxwtg0x6_q+UHw@mail.gmail.com>
 <CAEUhbmXLr3zXhbphXRvqfyW1FH9qo3yoPwnFoRoYNtbwkrBBKw@mail.gmail.com>
 <CAEUhbmUAKoFPqBLVW4FHmiESaF8fqEtjqDb1LKf4ivG3g2z0ZQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUAKoFPqBLVW4FHmiESaF8fqEtjqDb1LKf4ivG3g2z0ZQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jun 2019 11:43:36 -0700
Message-ID: <CAKmqyKPO8CERWMZQEfEM1Q7HBTysB8cG5LsR1wdc334YX5tmgg@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: virt: Correct pci
 "bus-range" encoding
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
X-List-Received-Date: Thu, 06 Jun 2019 19:09:16 -0000

On Thu, Jun 6, 2019 at 5:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, May 30, 2019 at 11:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Thu, May 30, 2019 at 11:14 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Wed, May 29, 2019 at 1:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > The largest pci bus number should be calculated from ECAM size,
> > > > instead of its base address.
> > > >
> > > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > >
> > > This seems ok, can you maybe explain what this fixes?
> > >
> >
> > The logic is wrong, as the commit message said. With current wrong
> > logic, the largest pci bus number encoded in "bus-ranges" property was
> > wrongly set to 0x2ff in this case. Per pci spec, the bus number should
> > not exceed 0xff.
> >
>
> Ping?

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

