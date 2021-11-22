Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1moxSV-0008Ht-Oq
	for mharc-qemu-riscv@gnu.org; Sun, 21 Nov 2021 19:45:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1moxSS-0008GC-D6; Sun, 21 Nov 2021 19:45:20 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=38469
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1moxSQ-0000Pd-Dy; Sun, 21 Nov 2021 19:45:20 -0500
Received: by mail-io1-xd2a.google.com with SMTP id z18so21088037iof.5;
 Sun, 21 Nov 2021 16:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0CF4Uwb5tnWyuxk0XR0uj+OOZJpjPy4U7vtbtufUiFY=;
 b=B7Iqlr5sKcNIowf0OApkN9ECwCicZsoK1859F+TZqjtTkEYWnzLsgkL2TY++jvEx3o
 Xx94QOhNCKbAdCOE6GyfnL3jjFi85jzxIDmSDBXvj8h8WVxfmjYduXPXQuynqSLKvUYl
 6SaSF3BYPiQkxbBECXqQDXRrn+vu+sXYRo9XwRAdQzQxrTCwNLRHnwppsA46dX1gXSN9
 hhYtpPbhlN7Tr/9JLwTM4Zge7WT4w8vdEvlYS27RWggkfJ9F4OdGao84zO5sEeRgoL0D
 zPcmG8+9yGzJswzLOTdLy49qzF1UVoR2wJsTzrkC6JUrmTqV8LGEu01C4MnqJqr6ULW3
 JoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0CF4Uwb5tnWyuxk0XR0uj+OOZJpjPy4U7vtbtufUiFY=;
 b=29SCgCa2Nf+QGPTEx5vlIOuZZQ/RJC3lTpX7S3zn72ekA194IImbUXJBfVBwIu35MH
 9V5n4nPFD4UEioju0uU0Qv2LIRmdqmK3bFRv1HxoJ9wlTcWdqK7vEZMyHoGsktmeH4Ky
 V1+RbfNDTTKiksfTLJMsG9rcvK22GuZCC44s2ANss/vBSKoP8gD6wO2zxV/huFBxgJOJ
 22dh7Mn2Xmc9QMYP6pxB0GKoNZFFWLuadzrKne2Eb7i551f1YxpSuDAsXCxFJG+IK6Yf
 oS7E/fsq0H1Jt7FsVCUL+Z4CNcW+F36bDTwoqbgZk1KtLCmdgFFqmB9q7HVm6WHW7hVA
 xepA==
X-Gm-Message-State: AOAM531lmY4cT6N04u28wE013pR7ucq0pT0HI1xcYRzxucRQUvnUE6MP
 IoCfxN+3QK7bHkOV/MNxV49NZdvuSDWvJS3fys8=
X-Google-Smtp-Source: ABdhPJwVXd/W8JSsN6BROV2ASUIZvirZ9XzcEdx5qq/352E3fLQ457jA8wQuTRxhjXBdJ/iF3nLwhvAmqQCtc8fP51Y=
X-Received: by 2002:a02:9f0c:: with SMTP id z12mr44343097jal.117.1637541915435; 
 Sun, 21 Nov 2021 16:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20211119102549.217755-1-thuth@redhat.com>
In-Reply-To: <20211119102549.217755-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Nov 2021 10:44:49 +1000
Message-ID: <CAKmqyKN6-C8M-mXwrkhSaNioW3LXpM5rkixnpDZy+gUyFQeEiA@mail.gmail.com>
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Nov 2021 00:45:21 -0000

On Fri, Nov 19, 2021 at 8:27 PM Thomas Huth <thuth@redhat.com> wrote:
>
> Configuring a drive with "if=none" is meant for creation of a backend
> only, it should not get automatically assigned to a device frontend.
> Use "if=pflash" for the One-Time-Programmable device instead (like
> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
>
> Since the old way of configuring the device has already been published
> with the previous QEMU versions, we cannot remove this immediately, but
> have to deprecate it and support it for at least two more releases.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  docs/about/deprecated.rst | 6 ++++++
>  hw/misc/sifive_u_otp.c    | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index c03fcf951f..ff7488cb63 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -192,6 +192,12 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
>  However, short-form booleans are deprecated and full explicit ``arg_name=on``
>  form is preferred.
>
> +``-drive if=none`` for the sifive_u OTP device (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Using ``-drive if=none`` to configure the OTP device of the sifive_u
> +RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
> +
>
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 18aa0bd55d..cf6098ff2c 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
>                            TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>
> -    dinfo = drive_get_next(IF_NONE);
> +    dinfo = drive_get_next(IF_PFLASH);
> +    if (!dinfo) {
> +        dinfo = drive_get_next(IF_NONE);
> +        if (dinfo) {
> +            warn_report("using \"-drive if=none\" for the OTP is deprecated, "
> +                        "use \"-drive if=pflash\" instead.");
> +        }
> +    }
>      if (dinfo) {
>          int ret;
>          uint64_t perm;
> --
> 2.27.0
>
>

