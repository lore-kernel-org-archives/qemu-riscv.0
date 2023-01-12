Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFu9c-00072o-EA
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 04:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFu9Z-00071l-9t; Thu, 12 Jan 2023 04:45:45 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFu9U-0001q1-AS; Thu, 12 Jan 2023 04:45:42 -0500
Received: by mail-vs1-xe30.google.com with SMTP id q125so6745412vsb.0;
 Thu, 12 Jan 2023 01:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D493d/lf6395odeXd8Z4oL1EMywgeerAnKb+g0+vV6o=;
 b=IXTySs+I667/BCAfEagoFk8CIQ3C58N6R7Eps/58s250J1tjBnfLLs84YkBS0VjA+R
 JDeT0Mx01p44HyGlZ4zL+qYbc27I25D4HlNIE8F6m6qzj7ZCEIdYW5BzKyuhW1P0QwkY
 0rD0GyeUUXefRMOqvekBK7wvNMebYI7gz/gIQlLutJIBb9Qrgu1vpFhMRoBBsyu+Z7+g
 1OCmdUmiaIyFt045dMbDo+KxlXeVGpr/+u5teJxgfmo68t5h0XT/z/16PSRkwbpprwZN
 B8kodySe8y/2dlLbpNaEPhKrRkdZ3gi77ktk9QGVK7W6Dj7oezpSEB446MX6IXoBzT7O
 RqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D493d/lf6395odeXd8Z4oL1EMywgeerAnKb+g0+vV6o=;
 b=BkzaXZhFqwM6AU/LjUFKJuygFa+EzO0Z0HL4ym1w6hoU+Q0svNgJ/HCak7D/ToBpRr
 MNv9Rm8aZf45/esa0IVQHeUIqBFfiYaDmh1jDpV/yaVsqVhVxE0HTpdlZYrr6wt8agBO
 2nHKWYhhUewziRBGPGXrj6vByMmLD59R4+cUlhgFWkCSiAjNLY2H4JsdNcN2mhnt0ct9
 k/OR8liKtVT4GlZVbrKeevHGO4iBfwYjaCBmR+qSSbMV9loI56EdR5zSz0gmxI/xebKE
 Y2oanaSEPUXUMuTfE/9OcQdW/za9KB6EVfZxfSoawI+fdnEc9F62sOlxUCsBHnFb7MkL
 fIqQ==
X-Gm-Message-State: AFqh2krhO7wVp8REoDPeAvwmPBypUbLdauJOfOgza81uXyfUogYnBw7w
 /kYT1SwocyCsfOAr6yp/gOuplZYE5IiIPnsAiuU=
X-Google-Smtp-Source: AMrXdXtp3UeFMDQWnj5sxRdluQeDfh9v9fi5qL7RDm702fYjW+wyZ8s98mhW/cwmLh99hlQrAtiuZD1GlyGUghKKuaQ=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr10025864vsb.10.1673516738156; Thu, 12
 Jan 2023 01:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20230112083921.887828-1-thuth@redhat.com>
In-Reply-To: <20230112083921.887828-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Jan 2023 19:45:11 +1000
Message-ID: <CAKmqyKNAREWgeNXEHyPqT8jthXEKK7v7H2vXYS_FSLOZy4_-7w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc/sifive_u_otp: Remove the deprecated OTP config
 with '-drive if=none'
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 09:45:46 -0000

On Thu, Jan 12, 2023 at 6:40 PM Thomas Huth <thuth@redhat.com> wrote:
>
> '-drive if=none' is meant for configuring back-end devices only, so this
> got marked as deprecated in QEMU 6.2. Users should now only use the new
> way with '-drive if=pflash' instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/about/deprecated.rst       | 6 ------
>  docs/about/removed-features.rst | 7 +++++++
>  hw/misc/sifive_u_otp.c          | 7 -------
>  3 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 68d29642d7..bfe8148490 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -87,12 +87,6 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
>  However, short-form booleans are deprecated and full explicit ``arg_name=on``
>  form is preferred.
>
> -``-drive if=none`` for the sifive_u OTP device (since 6.2)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Using ``-drive if=none`` to configure the OTP device of the sifive_u
> -RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
> -
>  ``-no-hpet`` (since 8.0)
>  ''''''''''''''''''''''''
>
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index c918cabd1a..6bd0a2b4e4 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -422,6 +422,13 @@ the value is hexadecimal.  That is, '0x20M' should be written either as
>  ``tty`` and ``parport`` used to be aliases for ``serial`` and ``parallel``
>  respectively. The actual backend names should be used instead.
>
> +``-drive if=none`` for the sifive_u OTP device (removed in 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Use ``-drive if=pflash`` to configure the OTP device of the sifive_u
> +RISC-V machine instead.
> +
> +
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
>
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 6d7fdb040a..8965f5c22a 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -210,13 +210,6 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>
>      dinfo = drive_get(IF_PFLASH, 0, 0);
> -    if (!dinfo) {
> -        dinfo = drive_get(IF_NONE, 0, 0);
> -        if (dinfo) {
> -            warn_report("using \"-drive if=none\" for the OTP is deprecated, "
> -                        "use \"-drive if=pflash\" instead.");
> -        }
> -    }
>      if (dinfo) {
>          int ret;
>          uint64_t perm;
> --
> 2.31.1
>
>

