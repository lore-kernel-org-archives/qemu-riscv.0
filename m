Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUkc3-00084K-Ip
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 02:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkc1-000840-U7; Mon, 27 Sep 2021 02:59:41 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkc0-0001Zg-C2; Mon, 27 Sep 2021 02:59:41 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w19so18952717ybs.3;
 Sun, 26 Sep 2021 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d0TfoZRMtQaQHeX8oI+jYFGeHeo1XKKYb2ENk/hHXFs=;
 b=q14Po4xXSEmb5OU9ZMoSm0T4BPcLJV1LHkhJALyRzLpPHNrzZmIZdqq1SBkp0ciEeM
 K/Zjgrlh8GR/YDge1A5HOR0VoQCVZzWfdBrSCB7+Y0ysCfFZafd+uxgVWOnKqFyjFIOD
 TUImDCax8hS+7s5fd2BbbDix7GJDrHq4swLN8mEn7OTLgfB9pnVsX5U0AuLDaK96IOT2
 G6dn50DNKzJA+rNeXB2xQMpmcI1Szl7x4K2dY36VeApR5AWup42i78BzaGTRgh/D6cBF
 OJfd3jUu2Hmd03ROPYKczE7FVpkyoZGRP0KK/m2qKbI40dxD2LHhGvC27aiUD1wTZ1iV
 VXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d0TfoZRMtQaQHeX8oI+jYFGeHeo1XKKYb2ENk/hHXFs=;
 b=by2ClI+pTHmCd5T4jbQtjkpUXEiS++87KG5zzTzjwdMq18jU77jbvBqtthzmKHvHbh
 Cn5Y6H45EQsy7y4qT2tkGVDbgJfjYQtp3nCUnkS4AWRwiovXv3sUcntGM5rGGT5+0LFv
 nmv7xCmLwxbPUfKJMPZ01rKAy9W78paS+hRdYindBYpOc91+T8mJSmBluGflTPVoCC4S
 OUEZaYWWfGOorWwXDHFMmcTLKEzoB7attnrRLJXGudx6AMMtJt2LhfxfQbzSnvrt0jff
 wGi/G/3qMPRhj/BswRdMhWpcQ6KBqf7na4IO7iY8CFpjDbVOLlijCz85v17KxEJG/gaE
 zrYw==
X-Gm-Message-State: AOAM531wsoQN9sL1W4oJXucYPDN9OVN8owYZELqbBFFbNisVG/0r/04f
 jtjWtgu0EXpNwS+OTsJqmJMRaa/Lz9F8ML7qrLY=
X-Google-Smtp-Source: ABdhPJyGTt0eTwzxFw2eURlAK8ilg/OOD4/RNuojbJ0h/ytK64Vtt3A/J+Gu1HW68fILFGHsHKbks7E4G3a9gAxVFcg=
X-Received: by 2002:a25:905:: with SMTP id 5mr28621346ybj.293.1632725979208;
 Sun, 26 Sep 2021 23:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210927022113.1518559-1-bmeng.cn@gmail.com>
 <87h7e6jyto.fsf@dusky.pond.sub.org>
In-Reply-To: <87h7e6jyto.fsf@dusky.pond.sub.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Sep 2021 14:59:28 +0800
Message-ID: <CAEUhbmXu3fToVqkBgsJe4oLpC+X8SR_Pkd-K-VpQEjcm8YpOEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: Improve code readability for
 "!!foo & bar"
To: Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 27 Sep 2021 06:59:42 -0000

Hi Markus,

On Mon, Sep 27, 2021 at 2:51 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
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
> >
> >          if (!claimed && (value & CONTROL_CLAIM)) {
> >              /* reset Next* registers */
>
> Old code
>
>     first double-negate, mapping zero to zero, non-zero to one
>     then mask, which does nothing, because CONTROL_CLAIM is 1
>
> New code:
>
>     first mask, yielding 0 or 1
>     then double-negate, which does nothing
>
> Looks like a bug fix to me.  If I'm right, the commit message is wrong,
> and the double negate is redundant.
>

Thanks for the review. The double negate is not needed with
CONTROL_CLAIM which is 1, but is needed if the bit is in another
position.

Regards,
Bin

