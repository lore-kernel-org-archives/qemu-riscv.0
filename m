Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hs2z2-000606-T8
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jul 2019 06:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs2z0-0005zE-B2
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 06:34:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs2yz-0001Y2-E2
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 06:34:22 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:45510)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs2yz-0001VF-7N
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 06:34:21 -0400
Received: by mail-ot1-x334.google.com with SMTP id x21so23569647otq.12
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2019 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28wKYrw+PB2qf7MYtlXfMbxVM/QPzyO1QbIheEBhZzs=;
 b=EhM8NlQGYdi2t/zh0AIkdqn9ihJy51NTBDO6ajqlamoERM+F+eFHW1bXjydy/sACgi
 Jq5JlJzipWNm+1DHBii/wLbSmHHzJada4HjNWeOcuI+C/SmSOA7k+Z255OUNqwHWQIH9
 q+fIMmiFrcrV5mmYeOLVvyiuQlGA1gp0QggfyO6gIVcgCFxjl1UOFcuGL1/UcJHIzKxC
 3ldLGTPX6BLorJZt6WxIPEsc73io4VQWCkEc/cOU8RX7hwzlsygy6LZYNgVsJZV9Myay
 5PnMjxG7YzwNWDfxS8DIu6g8JlqX75v+k36YKGlUpPdeyW/ZbcijsRdjRq3r8A1ILqhH
 Fi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28wKYrw+PB2qf7MYtlXfMbxVM/QPzyO1QbIheEBhZzs=;
 b=VVQhEeEigXneEbfSli6/tV7ZyXvqKnFd30rjk8sg/ncQIvJHAwHrNZZVSSzdpzPUNm
 evHZuhztVEnbc6pY8vs4CHQUuQ7z4JxFITn8WJ3h0cXAOp6jHVVvO032i3DmrJRwAJY/
 E+Di7IO5gplZDeRFuXgNoIxy2e68KUnvy2DO4pEmElYHP94yjpVRnOiPFS8wSgury9Iv
 6dz4QOuOsSJ/Ftxc5pA6fUhTUr3g59kf8RKLmKAwjs92s70bvVNvf47jlHISIQhBsoJB
 JlFl4KDgVRyTNsj8/GCgNsZzzzORY3M2ZEcVPPAc4AqGdDkQc8LkVo2xKI1KPHdpgbOR
 vS8w==
X-Gm-Message-State: APjAAAWeCL0liFAZU0SpziVMo3c4TuAgtq/W8naryMK83J0nFA2INJ1B
 lkg4rn6gqH0BQOenIFLqTMeXwnDPuhCF58BS7z9ZYA==
X-Google-Smtp-Source: APXvYqwQLByyjD12AT6+xad0gBxGmCu5xe4pZMlr+WB2NfoqGotwRpEM6RL0fshKLBz/E4nwHa5eab/UsLWXbXpG628=
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr26137056otr.232.1564396460365; 
 Mon, 29 Jul 2019 03:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190726232731.28572-1-palmer@sifive.com>
In-Reply-To: <20190726232731.28572-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 11:34:09 +0100
Message-ID: <CAFEAcA_S8+D4iaPRTo1Z2aUt8xpg=W-3bte5vBg78R4AgfxW1w@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patch for 4.1-rc3
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
X-List-Received-Date: Mon, 29 Jul 2019 10:34:23 -0000

On Sat, 27 Jul 2019 at 00:27, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit bf8b024372bf8abf5a9f40bfa65eeefad23ff988:
>
>   Update version for v4.1.0-rc2 release (2019-07-23 18:28:08 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-rc3
>
> for you to fetch changes up to 75ea2529cf09aa4630c5357f9814f04b6697e8b7:
>
>   riscv/boot: Fixup the RISC-V firmware warning (2019-07-26 16:03:48 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patch for 4.1-rc3
>
> This contains a single patch that fixes the warning introduced as part
> of the OpenSBI integration.
>
> ----------------------------------------------------------------
> Alistair Francis (1):
>       riscv/boot: Fixup the RISC-V firmware warning
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

