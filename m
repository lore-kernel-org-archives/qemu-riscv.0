Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iekPW-0000Qy-GX
	for mharc-qemu-riscv@gnu.org; Tue, 10 Dec 2019 13:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iekPT-0000Q3-Mv
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2019 13:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iekPS-0002QZ-Jy
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2019 13:38:59 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:36799)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iekPS-0002PJ-DA; Tue, 10 Dec 2019 13:38:58 -0500
Received: by mail-lf1-x143.google.com with SMTP id n12so14571030lfe.3;
 Tue, 10 Dec 2019 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Um02XhQDSOXqFThAJBB5utYQHbTlMcj0aoANmKJJuk=;
 b=CQ6UQ94apAhPFmtn0lQ1Nv8qeDAtP59Pt1hwQXFS1eP/JPkJc7hD4pHj6JJJ9au0Zw
 tXOPBL8JlUhapBF+h15uRO3Wri26ZqgrbZ03FtM680qOGU6xLu0MItW0N52ySFfbtBj3
 rhLjdg7JH6R3QF4Jjn8S//T9fvWd0o0PSShydf654vpWh8CThO07ydiIZnbk9ihq1RQO
 gW+0d7wfp2Xtr/rZxq4dz6ewtrNx7z4XFYjGOmWArn06xwojscoCreSAHNafyxRkrCsq
 uJlUmtPfvUI37JLuGIDjntWVG4JzQJvsJXJ8/1g07/LHzIOaeR0/nBX8fGs1A/OIeiJR
 Z9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Um02XhQDSOXqFThAJBB5utYQHbTlMcj0aoANmKJJuk=;
 b=t9Bf18Er/xgB5tEvfcJ1lqVkN/UNWStrz5fqQEewAErh40z0ZZ/4HjovfzonYa02Ee
 4XRZBG13l8ZSNiBYFy/o6z00blkagpOVv9U1x4cYJlohHM9i5QQpufwhmZ4FKBLeURSs
 zbzms+kAz7CrFUpNZh7H90IhRap8Fs6hxvsCnxIObiDZKWKIBczEfbwJdJIMtTGhVFgZ
 WterS1HBpU5j4BQwbx0MkhGnbOF7LQP9Rv5E9G5VOlHjAYx+lF84aDO2ZOuHAqN/UB7R
 +YI5uISj4NdnhOWdJ40vQtkDEDJMZiytVwnJ5h1Gzl7ps4TM73JsvHxK+tWwunhSgCN+
 7FKw==
X-Gm-Message-State: APjAAAWhijGmDr5n1OHuBvNufAahPAg4hK3BCUa1L8T8aW3As6tQy7BG
 2COeBRW9znaDysiYF0gdbiDDzWPbRbh9VqUmCEM=
X-Google-Smtp-Source: APXvYqzCPPMdqUl/gbARWa3GIyn/8VO3DBPZHjdMuD3Py/uVn9/N6/x//wcU1RN1/6r0eN2lirTj6AjTmDsi0qAdIfM=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr17290123lfm.135.1576003136065; 
 Tue, 10 Dec 2019 10:38:56 -0800 (PST)
MIME-Version: 1.0
References: <1575962077-28800-1-git-send-email-pannengyuan@huawei.com>
In-Reply-To: <1575962077-28800-1-git-send-email-pannengyuan@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Dec 2019 10:38:29 -0800
Message-ID: <CAKmqyKNH0NdhksX35C7Cm1e51in-iRBrmH8TJWGYregCgLgO6w@mail.gmail.com>
Subject: Re: [PATCH] riscv/sifive_u: fix a memory leak in soc_realize()
To: pannengyuan@huawei.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 zhang.zhanghailiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Tue, 10 Dec 2019 18:39:00 -0000

On Mon, Dec 9, 2019 at 11:15 PM <pannengyuan@huawei.com> wrote:
>
> From: Pan Nengyuan <pannengyuan@huawei.com>
>
> Fix a minor memory leak in riscv_sifive_u_soc_realize()
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 0140e95..0e12b3c 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -542,6 +542,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>          SIFIVE_U_PLIC_CONTEXT_BASE,
>          SIFIVE_U_PLIC_CONTEXT_STRIDE,
>          memmap[SIFIVE_U_PLIC].size);
> +    g_free(plic_hart_config);
>      sifive_uart_create(system_memory, memmap[SIFIVE_U_UART0].base,
>          serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ));
>      sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
> --
> 2.7.2.windows.1
>
>
>

