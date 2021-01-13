Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjYh-0002Au-Ud
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjYg-00026g-0S; Wed, 13 Jan 2021 12:03:46 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:42643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjYc-0006Kp-O6; Wed, 13 Jan 2021 12:03:45 -0500
Received: by mail-io1-xd36.google.com with SMTP id b19so3029176ioa.9;
 Wed, 13 Jan 2021 09:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4dgdkayyPOUflEN8h09jggZzNwLcT1a3WI/WAbNj3fE=;
 b=b0eNzWyFSKXW8hfL3Anm/67Wda30TN34r7sWKTQkg06Adb8Ux1RY7tGqsp+uRYbkF3
 laqf68L8pyadHbKnOS9K/5sRG7YwBgG1309n3Hg7id1ykw6nbNKTBa7wZB3vS/cTiYAm
 Xp5IZxGeNW4Pgghs2k3Y03yXQseZ89BUdhbWLyVdY7IwifAi89bskBrnXI7YXBBJcqbr
 J3e/4Z+0eM2WQ/0INYuZVKKHVOJj2jdqBsqmrAzaRZSkTgp1oN5lvBMUt8aY9WY4TgEm
 IP0T3fOjRaQDoFLOpL1nsCbj6eeyTDKopZ+FKhcabwPwqdSatLDBdI2DSYq3VGQBg+TM
 HA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dgdkayyPOUflEN8h09jggZzNwLcT1a3WI/WAbNj3fE=;
 b=nmF+OB3A5CSxATfHHjTryNl1eNWcnz/BJ8KpGssYcaC9TpfCUdmZZlmzUTdOTJ/Knd
 8j7bjPQcodL8xUmYtRfQqiDOjZfPK6l+Rphd3c4hFnU4UMLO4w2kZ/Te0uKKOOPv/k1v
 6EtbOXSD6q4/gYw1qlMKvFo4rYN+Eu+nQ/Y2RIrN6tHbTVHEiapIKYcpEtnIQJPoJ8I6
 5LcvBm4Mt26e3uXjnhWaxdgJVaGznEh/7FsfT0R/3jO9HRSXz22r/niXAyFUDM4ceTzl
 UAL61gaqRxBMOL0XtxBjbuEAAL1vbtEiqL1iDd1oiEV1yNyABRiHYQM3KPlOP8VViUVW
 qG7w==
X-Gm-Message-State: AOAM530YCxpwtArggWyYonc4eO8tOD3XEt7uKRqzN7icuJz3VnKLxXNT
 ESD6RSUOeOVDubF+5l8W5cky29tWaf63oDTL9Ps=
X-Google-Smtp-Source: ABdhPJwXsGixB9LqX5yrIv05mkl0vxkVBLtMgX78ZB1fDcFlRaYEGWOPnBYEa94TZ56UvYqTNby06y2Mb2M90OsMu7o=
X-Received: by 2002:a02:a419:: with SMTP id c25mr3199962jal.91.1610557420686; 
 Wed, 13 Jan 2021 09:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-12-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-12-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 09:03:14 -0800
Message-ID: <CAKmqyKODV_OrmbFMPfEPWb+m92ScKgTS8xkaWMRRbJHM3Dm0QQ@mail.gmail.com>
Subject: Re: [PATCH 11/22] hw/sd: sd: Allow single/multiple block write for
 SPI mode
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
X-List-Received-Date: Wed, 13 Jan 2021 17:03:46 -0000

On Thu, Dec 31, 2020 at 3:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present the single/multiple block write in SPI mode is blocked
> by sd_normal_command(). Remove the limitation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/sd/sd.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 1ada616e1e..67e5f7c05d 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1229,9 +1229,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>      case 25:   /* CMD25:  WRITE_MULTIPLE_BLOCK */
>          switch (sd->state) {
>          case sd_transfer_state:
> -            /* Writing in SPI mode not implemented.  */
> -            if (sd->spi)
> -                break;
>
>              if (addr + sd->blk_len > sd->size) {
>                  sd->card_status |= ADDRESS_ERROR;
> --
> 2.25.1
>
>

