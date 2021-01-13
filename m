Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjVT-0006hm-Fm
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:00:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjVA-0006cL-7h; Wed, 13 Jan 2021 12:00:09 -0500
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjV5-00055s-Cb; Wed, 13 Jan 2021 12:00:07 -0500
Received: by mail-io1-xd30.google.com with SMTP id y19so5561794iov.2;
 Wed, 13 Jan 2021 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1v1xIxIZMIBfAPhA51JVgMJJf/RjXzhelljvVyZPNVA=;
 b=I+IBaAnGXhiLI5nlISeNfSSyrUaTVPZY5dW1FfBgYXH0Dy11ZUCTgiEXTgK6Rf6eUW
 ojYDY/427T5Ayy3auoM1/wUK/5DSiCHvPxxRYGY+gcr6bxg3D5E7lPteRG3E05JjFyKR
 qC3t+aChMWRvqxM8S0kZ2CrOEZ7FjFbRBG3ogjY7mSuHFLGXbzmmURMhFiYwm8Bg0H/O
 vkgBJ0T5hIKlLK5ma9zk142jy2d8tOW7Yiuyk5QSDMfrzuwtkISUTqHIy1UMhS440kD9
 EnIYj1u/V+XNvuHvHYqyvvMOtsXHHNNjCaqagF7vp2BZOXxwxGIbgbhGAU+V39gJWJFw
 vGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1v1xIxIZMIBfAPhA51JVgMJJf/RjXzhelljvVyZPNVA=;
 b=MnSyd3x9aPdIgqcDDbKcUKcA6rbgbYAkLaF8fWKGxGuygfuO5nEdv3nKnlm3zEfk4P
 NgAj00nKwmUSrp9EJXc+CYJlhYIMp4BL0zmykvhWx9WCbTgiQaOnw5q+7x+Bc97KrBBx
 MuWaUPQWwB7XITBfBEdf/U8pwmXkcZ/98JEoZ3tFeg6TM4hOC+VB6k9SBFhYGNZHB6RS
 KnSEdy+9QUwSBpnDIfw9gmeDW5fj9L8ywDG3fxvTJu44spY/xaum6DPiCwCCYyJ14Mz1
 rSkACN06x4NRP8wFkfDgGzoadvd1xgkLDtqLzMrPDR7e3m+apLnk3ZaG01VsirQ6Qa76
 3biA==
X-Gm-Message-State: AOAM532CZQqSZRJGRujaUIaLiIKFoKeYLHdoHOZkHzqnjErxMrtWbSsv
 +SHajiBrz9WzuLSXZaxSERcdyMb2HQT1Zp1FPttBLYITC8Q=
X-Google-Smtp-Source: ABdhPJxzCaUeZSTL6Y8ZzR95P7PdBuOFPLCTjnUEqtELPjS9nt9/l5IhhTKRUpaBT8Pxvsj4ZmjTZhi79Ytv59IPtEQ=
X-Received: by 2002:a5e:850b:: with SMTP id i11mr2428195ioj.42.1610557201175; 
 Wed, 13 Jan 2021 09:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-9-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-9-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 08:59:35 -0800
Message-ID: <CAKmqyKP5=_ZCvN5N3_62NbG7WWftBmtJZfi+3VXTSqgTmdo1TA@mail.gmail.com>
Subject: Re: [PATCH 08/22] hw/sd: ssi-sd: Support multiple block read (CMD18)
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 17:00:16 -0000

On Thu, Dec 31, 2020 at 3:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> In the case of a multiple block read operation every transfered
> block has its suffix of CRC16. Update the state machine logic to
> handle multiple block read.
>
> This also fixed the wrong command index for STOP_TRANSMISSION,
> the required command to interupt the multiple block read command,
> in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/sd/ssi-sd.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 10b0ac2eaf..889260bd8f 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -51,6 +51,7 @@ struct ssi_sd_state {
>      uint8_t cmdarg[4];
>      uint8_t response[5];
>      uint16_t crc16;
> +    int32_t read_bytes;
>      int32_t arglen;
>      int32_t response_pos;
>      int32_t stopping;
> @@ -82,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>      ssi_sd_state *s = SSI_SD(dev);
>
>      /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
> -    if (s->mode == SSI_SD_DATA_READ && val == 0x4d) {
> +    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
>          s->mode = SSI_SD_CMD;
>          /* There must be at least one byte delay before the card responds.  */
>          s->stopping = 1;
> @@ -200,8 +201,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>          return 0xfe;
>      case SSI_SD_DATA_READ:
>          val = sdbus_read_byte(&s->sdbus);
> +        s->read_bytes++;
>          s->crc16 = crc_ccitt_false(s->crc16, (uint8_t *)&val, 1);
> -        if (!sdbus_data_ready(&s->sdbus)) {
> +        if (!sdbus_data_ready(&s->sdbus) || s->read_bytes == 512) {
>              DPRINTF("Data read end\n");
>              s->mode = SSI_SD_DATA_CRC16;
>          }
> @@ -212,7 +214,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>          s->response_pos++;
>          if (s->response_pos == 2) {
>              DPRINTF("CRC16 read end\n");
> -            s->mode = SSI_SD_CMD;
> +            if (s->read_bytes == 512 && s->cmd != 17) {
> +                s->mode = SSI_SD_DATA_START;
> +            } else {
> +                s->mode = SSI_SD_CMD;
> +            }
> +            s->read_bytes = 0;
>              s->response_pos = 0;
>          }
>          return val;
> @@ -252,6 +259,7 @@ static const VMStateDescription vmstate_ssi_sd = {
>          VMSTATE_UINT8_ARRAY(cmdarg, ssi_sd_state, 4),
>          VMSTATE_UINT8_ARRAY(response, ssi_sd_state, 5),
>          VMSTATE_UINT16(crc16, ssi_sd_state),
> +        VMSTATE_INT32(read_bytes, ssi_sd_state),
>          VMSTATE_INT32(arglen, ssi_sd_state),
>          VMSTATE_INT32(response_pos, ssi_sd_state),
>          VMSTATE_INT32(stopping, ssi_sd_state),
> @@ -304,6 +312,7 @@ static void ssi_sd_reset(DeviceState *dev)
>      memset(s->cmdarg, 0, sizeof(s->cmdarg));
>      memset(s->response, 0, sizeof(s->response));
>      s->crc16 = 0;
> +    s->read_bytes = 0;
>      s->arglen = 0;
>      s->response_pos = 0;
>      s->stopping = 0;
> --
> 2.25.1
>
>

