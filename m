Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mV70f-000460-KZ
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 02:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV70d-000414-JZ; Tue, 28 Sep 2021 02:54:35 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV70c-0006Dl-50; Tue, 28 Sep 2021 02:54:35 -0400
Received: by mail-io1-xd35.google.com with SMTP id s20so25979049ioa.4;
 Mon, 27 Sep 2021 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4IEW8YTUH+WMLs3wb33RNQknTWTpLh3RlmWEI7SqNCc=;
 b=ob3l9S4kPWTnMYQ+9vTZ9pCFLIDidzDWggoDuPQzT02Oqxbq872C4o+q/576drZgfW
 BNXuLjjpBlWjQhnTKXjKtErL3typByM45UrMnLuYoRO19eCtgpfAk+p1NLN81/7KDRJy
 T6oaauFnmf1c3LTqjnOG8s48kJKDUHYkodyAvu/J/zM6nZZivP8LLR/fmiyfX+03lNfP
 RvDwwEh75x7j9cmagDd8a1Wq0xWQMb6FzvvdWGMS5WoU2IH8z8LTqLltEdBhKm1KSb3X
 NGtEc/xCAFG5uOclFoG6RDv4jUA3zwQzJZKoTwYFDUwui16NH0aEHUQ2pU2QsNgMvuUR
 ZHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4IEW8YTUH+WMLs3wb33RNQknTWTpLh3RlmWEI7SqNCc=;
 b=w2WfI70bKH5KFuXeODk4BVlFz2IGsj8xZZJ7kbq0imQq4KhEhb6U2kvCnbufiCrBvD
 X4VLA45n+ZIHkeqDxtj+RNuSYkEIupJOqKFiL6pHiJhvTab2LSjXtW57UV8Bfmqk7IUO
 H9cpVqA0iO4cwFrWKr29oQPGi1pzw2/aPHViU33wVEZMnqO9B1vTOPJ/x343xSnOqGGd
 oYd3iXG66m/LtbNu7xhEsUxdyt9zZUOiUg9RjezJIAtPFN3aRZxUJoJX6PAmSbvtkHYF
 IjgSXVStvEC1lZVkdeAGDIpFBrqi7/PMmSQsW2vUfpJcf4tj1LiRnGbf8BgnekkWN1Qh
 ejyg==
X-Gm-Message-State: AOAM532MpXLwY52furnXRkxhf6HcssdAoeNYPYccQFkYxHXk9vW3qm2p
 utdifwr3vPkTEECIvZ+wqcfarN1FTLZXXxImVpQr986Xe2lkClQs
X-Google-Smtp-Source: ABdhPJz25FIdJB7LsTvKOlWJ/I6e1iP79DI6PFhosHhRfVZItesr5b7Hd4RvHa8GlDkGnARC31LhY6yt62++WHjfOAk=
X-Received: by 2002:a6b:5913:: with SMTP id n19mr2759673iob.91.1632812072782; 
 Mon, 27 Sep 2021 23:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
 <20210926105003.2716-2-bmeng.cn@gmail.com>
In-Reply-To: <20210926105003.2716-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Sep 2021 16:54:06 +1000
Message-ID: <CAKmqyKM_kDHkpHqM3662rZhz+yy8Ef3wADzO6f7r84dEA=62NQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: shakti_uart: Register device in 'input'
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
X-List-Received-Date: Tue, 28 Sep 2021 06:54:36 -0000

On Sun, Sep 26, 2021 at 8:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The category of shakti_uart device is not set. Put it into the
> 'input' category.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/char/shakti_uart.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
> index 6870821325..98b142c7df 100644
> --- a/hw/char/shakti_uart.c
> +++ b/hw/char/shakti_uart.c
> @@ -168,6 +168,7 @@ static void shakti_uart_class_init(ObjectClass *klass, void *data)
>      dc->reset = shakti_uart_reset;
>      dc->realize = shakti_uart_realize;
>      device_class_set_props(dc, shakti_uart_properties);
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>
>  static const TypeInfo shakti_uart_info = {
> --
> 2.25.1
>
>

