Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoVfS-0003Jy-Qv
	for mharc-qemu-riscv@gnu.org; Fri, 19 Jul 2019 12:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42275)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hoVfR-0003Jr-0e
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 12:23:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hoVfP-0007nV-4n
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 12:23:32 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39767)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hoVfF-0007es-HW; Fri, 19 Jul 2019 12:23:24 -0400
Received: by mail-lj1-x242.google.com with SMTP id v18so31292385ljh.6;
 Fri, 19 Jul 2019 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2FoDvxwYpZz91FpH+ibEZmibBKp77P3sh+A7zYKTeY=;
 b=LaSkSh0CWXe5vN91mFjnnW3IxpfsS8MJostmOwzWxcKj3RNH4yTvAliJlRGc/RkpWV
 89mZdiQG3g8rQjGbZ+/04r7B9VDBlegp5rXr18Cs4pz8PYkrXx/6XBoKWAqng378dRfH
 BbZ77Y17bE/0MXqP7zt55PJU0qxrJWOAeu2mshcectLGIZSRxGfI1CwNHMcRyKzoe3AO
 tU8RZJM/yF5DLQL29yYlo50fQQLXvykbGwsGJVVoX21aDdGYA9UndyOCzQelvuvjaiM8
 gphRL1e+NMktGLnURxqlXMoKHNH2J3B9eh1gWPDK1SQNmfS8mGPh/4eclb+oGAHmwgaD
 bngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2FoDvxwYpZz91FpH+ibEZmibBKp77P3sh+A7zYKTeY=;
 b=SGY5iERjg0gbYhgWBZ7y3t4d/rakQx0bJih1WOUEWM54lc3yoqadx5lKeIoYb8B/RC
 BrfzuRwLThsYlMN/sII1+bz9kIdXPhVPPq+0mDakHsPlc+lM59jkTWi/Ji3onMCXfI3R
 gbMFiG73OizwmA4smlKR8aQiJFxIuxZKr+X8aESoyAzeb+lRpo7emivhrm8KViorMmFC
 zqRIx7/PdW5a9sPR+b0MKrmShprYK90EgiynOg1tnEyJQR3gXGZDJKA5fpvQkYzTtSMV
 oIBmF1I9jznIkpuOUJV0UmvQhiOip7RlOgHVypTWWjjtlfZhzal434iaxXbMyP/URPHq
 PZjw==
X-Gm-Message-State: APjAAAUsBgPSwg3VexkNOn12ff4WHyG5z8xaTRoO0NhQryEWoXyxUTAX
 U9pxCCaq6duJ+E31fu/2jQNNtS+MzlKtupKFWeg=
X-Google-Smtp-Source: APXvYqzfsXZR/qOwIfTJzMSZwWVX3H85rBCdyTceRVmiZORnum5z8unc/ngaAmHkPKglOcGY2BBjtrfU5DuprBFgmCo=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr3849328ljj.146.1563553392339; 
 Fri, 19 Jul 2019 09:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <1563543645-20804-1-git-send-email-linux@roeck-us.net>
 <1563543645-20804-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1563543645-20804-3-git-send-email-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Jul 2019 09:19:50 -0700
Message-ID: <CAKmqyKM+wiTz3oX1G7gdJE9z+Hy0ZEWeO2aWW1u1m_Uc9THmcg@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 3/3] riscv: sifive_u: Fix
 clock-names property for ethernet node
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
X-List-Received-Date: Fri, 19 Jul 2019 16:23:34 -0000

On Fri, Jul 19, 2019 at 6:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The correct property name is clock-names, not clocks-names.
>
> Without this patch, the Ethernet driver fails to instantiate with
> the following error.
>
> macb 100900fc.ethernet: failed to get macb_clk (-2)
> macb: probe of 100900fc.ethernet failed with error -2
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 5a221c6..64e233d 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -215,7 +215,7 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          ethclk_phandle, ethclk_phandle, ethclk_phandle);
> -    qemu_fdt_setprop(fdt, nodename, "clocks-names", ethclk_names,
> +    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
>          sizeof(ethclk_names));
>      qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 1);
>      qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0);
> --
> 2.7.4
>
>

