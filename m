Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lny6W-0007sr-Tz
	for mharc-qemu-riscv@gnu.org; Tue, 01 Jun 2021 02:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lny6V-0007qN-Dr; Tue, 01 Jun 2021 02:42:19 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:44029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lny6T-0003uP-Ro; Tue, 01 Jun 2021 02:42:19 -0400
Received: by mail-il1-x132.google.com with SMTP id x18so6393037ila.10;
 Mon, 31 May 2021 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dWarMeTaD0ihl6uO1Ga2wPsrTxhZTuBeXFSwuoGbCW0=;
 b=sjL0YVZf1NgDfN6vS90i0WDiy5WHnx7TS1Etcsan/6IhEpIM2aAsXPgRlYVW9c40lm
 sk4ZfdC3don3KnYQxteUCYipOmco1IUBw21O8+bT0XCbwB2wZrUgpzoZTKUrht8ARzQT
 iq+rGvivAWGGMaz407FUjfI3jFT4aCb+ManjEzHj3os0sqeSDnugrPtvyXXZijjdfyXA
 pJK986SAkGJ+3cQpyjKXfxMKv+0cq5V/k0jdRr0zFyJPf3OghnHW8/JBz8RDl0qP/z8r
 Qih3iTnwbsXRaLxBJ4PCc8nv2jh1S8vGGFkaIiReKuqUUDAiIiTIH5eBbrq9iBJSOQP4
 7k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dWarMeTaD0ihl6uO1Ga2wPsrTxhZTuBeXFSwuoGbCW0=;
 b=rlbNQ6WKl9UTjV2h//uuCnBLmqgKq/ykD9ATUqe4jhUii1uu5ZVVvvhFrffbk1AqE+
 rjGQoGfi2YuOUIU1TOrraIDBT6pi043xqQHeTlpzIILhXyipRjHTHHPAazPwWyr0695C
 xE1lFRKeSnESgmSagciAbrxVLDilHR5c1qi7AxseKcK/fe79IZxBm4CLFmupWXeo3vyg
 X9Hw/CNTIZXnqu9x9qHbmitiwve1PaP6bdcFwR7zSccU8kRsa5RgERcA1A24+Q4gCXmc
 azjeeAS5tdS+rCiNQk5/Xp6fPKmIRJcsWsF5nNWLh3/IprhIKJHYH/Anmpeu8SkC/YZw
 yr2g==
X-Gm-Message-State: AOAM530T2RClgkxIYHiKWSdyYusEHurqMcVQOqkuZJolD4vdDYy3tHSb
 qbbWJTMOOUx4yOQzOVEN/W5BYRDJS7qJd88eoJM=
X-Google-Smtp-Source: ABdhPJxuZa6Luz5S7r8fbckeDf09j7tPAhJEEZ3+ozAbq/v4ECCCJ2vEwWywr/iHGcoJ/eAn7bgHObPwBFt0i2bEq3U=
X-Received: by 2002:a05:6e02:4af:: with SMTP id
 e15mr20302514ils.131.1622529736372; 
 Mon, 31 May 2021 23:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
 <CAEUhbmWKb3MhYOPHhscecdX_V1dhitmaDPjYn_Mm7rA2nerysA@mail.gmail.com>
In-Reply-To: <CAEUhbmWKb3MhYOPHhscecdX_V1dhitmaDPjYn_Mm7rA2nerysA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Jun 2021 16:41:50 +1000
Message-ID: <CAKmqyKOJUEn+Nz2kF7b-1H7NoNQi5AvmkrD-3wupLrgr56G2+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Tue, 01 Jun 2021 06:42:19 -0000

On Mon, May 31, 2021 at 12:34 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Apr 30, 2021 at 3:13 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
> > we can use the new helper to set the clock name for the ethernet
> > controller node.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >
> > Changes in v2:
> > - use "static const char * const" for ethclk_names
> >
> >  hw/riscv/sifive_u.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
> Looks like this series was not applied?

It's in my current tree. It just missed out on the last PR, it will be
in the next one. I was hoping that would be today, but I hit some
testing issues. Should be this week.

Alistair

>
> Regards,
> Bin
>

