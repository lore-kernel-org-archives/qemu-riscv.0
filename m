Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mV9Ge-00057g-Qu
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 05:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV9Ga-00055O-VY; Tue, 28 Sep 2021 05:19:14 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:44636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV9GX-0001OM-WF; Tue, 28 Sep 2021 05:19:12 -0400
Received: by mail-il1-x131.google.com with SMTP id b12so10740063ilf.11;
 Tue, 28 Sep 2021 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYFPv5lNK4VDHu9KkerI80tRMy7EbnduVugAEJAoUvY=;
 b=Csp0rmpNaOOR25SAAiXDcu7zUt0I/zCAYlwhsnjmcNNtib1ID8NhBVa3QbqZDt/OB7
 5LfltIW+EkCc5cqhp5iPOUJzqTJaNHgqP0bfic71HvX7J9YQQNDYnToP4M18ryyFyBCy
 rxT4aRu0/XT5a9SF0whvDMlnRlOzhXBB0iA/bAxvCZVewL6cZExX/PiHIx3iZFDxh8VV
 Q7dXMSQSWztvrKUNcIobRAV5ao2EMbD/bSSvCpxxCByudfdWgOnlZB9h+j7ZdH5oItqT
 sXjyJVLfkCp/ekPliduvdn7lbrWcevnf6nku6CjUTiTlVnYXP+mTqfLEIbSDeehJLB0d
 9Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYFPv5lNK4VDHu9KkerI80tRMy7EbnduVugAEJAoUvY=;
 b=fWdfbBCwAKyiGJgPnCnonzJedIkXpQjuGnT2ZEjwq9oyj//0oI/nP6ZFWn//0acQzU
 ohLb2n0qSNB9iMknL5jv+bE85QmBsImsQXiGNubx9NEPeBM+bMUuDMYOdBhWZu+Vw9C+
 Z6Iy8Ia1ZKpjyt+vEFHkmJKL9lSZypiGEXwGL7rA4jh8bYs0G+mGuqwPyO8FrvvCBPDM
 ZjU4BKI8lsBgUTSEEyin/zZnt8R7zTmb2TA1+Bh/fFvZhFb6QFr7AczZaWTWokL8jKOb
 YSWUSzgGnYiwyEoHHWOni7K0URVkZBwXNNMjWwVst+osqscz5ltr/kpAmdAnEf7hQUxA
 U6Uw==
X-Gm-Message-State: AOAM531np00Qovs19wnpQZF54WXOE6xSEeOjdxCMI8tLhrwsrtcTQhf+
 ZHi2llR+3IaD8h/gA+E+7L6AJLNzWUIphwcs4FY=
X-Google-Smtp-Source: ABdhPJyxTo+ByI4u725EBQrrq6QFUQCH8L24YJ2NxfztdHFPZWC/CV0Rl8D+LZMurQPtm8/xerbng/+yjYdpB16U5a4=
X-Received: by 2002:a05:6e02:1be6:: with SMTP id
 y6mr1317001ilv.290.1632820748614; 
 Tue, 28 Sep 2021 02:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
 <20210926105003.2716-3-bmeng.cn@gmail.com>
In-Reply-To: <20210926105003.2716-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Sep 2021 19:18:42 +1000
Message-ID: <CAKmqyKMyJTb6wUcowbVtzv1ZnEpzKkrKcm8hfoS8j80nZs4i9w@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/char: sifive_uart: Register device in 'input'
 category
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 09:19:15 -0000

On Sun, Sep 26, 2021 at 8:53 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The category of sifive_uart device is not set. Put it into the
> 'input' category.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

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

