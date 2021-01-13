Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzkZJ-00031e-8n
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 13:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkZD-0002zH-Am; Wed, 13 Jan 2021 13:08:23 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:34020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkZA-0004Uv-L1; Wed, 13 Jan 2021 13:08:22 -0500
Received: by mail-io1-xd2a.google.com with SMTP id u17so6031961iow.1;
 Wed, 13 Jan 2021 10:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wtdFSjiQ2zg0qJQK7HrD7NYOhHYVO3DtRlu5GEVBbd4=;
 b=vgR6tuKhzxLqUwUR4hse5LbNfsvjTXeQv0xTyXflKI5eiwEnudOGVHBkfRSV/5PSsT
 D/a2x2DZ4S/LBIjIeVBmWTRmq4nZ+hdJBEkuHLjABS1haD7MjOcwdI8+24o8Jsb92roT
 dUz9OoeLrdOgqiCWKJoPdPwACzCgBQoKy28hZ0vKLSJ7Hj823RIP8GXoU/dzrYmEw4jh
 pQpk2+X7mQQlcdl8UkaLLz7Ur7k718KFTs0BhBQg4t4jysZworSG12JxL0qu+0GTAqsI
 /XlCM3Ac3r/J77XljPcMp5TrCHd3TIqoLhirbzgxHC/3zkGTSb+RYWV6v+8tmiXGLnnC
 iL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wtdFSjiQ2zg0qJQK7HrD7NYOhHYVO3DtRlu5GEVBbd4=;
 b=MmSerYko/9DY0jG457nut0q++3YOmC347CofRxXfsk+VhUQIioRv/wCo+gkMAJaBRU
 a3KafQnrovyBv5ySuJwtTgvBZUlew8cHmPNR7REZRZzLWnBcb1CYRX+qy/PGjDn33maW
 5dCYhWSvfZK8pV0tY7ox6h3+wIA5M9FdrZUOSYPKa1Tyfki8xtoMbRxuDP8T/LnKZqtP
 689Dx9q7cLM9LMEdWlrOZkrWLr1ExpzDDaddhSjTi9AALq0VSxPFPQyyUknX0o7YlJhX
 vZpKm8/hsibNV2ncTxCn8GqmlqYWLIFD9yY3Pq6fCMAnsIWJ3hTTe5QnpLdVk36BmoSI
 dRHg==
X-Gm-Message-State: AOAM5332jMQK0IIS6XWIZAPEIZNB5AiMe7xKJuTL/V6WMvJPNM0C/xq3
 HlNeE9467VYlwAXfKX0XaFK4VWkT7IKk+bmAn0M=
X-Google-Smtp-Source: ABdhPJxXUXCI+xBnZxJP+sCjYRYWrpWSQcEAKXw9N/29Gz8ghfBw9txaEkUmy5Su22oi27eP5f7uffMGTmRDgTv2unw=
X-Received: by 2002:a02:5148:: with SMTP id s69mr3586856jaa.8.1610561298902;
 Wed, 13 Jan 2021 10:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-15-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-15-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 10:07:52 -0800
Message-ID: <CAKmqyKM8=iv6_89AYcU5_WkagacVsOwj1Hiit6Aax+rJmLGUWQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] hw/sd: ssi-sd: Support single block write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 18:08:25 -0000

On Thu, Dec 31, 2020 at 3:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Add 2 more states for the block write operation. The SPI host needs
> to send a data start tocken to start the transfer, and the data block
> written to the card will be acknowledged by a data response tocken.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/sd/ssi-sd.c | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 8eb48550cf..21a96e91f0 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -42,6 +42,8 @@ typedef enum {
>      SSI_SD_DATA_START,
>      SSI_SD_DATA_READ,
>      SSI_SD_DATA_CRC16,
> +    SSI_SD_DATA_WRITE,
> +    SSI_SD_SKIP_CRC16,
>  } ssi_sd_mode;
>
>  struct ssi_sd_state {
> @@ -52,6 +54,7 @@ struct ssi_sd_state {
>      uint8_t response[5];
>      uint16_t crc16;
>      int32_t read_bytes;
> +    int32_t write_bytes;
>      int32_t arglen;
>      int32_t response_pos;
>      int32_t stopping;
> @@ -90,6 +93,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
>  /* dummy value - don't care */
>  #define SSI_DUMMY               0xff
>
> +/* data accepted */
> +#define DATA_RESPONSE_ACCEPTED  0x05
> +
>  static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>  {
>      ssi_sd_state *s = SSI_SD(dev);
> @@ -103,10 +109,17 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>
>      switch (s->mode) {
>      case SSI_SD_CMD:
> -        if (val == SSI_DUMMY) {
> +        switch (val) {
> +        case SSI_DUMMY:
>              DPRINTF("NULL command\n");
>              return SSI_DUMMY;
> +            break;
> +        case SSI_TOKEN_SINGLE:
> +            DPRINTF("Start write block\n");
> +            s->mode = SSI_SD_DATA_WRITE;
> +            return SSI_DUMMY;
>          }
> +
>          s->cmd = val & 0x3f;
>          s->mode = SSI_SD_CMDARG;
>          s->arglen = 0;
> @@ -235,6 +248,27 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>              s->response_pos = 0;
>          }
>          return val;
> +    case SSI_SD_DATA_WRITE:
> +        sdbus_write_byte(&s->sdbus, val);
> +        s->write_bytes++;
> +        if (!sdbus_receive_ready(&s->sdbus) || s->write_bytes == 512) {
> +            DPRINTF("Data write end\n");
> +            s->mode = SSI_SD_SKIP_CRC16;
> +            s->response_pos = 0;
> +        }
> +        return val;
> +    case SSI_SD_SKIP_CRC16:
> +        /* we don't verify the crc16 */
> +        s->response_pos++;
> +        if (s->response_pos == 2) {
> +            DPRINTF("CRC16 receive end\n");
> +            s->mode = SSI_SD_RESPONSE;
> +            s->write_bytes = 0;
> +            s->arglen = 1;
> +            s->response[0] = DATA_RESPONSE_ACCEPTED;
> +            s->response_pos = 0;
> +        }
> +        return SSI_DUMMY;
>      }
>      /* Should never happen.  */
>      return SSI_DUMMY;
> @@ -325,6 +359,7 @@ static void ssi_sd_reset(DeviceState *dev)
>      memset(s->response, 0, sizeof(s->response));
>      s->crc16 = 0;
>      s->read_bytes = 0;
> +    s->write_bytes = 0;
>      s->arglen = 0;
>      s->response_pos = 0;
>      s->stopping = 0;
> --
> 2.25.1
>
>

