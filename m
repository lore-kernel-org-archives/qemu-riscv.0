Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kvhHe-0008HO-TK
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jan 2021 08:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhHd-0008H1-IP
 for qemu-riscv@nongnu.org; Sat, 02 Jan 2021 08:49:29 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhHb-0002kJ-PX
 for qemu-riscv@nongnu.org; Sat, 02 Jan 2021 08:49:29 -0500
Received: by mail-ed1-x533.google.com with SMTP id h16so22184558edt.7
 for <qemu-riscv@nongnu.org>; Sat, 02 Jan 2021 05:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXYsc3V9gdGdBav4QnbscS2SJSHtSd4TDJY0y3f2tfc=;
 b=ZvuxcmAZTKWnkDaKqQQseGe2AJumUaFKvVP0ERiBMwvvL3gUhfZmc+g/A02OwHC31s
 BJDpOpekQXEZLFZAGgQwZYT9PjdZr3uW1IhZK+iKp3183r2d01mE7XPM8OmeNQV/sQhZ
 re2451OTMv9EzTzLL2wXPJgi6PJjiMqiqvACHGlD15GtJD0ofDlh08h8mQvOCZSS3zYY
 WwuzPwm/g6A8Kuubwm8PD9dWQ5VOqbab0p+jfuMfrVAJV2ceMs4utq30WmlbdtA2TQV2
 IYbUfWGNM4E4CU8CevlJVr4RxhbtNDAoXqUapKgYWgA2cKmILYCuEsL3RxQi72VUZj7S
 qWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXYsc3V9gdGdBav4QnbscS2SJSHtSd4TDJY0y3f2tfc=;
 b=Y1OO/LF6xSo8vcDg/R5jJAC8ggYdJluxQzsBTkmZnA2DAdvdfI9H+ENuxQL0XdSFsB
 a1VIhL4G6Yy1LZIHHncJT6FVN7uyRuZc2BDhn/TKjU9UxG2tIojGPr+v/O29O3EKCRbI
 gr0meNNKPTiryjwQJ7QS2C4BVj5YDvJ7p2eE/v4yvwmDmIwvnfBszq6yUoq4teUG397C
 eObyTn1qmgx9f956uvGsjqJMKVl+sOL+DM+9Ide3iZzuFy92EvvcmUYHLSHVloGBYYJx
 feENQ/JPbkmbiyH/wlsB5/sAQxA5aTyNP3kVx6qTFgEer0D3g098e+ZTGXhM2WUzJXoD
 +WTg==
X-Gm-Message-State: AOAM533GhGbDohztwfEfOaWGXF+ucJl9Emy6rn5kSw7/mxUfvFhSAseL
 /ceHMozbBE6LL/Pg4cT+08MrxzkpSwf25p+F8+D+1g==
X-Google-Smtp-Source: ABdhPJyGKnwTN8YFjGj1Qo16OvsmVtDez0ihFTHRXkYLqTCI5mW+119HBeyndwnn7IaVygfGbWiLjRtFR9qCuMNR0zY=
X-Received: by 2002:a50:fe0e:: with SMTP id f14mr64414601edt.159.1609595366226; 
 Sat, 02 Jan 2021 05:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-4-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-4-bmeng.cn@gmail.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Sat, 2 Jan 2021 19:19:13 +0530
Message-ID: <CAN8ut8+z=qJtzACufKcRBoAp-LH4+nKBwaYuGJxOJ-3Mushtzw@mail.gmail.com>
Subject: Re: [PATCH 03/22] hw/sd: ssi-sd: Fix incorrect card response sequence
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=pragnesh.patel@sifive.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 02 Jan 2021 13:49:29 -0000

On Thu, Dec 31, 2020 at 5:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per the "Physical Layer Specification Version 8.00" chapter 7.5.1,
> "Command/Response", there is a minimum 8 clock cycles (Ncr) before
> the card response shows up on the data out line. However current
> implementation jumps directly to the sending response state after
> all 6 bytes command is received, which is a spec violation.
>
> Add a new state PREP_RESP in the ssi-sd state machine to handle it.
>
> Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/sd/ssi-sd.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>

