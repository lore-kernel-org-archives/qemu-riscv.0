Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuyBO-0006xb-JA
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 07:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48045)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iuyBL-0006tg-L5
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iuyBK-00028K-Eo
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:35:27 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:37594)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iuyBK-00027G-8z
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:35:26 -0500
Received: by mail-ot1-x32e.google.com with SMTP id d3so1140356otp.4
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2020 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oNAtJLnuhmMFXycXLNnPn7OxpMKxfxO07z4pOrrGKGA=;
 b=XzAT4W2IoM1bMkR3LSgVDVTu9eb2Z1tCXkew/RPz8RjGmPAwyUMHzTWZUf1ayNPKWf
 i5x2VzzAH8H7z+PmHw8klh2q2wfH1cGP7/uOUUuZkcUAtVwLYOP/9HgBuW9MnhVp9BUZ
 SJ52sGpyguZMmdqpuSbUp+O6jzzSGbqSlJuQUcF2+EBo2LSc7EigBeBtEC+Ogto1lQ1M
 BTj8cjkQwkDpGuKzWczcx/fub8o5KWUyxnal2/dawkPZH4E1hGWuwn1ChAKmBr+4IcYc
 4cpZXVRwGmGQUrhxX/RvXldvNp6jZ2TaX036rPjhGfF5cfbJn5CVsjFTp3nhYCYuYY8S
 fB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oNAtJLnuhmMFXycXLNnPn7OxpMKxfxO07z4pOrrGKGA=;
 b=KrMK37IZOf8wNTxVYgaS5KzE7ZLo510s4y6vajVYII1UM6DdcqOtinbnTz1hYAecuS
 yu4kUYj1SHsXjNHlmxUUvHlEY9mByZ6hcuhtu3dxiJGkl4wbvKmyNmtnC5cPoDqbi7RB
 hAOEWfa3hWBOu/2GBKcqzNEtyrorwfH740q8+Rsc8UgArCIeeHVrR/IUlffXwopmTLIQ
 bLHekfv+ItZ5PNdCtQGBZiT3nVYYL9krIXce7NU48GJ4VQHJxyi34JeTx//KH43kOcpO
 BFo1+1okydmtgqSSiG4ArCtxCfvAJqycaCNJmG6Xd/GtTLaNbm3WO88L559ag0k4oSv2
 ZPDQ==
X-Gm-Message-State: APjAAAV+aYOEZ6RVMqkXUJqLxkE8izfycwi1BPBcQ+mGQSkPlpSrxOPU
 MPiWzJxqOP1m9i/60hHZ+tKPpFwOLNpqC+PN5oHpgQ==
X-Google-Smtp-Source: APXvYqzk++7qX0uy7J/QkZb1zfqlYyTqpnw5HE4NQLZFa69aWTTeyndiSzgpfxD2wXnYxfLm0R+HS6M9YHIvoRY2JSo=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr2490043otd.91.1579869325298; 
 Fri, 24 Jan 2020 04:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20200121225703.148465-1-palmerdabbelt@google.com>
 <CAFEAcA9YoAjASu4F1hZRjbq5S+h8GtBUVb9dgecMdaWb9YENEw@mail.gmail.com>
 <mhng-ea4d4047-6dfa-4be0-8ce7-424b1d17560a@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-ea4d4047-6dfa-4be0-8ce7-424b1d17560a@palmerdabbelt-glaptop1>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2020 12:35:14 +0000
Message-ID: <CAFEAcA9HnhKE1nS+ubmCD4AgS-EZ_J_XcWapzUvM2pegHs-imw@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 1
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
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
X-List-Received-Date: Fri, 24 Jan 2020 12:35:28 -0000

On Thu, 23 Jan 2020 at 18:43, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> On Thu, 23 Jan 2020 06:38:07 PST (-0800), Peter Maydell wrote:
> > Hi. This pull request doesn't seem to be signed with the GPG
> > key that I have on record for you...
>
> When I moved to Google I got a Yubikey and made new subkeys for it.  If I
> understand correctly the new subkeys should be signed by my main key, but maybe
> that didn't make it to your keyring?  I see
>
>     $ gpg --list-keys palmer@dabbelt.com
>     pub   rsa4096 2017-06-06 [SC] [expires: 2027-11-13]
>           00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
>     uid           [ultimate] Palmer Dabbelt <palmer@dabbelt.com>
>     uid           [ultimate] Palmer Dabbelt <palmerdabbelt@google.com>
>     sub   rsa4096 2017-06-06 [E]
>     sub   rsa4096 2019-11-26 [S] [expires: 2024-11-24]
>     sub   rsa4096 2019-11-26 [A] [expires: 2024-11-24]
>     sub   rsa4096 2019-11-26 [E] [expires: 2024-11-24]

Yeah, I have those. I think I must have fumbled something
when I retried the pullreq after doing a refresh of your
gpg key, because I just did a retry now and it's fine.
(I'm just running the pull through my tests now.)

thanks
-- PMM

