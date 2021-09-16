Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQz9j-0007zR-0o
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 17:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQz9b-0007xH-Kq; Thu, 16 Sep 2021 17:42:49 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQz9a-0005sH-9W; Thu, 16 Sep 2021 17:42:47 -0400
Received: by mail-il1-x12d.google.com with SMTP id b6so8180641ilv.0;
 Thu, 16 Sep 2021 14:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yjANsIinw3hyglqL40CK1aUAIECQpkyh5gQopmZT2pE=;
 b=RIGk5Fcm7xf2JiHWKjOngVSfB/7hLu0V36S/7JaV+rAgyfpeqzdHcZ2SExN8T03NWc
 6a2nuM57emiUyJjC4Nn7REZiKDBUpn1BPsB88Zve8lwBf4z5zjpNe4mTf+668wR/3FgT
 djFpKyI5TuM5MrNDpswqV8VpFHN3HuNcl4Ucz+LVzuKZij+n8i9zMikbq4TNhuejcwq1
 8cC2T8GTpClt1+4jfbedJXr7WN4y+7iB1a6gYxQW+y8Nqx2DtIMdYIHzRl1QE6ftFsQK
 qWqEHWhtIh90UdMIRbLhYAzwLva16BAiYfHkHgjX7JblD5ny2ZJHjjJvgV4jYff43BnX
 pTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yjANsIinw3hyglqL40CK1aUAIECQpkyh5gQopmZT2pE=;
 b=uwHn+msA2JLk/ZBihmTDRZ3LUOTGA34HBm876k114sX4NW8xnsuHoJVJPpolvWM8Uy
 70iNVYpJc05XuBPFydB8TymBcgzzsUdNBkfjjTZzrbWPg1hhd3hilgAScwqqHZ4zx/Z4
 FGjT5aO3pmlDBbbNMFYeBlKj45NfAtWZncg8B6DGgEZKdq1DeF8Y61S0V75fpWlzFgZh
 XRQjmZksx3SEUsGMd1/Yf7XzBzb5bzuX4b6lHaYH4dnGJGCwxeCYN/Pin+9sJWxE7zzR
 OxaZuzfuKSkKeh+qbC7CRP3omJPp9Ic2nKzsIW6d2hDNOJ/xk1KJapKlTGP7TpFZUBOa
 WlSA==
X-Gm-Message-State: AOAM530SDNT+H5Rw23c/5gF7IgU7h1B/lvD97CeD6uJG9nNeMn8ToO18
 3SSST0+UuuvwE1hOfyKtqf1F4Hjj6LK2FZ/yPE8=
X-Google-Smtp-Source: ABdhPJwjsdHJvPIn/kxBpnUypClJzj4QwsyK/eAfLmYVVzOBOBsj7TtIHuGaInP1DqpRJzYNz/Edi2wlZYfKQiX3MWQ=
X-Received: by 2002:a92:730c:: with SMTP id o12mr5432683ilc.208.1631828564496; 
 Thu, 16 Sep 2021 14:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <d6cb4dfe75a2f536f217d7075b750ece3acb1535.1631767043.git.alistair.francis@wdc.com>
In-Reply-To: <d6cb4dfe75a2f536f217d7075b750ece3acb1535.1631767043.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Sep 2021 07:42:18 +1000
Message-ID: <CAKmqyKO_oC-W3LZKtruOF76tpA7UV5bQdRPfvsk4-jP9dPQb9w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv: opentitan: Correct the USB Dev address
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Thu, 16 Sep 2021 21:42:51 -0000

On Thu, Sep 16, 2021 at 2:37 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/opentitan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 36a41c8b5b..d38c43abc1 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -39,12 +39,12 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
>      [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
>      [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
> +    [IBEX_DEV_USBDEV] =         {  0x40150000,  0x1000  },
>      [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
>      [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
>      [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
>      [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
>      [IBEX_DEV_PADCTRL] =        {  0x40470000,  0x1000  },
> -    [IBEX_DEV_USBDEV] =         {  0x40500000,  0x1000  },
>      [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
>      [IBEX_DEV_PLIC] =           {  0x41010000,  0x1000  },
>      [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
> --
> 2.31.1
>

