Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoRRE-0006uJ-Dz
	for mharc-qemu-riscv@gnu.org; Fri, 19 Jul 2019 07:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42813)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hoRRC-0006tv-4I
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 07:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hoRRB-0005tr-2M
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 07:52:34 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:36972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hoRRA-0005sW-T8
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 07:52:33 -0400
Received: by mail-oi1-x22c.google.com with SMTP id t76so24081478oih.4
 for <qemu-riscv@nongnu.org>; Fri, 19 Jul 2019 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o5oCCfZrt6E6bO9/Ub2USoUcchi6gyvx8eQLK2EhB1w=;
 b=hoV9zD1US0p4DjRaeQ0ZyVxR7CMscjuH4IT45GMAvFjGlfrH/zM8U54hQ7XmQKc4x0
 eiKILp3V1Vt7vHdlQNNd15M8Q42m//d9ePEjCGSe9u3m6YYR7HnGjCNBgbHtF65RH7Jy
 TWdxCwb/kVzDRlsqBkJKdSyCI1LiT1vYZV/ICX4gC/4iRCM9377AavQnpkmrR7Zy0ZVF
 uHQmARBdQeZwCaHX6Ooo50+kseM+ueO5Zcm517RiZae3mY7hRhRjDPFSkPlnfEdJa6j6
 EaugxPI34eN27BTXVlF8vXxkn/ENtyRO4fD5Uqplm8jdV3tkK2MNUBVlCJfnZO+RGmGa
 cGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o5oCCfZrt6E6bO9/Ub2USoUcchi6gyvx8eQLK2EhB1w=;
 b=GGE/NZE8q1MWrLLfxgNaHCfO0/6mBrHxTng/2DAGFf5BvPZ39WQK4ryehndOz5mcil
 DE7u6bmQAuSz6Onirlf6GMfXP3hvH9r222jevz3+XRaIHUQxxyTbRK0JyH74BlVGMDXH
 SGPUuYkF2Qkfomq5nJ3tDx52Lt3DJ9Etz13WyPWm0igLtPo/HkmEGhZ3X60fsKgqjcuA
 fi78c020JwIz++BXTnJUyKN/TU9rJH4rnPPIdz50Hz3rfPkirwUl5k//0w/4A96m4XbS
 G2qUvb/TtzBmwQB+7801ExljPKE1o3BDHeR7XdrcqGeVJVXjLQm0+tw45AJS2hFXK1j5
 bnLg==
X-Gm-Message-State: APjAAAXBQZ2pvwvpPhq1BnErS+6Y/6TxgGPenDYKk5RUf3Sb6N27GIVy
 op4UDNiYm1Jae4wemCMdniZ/j6w/AvGPBpcI6NaV3A==
X-Google-Smtp-Source: APXvYqyWKV+5bz28TO4uOqRtf4ZPw0vY6qwV1EjE88O3D8gvPmPA6bYKBB6Vu8kIaYMCwfixkYTHaVXMZr16gMcMdcg=
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr5926754oic.170.1563537151899; 
 Fri, 19 Jul 2019 04:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190719015811.14776-1-palmer@sifive.com>
 <CAFEAcA_MGz=EvH67twNoM-SMXZ8_pE6FhO+JuLN=0Z1H6sfRnw@mail.gmail.com>
 <CAFEAcA9mR5XxV9ghSzt4PbANKZJW1xKMGF1a9+ak+m6OyZ-YZQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9mR5XxV9ghSzt4PbANKZJW1xKMGF1a9+ak+m6OyZ-YZQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jul 2019 12:52:21 +0100
Message-ID: <CAFEAcA_tJk1q1A=niWojabO2Dy6vAuiHSDDhw19wT9GXHXBikQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair23@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22c
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for 4.2-rc2
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
X-List-Received-Date: Fri, 19 Jul 2019 11:52:35 -0000

On Fri, 19 Jul 2019 at 12:11, Peter Maydell <peter.maydell@linaro.org> wrote>
> Since this pullreq does pass the tests, and rc2 is not far off
> now (Tuesday), I think my suggestion is that I'll apply this
> as-is, and we should fix up the issues with the warning messages
> as a followup patch. I think that's better than holding this
> out of master and making it risk missing rc2.

...and so I have applied it to master.
Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes, and please also submit a patch to
fix up the warning issues.

thanks
-- PMM

