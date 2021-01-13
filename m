Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjqr-0006LQ-5H
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjqp-0006Iy-CI; Wed, 13 Jan 2021 12:22:31 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjqn-00052U-NQ; Wed, 13 Jan 2021 12:22:31 -0500
Received: by mail-io1-xd2f.google.com with SMTP id r9so5659456ioo.7;
 Wed, 13 Jan 2021 09:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p3XeLmL+EqyMJBnKOgp74A16p7ga2Zbo0nHwMAsbgVA=;
 b=IKyRqwJSoDh6filf1qXOMRz+fC5UcZIV5u4d+ei3fYvxIsQayaN2DylnTSSy9BUZLT
 0q83tu7VVkVNH7w5TAjUukgYnIkEQe6OmCncG+5C0twXmI/32YO9Mnmsb2g1MIPbo8uH
 Mdu/aQuVTfnXdCPNA25PYRKcbO2oGMEYExWJH41KQmkS2U/SJgBR1GfIn9K3Oi5tRm63
 qellq8dRdywukbyhZv6GQvjwtpDNaklTXnR/Ff4tMbq841tnBoQAzv+cxi5zCYjll22Q
 IP7ni8bHPbsGbdRflq1bubvdyhXtpJT19dXVNYvzAKrA36B0QoxSpv0Z1YYx5e8rO/+2
 hItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p3XeLmL+EqyMJBnKOgp74A16p7ga2Zbo0nHwMAsbgVA=;
 b=V1thJ66GGD56o7zpjo0orlbOfTsgjKf3EPYSLEb3RlzwCQt7PH7P5sq4C8JBUTAU0l
 apFfhf9R4yx9ioBuOkRjYxkPCnzls8IUA/gwvRH8aYPaLdVmTLgIti6IQSCgnKBH3bGU
 vP5IfjsYJ3jWQVoIAlyNn7oBCFIeqSB0OZJabef2iaN+DEjTI2Db2PjjSJ5C4XNwCAcs
 soiuMsOBLqgPwJWtsp3Lf3Wxooff3t5ohgRBfq14IleRzbqtJpRb5l6W7ZAgkxHTXxEc
 sg1kyGZNbA8T+L17J7cOzZAszMU/prxv7emHcnLCNnh/PSAjJ3w9kXNBtT5ovn8kD1tQ
 ldHg==
X-Gm-Message-State: AOAM53238aIdD6NBCfa86gsyubItnHHdWtIxafV2r+n6Uz2oQf0yoAUk
 JQCBGIW+k595zI5DywHsf79KStpnO1UlEAfTzCg=
X-Google-Smtp-Source: ABdhPJzbF2eRdWTG42pjonpahP8l2LpCYcixSOBmABPhPorayKTmDMZ4+FIf2CCbWQRDSJyKJm0NXfJ+7zS8Bdg+NSE=
X-Received: by 2002:a5d:9514:: with SMTP id d20mr1175368iom.118.1610558548079; 
 Wed, 13 Jan 2021 09:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-14-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-14-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 09:22:01 -0800
Message-ID: <CAKmqyKOT0TrCu+z76NiaAntsyzTWws22dfsa6Ks640WzkM61Ag@mail.gmail.com>
Subject: Re: [PATCH 13/22] hw/sd: Introduce receive_ready() callback
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 17:22:31 -0000

On Thu, Dec 31, 2020 at 3:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present there is a data_ready() callback for the SD data read
> path. Let's add a receive_ready() for the SD data write path.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/sd/sd.h |  2 ++
>  hw/sd/core.c       | 13 +++++++++++++
>  hw/sd/sd.c         |  6 ++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 05ef9b73e5..47360ba4ee 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -116,6 +116,7 @@ struct SDCardClass {
>       * Return: byte value read
>       */
>      uint8_t (*read_byte)(SDState *sd);
> +    bool (*receive_ready)(SDState *sd);
>      bool (*data_ready)(SDState *sd);
>      void (*set_voltage)(SDState *sd, uint16_t millivolts);
>      uint8_t (*get_dat_lines)(SDState *sd);
> @@ -187,6 +188,7 @@ void sdbus_write_data(SDBus *sdbus, const void *buf, size_t length);
>   * Read multiple bytes of data on the data lines of a SD bus.
>   */
>  void sdbus_read_data(SDBus *sdbus, void *buf, size_t length);
> +bool sdbus_receive_ready(SDBus *sd);
>  bool sdbus_data_ready(SDBus *sd);
>  bool sdbus_get_inserted(SDBus *sd);
>  bool sdbus_get_readonly(SDBus *sd);
> diff --git a/hw/sd/core.c b/hw/sd/core.c
> index 08c93b5903..30ee62c510 100644
> --- a/hw/sd/core.c
> +++ b/hw/sd/core.c
> @@ -160,6 +160,19 @@ void sdbus_read_data(SDBus *sdbus, void *buf, size_t length)
>      }
>  }
>
> +bool sdbus_receive_ready(SDBus *sdbus)
> +{
> +    SDState *card = get_card(sdbus);
> +
> +    if (card) {
> +        SDCardClass *sc = SD_CARD_GET_CLASS(card);
> +
> +        return sc->receive_ready(card);
> +    }
> +
> +    return false;
> +}
> +
>  bool sdbus_data_ready(SDBus *sdbus)
>  {
>      SDState *card = get_card(sdbus);
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 67e5f7c05d..f19e38625a 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2036,6 +2036,11 @@ uint8_t sd_read_byte(SDState *sd)
>      return ret;
>  }
>
> +static bool sd_receive_ready(SDState *sd)
> +{
> +    return sd->state == sd_receivingdata_state;
> +}
> +
>  static bool sd_data_ready(SDState *sd)
>  {
>      return sd->state == sd_sendingdata_state;
> @@ -2147,6 +2152,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
>      sc->do_command = sd_do_command;
>      sc->write_byte = sd_write_byte;
>      sc->read_byte = sd_read_byte;
> +    sc->receive_ready = sd_receive_ready;
>      sc->data_ready = sd_data_ready;
>      sc->enable = sd_enable;
>      sc->get_inserted = sd_get_inserted;
> --
> 2.25.1
>
>

