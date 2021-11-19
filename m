Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3gG-0001YQ-Ac
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 08:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3g6-0001Um-Qj; Fri, 19 Nov 2021 08:11:44 -0500
Received: from [2607:f8b0:4864:20::d33] (port=38787
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3g4-00069K-Ka; Fri, 19 Nov 2021 08:11:42 -0500
Received: by mail-io1-xd33.google.com with SMTP id z18so12676046iof.5;
 Fri, 19 Nov 2021 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yXhdhHUxMcjL9dVK7BTbnaul5VBhQTmwzP2QU2bc8EA=;
 b=IZqKQCQUWoUeDqNJ0caruFtSXUFAbB+i/FqEW0GQ9CBQttJ0KWEijCFSaMCqxQQtIe
 WlyE6c8mFMk3c/uqCurB7cIf7miB14rCQuykL4AouCwioTnHIZGqmghFuXPm6L5sxVFE
 pOoO4kDgv/FQcRVOlThKMXVWjNTi9V/R+EhzXfafGTr6KginCbbs5vP7dpgx7L7zlTVk
 vsZVQihMH3K6j0oC1PLx1Vw2VqQVKaD459nHOW60kasVYFPQk9iJ8vwOH0PQJxcvSOpW
 MaqByJQfVgTOUyP6jkcv0j0fPuMsmKWFFEzKPNkXxvWaGTuonzXifaeaSuNzuxKT0C4U
 kQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXhdhHUxMcjL9dVK7BTbnaul5VBhQTmwzP2QU2bc8EA=;
 b=t0Yg7bcFkjf1AGb/6u4fVaSzbEaD5xqTCLXWFQO5kRgmQEI3AsTRMz099xDAXlqr8Z
 2jKSrVN6LuHpfXX8K3u1wa3OL/5RaHNJI497s7Pt5DF1juMJxLlpemlVhnZr56yprUsH
 Qa3esVgJtvv7ozL+hPvE6mto0MHq7CLSKDLWKgVSl1BQW9Aw5YeYHuJHMk6mMB02iFl6
 5NLSbH+nnPQlGughcEgWJ/Ze1ftjctJaWDHdpoJ+s2SEv/qRJUU8pypCq+u5dGK7w2ye
 JDXyFaOgA562eDcq2ifIgblIHlhIA5ibTqWinp6nPNIg/KD5ZtyuYVyRLsfjZSMzPgku
 V0zg==
X-Gm-Message-State: AOAM530981N8RqB2x20nzWrtdh9dTNh378l+rPRzyUoNk9WMG/BJScNB
 E/+cKoVXi/EsItiHqBEOJ/wg2AWfjT05ND+FfqY=
X-Google-Smtp-Source: ABdhPJwRD9BQHZ9t+oBAnkggaaYrdXWl9y8ncTG3b35eYbr7DdIZQypHvEUxS3bNyM31jqBpHw9K/VZzCr1RflVqVzk=
X-Received: by 2002:a05:6602:204e:: with SMTP id
 z14mr5357891iod.90.1637327499183; 
 Fri, 19 Nov 2021 05:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20211119102549.217755-1-thuth@redhat.com>
In-Reply-To: <20211119102549.217755-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 23:11:12 +1000
Message-ID: <CAKmqyKN99Yag2OyJfXzJD_tbiAPfWER=BmXP-taM298kAqLxUA@mail.gmail.com>
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 13:11:46 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

