Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mV6z2-00013C-AS
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 02:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV6z0-0000zy-Qb; Tue, 28 Sep 2021 02:52:54 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:41487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV6yz-0004pd-1P; Tue, 28 Sep 2021 02:52:54 -0400
Received: by mail-io1-xd2a.google.com with SMTP id q205so25950869iod.8;
 Mon, 27 Sep 2021 23:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1PE0SENtU9S6Q2rRu+eY7t351eJJlB5+ljVrS6qDq5M=;
 b=D6xFkpO8cDYzmJBlTbXAsJ1C2Eg0xHz4Ba5aVpkTXEwzCyBJRZuIf1fYwo2B9w7Ujb
 kpe85k+ZCq3U1qKRYjd5fdte7d7Etrxp7GxoqCYxcWY7Do5nBXH0devjbRDilpNURQ0Y
 7qZtVmhGM9UPbj6rkDyT4NK5dqg290s7vWbpOphx3I8LY2vHGV6SE/tJ0r9GUjCAoq9j
 1VJUNXYsgHDufdx2+VJ75/cOgD5XekLeE9U/41anyGzLQ8qnO9lVXo8rzgEqgEeUtV2w
 rdzLLynw2MlHcIb5JbCeVL3qhxox9TgPuvsA4G77eI0+ADStCC3xu7ARfPrvN3xiPmOY
 eXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PE0SENtU9S6Q2rRu+eY7t351eJJlB5+ljVrS6qDq5M=;
 b=z54BIh0LkXUAKAErolzLP+M3Sg83PC2qN1e8baTD+I8nONDbuej6u6pXzdQF7Ujfl/
 k2HTpoyl2sqrsDgtHlGVi3SGk3tGmS8E6rFKBEMKaV1H10piExtgnaU1DBlu1qv9XmKg
 q9DbQsw2MtkW3Aud3RCoR8KDexkFFNpf0993nwNcm3uj6fgeXoe82dGnxhUTMsiOAHnL
 ZCEOxsGjX5F/efxhIs3B3fskYWuJAzFoxiuHWjJ5pyvkC+AMbPuctzZdlGCscjD+pwsd
 heiKFRFa5eQ7gTRyIIs8dT2lQSuMi3tbSWcVfvl6Jtt8toUYa8awTBbv/PCKSX2BgdE4
 tU8g==
X-Gm-Message-State: AOAM5315GKdX3Ou3DWbNaGiPN3SeE93NhxwlKM0CyVOcvO7KmdJhO9Bb
 YfMTZ30ugoKNujU8oVUJ5HcyM4fvzb0qSW+aybQ=
X-Google-Smtp-Source: ABdhPJzKSw/eQN9FH6GH/lGGh2eLQM17BCJkpz3/y+U5DMIwd29Ij68lAY4YSG9+hW346Xyc35rH+fYx21xcpa/qtYo=
X-Received: by 2002:a5e:c101:: with SMTP id v1mr2855630iol.90.1632811970962;
 Mon, 27 Sep 2021 23:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
In-Reply-To: <20210926105003.2716-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Sep 2021 16:52:24 +1000
Message-ID: <CAKmqyKNuDYrGOzZid+A4V638t8juo-Du+u+cbEhwY3Y81TJa+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/char: ibex_uart: Register device in 'input'
 category
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
X-List-Received-Date: Tue, 28 Sep 2021 06:52:55 -0000

On Sun, Sep 26, 2021 at 8:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The category of ibex_uart device is not set. Put it into the
> 'input' category.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/char/ibex_uart.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 9b0a817713..e58181fcf4 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -550,6 +550,7 @@ static void ibex_uart_class_init(ObjectClass *klass, void *data)
>      dc->realize = ibex_uart_realize;
>      dc->vmsd = &vmstate_ibex_uart;
>      device_class_set_props(dc, ibex_uart_properties);
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>
>  static const TypeInfo ibex_uart_info = {
> --
> 2.25.1
>
>

