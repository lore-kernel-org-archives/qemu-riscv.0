Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdw0J-0006Po-7a
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 10:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdw0F-0006Nq-AI; Fri, 22 Oct 2021 10:58:39 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:33280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdw0B-0002OG-Ke; Fri, 22 Oct 2021 10:58:37 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v7so7747600ybq.0;
 Fri, 22 Oct 2021 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XeIYA3vKoZzeqIdy2vPgiN6fzJsfbaZtVDBOyfxFts=;
 b=qOzNLubgKhE9UPHvtNgAa7lHkeNzZxgmAkPeQOcPxOLL0u3t7NRbXeNDxiCBqXzGje
 FagvimOxhPUwY7nH/Ms4QRnKy6Yk5rV7ftv9plgE+dv1pnaBO142X7kiLSLIdsKfH7DR
 U/Fezr17ryc+DfzTaWgkSbOYH2eS2OZD6tAhsEGl8t8rfmqpShR2O3RScQ6R90HhwKZt
 5qc1Fdedx1IdTkLR0JnMFrvLK3RxsfiZrZw253KHMH85ZN0FwxtxO+xVMuBXT7igHwL5
 9KgubO/V2AIKPerHUZN3N/ByO5DdXjLU8PhE4d9VYru1jxQ9abDd4GVJ/W8sGCSI52hU
 kWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XeIYA3vKoZzeqIdy2vPgiN6fzJsfbaZtVDBOyfxFts=;
 b=Xb7OdbqekzT+IDWR/pHb0sb9vOyZW+55nZZCt2siYjes+6snB7B8jI1TATeg1ScUNF
 2fi639SVn28+y+g1raypVXX4MCXPcOFnkZQTpwVzeAv0vQ8o35d5MFNo46xyPJjlyh1r
 yx5pFHqVeG4h3CYzUg4B0uSu/2GzkTTa6ItAK0T+I4J9HUQ6VzenBn0hEoo9O4QSh9uq
 l2BMYjuRj60OsNjK3vnQkAPd+057Pncxjj8rK9q6a2nS3+R8Lt1clbD3XcI2BwUkZiG0
 fEtal2u4rSjQJvcy3WTIktDgC2p5xRTc6nmIxbX0FE1ZRKVkjmFKEqZuwnZIUW87FQAR
 /bAw==
X-Gm-Message-State: AOAM53325zYKjqNHSh96jN5UpHbBy/NDyD/R7EnRYtTK3dRrE1yt0fFR
 4T2XLXfBf+y4bhPtrWRPGNLwnnb2cfdAXY1tPZocyI5l
X-Google-Smtp-Source: ABdhPJy1is4CoTOqYBrKwrRGYd4otgi6kFKvbz/9xm5kJxioiRpiNQ6Oo6jaatOlX9OBUGenDW1DA6bmSA/vmSBP/5o=
X-Received: by 2002:a25:3843:: with SMTP id f64mr187072yba.313.1634914713149; 
 Fri, 22 Oct 2021 07:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
 <20211022060133.3045020-4-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211022060133.3045020-4-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Oct 2021 22:58:22 +0800
Message-ID: <CAEUhbmUozq7oYBVdx5FJjzmpzfCo59+dX4rkBeU2h4+TZ_1+4g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/riscv: microchip_pfsoc: Use the PLIC config
 helper function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Fri, 22 Oct 2021 14:58:39 -0000

On Fri, Oct 22, 2021 at 2:02 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/microchip_pfsoc.h |  1 -
>  hw/riscv/microchip_pfsoc.c         | 14 +-------------
>  2 files changed, 1 insertion(+), 14 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

