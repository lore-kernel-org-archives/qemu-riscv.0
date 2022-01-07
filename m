Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5g0k-0004YI-64
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 22:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5g0j-0004Y4-1n; Thu, 06 Jan 2022 22:33:49 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=37877
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5g0h-0000qC-Gg; Thu, 06 Jan 2022 22:33:48 -0500
Received: by mail-io1-xd2f.google.com with SMTP id 19so5575657ioz.4;
 Thu, 06 Jan 2022 19:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhwwQ5awAIB0jfxUcEEilVDhPlZsVCaI1wW7mY14seo=;
 b=htOKJil1z0jw7n0DP/4VIsDP/oiU+zfyYoDl88Wy7MoomRgMg9ZiaefUzNB1yKaec6
 4an17qM1UdkShfbPmbw4U/drKyZiwQ7hAo+ZPpaP0SkN4jkhjL38GDXcu6vXs8SPTrML
 kVEaLR85wFuHLvBtebpHsA7NaUb+8+B5WMhYffNLVHGUeV82ETX52u61/2i/B0oZVsug
 wYsUvNcWni8m6JzJHtjqaoPMZ6OXf0ygvzSJBT/wR6x3S6zkMX+1tSqsifAZFSerUBrL
 zrLr+0USND1CNRx2TCD2LAHHaTJNP6DNalDcMThkYIjFQs1QZxBYQSv2ZCs92CMDzbZd
 hQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhwwQ5awAIB0jfxUcEEilVDhPlZsVCaI1wW7mY14seo=;
 b=BEDApZ6feRxKkWOF2lMbQMKicva6NDRaflRnF1phZzRbAyq4uwitnvasYMaXL0X52Q
 BgM+XZNSqmK+IU4O/JmO3dZkSir7aKEOw2/0PAlTLUwViHkG+YH0K1OFC5n3lHVystMK
 Yuo6cf8VtDJL0yt7HolDhBQqrT7jHy5SerCRRngOGshjDjhGlckrNQ6FJ69TiaiK9RZj
 fRfds9DveeCF4L+eSjretBjfXorj+uHLIedzoBiZIjKhdrf7M6QiFAl/b/yVoeC+bF4+
 6yMdqnD7g8x10XxMKfP1cTdHjOL8XPoQ0BJ8gwVoa5nYxpFVSy6dvmvvXXlBH4ad45fu
 ADBA==
X-Gm-Message-State: AOAM531yVqTsCjrHZ0YMOKgovSgWkgKxbD6//gMWt98gb1xzsECcqQ7o
 cF6Z+bG5JEYPBc0fZQ8DAN476Obmv1nilAUNFtc=
X-Google-Smtp-Source: ABdhPJwKQrTpXlTkqK05PCCGmV6WVrJeArRNEp/hZLDzNtkQvgjc1WsZqecMd5r/5Was8rO4XMUKZY7nI7utElG7Ojo=
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr29399627iov.187.1641526426207; 
 Thu, 06 Jan 2022 19:33:46 -0800 (PST)
MIME-Version: 1.0
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 7 Jan 2022 13:33:19 +1000
Message-ID: <CAKmqyKN8MTw-rp0kOwys75usLu=53Tf8NEK3tgzzyXOF_VRT_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] RISC-V: Populate mtval and stval
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 07 Jan 2022 03:33:49 -0000

On Mon, Dec 20, 2021 at 4:49 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Populate mtval and stval when taking an illegal instruction exception.
>
> The RISC-V spec states that "The stval register can optionally also be
> used to return the faulting instruction bits on an illegal instruction
> exception...". In this case we are always writing the value on an
> illegal instruction.
>
> This doesn't match all CPUs (some CPUs won't write the data), but in
> QEMU let's just populate the value on illegal instructions. This won't
> break any guest software, but will provide more information to guests.
>
> Alistair Francis (3):
>   target/riscv: Set the opcode in DisasContext
>   target/riscv: Fixup setting GVA
>   target/riscv: Implement the stval/mtval illegal instruction

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_helper.c | 24 +++++++++---------------
>  target/riscv/translate.c  |  5 +++++
>  3 files changed, 16 insertions(+), 15 deletions(-)
>
> --
> 2.31.1
>

