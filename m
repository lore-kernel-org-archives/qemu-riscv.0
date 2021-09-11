Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP4It-0001Qe-Kp
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 10:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4Is-0001La-9A; Sat, 11 Sep 2021 10:48:26 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4Iq-0008B7-LA; Sat, 11 Sep 2021 10:48:26 -0400
Received: by mail-yb1-xb32.google.com with SMTP id z5so10398330ybj.2;
 Sat, 11 Sep 2021 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QLkge/C+giA7z7VL42fL7YmOePfgYiNiT1zcbOdEhU8=;
 b=ZYnlQnlceYD0uKajrNWr1Zruo+nTHjdjSgar4WPU8Si1GJR6VMHBxKAmDqFY6C8EVN
 GOji4PlJQWfeTq8CTa/t40cEXLqZ+NUtkH7AbZKw9MmUBW53xT8lD67s1i/WFWES3hwe
 KakpR6+TnE4rBawWjy9X69SBZKgrlRJ7bXkg5dNPc764Q3gOasGs82e6+5uYbzXiyAGL
 RIZNDvl9S0jwM/235K/8x3q3UWBDzSQgNePZzmUmTkXpOB+N4zWsp/kpIAnYCjrtugEJ
 n+Tm2/jWisLSE4bheU8CpLEYOwKwACxiaqg9iaQoCy48LY/2vAq7BGg9g1t0s/kq0gSX
 wsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QLkge/C+giA7z7VL42fL7YmOePfgYiNiT1zcbOdEhU8=;
 b=mSFyhQG8K8RXrrXRqDMXO55VzZGyN6rkQdMqlr2XuDFRA9JY/v0Z1/w2A1X1Np3HOc
 DZE0eo6qdTIEKgFpHtfJwS1k4UTqTLDNbzkLqeK4/2nKdsiiKOZ42zOpaeyupoQkYfH4
 TvEPaXgHB13VIW1Ic3Y2FYjd3F/VWIjZmlOFD8TH96b46AUUs8jMmPoFOlVuRMp8UVOl
 NSsDX+s0tLbwGWU5+BQvvLK29N2wTaCmMqw/1RTe2gbaYmWmrRIwAAaRSriXY+O+Nwsj
 tK4t3qpOql2Q6J39JrV4gpgivkr3evWLPVy5WMlfCHxDo84VE/2AKWJD6MWCAdzuyZNf
 SF3w==
X-Gm-Message-State: AOAM530g9gZc6Mm4Y9+WB2AU+70J6dXmkDR1z4hB5/Q8nN+fq4wRSyZk
 4+ZzJKosE+TExnyL0DRAnGSapmLzKfAow83iFfnc8XB1
X-Google-Smtp-Source: ABdhPJwA5X5ZPij+cJLzcvWB8NBk0RR1zqkCZfodnzZ420Umic6ninLUajDBP2NfLJTCV/sL5JPI60/MZcni48Q1We0=
X-Received: by 2002:a25:1b89:: with SMTP id b131mr4083433ybb.40.1631371702269; 
 Sat, 11 Sep 2021 07:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210910055620.946625-1-frank.chang@sifive.com>
 <20210910055620.946625-3-frank.chang@sifive.com>
In-Reply-To: <20210910055620.946625-3-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Sep 2021 22:48:11 +0800
Message-ID: <CAEUhbmWgc4-aadjuZg_kuc6TKZ2ci6ryS_s__t9_5x3fobA9SQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/dma: sifive_pdma: claim bit must be set before DMA
 transactions
To: frank.chang@sifive.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Max Hsu <max.hsu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
X-List-Received-Date: Sat, 11 Sep 2021 14:48:26 -0000

On Fri, Sep 10, 2021 at 1:58 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Real PDMA must have Control.claim bit to be set before
> Control.run bit is set to start any DMA transactions.
> Otherwise nothing will be transferred.
>
> The following result is PDMA tested in U-boot on Unmatched board:

%s/U-boot/U-Boot

>
> => mw.l 0x3000000 0x0                      <= Disclaim channel 0
>                                               (Channel 0 is not claimed)
> => mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
> => mw.q 0x3000008 0x2                      <= NextBytes = 2
> => mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
> => mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
> => mw.l 0x84000000 0x87654321              <= Fill test data to dst
> => mw.l 0x84001000 0x12345678              <= Fill test data to src
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000000 55000000 00000002 00000000    .......U........
> 03000010: 84000000 00000000 84001000 00000000    ................
> => mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000001 66000000 00000000 00000000    .......f........
> 03000010: 00000000 00000000 00000000 00000000    ................
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Tested-by: Max Hsu <max.hsu@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

