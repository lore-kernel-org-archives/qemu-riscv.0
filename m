Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hunFT-0008Bm-B4
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 20:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hunFQ-000883-O6
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:22:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hunFP-000508-QI
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:22:40 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:39645)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hunFN-0004zH-Rl; Mon, 05 Aug 2019 20:22:38 -0400
Received: by mail-lf1-x141.google.com with SMTP id x3so5699476lfn.6;
 Mon, 05 Aug 2019 17:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=luussWO6xblBv8hjzgZy7UW4cyRqL6kWYmGl3ubVypM=;
 b=FEJTb+5RaAQ0XcEvCPw7XjYsE8VromNk1FdIz52rFZlOUrww2IEZVQBxWDyiYnNgKo
 U2wVhQePBloiwvsLRMg4QPAkZ+Qerjn+phW+AjAWjMqxmswVvxG5bz9BnWZVZDHXF6Sp
 l/LO4AwYTcO5G4Z7JolaMGKSzqWnj69riGr/pd86/ZqZNk+17wUZTLGTbIoIR1vS6E5/
 uDZShgOP6NZYy7tp9eh7oRj88gkHMFJDkWNiQvzaCjblTgU8+SXni1pCNqjlMAaPLAK7
 AevuEx7dkTg8WOPA7BFTBFbrl/4UQezJKSfePMwlAvDaA3PY3AXGeK1pBgTp6RzR8OHB
 bJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=luussWO6xblBv8hjzgZy7UW4cyRqL6kWYmGl3ubVypM=;
 b=n4U9ADF5vFVzlH2zbO4gCIzSD4RBCrd4e6lio3unb+eh4rVQRTMaWcDdLy/Kce2OK2
 9rUG4gCHd1rvSRl/7p4xX0Cz2OkMGj7GcydLb0maioFUyHEG9gBxEPR0AXirPyRX1tE3
 jbRImMaGyP6VatZNVDSiXLmSufL/Ph9DXPecOczcnbJn94rOE59nhtgifO42sOSLap60
 PF3nV7wzQqtZtUjCi63KJXPbiM/eXDC0p99HEjIqOXsgpV2qiIG6MnZXHhPPw/ULNkJN
 gCyo8E8UvL6S8cGjMeM6vYodrw8UB7Nsa/KGrIzpL6mVQYi8BnrlrwKnDzhTk6o/cazk
 46wg==
X-Gm-Message-State: APjAAAVx7VBiAoLkHyPYflTMMJ4VHU87KHXUPRozLe+gt7C6IoHCLiRy
 RiBPksTrlmBmVZJh1eY/YBlIsvMOq35MvFRenco=
X-Google-Smtp-Source: APXvYqxCcDywhHyRPLZQf5UGR0HmggY/LDvceI5UAqiZSJqyhhPHgOKj9uqRZFGatDq6Ev1PLJbWGwhj5gGsDaxl77Y=
X-Received: by 2002:a19:6904:: with SMTP id e4mr254575lfc.156.1565050956453;
 Mon, 05 Aug 2019 17:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-13-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-13-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 17:18:57 -0700
Message-ID: <CAKmqyKOGp+-V4s8UcN06rHPF7OYnEEjXBqgA7+8+MKL6fn7HJA@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 12/28] riscv: sifive_e: prci:
 Fix a typo of hfxosccfg register programming
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
X-List-Received-Date: Tue, 06 Aug 2019 00:22:41 -0000

On Mon, Aug 5, 2019 at 9:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> It should use SIFIVE_PRCI_HFXOSCCFG_RDY and SIFIVE_PRCI_HFXOSCCFG_EN
> for hfxosccfg register programming.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_e_prci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
> index acb914d..c906f11 100644
> --- a/hw/riscv/sifive_e_prci.c
> +++ b/hw/riscv/sifive_e_prci.c
> @@ -89,7 +89,7 @@ static void sifive_prci_init(Object *obj)
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>
>      s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
> -    s->hfxosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
> +    s->hfxosccfg = (SIFIVE_PRCI_HFXOSCCFG_RDY | SIFIVE_PRCI_HFXOSCCFG_EN);
>      s->pllcfg = (SIFIVE_PRCI_PLLCFG_REFSEL | SIFIVE_PRCI_PLLCFG_BYPASS |
>                  SIFIVE_PRCI_PLLCFG_LOCK);
>      s->plloutdiv = SIFIVE_PRCI_PLLOUTDIV_DIV1;
> --
> 2.7.4
>
>

