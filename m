Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUkUO-0004FY-7r
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 02:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkUH-0004AI-2n; Mon, 27 Sep 2021 02:51:41 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkUE-00034J-S4; Mon, 27 Sep 2021 02:51:40 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i84so21631411ybc.12;
 Sun, 26 Sep 2021 23:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=49NInRUZ5IROEEMWbnzn+apyDRL2z/O380AvQicslsA=;
 b=prRLkCxjDnVvLXIziRaL4ym39sBUtP1JGAF2sD0PRl1nzRGNCl/NIdjCObe3p0UJ+p
 ZxxGzPGy/0iPkFaSomwH2AlENdYBh48+OaSnO582c83IupCeL8/q7HvYhbmRkGTLfXb8
 /7KS2iNxOYx/gDOznjgyzIzdtKbT3FGk+exeKGGtlvlN18u5bsno71gnAe3F3yFqi1d5
 kzMEx3dMFh+xh7W8GSCkJlLVOlK6tJEwdV6xa00gvxiEnu1xfpP3Tv1JYxtd9PSx5ljf
 3rz5TaXQ+FylKRpxcShy/xlm46jyHc2oG7YCYcDyDIf8SaO/m9D0JZfgAhkZhjQjCFqh
 S9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=49NInRUZ5IROEEMWbnzn+apyDRL2z/O380AvQicslsA=;
 b=dmEsxmiZVzFfbYChvvTXxqymxYv3MGLnB0yTcQUa4tvJ1Bhxzs/VCsyYGu5/1YCOVY
 inNzkjyZMYlq7kmYlpIoYr3m13YsiVAccWj4ZvMvtxvYehEBhYr7eNLlYK2D4P5hbftq
 TKEsZmCa62z8Fu5octmvQlJBi5g+M6eprxskQQh9sXS+nseisOmEFap2VoNyvEzmdU66
 cWbcIUkxQsVhSNq0nL2Sd+m7lgZPuRFWzIX72p4h1ZUTiyu7lq69UDhdC4HsisnNb6Gf
 QUIVJ1CZJjdcIbH+Lecq+vJlqZA0YhJuT4L1BwaMfqpRRQSy40ftF9opRcweLrS4sFzQ
 9J5Q==
X-Gm-Message-State: AOAM533kGbiFGYmDLYPQBxtyadCqdQcu74+Z5ZARo/sKHExZTXCy1GFT
 UQy6uW07K8jLVlL6Kq2yoD0rHL1GnVaSLpuPqn19Io3GrzU=
X-Google-Smtp-Source: ABdhPJwBO0ZP9UuM65Q4tvTw7Ej9WpPM5quGYOA0vkqYHddj5TrbVW0/KBSsZy69miPFPf6K+93aE0gZUETU/gHvQUM=
X-Received: by 2002:a25:2c15:: with SMTP id s21mr18995149ybs.332.1632725496823; 
 Sun, 26 Sep 2021 23:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210927022113.1518559-1-bmeng.cn@gmail.com>
 <8a997109-92cb-675b-f872-4a07dbebe861@amsat.org>
In-Reply-To: <8a997109-92cb-675b-f872-4a07dbebe861@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Sep 2021 14:51:25 +0800
Message-ID: <CAEUhbmVnV+9=02fVgoGwB=QtC++UQwfj5v4zK1r9zD8Fd4mE5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: Improve code readability for
 "!!foo & bar"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 27 Sep 2021 06:51:42 -0000

Hi Philippe,

On Mon, Sep 27, 2021 at 12:47 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 9/27/21 04:21, Bin Meng wrote:
> > GCC seems to be strict about processing pattern like "!!for & bar".
> > When 'bar' is not 0 or 1, it complains with -Werror=3Dparentheses:
> >
> >   suggest parentheses around operand of =E2=80=98!=E2=80=99 or change =
=E2=80=98&=E2=80=99 to =E2=80=98&&=E2=80=99 or =E2=80=98!=E2=80=99 to =E2=
=80=98~=E2=80=99 [-Werror=3Dparentheses]
> >
> > Add a () around "foo && bar", which also improves code readability.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/dma/sifive_pdma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> > index b4fd40573a..b8ec7621f3 100644
> > --- a/hw/dma/sifive_pdma.c
> > +++ b/hw/dma/sifive_pdma.c
> > @@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr =
offset,
> >      offset &=3D 0xfff;
> >      switch (offset) {
> >      case DMA_CONTROL:
> > -        claimed =3D !!s->chan[ch].control & CONTROL_CLAIM;
> > +        claimed =3D !!(s->chan[ch].control & CONTROL_CLAIM);
>
> AFAIK in C logical NOT has precedence over bitwise AND, so IIUC
> compilers should read the current code as:
>
>            claimed (!!s->chan[ch].control) & CONTROL_CLAIM;
>
> meaning this patch is doing more than "improve code readability",
> this is a logical change and likely a bug fix...

Yes, you are correct. Indeed this is a bug fix. I did not dig into the
operator precedence in detail. I will reword this in v2.

>
> BTW GCC suggestions are:
>
>            claimed (!!s->chan[ch].control) & CONTROL_CLAIM;
>
>            claimed (!!s->chan[ch].control) && CONTROL_CLAIM;
> >
> >          if (!claimed && (value & CONTROL_CLAIM)) {
> >              /* reset Next* registers */
> >

I was using GCC 9.3.0 on Ubuntu 20.04.

Regards,
Bin

