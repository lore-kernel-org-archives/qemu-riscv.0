Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4bdg-0006Gu-C7
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 00:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4bdY-0006Dz-BN; Mon, 12 Dec 2022 00:46:00 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4bdW-0006jr-SP; Mon, 12 Dec 2022 00:46:00 -0500
Received: by mail-vs1-xe32.google.com with SMTP id h26so10167799vsr.5;
 Sun, 11 Dec 2022 21:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MzFJnwjXjfVhxBZI+liKe0vwbxTAUty4M9Dc7fH7HNw=;
 b=HjOqTCjX+L5Nz59xFfwUUbgYnOIHdBTVCOke5mf9fYKWo05vYSd7bnr1p2kVYlhQBX
 pBOTEeS2t07DHEW4l6lj9+/Yue98pDj08xyE9vaz5i6bGkOHvploqu1cxyhj0036qMJG
 jOYdgKgl+9DiHfF7FDtTWtdU4Rp9e0d+KjLmu0y2oxKXSlMYQQPMp1AGxrKtKP2K8NYG
 yxiSz7c6CHXOgf602pizyUMFTh/gLv/VJnS5W3EYjl0uraO4EHSssnTSok01D//QusLp
 MDNackOFuGIPXYFAkItPmCgS46Py4pTSwNUmptWm4EiroxgWDILlx+7c2wBL0lyFkyTM
 5nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MzFJnwjXjfVhxBZI+liKe0vwbxTAUty4M9Dc7fH7HNw=;
 b=wcoxQngBaKfahrM7fCm31rRJvvp6CozkDDOipniNvy5EUluB39XMJpTV8L2MWQM3u6
 vDzoY9nNJUx86ixzzsFBl2lJQzx1kngYcJQoPmHzxCy654tfWgTq8z/fdh3P6n0VYYhL
 kIHmuWA89/P45A0Vgv7Mf7LMK+vojcjkIZrTEj208JN9/f+XKZm9I2cyP/458VBtR6O/
 m/xPO5/i0yyYx6+aCul1iP6U81nOLAr+obgH6zqBR8L3IwRtOEHO5upwFxA+eryPV7G9
 UuDx/ZhaADaEj7qfaWR4kAUtXXXOX4F1C4TUGhwA5+8gvDRjrXgYJimwRymPNscQfxsR
 tEAA==
X-Gm-Message-State: ANoB5pkuYhRO5dw/x3BkvLZbcX6tcBXJ2A9sDS7BzaDVixlwrOdA/aGp
 wT9j9FjwxEARC0dNZl06QgYBR2CLvFyusISuo44c6iJaIWU=
X-Google-Smtp-Source: AA0mqf42KLwkXCzSzGvvF9bORrFKbpW+5gR8mnkbBbTPOR8tSmqhsnL9/qIsPtxZe5wnXGdGnB0L4L5h69OW+BCqAdA=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr18356064vsa.54.1670823955586; Sun, 11
 Dec 2022 21:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20221211030829.802437-1-bmeng@tinylab.org>
 <20221211030829.802437-15-bmeng@tinylab.org>
In-Reply-To: <20221211030829.802437-15-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Dec 2022 15:45:29 +1000
Message-ID: <CAKmqyKN_mWDCvwfvBoghcnHN2RnoAnGGv_xLSu6pdhhKGHLX+g@mail.gmail.com>
Subject: Re: [PATCH v3 15/16] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2022 05:46:05 -0000

On Sun, Dec 11, 2022 at 1:22 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> "hartid-base" and "priority-base" are zero by default. There is no
> need to initialize them to zero again.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v1)
>
>  hw/riscv/opentitan.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 78f895d773..85ffdac5be 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -173,10 +173,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>
>      /* PLIC */
>      qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
> -    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
> -    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
> --
> 2.34.1
>
>

