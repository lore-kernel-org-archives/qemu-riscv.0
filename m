Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjWR-0007Lw-HC
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjWP-0007Ee-5r; Wed, 13 Jan 2021 12:01:25 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:38431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjWD-0005R5-SW; Wed, 13 Jan 2021 12:01:24 -0500
Received: by mail-io1-xd34.google.com with SMTP id e22so5527970iom.5;
 Wed, 13 Jan 2021 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zg2BoYqyHZg+md1cn1N/fMMJ99+dX8gBkh0d257Nd8c=;
 b=tkNjZvlHNE4NYk+tHz5rQlZXFRJgUVwktSxFh4/ii76lWKRNReq0XAO1LWh+0bLaII
 drErzyYKjMUOGvUhNfu0owFNauRyHE0tB0KMdpjnArBLz2tViphzA9a6rBUkoOy3IZcO
 HOwF5Xr0MTW8T9TLeSkVhFnjQQOysGBQDOHn9+cqOj2HUlGDGR+dEFDB9TM4xDEzJyg6
 7dwrKQTExGDI02dnaBxb/YyishOpzOMER48tfCwBIVKddm//4U+Ernz5hOeu7jDsETsA
 rvRtb//W+zFlyflWaKu0cAaOSyxSXNSNXZTj0qYy41pMJ0zpihOV5vbC1Xs7T72uRGCo
 /2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zg2BoYqyHZg+md1cn1N/fMMJ99+dX8gBkh0d257Nd8c=;
 b=ijxG8vdnKALDj7kJ+3i3QM1i++FGCZbc+Zg+jbneglRmi9IWXsU/opB34+lfdA6Omo
 fCjXXop+T1K2R5Nz0LccfEwq8In5Wk/Acl8itvZ6NnaBAlTMh5uvw3paQOnFNieD6+HW
 43wiqLciElvFu+/KScDokZRlCV2XbRyOaN2wnNZMF1EXObjVqzxfjIHBhKUTi6FoOtag
 5FCS5lJ7Ikqr6f9UAxLjw2XDfkPcvtVNeDoYWzG/n+c2id+/BW2+7RsN56/uw52f1aP0
 kHPQj6yL7So1mAi4GbrznOQgNSY3c14rvlSTRuvm2nNmRoFQhxquhKlxxY7t21l+niIE
 3RRQ==
X-Gm-Message-State: AOAM5313F81h7sLvWyThK1f4oQuMbDs6S/GFkd5Jn1FvD4OH1IEFdxVk
 /fICbcEzLcf93RRAIOv2hpfWyK4ENHYOq5qqDMs=
X-Google-Smtp-Source: ABdhPJyuruueUk7TinWbdcquESS+qMr8Ikq2vI2g0i0o7Tvc6qeAR0bzLCkx0x/5yvOrcJJ2K3HxpF5aBdO5cBvFC0Q=
X-Received: by 2002:a05:6e02:180a:: with SMTP id
 a10mr3185442ilv.40.1610557270338; 
 Wed, 13 Jan 2021 09:01:10 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-10-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-10-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 09:00:44 -0800
Message-ID: <CAKmqyKM1dMmDK-uwoS16p9eraWwN+X5=W-AB8FzO+eFRexSa5A@mail.gmail.com>
Subject: Re: [PATCH 09/22] hw/sd: ssi-sd: Use macros for the dummy value and
 tokens in the transfer
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 17:01:26 -0000

On Thu, Dec 31, 2020 at 3:38 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present the codes use hardcoded numbers (0xff/0xfe) for the dummy
> value and block start token. Replace them with macros, and add more
> tokens for multiple block write.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/sd/ssi-sd.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 889260bd8f..8eb48550cf 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -78,6 +78,18 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
>  #define SSI_SDR_ADDRESS_ERROR   0x2000
>  #define SSI_SDR_PARAMETER_ERROR 0x4000
>
> +/* reading and writing blocks start with these tokens and end with crc16 */
> +
> +/* multiple block write */
> +#define SSI_TOKEN_MULTI_WRITE   0xfc
> +/* terminate multiple block write */
> +#define SSI_TOKEN_STOP_TRAN     0xfd
> +/* single block read/write, multiple block read */
> +#define SSI_TOKEN_SINGLE        0xfe
> +
> +/* dummy value - don't care */
> +#define SSI_DUMMY               0xff
> +
>  static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>  {
>      ssi_sd_state *s = SSI_SD(dev);
> @@ -91,14 +103,14 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>
>      switch (s->mode) {
>      case SSI_SD_CMD:
> -        if (val == 0xff) {
> +        if (val == SSI_DUMMY) {
>              DPRINTF("NULL command\n");
> -            return 0xff;
> +            return SSI_DUMMY;
>          }
>          s->cmd = val & 0x3f;
>          s->mode = SSI_SD_CMDARG;
>          s->arglen = 0;
> -        return 0xff;
> +        return SSI_DUMMY;
>      case SSI_SD_CMDARG:
>          if (s->arglen == 4) {
>              SDRequest request;
> @@ -173,14 +185,14 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>          } else {
>              s->cmdarg[s->arglen++] = val;
>          }
> -        return 0xff;
> +        return SSI_DUMMY;
>      case SSI_SD_PREP_RESP:
>          s->mode = SSI_SD_RESPONSE;
> -        return 0xff;
> +        return SSI_DUMMY;
>      case SSI_SD_RESPONSE:
>          if (s->stopping) {
>              s->stopping = 0;
> -            return 0xff;
> +            return SSI_DUMMY;
>          }
>          if (s->response_pos < s->arglen) {
>              DPRINTF("Response 0x%02x\n", s->response[s->response_pos]);
> @@ -193,12 +205,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>              DPRINTF("End of command\n");
>              s->mode = SSI_SD_CMD;
>          }
> -        return 0xff;
> +        return SSI_DUMMY;
>      case SSI_SD_DATA_START:
>          DPRINTF("Start read block\n");
>          s->mode = SSI_SD_DATA_READ;
>          s->response_pos = 0;
> -        return 0xfe;
> +        return SSI_TOKEN_SINGLE;
>      case SSI_SD_DATA_READ:
>          val = sdbus_read_byte(&s->sdbus);
>          s->read_bytes++;
> @@ -225,7 +237,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>          return val;
>      }
>      /* Should never happen.  */
> -    return 0xff;
> +    return SSI_DUMMY;
>  }
>
>  static int ssi_sd_post_load(void *opaque, int version_id)
> --
> 2.25.1
>
>

