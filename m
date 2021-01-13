Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzkcc-0005NW-DX
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 13:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkcR-0005LI-6R; Wed, 13 Jan 2021 13:11:43 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkcO-0005tS-SM; Wed, 13 Jan 2021 13:11:42 -0500
Received: by mail-io1-xd29.google.com with SMTP id q1so5971732ion.8;
 Wed, 13 Jan 2021 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChPvUSF+Da/Ky3+8I2uwkqQn2O3s/I/de+edvRfCnHo=;
 b=KNztZjMeJTghFee7C3GCN4TQTjl84vW2YhH2Fr1ysiWd+K6Sn6QKBpE6+a5YLa/lPx
 BVv1L1J/ArhYiQ2AkWyEv+4fRm1VFkfM/v1JyppFW4lyRqoKhKFte8YaW2VoRSY21ZuT
 s0lrkCw6/3y91M1n2DVyr3agGWqsUMV1d/eUw8tHugtmXGhp5pIZfhHoLkT/McliEPfb
 jkq3yDFv0GALlHO/Dk/hAS4na3tec9w58Rq8oNbb7XYlte+hbQ0uePq+NCBJNuktk7/+
 SFvC0tAcsgjlu7x2gyzZxyjb0KbHdDi9WqqqdsUYFl+nnn6AtCaYDkR8BDyGIU8y0UxB
 nWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChPvUSF+Da/Ky3+8I2uwkqQn2O3s/I/de+edvRfCnHo=;
 b=qZHv0h4RNOGUIAr8rJzIGaVwyrfgL2C0hnI0hfIbfoS53lneulc8C4hVNZzYzHUsiw
 Fuyh5wRvc/gEInnDc9S/wBJC+1ZrW3bOBZ/F/6ZyNPHHilhOjBnbm0oWD7zlDNIaoFo5
 fF6et3/I4CO4T4pioLN0VisPLqK8L6tNP5riANoFPtPHljzgu+JCabn70A4RLd7xxoSA
 5j5wabC8hyueWZ7+ZokOUy3L+kkD7vm4ZshqU+4NSXnUfcaCJ+TVMW19QD5+noimR941
 tpdffPOjk7pxYqI/VaOtu2wVkMvEqg+uGjcOCkOm+LnGbGIH+BIcjIImTGtbpSlI1zAv
 uwvg==
X-Gm-Message-State: AOAM532Dr/836Oz+q2GW97AkBmWe7MMe967XFeZjXvRrT8wjHbCMewIN
 qM/hbuUz4TXLwqIKvENe+8zWTTKZZsxLv5nqRnk=
X-Google-Smtp-Source: ABdhPJzWKpZg2ElOH8x/7uPdatS9DYBxK4KAvDG8k9fPx/FvQ8VJj8GU7kNJhfYbUo7wLY07B3HQkh3SEm8NcIhlBkk=
X-Received: by 2002:a5d:9514:: with SMTP id d20mr1313308iom.118.1610561498110; 
 Wed, 13 Jan 2021 10:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-16-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-16-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 10:11:11 -0800
Message-ID: <CAKmqyKPNN30gCQqGxyvRAexnaGYDDnD9min8Yc1ZYU=KWioC-g@mail.gmail.com>
Subject: Re: [PATCH 15/22] hw/sd: ssi-sd: Support multiple block write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 18:11:45 -0000

On Thu, Dec 31, 2020 at 3:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> For a multiple block write operation, each block begins with a multi
> write start token. Unlike the SD mode that the multiple block write
> ends when receiving a STOP_TRAN command (CMD12), a special stop tran
> tocken is used to signal the card.
>
> Emulating this by manually sending a CMD12 to the SD card core, to
> bring it out of the receiving data state.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/sd/ssi-sd.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 21a96e91f0..6cf5d749c7 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -99,6 +99,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
>  static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>  {
>      ssi_sd_state *s = SSI_SD(dev);
> +    SDRequest request;
> +    uint8_t longresp[16];
>
>      /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
>      if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
> @@ -115,9 +117,31 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>              return SSI_DUMMY;
>              break;
>          case SSI_TOKEN_SINGLE:
> +        case SSI_TOKEN_MULTI_WRITE:
>              DPRINTF("Start write block\n");
>              s->mode = SSI_SD_DATA_WRITE;
>              return SSI_DUMMY;
> +        case SSI_TOKEN_STOP_TRAN:
> +            DPRINTF("Stop multiple write\n");
> +
> +            /* manually issue cmd12 to stop the transfer */
> +            request.cmd = 12;
> +            request.arg = 0;
> +            s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
> +            if (s->arglen <= 0) {
> +                s->arglen = 1;
> +                /* a zero value indicates the card is busy */
> +                s->response[0] = 0;
> +                DPRINTF("SD card busy\n");
> +            } else {
> +                s->arglen = 1;
> +                /* a non-zero value indicates the card is ready */
> +                s->response[0] = SSI_DUMMY;
> +            }
> +
> +            s->mode = SSI_SD_RESPONSE;
> +            s->response_pos = 0;
> +            return SSI_DUMMY;
>          }
>
>          s->cmd = val & 0x3f;
> @@ -126,8 +150,6 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>          return SSI_DUMMY;
>      case SSI_SD_CMDARG:
>          if (s->arglen == 4) {
> -            SDRequest request;
> -            uint8_t longresp[16];
>              /* FIXME: Check CRC.  */
>              request.cmd = s->cmd;
>              request.arg = ldl_be_p(s->cmdarg);
> --
> 2.25.1
>
>

