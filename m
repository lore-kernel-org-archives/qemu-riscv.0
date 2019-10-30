Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iPhkN-0001zS-RZ
	for mharc-qemu-riscv@gnu.org; Wed, 30 Oct 2019 02:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iPhkK-0001zA-N9
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2019 02:46:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iPhkI-0004N9-Ge
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2019 02:46:19 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:36728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iPhkI-0004He-7J; Wed, 30 Oct 2019 02:46:18 -0400
Received: by mail-lj1-x242.google.com with SMTP id v24so1361043ljj.3;
 Tue, 29 Oct 2019 23:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gfE+NEO7YS8mVjvOVK9/8HpohP3p3byTjfw7KM/WHOI=;
 b=QpOqizBZ4A60YMVDyaD8LtHl3At8+OnZ1WC7kj+kWnyH+ZO85N7FD78vDABsd17MfG
 1DPWu6j5DsIIEPK49URlpEJ8ct7TKTlq9fg7czfYykiLBN1AAClNwMHd3UJmYvApSEBA
 DEEtH7HHwPd9Zk+tmpKa/MYdf71UyInfyDHB0hYbJOXi7HhfxOE1x9BYcUeguahHk7cu
 Vb9IwwZ/CymKJ5ZsX9bOozsbZpb9udNvRiozuRgu9kKrRe/b3O5gh9h9NpnFuVptIbfs
 03mZl+YF7GtSjIM5n8D7T0Uzx5ky+tZKAmDgX+lEci9lp8oOWrF4j18oyIGEDHNNAH8m
 3Kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gfE+NEO7YS8mVjvOVK9/8HpohP3p3byTjfw7KM/WHOI=;
 b=NFlzlszCchaSjDP2yZaR7DOEkBiokob9XBYwDX5LFXpsW9PLtrCzRKVGK1Uy2wJrzR
 AmdxE6+EkAbIyDzNp41NRu4NfMz/Q5mGbNw+06mdYL3HvDMVR9710z9OPBp5LEcKWdE6
 ja/NExsC03nVNDVOosU6bQY6alxZileejn/PXQnqIqO9ROmlSy4E06jTRXGwh4fNbZUv
 j4AtZwyeS1uYSWfkLsHBCx6a/+lY+c3E+Mn0skMLaCu9rbGR9feACot31JhURGz86ODp
 1NzMEcNuWNs6HbT7LKlm5FrW7fVnBUNlJ6VZilskSsMnn4gD0HvEOApohpczSuPj3WPj
 LuNQ==
X-Gm-Message-State: APjAAAUK6uAq2NUHu4IZ1qDpCis86d+D1fXJkqmgsPfPSUKgXOY5bNKR
 RmTzRJgHstokZXjQ+4PpOlrPN0VqFhDgR6YCD5s=
X-Google-Smtp-Source: APXvYqzg62/R7K0Ue2ySzCK9briO1v7CioFMN9dA0MwefGz7UR2nc4zhmGmoZ1i9yZb2wg3hXE5wHIDjMpaKhN6s3Sk=
X-Received: by 2002:a2e:420a:: with SMTP id p10mr5597358lja.16.1572417976697; 
 Tue, 29 Oct 2019 23:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191030044341.29179-1-palmer@dabbelt.com>
In-Reply-To: <20191030044341.29179-1-palmer@dabbelt.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Oct 2019 07:45:49 +0100
Message-ID: <CAKmqyKPQqNJq1ZEDOd6kdbays+5he3zdhq0dgUMXagAfrqCyiw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Change to my personal email address
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Wed, 30 Oct 2019 06:46:21 -0000

On Wed, Oct 30, 2019 at 5:57 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> I'm leaving SiFive in a bit less than two weeks, which means I'll be
> losing my @sifive email address.  I don't have my new email address yet,
> so I'm switching over to my personal address instead.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 325e67a04eee..20445f353e7a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -259,7 +259,7 @@ F: include/hw/ppc/
>  F: disas/ppc.c
>
>  RISC-V TCG CPUs
> -M: Palmer Dabbelt <palmer@sifive.com>
> +M: Palmer Dabbelt <palmer@dabbelt.com>
>  M: Alistair Francis <Alistair.Francis@wdc.com>
>  M: Sagar Karandikar <sagark@eecs.berkeley.edu>
>  M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> @@ -2392,7 +2392,7 @@ F: tcg/ppc/
>  F: disas/ppc.c
>
>  RISC-V TCG target
> -M: Palmer Dabbelt <palmer@sifive.com>
> +M: Palmer Dabbelt <palmer@dabbelt.com>
>  M: Alistair Francis <Alistair.Francis@wdc.com>
>  L: qemu-riscv@nongnu.org
>  S: Maintained
> --
> 2.21.0
>
>

