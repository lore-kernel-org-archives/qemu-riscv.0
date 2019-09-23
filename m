Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCWjN-0005jD-GB
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 18:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCWjL-0005iN-AB
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 18:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCWjK-0003pb-BB
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 18:22:51 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43293)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCWAA-0001Za-DM
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 17:46:30 -0400
Received: by mail-ot1-x342.google.com with SMTP id o44so5067773ota.10
 for <qemu-riscv@nongnu.org>; Mon, 23 Sep 2019 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1lwzpWN8tjukbbISDvbnJRJp7+j23v5G7tQvo2iviAw=;
 b=NgJuH4J4A33lyPD33YF15BNN5RpNHLbOuf5gm0qILbL/ica6Cuc9Zmb5BoeJC/Pp6M
 6eBAoOjf3wfumYLUsh4z4j3BGRNFyNGfwhsNopx8kE2yp8jIIumstlLJbrvhXBmOxqtc
 Ca7X5qxIHVtmUDwcJ3sfOVl/8fkjqa4TS0xNkgiuVI9tNeLGKrStTt6FOtiQFN4qTdBs
 dxklM/lynYEnNOJ+fUWdtxcCaPplYEfCRmw7Qj0c69MdtYhtXIO5cokxOxbD91dCTydE
 xB7iWiKfPU5y3D7ebnLAiHEFm6bkrG9Frp7P42C4CchQ4VYDheJ1acT6JGUkeTWHLkT8
 9THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lwzpWN8tjukbbISDvbnJRJp7+j23v5G7tQvo2iviAw=;
 b=jVU4MH8/d4i5wlNIcboUkCkbQtQXI6jc8aHclrFS9ENklgdrf/KYFdLlchrrWB4XZG
 EBvnBS7uwewq2icBeScF0nMBqFFU5co8z5R8xeEhJ7ZrEClEHKLao2kaETIpciRnir9f
 RWpsJ20+q15iNg3hE43vIs5nV6cGo7zVtw1gqXhveN8MakWulvJmHvm+/AMh0zJQm8rj
 5CYjjxPiKojjxKNm0qpja0FGQB3H+I6FD33uzX+dRPt9kff45MjsJQEutcjAlJC3tin+
 iMrfBG29RJfpLNVNmEMwVM1i5IweQNHuH3g+n/eFdhlRBr0vlfb+SYpMveH6sHunt8So
 sEfg==
X-Gm-Message-State: APjAAAVoHsYdaUcQT+ifiQdhrE73hJSWHYPAy2m6VJDkVJaq8wAsjjpM
 wZKwKubkboAAsqDXQXvf7C4uBh3ptQPJFbcN/4vw8Q==
X-Google-Smtp-Source: APXvYqzlviW3HUvhH+fobID+Iesir2GZbVjn9P0OyQFYL8SkBo09OrV9KfQruiYNxghNEMxTA6uf1Kx1Rls0R+BwCc4=
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr304805otp.221.1569275188921; 
 Mon, 23 Sep 2019 14:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <0a5c141a26fada6d93d06e996a2f24e1b269ec50.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmVvDKQqQYE-riq=cvSrCe_NMoW_KDsLjh8CVHRUhJvk9A@mail.gmail.com>
 <CAKmqyKOofA3U+8kjMkzQ0sNd1=uwJHq3c9eaLZdoNCb7=e-PAw@mail.gmail.com>
In-Reply-To: <CAKmqyKOofA3U+8kjMkzQ0sNd1=uwJHq3c9eaLZdoNCb7=e-PAw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 22:46:17 +0100
Message-ID: <CAFEAcA-uFPGf4BiDXH=Om3Df-xXrt7QwjzVF7E3kY4aMWMP4YQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] riscv/virt: Add the PFlash CFI01 device
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Mon, 23 Sep 2019 22:22:52 -0000

On Fri, 20 Sep 2019 at 23:23, Alistair Francis <alistair23@gmail.com> wrote:
> On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > I don't think we should mirror what is used on ARM virt board to
> > create 2 flash for sifive_u. For ARM virt, there are 2 flashes because
> > they need distinguish secure and non-secure. For sifive_u, only one is
> > enough.
>
> I went back and forward about 1 or 2. Two seems more usable as maybe
> someone wants to include two pflash files? The Xilinx machine also has
> two so I'm kind of used to 2, but I'm not really fussed.

One of the reasons for having 2 on the Arm board (we do this
even if we're not supporting secure vs non-secure) is that
then you can use one for a fixed read-only BIOS image (backed
by a file on the host filesystem shared between all VMs), and
one backed by a read-write per-VM file providing permanent
storage for BIOS environment variables. Notably UEFI likes to
work this way, but the idea applies in theory to other
boot loader or BIOSes I guess.

I would suggest also checking with Markus that your code
for instantiating the flash devices follows the current
recommendations so the backing storage can be configured
via -blockdev. (This is a fairly recent change from June or
so; current-in-master virt and sbsa boards provide an example
of doing the right thing, I think.)

thanks
-- PMM

