Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP4J6-0001xU-P5
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 10:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4J1-0001q3-Iq; Sat, 11 Sep 2021 10:48:35 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4Iy-0008Ip-Vs; Sat, 11 Sep 2021 10:48:35 -0400
Received: by mail-yb1-xb36.google.com with SMTP id s11so10240032yba.11;
 Sat, 11 Sep 2021 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R6ouG/eF/hOoH0/AxyqqNdPLjtWPoOB3g2qH0Qe+sR0=;
 b=oXdjkqZVZqJdmR5Etlarho/H/MmJVao11JjvsfKY3jUdmmVuluKLlMzSJuXVFW2WOP
 R6Hf6Po+RjFuefVpIv5xoYvXdk8rsK+768uniWW9t+lJjjBy4wddgxUF+acHDXmQRmGE
 iHya1c4I4wA4I43c0AnPN2HmNk9p84oMEef8vEM9eAfm8vrVnH7rrCbYs2aTZW84ErJY
 HkTSxe2yg+DD0I04fpb5Qvmala+/kW8vsTm00wcILcvTXEV6sEd834A6nuQbkPhDUcmz
 mF06yO5Dzoc/AmL1FuCvoM1VoNPhomXS/KqUFrhLfMPzh/6Q9WJZw8TWLo1E4GBbRhiB
 09YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6ouG/eF/hOoH0/AxyqqNdPLjtWPoOB3g2qH0Qe+sR0=;
 b=yRfjvgPjizFdVDVlGz4AazAkAaTPlJfHkSBEgLPrMiEf0TW6cgkpRydIB1wwLgcuYu
 ZZOpdzIJ8KWb1dGKj6t1opJYsR7j4pzJ56u9CJrRIX/5r6+eRDzufT3VyTV8taVFX20T
 eksQmsqGuT6leATWPXJcp1dYaEM9KRTvYjSxgIJ27448hGYNSxKRwwHB4mo3oWkodlnd
 eP6uTCxNTuHnArO579gL4gReHCVNpPSYCz9qGgoAkRqxyrIrGd1X1v4v193XMBVUImqN
 mjlccmr9Ar6H/IKEMa7QWRUBm9qydnw3azHcHMogQaQ4tS3I5jZ2nx9nm/IFlIjRDXc0
 vUlg==
X-Gm-Message-State: AOAM531xzR9XYRahvpsfpGacbGoUcsh4igRx6fxx7Qgr5xeBEiUGCX3H
 yJfziKr+2ZUWSfVmqwW3nhriW3uSn8NMI9/REqyqeY4c
X-Google-Smtp-Source: ABdhPJw6pCgqZmoO5tDvWparjRqUn66QFC7vxbQVLalSVhkgS7rpEoCx4cZmwgwcyE8SjWca/aGFr05FDYGOX7M/cew=
X-Received: by 2002:a25:cfcd:: with SMTP id f196mr4190643ybg.332.1631371711740; 
 Sat, 11 Sep 2021 07:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210910055620.946625-1-frank.chang@sifive.com>
 <20210910055620.946625-5-frank.chang@sifive.com>
In-Reply-To: <20210910055620.946625-5-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Sep 2021 22:48:20 +0800
Message-ID: <CAEUhbmX=zjKHi_t3w-pxVuRTfOsqV_dN+NWGWVbuwON6W5Be-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/dma: sifive_pdma: don't set Control.error if 0
 bytes to transfer
To: frank.chang@sifive.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Max Hsu <max.hsu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Sat, 11 Sep 2021 14:48:36 -0000

On Fri, Sep 10, 2021 at 1:59 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Real PDMA doesn't set Control.error if there are 0 bytes to be

nits: 0 byte
Please fix the commit title as well

> transferred. The DMA transfer is still success.
>
> The following result is PDMA tested in U-boot on Unmatched board:

%s/U-boot/U-Boot

>
> => mw.l 0x3000000 0x0                      <= Disclaim channel 0
> => mw.l 0x3000000 0x1                      <= Claim channel 0
> => mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
> => mw.q 0x3000008 0x0                      <= NextBytes = 0
> => mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
> => mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
> => mw.l 0x84000000 0x87654321              <= Fill test data to dst
> => mw.l 0x84001000 0x12345678              <= Fill test data to src
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000001 55000000 00000000 00000000    .......U........
> 03000010: 84000000 00000000 84001000 00000000    ................
> => mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 40000001 55000000 00000000 00000000    ...@...U........
> 03000010: 84000000 00000000 84001000 00000000    ................
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Tested-by: Max Hsu <max.hsu@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

