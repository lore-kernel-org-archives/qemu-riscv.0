Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oL9jb-0001NR-7c
	for mharc-qemu-riscv@gnu.org; Mon, 08 Aug 2022 16:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oL9ja-0001NE-An; Mon, 08 Aug 2022 16:52:22 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oL9jY-0004Ll-Pd; Mon, 08 Aug 2022 16:52:22 -0400
Received: by mail-pl1-x62f.google.com with SMTP id m2so9611415pls.4;
 Mon, 08 Aug 2022 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=PkyBSz3T4VZ+UVrbb0002V2Jh5VFrfHzkQWQK3bBi98=;
 b=SILcWFWVHHgpWvJSf7G2sjJ/uOHykjeS3lM8OQzEdAnMVnHw/k+iA/UTQCXrf5oI8F
 wA2jWlVUENWyoLHeb0X+lqFcizBuyWNOeZC8gpSi876lt3woKppEzI4wTQ73k39s8R//
 ssjJw6enf+XRzncSfKUs7TQNy3+diaI7mWaUJPXK3y2BFC0BvOML0TMaKbpZl3j4e7DA
 L2Fqb9Y7rcsC1I4z7/m4uD11sKAKbulxI3THkWYTTupz+zZ9XQyR7aVXNsdsj9rlj0i0
 gIILaFnZ9H4yCfPYtoduTNy9gGzu2SHIwIC1NyiodLfbIHFqQKY+iqRQJj9j0doGuTEv
 aiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PkyBSz3T4VZ+UVrbb0002V2Jh5VFrfHzkQWQK3bBi98=;
 b=lQV1pkiXOXz24S/eUOEP9+qMdwpfGiBVshhBFr4u470fyEk8pBCrK59KanmHJCqtOE
 ZZfVg6OIeJAfw+euhVXJS+vfrGuhiGAVBqFXzLPYiJKmdGXyBRkDjwDt+6R4R/Tf5XET
 1O3Y5uDovMhfnBZtVOxtY4wdrtOCVTK3bEDwRJECULUCeKyYHpIXavSfMv72ipybh8m2
 LbptWfe10G1OPbf/SbAJNzBRd9OSRWX+DL1FYRgj229Y7lJ9xPA84t16JmKV0XVoO7vN
 +aPL3cJta5b2iCqZ2CgnWsy4vemVZS+NWVki9WD95BYWaWbr++HH/nBXflyZRs5tO4kb
 BNpA==
X-Gm-Message-State: ACgBeo3Q8PUyjfJsi9RWkoxViNtRnflSxTW/PPvnJP7oXwFLBs2LRv9p
 R9R3Z+bjU8AVXvEmN6/YdAwJUl0Yr73pdqfq2Xk=
X-Google-Smtp-Source: AA6agR5MjRLAKi7c/TFhwToDrUvo09Hs9RIH7SFUs3KSroLMuckziLkQpYxHy3k46WCy4lgAb/juHf1mFM+b7soOk2o=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr22276027pjb.120.1659991938797; Mon, 08
 Aug 2022 13:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
 <0f453024-1d1e-105d-855b-234c3c8fedbb@irq.a4lg.com>
 <fe4bc495-14a3-205d-480d-083c2a81fd13@microchip.com>
In-Reply-To: <fe4bc495-14a3-205d-480d-083c2a81fd13@microchip.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Aug 2022 06:51:52 +1000
Message-ID: <CAKmqyKMURX0ZVgWBOWtWD0fLXTfLDRfdhDtsqLEEPKL=h=afPw@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, Conor Dooley <mail@conchuod.ie>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 08 Aug 2022 20:52:22 -0000

On Tue, Aug 9, 2022 at 2:14 AM <Conor.Dooley@microchip.com> wrote:
>
> On 08/08/2022 16:03, Tsukasa OI wrote:
> > I agree with Alistair.  **I** removed 'S' and 'U' from the ISA string
> > and it should be working in the latest development branch (I tested).
>
> Yeah, I saw what you as I looked at the commit log while trying to
> understand why there were invalid strings appearing when the code
> looked like it was impossible. Certainly I found it very very odd.
> I didn't just revive a 2 year old patch without taking a look at
> the code.
>
>
> > Besides, this function alone generates the ISA string for DTB and
> > there's no way such ISA strings with invalid 'S' and 'U' can be
> > generated.  It's definitely a behavior of QEMU 7.0 or before.
>
> Hmm, it would seem that you're right - I have retested on a fresh
> clone. I did checkout v7.1.0-rc1 before running the first build that
> I saw the invalid string on as I'd been on some hacked up & fossilised
> version prior to that. Perhaps some build artifacts were not correctly
> removed, consider me quite confused! I do recall the configure script
> saying something about my build directory when I kicked it off, so
> it is likely down to that.
>
> Unfortunately my bash history is out of order so I will not be able to
> replicate the conditions, having many terminals open does have it's
> downsides.
>
> > Please. Please make sure that you are testing the right version of QEMU.
>
> Heh. Please, please give me some allowance for reasonably believing I
> was in fact on the latest qemu/master after checking it out and building!

No worries! Glad we cleared that up

>
> I guess this patch can then be safely ignored :)
> Glad to have cleared this up as I was rather confused by what I saw.

Great! Do you mind resending the series then with this patch dropped?
It just makes it easier for me to track and manage

Alistair

> Thanks Tsukasa/Alistair.
>

