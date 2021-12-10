Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvVOn-00054Y-9w
	for mharc-qemu-riscv@gnu.org; Thu, 09 Dec 2021 21:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mvVOl-00052s-Hp; Thu, 09 Dec 2021 21:12:35 -0500
Received: from [2607:f8b0:4864:20::131] (port=46596
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mvVOj-0007aL-Gu; Thu, 09 Dec 2021 21:12:35 -0500
Received: by mail-il1-x131.google.com with SMTP id j7so7151812ilk.13;
 Thu, 09 Dec 2021 18:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2xjAZ8/1p1w2whjEdVBF6OC2tBr3XUNo7yYYpVRIj0M=;
 b=FLWd+FvDQ3t5DaW1spUnah7eNX3BzdLizOICq0KRqhtTzAbCKex7qFe0Lam9SAOOaC
 oxYd0WIFGCZmIsmmYykcqGzitl/4uChw/hRFqmIUGfUc4nUxooca9eqoeK8lCi/zqK3s
 FYPJgPKbvwamx+1SYhybTsS8lXAkzWpS1ZWqs4UfHHJDfxlTm3zKAfCLW02krV1fRFqH
 eocjLQPzG6CGYvFBrYdK2Stq9xc9QeB9LTDHv3cu3XNky0ujiwCX4pKZp9kHnzvGpjPb
 l4GdUIlTYbCCXn2ranMIxhHqUq/kF+vAQaFolLQQOPnhgNCDTcrcra5bjPctbW3US+OQ
 Qh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2xjAZ8/1p1w2whjEdVBF6OC2tBr3XUNo7yYYpVRIj0M=;
 b=qnL2eXcyt/nRx/tbsJd+ufn1I/SDoC8cQFrAVQ6UZ2PjBBkh8RX5GEi/2KIp0Scks1
 dhJeX1x3oblYlxzvqPmcApieZpcznMdkCis7EcwNbpJ61P4BbXwXlxxPHiSGlsZpe8dW
 ni53zHe7cRsyoCXIju9q6jt98FSbdujCerwZf4huYIOG2Jv0gQYuCFB5F2AgOk7fyCgw
 Huv3j/DiaOwPHGXGZ7qaVShF5PVAkR6G1EpIlRGX0A+HwmMLVaMrEQ8dOWihgTQgJHbT
 d3fEMaYfbc6JWQafo+SpyrwyMKuHelvO426o5Ox9YzNW6OyeUWPnZ4SvWRscHW9Ymwy4
 kC3g==
X-Gm-Message-State: AOAM530ypKaaM/1p0lin5U9D7OZ8+zW3U5GiThmAMPUNgxRwsAA7VF6V
 rON6uv/CWuqWUPinUDylnFt/OJi/Q9fI9TKE5vY=
X-Google-Smtp-Source: ABdhPJwKmV1M3OFOE78F9SKVq1bglvg01H9hPPXr0fIKWRjWV8nb1vp0xZix0kYOuIknk9sWU87MQyfctY+emONCs7Y=
X-Received: by 2002:a92:cd12:: with SMTP id z18mr19328199iln.290.1639102351249; 
 Thu, 09 Dec 2021 18:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
 <20211208064252.375360-2-alistair.francis@opensource.wdc.com>
 <d4fb2710-a03c-0c33-fa7a-9279e63507ac@amsat.org>
In-Reply-To: <d4fb2710-a03c-0c33-fa7a-9279e63507ac@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Dec 2021 12:12:05 +1000
Message-ID: <CAKmqyKP37DKXzuDixY0123zVdU=NRODhH6MXapKrC4wtsNf39w@mail.gmail.com>
Subject: Re: [PATCH 1/7] hw/intc: sifive_plic: Add a reset function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Dec 2021 02:12:35 -0000

On Wed, Dec 8, 2021 at 10:00 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Alistair,
>
> On 12/8/21 07:42, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/intc/sifive_plic.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index 877e76877c..35f097799a 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -355,6 +355,17 @@ static const MemoryRegionOps sifive_plic_ops =3D {
> >      }
> >  };
> >
> > +static void sifive_plic_reset(DeviceState *dev)
> > +{
> > +    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
> > +
> > +    memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
> > +    memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
> > +    memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
> > +    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
> > +    memset(s->enable, 0, sizeof(uint32_t) * s->num_enables);
>
> Looking at sifive_plic_realize():
>
> - Should we reset the external IRQs in a default state?

Good point, I'll add that.

> - Shouldn't riscv_cpu_claim_interrupts() be called at reset?

I don't think so. riscv_cpu_claim_interrupts is a once and done call.

Alistair

>
> Note: parse_hart_config() name is slightly confusing since
> beside parsing, it also allocates addr_config. Maybe consider
> renaming?

