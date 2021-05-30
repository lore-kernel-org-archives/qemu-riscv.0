Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnMp5-0000yZ-0l
	for mharc-qemu-riscv@gnu.org; Sun, 30 May 2021 10:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnMp3-0000ww-Oj
 for qemu-riscv@nongnu.org; Sun, 30 May 2021 10:53:49 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnMp1-0000RM-SC
 for qemu-riscv@nongnu.org; Sun, 30 May 2021 10:53:49 -0400
Received: by mail-ej1-x635.google.com with SMTP id l3so12681267ejc.4
 for <qemu-riscv@nongnu.org>; Sun, 30 May 2021 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7q/3BEsknokajuOcZiljekZpeLW+A1eF+ACJkfb9MlQ=;
 b=Ri7Cl4romDV6EkdaWlRo5PMNt7Ar6KcxdsPfAT/XR5fylhYX7XTfc7f58y2FxP9IwJ
 ACfS46BaorePknrCr/5dRShCTuMl0jUL9YcRTFVnGUarQBlkQil1HcVuHKtQWiHNxk6j
 HYgMTbOpertt1mS1qZ1GDCcJEKBL1t20bC+5WLNbLZ3sfkbeN0HAFfJcBpm3hC5QAm/P
 J0EJCs8671tiQeKP+azV0G3JM/DVvpLgOITeRHl/z3LiGg/BetgAL65vOqKS5PcbIl5v
 8SMN5BtPFijTfdqaEg8j8ELHREEbourzeRwU9mMExGSroyVNXntGdEZXQJLhU8H+43Wc
 y1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7q/3BEsknokajuOcZiljekZpeLW+A1eF+ACJkfb9MlQ=;
 b=BcwGCeKbS35FeNTK4tgchCjk1sUNWadGNV0g/EDvSESskBTfyh1BbpW1eESsDRxqU+
 JZbF+8touEnoR4R6YDKCmPIpDWIn5sTPBqjBbN6GotOR1PSA2pZE7mBrGLTJ/WF7rf6P
 V9e88NvJZgNV36e266BRcwdI/sqssbwlPX8r6iNA/2/JHN3dA1QYWjxrjCdVxvjaxXk1
 uMZ7YjFI4Kd7VsGYPgbjHq+bUeT7AnoO5BbgDtYvPO+gbKj+AHJ1aMAT7A/Boqz5YFmh
 uJo+xV/JLqnU4p1dfDUA6vy8Wth3Vks3kP5XRcObJFxoLrJW08JyfrgpOh85yTsk/Dlm
 OP0Q==
X-Gm-Message-State: AOAM532csl1lf1roIkOTB7a+UO6X11mQbmpx9k1YyO/6f+W44PVX99GP
 aZylMzOW/U/B6GH0pJ/XiyCVxvKDkVCVby7KU938FQ==
X-Google-Smtp-Source: ABdhPJwhX6U2CGJh8FJvUhSUb1tCdLTEOLoBhhhNGsZDw1TTH+h9Y1uYjAuK318Ryt57IJ/o+nmSx2KUTPb+tMrijTY=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr18551022ejb.56.1622386425131; 
 Sun, 30 May 2021 07:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210530104922.466175-1-lukas.juenger@greensocs.com>
 <20210530104922.466175-3-lukas.juenger@greensocs.com>
In-Reply-To: <20210530104922.466175-3-lukas.juenger@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 15:53:16 +0100
Message-ID: <CAFEAcA9Vy7B8SNo4MLB1CKxeuYNjS=GG5XdCqM4S-NFfikvbvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Mark Burton <mark.burton@greensocs.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 30 May 2021 14:53:50 -0000

On Sun, 30 May 2021 at 11:55, Lukas J=C3=BCnger <lukas.juenger@greensocs.co=
m> wrote:
>
> QOMify sifive_uart model
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  include/hw/char/sifive_uart.h |  6 +--
>  hw/char/sifive_uart.c         | 72 ++++++++++++++++++++++++++++++-----
>  2 files changed, 65 insertions(+), 13 deletions(-)


> +static void sifive_uart_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D sifive_uart_realize;
> +    device_class_set_props(dc, sifive_uart_properties);
> +}
> +
> +static const TypeInfo sifive_uart_info =3D {
> +    .name          =3D TYPE_SIFIVE_UART,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(SiFiveUARTState),
> +    .instance_init =3D sifive_uart_init,
> +    .class_init    =3D sifive_uart_class_init,
> +};
> +
> +static void sifive_uart_register_types(void)
> +{
> +    type_register_static(&sifive_uart_info);
> +}
> +
> +type_init(sifive_uart_register_types)

All new QOM devices must implement migration. This is
a baseline requirement so that we always ratchet upwards.
It holds even if not all other devices in the machine
model support migration -- that way we can gradually move
towards actually supporting migration.

You're also missing an implementation of the reset method.

thanks
-- PMM

