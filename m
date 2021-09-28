Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mV70z-0004aT-Du
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 02:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV70x-0004Yw-Jd; Tue, 28 Sep 2021 02:54:55 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV70w-0006Vi-AN; Tue, 28 Sep 2021 02:54:55 -0400
Received: by mail-io1-xd35.google.com with SMTP id b78so20674090iof.2;
 Mon, 27 Sep 2021 23:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+u6YbFSJCN0l+3OK/ir4bU8Az2LUz58et7dxeOIn+g=;
 b=fZ43rBv9G2reAHyoDF+uIoo10Jv/BLRAMx2d87WQpgEF28jKEL+6yWmFrsML7y/ewY
 IFEPcXkwSqWrw58q7IQj1H8M/AYnY3q1D1uZqIqWeacruMulhJi4TO4Hj8Ttv+H7qGQI
 q2xMlaF68UDDRvt29YWAs0y9glsA404qLnkg/vpGssWYKZD2P9KB/lcNiI6O8faAhshE
 9y75tr+mgNt5eSqz2OELF9dzgGLPP6XjaH+5B1xA1PiWVNl+gwZjb8Vv2KwU2yOAq+Qi
 M974FEGESMqSCPpIBCXNvzJ4loTk3LgKUM3wxxW6iBtKPqT5pZPUCBK8ucmb/RB3KH01
 9Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+u6YbFSJCN0l+3OK/ir4bU8Az2LUz58et7dxeOIn+g=;
 b=dJoQerfH9B2U3AE6Nis0bUvYOAgmhtIxMdfwa3urVOEfvN5roQyCZkxUE0jQVJjXVN
 Z1Yi/XM989eCN95tvWBZA8fJc/XYPVh6qFw8QEzY5csll5LSM+TgHVhjUj2Xku0f8mT/
 9kWX63RBWf0wUnxUW86GnS0CnY8F0GKAMZ2dQCKHk+Hb9jVpF4I782c4TX4iccuLd2ID
 qoo8+L7JHGl6ceyvN6fsKlPOWNeRwA3sKluKcnjyMcos9R+x8ybV5LW55X5w856j9eao
 QjuomJFJKry+oKc+miPFr3TfZZjSIkypEwtYXx+9PSH/nofuda6II2KoDw2ToMMpupcq
 D09g==
X-Gm-Message-State: AOAM533lRP/NCKemQ1NFKGiW5OO+piRetwifcVsvHGSGVJ3yDODntgpn
 0fOiYY279a9fnxCKbeN+sRmIshhc1LRkntNkrbQ=
X-Google-Smtp-Source: ABdhPJxeZbadrU2TcX0p5k4JQJAdCavjaQR6TSy+txY1KeNmPf9rDRVbZJTCkPUu4DGa+rKYceZhlaM6a2etHvBLkNI=
X-Received: by 2002:a05:6638:25cd:: with SMTP id
 u13mr3213015jat.114.1632812093188; 
 Mon, 27 Sep 2021 23:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
 <20210926105003.2716-3-bmeng.cn@gmail.com>
In-Reply-To: <20210926105003.2716-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Sep 2021 16:54:27 +1000
Message-ID: <CAKmqyKMmU9=JZ6oFKmSm41EE9Mu2=+efruN74z5tSHMdEAumrg@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/char: sifive_uart: Register device in 'input'
 category
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 06:54:56 -0000

On Sun, Sep 26, 2021 at 8:53 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The category of sifive_uart device is not set. Put it into the
> 'input' category.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/char/sifive_uart.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 278e21c434..1c75f792b3 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -248,6 +248,7 @@ static void sifive_uart_class_init(ObjectClass *oc, void *data)
>      rc->phases.enter = sifive_uart_reset_enter;
>      rc->phases.hold  = sifive_uart_reset_hold;
>      device_class_set_props(dc, sifive_uart_properties);
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>
>  static const TypeInfo sifive_uart_info = {
> --
> 2.25.1
>
>

