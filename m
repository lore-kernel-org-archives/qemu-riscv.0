Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP4Iw-0001be-Sm
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 10:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4Iv-0001Um-2G; Sat, 11 Sep 2021 10:48:29 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4It-0008EA-I9; Sat, 11 Sep 2021 10:48:28 -0400
Received: by mail-yb1-xb34.google.com with SMTP id i12so10077258ybq.9;
 Sat, 11 Sep 2021 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kluufKkOl++OkAVcyPFRFkWu4+hhudZhLyNkIVimpjo=;
 b=ToZEAknKjpWekkvfZQKKMoHEbS6OT+D2qIKoJEatwBUBShYdWYgBES0wPk2ziu/PEr
 tmsTZiOCEPJ1oaViOmb9F18hu8l3f/wtHKC+JVlTFxtReTeFy8IgZGzIu20KtE9IXFe1
 iRHPxm1yzD9G/sAEc97d3/11rVk9oluciZ6qOjQ9OEDLnxKuLcc/zc08ypJO/Wg2L57f
 gOfnH5CaAfBhvkfIWs2sFpgDjP2NecGrs4uHbzwd7PQSPkIzgA/KTPsb8A6OTNpS3Ktm
 /Z5mB8xkUdDT2iAhehROIt/MvzFXflCi27hR6ROoPwXAq3KOuA/vnwJOu/PeiWxZL7ix
 Pikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kluufKkOl++OkAVcyPFRFkWu4+hhudZhLyNkIVimpjo=;
 b=z0o+UGUPrJR9p5inMEkd5ZrWjhbOwANuGeRvqzwScmCErH1gc+evDv3Awd5tB0RWvG
 yymkm/j/aUvAeUoDxSIMY1qElMLPSqUCceLHnVKSjLusAcXLf0kIM/5sV3KnZNGzdAb+
 HPvcoi1eDy890ZsFxtf0gQKl8HJy6WUwuXtmSV3zDPGu0kM4Dl5tpULmIuZnSN4D833/
 YhUWe/e4SHqlYUaZnAv7wk8kfYjvxUnW9eSJnUahfOs5NOXnrbU1tgAZ4m1Wqk/oaF3z
 xgiy1nXauMMPAigTSOb9ESWXH9KEKLI4421QLzc83oGi3FhziT/Zc//Er9IbyKiLv7Pu
 QILA==
X-Gm-Message-State: AOAM530z3OUePHzKl6J+8KCCqIu6Y8pl6w3LLuR0Vc0MvwMgK2yw1ZLh
 fYfM1qlR8nlVFtrdRikGrr+hTxPZ/vFyMhzTzmA=
X-Google-Smtp-Source: ABdhPJzDUh65kdgbg5BMPp0J/nznfWBnQO0BUyb1N1+pMEsuTkNJScmN1UcGnFS3cp5w27uA1s8WnP43k87ePTpFJ+k=
X-Received: by 2002:a25:ad52:: with SMTP id l18mr3848900ybe.453.1631371706373; 
 Sat, 11 Sep 2021 07:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210910055620.946625-1-frank.chang@sifive.com>
 <20210910055620.946625-4-frank.chang@sifive.com>
In-Reply-To: <20210910055620.946625-4-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Sep 2021 22:48:15 +0800
Message-ID: <CAEUhbmVMgn0Nii2uCf8OL7mMG5UW+27KG-5UR+EpG-TtYJ0GzA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/dma: sifive_pdma: allow non-multiple transaction
 size transactions
To: frank.chang@sifive.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 Max Hsu <max.hsu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Sat, 11 Sep 2021 14:48:29 -0000

On Fri, Sep 10, 2021 at 1:56 PM <frank.chang@sifive.com> wrote:
>
> From: Green Wan <green.wan@sifive.com>
>
> Real PDMA is able to deal with non-multiple transaction size transactions.
>
> The following result is PDMA tested in U-boot on Unmatched board:

%s/U-boot/U-Boot

>
> => mw.l 0x3000000 0x0                      <= Disclaim channel 0
> => mw.l 0x3000000 0x1                      <= Claim channel 0
> => mw.l 0x3000004 0x11000000               <= wsize = rsize = 1 (2^1 = 2 bytes)
> => mw.q 0x3000008 0x3                      <= NextBytes = 3
> => mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
> => mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
> => mw.l 0x84000000 0x87654321              <= Fill test data to dst
> => mw.l 0x84001000 0x12345678              <= Fill test data to src
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000001 11000000 00000003 00000000    ................
> 03000010: 84000000 00000000 84001000 00000000    ................
> => mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 40000001 11000000 00000003 00000000    ...@............
> 03000010: 84000000 00000000 84001000 00000000    ................
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87345678                               xV4.
> 84001000: 12345678                               xV4.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Tested-by: Max Hsu <max.hsu@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

