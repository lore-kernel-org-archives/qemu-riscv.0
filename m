Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgS5f-0002py-FA
	for mharc-qemu-riscv@gnu.org; Tue, 11 May 2021 09:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lgS5e-0002pm-2b; Tue, 11 May 2021 09:06:22 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lgS5b-0004Sg-Hc; Tue, 11 May 2021 09:06:21 -0400
Received: by mail-yb1-xb29.google.com with SMTP id s37so1703446ybi.6;
 Tue, 11 May 2021 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EZngYV9stFe3OHnNnsjqCw+QkdCUpg/+5rmM+vOq++0=;
 b=YGP141y0jIrLNxkdAXmZCoMoEpuNFFiAGqsUnk2Ah2EOonO4H0V18cjWY5Ffj4Du6U
 uQ8KPam51tzVePrifWwsb/Q4GGQa4xkpPD2YKDiDO6k6jW8wgmQdT6dwarCf807xbbz5
 +fPlWMolvArMv2+W5Gx/DDjlQGjHHBvU4DUo8ctC+P6JtXeBBqCP10Vy3gYDDJD5fgzG
 783jRkT2nIMVMa0FTJp0qhrvlaJi7uYvS6Bjx/65vH6dcQbtdT3hfI/qjXaJkMW4AeWb
 ecHvqFaTxiMWxFdv2azTLj+qIgtZodKKPMvLXAPiXPlqOFRkO2hpmb2XoKS1XsUbOyj2
 URKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EZngYV9stFe3OHnNnsjqCw+QkdCUpg/+5rmM+vOq++0=;
 b=BY6m8Scas5meTRWGDxaV2fyQfDCeuttHPfIQqhqVcGkz//usfuPfk+/T1tWixq9bZl
 GikIwPIOVFZtQhrhIPEJKNhHc7nNdszivY/KreB1EIAZp/22pn27QESDp24hxy/abLIi
 KzRSNiwSRyld8oRYkIyJV84e+4SFKsN4ndsTt4jIjklBG+SWZ5b0E4GWURFF4M4Rl9di
 EUoPjePNDSLqR1mQmtIPZDeVQxUao4VQXN9LhkbWGwR7Rku5EmjB42yy4m83CT9gvNQ5
 BvLhM4cXOfpQyjk8lbUNJHUjnEWUVFDrcpjoUgFhq2T4WqZdUYRwLOdyWrktEF87PFJm
 smzA==
X-Gm-Message-State: AOAM531D2wFYexTpi4jtnR8dTr+Gt3PCG/BXevPL4X2c38PirWhfTxrk
 EcFRl6DGgaVJvVlSvmxqYAOfP46RMIGL1XojEIg=
X-Google-Smtp-Source: ABdhPJw8D1XnehRAPjlJfl5mIQtNfZr1iigitddEPQxbVHfL7zDlKAfgm5SXhTKwypue6ZDR6M72mwjXWWf5Yul4/0I=
X-Received: by 2002:a25:be09:: with SMTP id h9mr42839805ybk.239.1620738377640; 
 Tue, 11 May 2021 06:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210504153456.927083-1-lukas.juenger@greensocs.com>
 <20210504153456.927083-2-lukas.juenger@greensocs.com>
In-Reply-To: <20210504153456.927083-2-lukas.juenger@greensocs.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 May 2021 21:06:06 +0800
Message-ID: <CAEUhbmWCwyyj1jAnqeadoLCcJcrzP5agr_r7tzR5qBBm052VcQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Consistent function names for sifive uart read and
 write function
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, mark.burton@greensocs.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 11 May 2021 13:06:22 -0000

Hi Lukas,

On Wed, May 5, 2021 at 12:49 AM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>

While we are here, could we make other functions sifive_ prefixed?

Also the commit title should include a tag of "hw/char: sifive_uart"

> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  hw/char/sifive_uart.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>

Regards,
Bin

