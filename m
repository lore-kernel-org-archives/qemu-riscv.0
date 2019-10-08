Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHsl2-0008KU-GB
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 12:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iHskz-0008Hp-D2
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 12:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iHsky-0007HZ-Df
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 12:54:41 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:39560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iHskw-0007GA-0q; Tue, 08 Oct 2019 12:54:38 -0400
Received: by mail-lf1-x141.google.com with SMTP id 72so12494206lfh.6;
 Tue, 08 Oct 2019 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yKnbWPlo9JQzuklZk80XuvQ8O1Z/I/MhFT718KTVLWw=;
 b=QKbykGgxmL2kSxdvDJW/+1rMYtOzoIFmXPb0AUI2S47kGY8LOT6BFQ8iM7ARO5jyAi
 u35oJXH+48kcpDEFt3TKZsjh3+oohEIk5Hga4sorIFPXI+5d3tgayk0xTdcngPnIuJVS
 FY3TeS6jlUvoY26o0oeTGiw1EhN/iemv8rvBraITcRFuwNN4jMpKJz97TRJBNWZR9o/+
 HlkCJhytPeV6YBCntr0Ix7LFtVKbiZepxAAbmcUyjAVGVNKEYAklVb0M616qRCdmX8gP
 iCjaliIddQHmElr18Vu/OB4x3NcMDZlPyVgb2WWpBCt7f+amzU3tMn740Tei9BQ4X2xf
 HnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKnbWPlo9JQzuklZk80XuvQ8O1Z/I/MhFT718KTVLWw=;
 b=aBlaMn7tbbwCKbr1JSD8X1u6WNKuhWD6bbthKd+GjREXmc3MVXnMDCF/cl9sIa7Bl6
 QTgWz1S5ZhqIqBAXljzJRTViG05aPaUk3qP3EPbwUFcEJw6iWe5jDp+HTQ0RyjRSIHdy
 NCHuaJCowolSO7DoId1opETwL9zkU0gDpTpkSoQ1k1YqieQATV5yfnGj1U3BeGiW0+Cl
 SgD+hdhXIXJZXRlMfJ9lWlbSO7H/DUeEW149/57M0xJJtar0Fb7O0ZrBTD0C7oXDMLVZ
 pmMC3SiN1TPHZ13Pcad+TgRS2yEdZuBMn3YsBNpno2g6orr9YMVdCMFlGHeIEa2B7sDZ
 2l+w==
X-Gm-Message-State: APjAAAX5/o5ocWGYMV0Nkq5PIEBF8HB6xSqwuycFSPmuCzMH3oQNpM2U
 F+XDuuiUpz1odY6J0sYavnDpCroiipV5bF6e4s4=
X-Google-Smtp-Source: APXvYqyDnrRaopvewc0mjs/V5HgFbwVTuDN7cWzjBnHn8WuxZOpfLlyvz7lfA/+nZloklBupGIgbnhMH+WMaJEyXLnw=
X-Received: by 2002:ac2:484a:: with SMTP id 10mr21047068lfy.135.1570553676497; 
 Tue, 08 Oct 2019 09:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191008001318.219367-1-jonathan@fintelia.io>
 <20191008001318.219367-4-jonathan@fintelia.io>
In-Reply-To: <20191008001318.219367-4-jonathan@fintelia.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Oct 2019 09:49:39 -0700
Message-ID: <CAKmqyKN1LZjcd5wJ8PAFvh+RWxwWB9+zJOdh5_t4xjaFKCgc+g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: Make the priv register writable by
 GDB
To: Jonathan Behrens <jonathan@fintelia.io>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
X-List-Received-Date: Tue, 08 Oct 2019 16:54:42 -0000

On Mon, Oct 7, 2019 at 5:20 PM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> Currently only PRV_U, PRV_S and PRV_M are supported, so this patch ensures that
> the privilege mode is set to one of them. Once support for the H-extension is
> added, this code will also need to properly update the virtualization status
> when switching between VU/VS-modes and M-mode.
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/gdbstub.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 33cf7c4c7d..bc84b599c2 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -387,6 +387,15 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
>
>  static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
>  {
> +    if (n == 0) {
> +#ifndef CONFIG_USER_ONLY
> +        cs->priv = ldtul_p(mem_buf) & 0x3;
> +        if (cs->priv == PRV_H) {
> +            cs->priv = PRV_S;
> +        }
> +#endif
> +        return sizeof(target_ulong);
> +    }
>      return 0;
>  }
>
> --
> 2.23.0
>

