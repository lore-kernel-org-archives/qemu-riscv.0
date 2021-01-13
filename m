Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzkR2-0003v2-Aa
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkQz-0003pt-V7; Wed, 13 Jan 2021 12:59:53 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkQy-0001U6-AV; Wed, 13 Jan 2021 12:59:53 -0500
Received: by mail-io1-xd36.google.com with SMTP id o6so5859705iob.10;
 Wed, 13 Jan 2021 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rChWHeBFbx9HDZfuNq0im99M0g+57IB6smclGGT1qQ=;
 b=Tcyx9iGp1KpwymetsLAYgzkOZLUd3O4becV8fz4yJrhakLEd9LrEaSbiluc6Bt2taB
 GAx4DgUpn5XyJb6cSPs22R9B19oHeU1e+ooOoLWWOxAdPtzOXV1m6WsSLt5wo4p5P+10
 jAKMyUVSxMxy8h+c0GUhohVJMXw300M35KAsd8z+I4dBaEQ1AVwFxMfaN4nT0mg/CaPn
 ywSAzdLoiYv9NRtkFFe5xkBuLPvGQXmy7NhcBfIYiajLY3/t7kC3BOSLSjnfDWoFXphA
 XjL2s78aKU0AZA1pP/ZS4MnSnZRQXaVa+Rwhl+BjcpMvxAfD5DXfPXh58Vuk8I26A1xv
 MFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rChWHeBFbx9HDZfuNq0im99M0g+57IB6smclGGT1qQ=;
 b=PRp8dRmKGHZeqCgS/1riND38aBcS+nOriUm7debCKKpZ0lH4zauNykY2ZDX2AdJ6MS
 NjY5AVyQy/AkAIp70Q2ZlWkbkYpLOh6yxIg6yNJY0UzQKjPxBkSuH42LMidwzMHN9l6c
 N780queHj5aVsC2m8+ReKlw3hna8lBOj9mMGJEp7W17LnZEjbsNooyDB1nY61oGl5gkV
 l243Y9Lc6PXlXwSrxUq5D+MnMqOdB3nsJDpgYokA6fyoO3MqLxA0xP81WqPKrJpGZB9x
 qM97Pqz8izjzpIMjtdNCZyYoUFEOJRBD57+GqgVPMCxzTLTIjjD0y0P0Dj4MJpMYV0Cp
 11Ag==
X-Gm-Message-State: AOAM531YTC9ztAACGZDKdbJ6BiuD2eXWj1soF+gCA3MNcDlpPEvkjLMa
 Kt+uc4KI0JnA5uShNsrlDbEmeTJ3sjP8yW0Ycuc=
X-Google-Smtp-Source: ABdhPJxfn44bYzZnVdl4T0bYzOiPOs1PTPxxmI1Jout/fq+z9hDFaad5KBSCOIpVtb1HMVGkVURmnG50y799q2skB1k=
X-Received: by 2002:a92:c942:: with SMTP id i2mr3331734ilq.227.1610560790454; 
 Wed, 13 Jan 2021 09:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-13-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-13-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 09:59:24 -0800
Message-ID: <CAKmqyKNYtSvFybFeSC7mtWSibBaDS0bhMnFvgkBNHAY1X-aOjQ@mail.gmail.com>
Subject: Re: [PATCH 12/22] hw/sd: sd.h: Cosmetic change of using spaces
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 17:59:54 -0000

On Thu, Dec 31, 2020 at 3:46 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> QEMU conding convention prefers spaces over tabs.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/sd/sd.h | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 59d108d453..05ef9b73e5 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -33,27 +33,27 @@
>  #include "hw/qdev-core.h"
>  #include "qom/object.h"
>
> -#define OUT_OF_RANGE           (1 << 31)
> -#define ADDRESS_ERROR          (1 << 30)
> -#define BLOCK_LEN_ERROR                (1 << 29)
> -#define ERASE_SEQ_ERROR                (1 << 28)
> -#define ERASE_PARAM            (1 << 27)
> -#define WP_VIOLATION           (1 << 26)
> -#define CARD_IS_LOCKED         (1 << 25)
> -#define LOCK_UNLOCK_FAILED     (1 << 24)
> -#define COM_CRC_ERROR          (1 << 23)
> -#define ILLEGAL_COMMAND                (1 << 22)
> -#define CARD_ECC_FAILED                (1 << 21)
> -#define CC_ERROR               (1 << 20)
> -#define SD_ERROR               (1 << 19)
> -#define CID_CSD_OVERWRITE      (1 << 16)
> -#define WP_ERASE_SKIP          (1 << 15)
> -#define CARD_ECC_DISABLED      (1 << 14)
> -#define ERASE_RESET            (1 << 13)
> -#define CURRENT_STATE          (7 << 9)
> -#define READY_FOR_DATA         (1 << 8)
> -#define APP_CMD                        (1 << 5)
> -#define AKE_SEQ_ERROR          (1 << 3)
> +#define OUT_OF_RANGE            (1 << 31)
> +#define ADDRESS_ERROR           (1 << 30)
> +#define BLOCK_LEN_ERROR         (1 << 29)
> +#define ERASE_SEQ_ERROR         (1 << 28)
> +#define ERASE_PARAM             (1 << 27)
> +#define WP_VIOLATION            (1 << 26)
> +#define CARD_IS_LOCKED          (1 << 25)
> +#define LOCK_UNLOCK_FAILED      (1 << 24)
> +#define COM_CRC_ERROR           (1 << 23)
> +#define ILLEGAL_COMMAND         (1 << 22)
> +#define CARD_ECC_FAILED         (1 << 21)
> +#define CC_ERROR                (1 << 20)
> +#define SD_ERROR                (1 << 19)
> +#define CID_CSD_OVERWRITE       (1 << 16)
> +#define WP_ERASE_SKIP           (1 << 15)
> +#define CARD_ECC_DISABLED       (1 << 14)
> +#define ERASE_RESET             (1 << 13)
> +#define CURRENT_STATE           (7 << 9)
> +#define READY_FOR_DATA          (1 << 8)
> +#define APP_CMD                 (1 << 5)
> +#define AKE_SEQ_ERROR           (1 << 3)
>
>  enum SDPhySpecificationVersion {
>      SD_PHY_SPECv1_10_VERS     = 1,
> --
> 2.25.1
>
>

