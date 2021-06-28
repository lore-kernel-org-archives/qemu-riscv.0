Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxf1p-0003Kl-Ap
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 20:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lxf1n-0003KS-7f; Sun, 27 Jun 2021 20:21:31 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lxf1l-0007lO-Jq; Sun, 27 Jun 2021 20:21:30 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b15so1852859iow.4;
 Sun, 27 Jun 2021 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VAg84RvaumaoTIpLVOIfd5jzu4AbmRH4+5tldUyY1Ow=;
 b=enWVUmsnBRB/UiljqkEYR2cwOg7kW66qUsp61s89pAqt8NxRuBzzRWdsrm8zdwbvZH
 2uUOJyto8JUqIJnoF96lZ+jdEWLSUhlt9+b5PXKwX8FqoAWk90tjSX4/m5GBGlk/ZjD3
 +TAucYpHFwbfaMD7rJzbRTJD66IRaqz+xoXkSPP6Kmy6XIjDk7/NJa5hyMegLciDquui
 9T4G3G5G6JC/FdWa3+QGBW0PN4yu9kEf4Q7KeoaS3MjxvnPjnMWk8OgpzsgkAyyH8N8H
 X63V+wy+Pgy4iJJeyOkJ0f4u1uS6RltTPpwzxIjDFFQdCmhm/gifiUdESi0CA5tMwCTQ
 eMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VAg84RvaumaoTIpLVOIfd5jzu4AbmRH4+5tldUyY1Ow=;
 b=YYVl4IkfGBdaWwWZQwylCEo2vJUX7ajIfdy5i5RvrE8WYQuCuzwAcSuLYDji5WvrEA
 K23KKelk5Rt7vIfvOts1UPZAri/QoH21e7iH59/G7wLUTsIBZ0hSP98TkOxr0jXAV6h7
 8rw+QqJjIsrhAh3PSEvULN659eT09GmtMmm4kmSCi6sjuzlseN2g8OpXR1+VzdH4Pb+M
 rZpiHr48w8rm7n5xhBWGdIb2593/PqqsGt1dCbixRa+2vrDnMBXbGO+9mGZwKa6hFW46
 BZbw6VCJau5Xq3MtjZ3+626ggFkjO7hYZ/ENyyUIHcAnbQLhJs5tRT23A3WAd5TjnLc9
 YojQ==
X-Gm-Message-State: AOAM530Py2kIByvxiMUwJ58PNGm613T98iq70nXXDwWxyjwrnhy3bonM
 jRUZTx3LeJQH5Vt9U797AKQtlrYVKMo2i0PFgL0=
X-Google-Smtp-Source: ABdhPJxGpvqmFGUcc4xmolNgm6z5EzgSN11NAPKorY+aTOSzyfv67tB5huuucmxsposdiUCXFoOeWqPt/xi4xn3j750=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr18702077iov.42.1624839687167; 
 Sun, 27 Jun 2021 17:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210627142816.19789-1-bmeng.cn@gmail.com>
In-Reply-To: <20210627142816.19789-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Jun 2021 10:21:01 +1000
Message-ID: <CAKmqyKO2kjMc5XTDgBbrcgfmg_oHCy1i65QYb8PnXVGvyhbXrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/system: riscv: Fix CLINT name in the sifive_u doc
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Mon, 28 Jun 2021 00:21:31 -0000

On Mon, Jun 28, 2021 at 12:28 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> It's Core *Local* Interruptor, not 'Level'.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/sifive_u.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
> index 32d0a1b85d..01108b5ecc 100644
> --- a/docs/system/riscv/sifive_u.rst
> +++ b/docs/system/riscv/sifive_u.rst
> @@ -11,7 +11,7 @@ The ``sifive_u`` machine supports the following devices:
>
>  * 1 E51 / E31 core
>  * Up to 4 U54 / U34 cores
> -* Core Level Interruptor (CLINT)
> +* Core Local Interruptor (CLINT)
>  * Platform-Level Interrupt Controller (PLIC)
>  * Power, Reset, Clock, Interrupt (PRCI)
>  * L2 Loosely Integrated Memory (L2-LIM)
> --
> 2.25.1
>
>

