Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDl7o-0006Rn-MW
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 03:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40333)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl7l-0006Nn-Mp
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 03:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl7k-0000wt-P1
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 03:57:09 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:38988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iDl7i-0000tN-OD; Fri, 27 Sep 2019 03:57:06 -0400
Received: by mail-yw1-xc41.google.com with SMTP id n11so608581ywn.6;
 Fri, 27 Sep 2019 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XvNlffDIBXRZ3eFiksPvktc1aFre30nAocuB8LHpKWA=;
 b=Y1tNp8fKJfEyN31Bj+hBREYFeB0y9kXd9KmHApYDPkZyYeA896+LuiSTFJbnIQmzZZ
 8e//b402y/gFRIJPOvEvpj9Pv7RYiciGMslfk01K0y+X5pSO44z1CMnxQBSE4doONVaN
 u8dfCTPeNKU5rihEnnOCEwBxH1rRwgeJpF/XIKZ7a0mq+mPEhEmYxpHpPm1P5wDzJVBY
 ynD4YaKfWm3V9C8RRgtOMtkcYEsSy+MIF9nchqVl1ePzghAex8f1lEHGHD+W7DDG3981
 66NBSbAVZYY8uZmdRN4DAzedYf+KLHULAPImaURXrcgbG8jV6pFTMVut84KBI/SlBDzB
 P/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XvNlffDIBXRZ3eFiksPvktc1aFre30nAocuB8LHpKWA=;
 b=KXHQI4cu1JsejYzDgHTn6cy8KcCIvMVsmGOewuWTOs6aO4MzLzNBWety43iBCjiAiP
 I8RKbDYXzBUs+rcHVUhPG1HfZ7PMo7DqYyrCy0PBd1eVD1X1PYBO9iMKq3/KNozLTmOb
 ghwzsC1081VJ5NtCve0iCXhgQ0bUeGKW2eUBHE0rYFz6sa9vxWByY1oGa/dB8wVdVHyb
 sHr7rerRuNQBi29b4y+IKsNNsKWhrHkiboEQ8Bumc8em45WTLyXtGH6yi3PpQaK7D4sX
 d1lcdWbdCOd/q4kl3NdJv6t3Uofdvuhe8fauFhhj/PDGYn0D15TqBILyovYnUKbpzjNH
 RWFw==
X-Gm-Message-State: APjAAAUbJHY4Zp8UcQVGu0HLAMZ8YvCpQTng2KQeA43lXeWTNDrONSXt
 cRgEf8EeQIpqS1tT3NVCUAJHtp33Vd95XFyBRew=
X-Google-Smtp-Source: APXvYqw/VW61dAZ8zrrsxBzB+UqkM/H32dU5RKdsyKf1DIUga7OHxO9rbDV/qr2cXF9kOEyFXqvTqqWcbK/vSt+E8Mc=
X-Received: by 2002:a81:48c3:: with SMTP id v186mr1754043ywa.140.1569571026306; 
 Fri, 27 Sep 2019 00:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569545046.git.alistair.francis@wdc.com>
 <427130d2510a6c3dd7a4266bd586b15ecefba103.1569545046.git.alistair.francis@wdc.com>
In-Reply-To: <427130d2510a6c3dd7a4266bd586b15ecefba103.1569545046.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 27 Sep 2019 15:56:54 +0800
Message-ID: <CAEUhbmVo-+=bEH75TTpL-PxwF+NJT6Q=fc6sGxn+OZOq=Qyjvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] riscv/sifive_u: Add QSPI memory region
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
X-List-Received-Date: Fri, 27 Sep 2019 07:57:11 -0000

On Fri, Sep 27, 2019 at 8:51 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The HiFive Unleashed uses is25wp256 SPI NOR flash. There is currently no
> model of this in QEMU, so to allow boot firmware developers to use QEMU
> to target the Unleashed let's add a chunk of memory to represent the QSPI0
> memory mapped flash. This can be targeted using QEMU's -device loader
> command line option.
>
> In the future we can look at adding a model for the is25wp256 flash.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c         | 8 ++++++++
>  include/hw/riscv/sifive_u.h | 1 +
>  2 files changed, 9 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

