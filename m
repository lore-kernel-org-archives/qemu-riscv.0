Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2nt2-0001uf-Iq
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 00:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m2nt0-0001tW-8H; Mon, 12 Jul 2021 00:49:42 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m2nsy-0002mo-Sj; Mon, 12 Jul 2021 00:49:42 -0400
Received: by mail-io1-xd32.google.com with SMTP id b1so21025376ioz.8;
 Sun, 11 Jul 2021 21:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LxCH3O1XZz2nu5nNuTECPvAkvG36zLw0+vP0d9iRmsI=;
 b=o0oVrPPMhJUlWyuImImvqBj0482u6mhGVy6DrSTlkrsmI+LuoZjalq9zOp1OTiQo8P
 iEj7P4OngPLsllvC++vC5+VUwptkdvIOu7ZfKtfnQaTq7skv8+mu2iqDh1u4Ici0AQ1L
 yXZbPrqn5801cy5z+rnMc62k1A4zUOO6pNvLEADRnUWpaPB36cz+VvDJfdnOECg9TqU0
 acBq0nLaVXwzEjDG6UOysM3zvmOgnry+qbJDp6/NZY929Yf7TRtW2PMjE0yR8YqbnzwE
 vf5YU4XkH9boJmHRLYfFlUBKN4BIlGWYlAbGBVlTpcQQTa9uRo9/yY/Nrej0H7m+2zc5
 AiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxCH3O1XZz2nu5nNuTECPvAkvG36zLw0+vP0d9iRmsI=;
 b=jZqJot0kA5YReb3X36+CZjI8R5Yn27g68aNkMNZWS4dpsFrLvKDek22Gn1VQUeYBa6
 bw74uVnFbuq1uSlU1IYX+1oPOZtZKwd5GsFuKzSSRcO+daOgVri4j8Q5YR9wc8oBNdVa
 oVizF2PBQzuoZO5qGFERhUKmvxcNcOvrFNW/bLBSSQG6yqLxwMbg+H6HHPg0Sy/PcTX/
 jYLZdzisaFQpB1C3vhPn3A8/MJGFoE2yRtRow+J2oQkHySyr0cNJvJSTMiqPqavL3PJk
 qlKiOOkCdnLATu6+1EXlQAWM9wweHDVMqRXrvqzbVsFl9gjL3fIDIpdcEFJSmlCvi1V9
 /DMg==
X-Gm-Message-State: AOAM531knBbyznekNuuqoiz/IH/rgWs88nb58oYU3bon7pGqyDwCKd2v
 +06Z/UyeYdCcnDfLKqoAYK5tZboihOboJXtV9Dk=
X-Google-Smtp-Source: ABdhPJz/keJ8LILLQCewA1nz/TLbJsltj1YLQ0f8E5xFMuakoearOuskBkfJL6uic3R9VMt5NXpWsJ7rJu8KS+4Pp0w=
X-Received: by 2002:a5e:9703:: with SMTP id w3mr37850459ioj.118.1626065378727; 
 Sun, 11 Jul 2021 21:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
 <aaa5d8dd-d161-684e-4204-e5bb60a2627b@linaro.org>
In-Reply-To: <aaa5d8dd-d161-684e-4204-e5bb60a2627b@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jul 2021 14:49:12 +1000
Message-ID: <CAKmqyKMnWch1PvOaEcJDXV2kHmgRsGZN4eXp0RZ2gV4SFunKXQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Mon, 12 Jul 2021 04:49:42 -0000

On Sat, Jul 10, 2021 at 1:36 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/8/21 8:30 PM, Alistair Francis wrote:
> > +typedef struct sifive_clint_callback {
> > +    SiFiveCLINTState *s;
> > +    int num;
> > +} sifive_clint_callback;
>
> Perhaps better to put "num", perhaps with a more descriptive name (hartid?), into
> SiFiveCLINTState itself?

The problem is that there is a single SiFiveCLINTState because there
is a single CLINT, but we want to have a timer callback for each CPU
so we need something here that is per CPU.

>
> It would avoid some amount of double-indirection, and some awkward memory allocation in
> sifive_clint_create.
>
>
> >           } else if ((addr & 0x3) == 0) {
> > -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> > +            if (value) {
> > +                qemu_irq_raise(clint->soft_irqs[hartid]);
> > +            } else {
> > +                qemu_irq_lower(clint->soft_irqs[hartid]);
> > +            }
>
> You should use qemu_irq_set here.

Will do!

Alistair

>
>
> r~

