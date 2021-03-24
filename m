Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lP3lS-0007Ub-O0
	for mharc-qemu-riscv@gnu.org; Wed, 24 Mar 2021 09:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lP3lP-0007U3-Lz; Wed, 24 Mar 2021 09:41:35 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lP3lN-0002sc-U5; Wed, 24 Mar 2021 09:41:35 -0400
Received: by mail-yb1-xb31.google.com with SMTP id j2so14156868ybj.8;
 Wed, 24 Mar 2021 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YusfBGFn66IFPIBiEdhUfrqXYGa4bwguTgCYjVoZuA=;
 b=DCo0r+n1qTJL6bbmDecx388JHVjeLvXkFilGl9+zZiM9WCblaPhRURvLzAqEq7/I5n
 jdHaSuFDkb/DzuB9NTbBXFHJX2vjE6HE7mKievPfMct6NN3oxxl0+0VoA3B9TNALJfNZ
 4IqWkPLg/03Bzx526IsKrk2GQP3mKjAptVPnDIhWavN9+JGQfzgzhPTeny0xtHcZJt1L
 JnlzjWTz9tDEZu26gWW92NqfcjimrMjEDsVfItEE0LGiBZlEjOrFUl46g9QNKgdqGRlL
 My3ELwYxW4teRrwnA6YLnX5zh1V5+YGjP98uX3xc+BOjjK/6cfsov9xDWtk6XEJfaCOq
 nzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YusfBGFn66IFPIBiEdhUfrqXYGa4bwguTgCYjVoZuA=;
 b=j4kxfhaKXg5MlEM2xGoZIh9Rd1pcXaq2uMVjWr6kpJA7aTi4vv6TiAIWnfbabPZp/v
 g9Bna5ZXsR/3HgOfD5ttJlgW6y81JjkXggFYB6hVe+DqoTzFNcP4ouMyvmUzpXygyBtC
 tlyhFu3HywSpAZm1DsxcqfUx4/xZInMVkGZRdl2VCghW/5oNxtWfNjeh3jrVhzJjnh22
 PzZKtGL0icCi7O5hwHoG9wcKEyjOs2jwhlHI0YoSyp+PmDP7DN0Qpf5Yfc/RKOX4OB5t
 AiLkQ54EHRmusIRJMh7RY2z6bDHFLNyKtKNE83G0BuRW6lvzon0j3XoJWeCDxDY9YZha
 N8FQ==
X-Gm-Message-State: AOAM5325W+izKe+cN/vQnymmz9tMFO1VWT3Tl2HrcI9YR05pJdwa9yOj
 DaSv3yiIOnhSQUr3aN5Ey151MIxdL/C68vsF6Mo=
X-Google-Smtp-Source: ABdhPJzwEoWE1uDrLQI9J5MbDPq2Z1uTqJbtm3RJAf/WQW5un0ymPGxWyCJaE1mlVtCadNfm7d/UWBwBBYAtyfS5XO4=
X-Received: by 2002:a25:73d1:: with SMTP id o200mr5061400ybc.239.1616593291807; 
 Wed, 24 Mar 2021 06:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201022053225.2596110-1-anup.patel@wdc.com>
In-Reply-To: <20201022053225.2596110-1-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 24 Mar 2021 21:41:21 +0800
Message-ID: <CAEUhbmVWesOJTxejnr-DYMUMXgLsRLz9nVqbAEb0emu_nUEhqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv: sifive_u: Allow passing custom DTB
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 24 Mar 2021 13:41:36 -0000

Hi Anup,

On Thu, Oct 22, 2020 at 1:34 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Extend sifive_u machine to allow passing custom DTB using "-dtb"
> command-line parameter. This will help users pass modified DTB
> or Linux SiFive DTB to sifive_u machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/sifive_u.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>

I am using the following command to boot a Linux v5.11 kernel, but it hangs at:

$ qemu-system-riscv64 -M sifive_u -smp 5 -m 8G -display none -serial
stdio -kernel arch/riscv/boot/Image -dtb
arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb -append
"earlycon=sbi console=ttySIF0"

[    0.000000] smp: Bringing up secondary CPUs ...

Removing -dtb makes the kernel continue booting.

I am not sure what's missing ofusing "-dtb"?

Regards,
Bin

