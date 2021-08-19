Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGVhE-0002WY-7c
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 20:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGVhC-0002UI-Ty; Wed, 18 Aug 2021 20:14:10 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGVhB-0002wF-Ft; Wed, 18 Aug 2021 20:14:10 -0400
Received: by mail-io1-xd30.google.com with SMTP id a21so5348869ioq.6;
 Wed, 18 Aug 2021 17:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ktIJE0Tya9oRiCweQ2jilUTaMAWElj32Gau5KBMroA=;
 b=RhdXdwT3m1HM0/X8f8cwSy4ONC8/CTinRmbONuSLJ9ub/sIL7pZuYFPhvm649wv17b
 SyQeEKQfD6PHsZml7PnCXUHrwhXOkz6NE72RMQyRbQbF8TuO/khBSvALjkWF1OfZzUYc
 f1SC4m5xyT4jCVCuBBlbYN/FaFaLviZxgDpy6mJmleVPNFVmxp++peHFvGefDhUPtCyD
 m+QRSJD9hbt9smje9RAi7gEsBCbXPyphahp8eiGgPliD6IBdilUX3PgfC1QMKfPVM6n6
 EzOx5Pebh+lqkCHRWoUXF2urO1XzfvGjOqY5PcPGkyXboVIPfhtmUqEUP3uAunHG2aV2
 bl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ktIJE0Tya9oRiCweQ2jilUTaMAWElj32Gau5KBMroA=;
 b=LLajskdpqK6anFFaEvEf6LSiORGugHCAHfIU/X/NP8OYpJe4zWM7/988S3MMVoj0Z1
 6kQoHa4uvfPbspRQj4J5qNWMjNw5OGeoQdbNhpOcsIAvQ39IS0tSjZ5fylqvTqE33kDU
 OQ6PtdbNySFx2DhJQzOQ1G8ngtBvSeD8KZRbqEjJoa3qoN2mWqMc1rR6qeGbYIf/7p7K
 EID0VDZVMLL7UWxSNglTKq2MdPtKBRmIrPGqNc+BIB4NVCFAi8G1y2EImsNvLcfoAIfs
 jjEHN3jGyTGOp7y3GUlsc0S4c6NkbDIuqm3qnrpXd7pSGrhbscgyrrLG7PxblwpqY7a+
 LPTA==
X-Gm-Message-State: AOAM532wdwb5dF8pthdytiP2beW4JumdmMH3yW1Ob/lX05FkUSaV0vYW
 N9oTIsNnp3XvED1tI5gdiHqkC/9rMcWmKx3UIXI=
X-Google-Smtp-Source: ABdhPJxtSW+2ZR1VyygKbKSAVx6AhqYI9DvFWdXdFfpaUH2fW3EmksRgpaWZOr3TLssoWtxePHLntDUcoFl3jAepXT4=
X-Received: by 2002:a5d:850f:: with SMTP id q15mr9322105ion.118.1629332047191; 
 Wed, 18 Aug 2021 17:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210816183655.18492-1-david@salt-inc.org>
 <CAEUhbmUKRD3quokpurMPBhfuONu=DRBcL29WLUPQu6fy0iiM1A@mail.gmail.com>
In-Reply-To: <CAEUhbmUKRD3quokpurMPBhfuONu=DRBcL29WLUPQu6fy0iiM1A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 10:13:41 +1000
Message-ID: <CAKmqyKNCtav9rNu0CM1buiRLxQcToeGbzAK8So7-6ptitdh+0w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc/sifive_clint: Fix overflow in
 sifive_clint_write_timecmp()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: David Hoppenbrouwers <david@salt-inc.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 00:14:11 -0000

On Tue, Aug 17, 2021 at 6:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Aug 17, 2021 at 2:38 AM David Hoppenbrouwers <david@salt-inc.org> wrote:
> >
> > `next` is an `uint64_t` value, but `timer_mod` takes an `int64_t`. This
> > resulted in high values such as `UINT64_MAX` being converted to `-1`,
> > which caused an immediate timer interrupt.
> >
> > By limiting `next` to `INT64_MAX` no overflow will happen while the
> > timer will still be effectively set to "infinitely" far in the future.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
> > Signed-off-by: David Hoppenbrouwers <david@salt-inc.org>
> > ---
> > I wrongly used `MAX` instead of `MIN`. I've amended the patch.
> >
> >  hw/intc/sifive_clint.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>

