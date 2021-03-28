Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQJaE-0004hV-Lz
	for mharc-qemu-riscv@gnu.org; Sat, 27 Mar 2021 20:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lQJaD-0004gd-Q9; Sat, 27 Mar 2021 20:47:13 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:43815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lQJa7-0000jY-SN; Sat, 27 Mar 2021 20:47:13 -0400
Received: by mail-il1-x135.google.com with SMTP id d2so8227201ilm.10;
 Sat, 27 Mar 2021 17:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zInIHyAvoPNZ/k8WdxhqxUFzosa8gXy9oigbO3HY2RI=;
 b=iHHgXVkK+uw6i5FSiSgYTLHsOrENX5RwrIxAO/ccIlYJN/TE2SYWP06kmeRHuv9KY5
 Fr81KjdAXwyYK9BcmLf95cBZuzbrU9ITIDGLh1AcBBrA50841zuhs2gnwW/rwZi8tL6l
 3QVFL24iRssXNYmYmpIdMRavySNPdBNW1gVoFzAvj0roe6+Jx+CeAfNHa3cJeVHEYlBk
 5c8xbZmQGn+bmpRRBytDuNRQMJDa+kJDSlZwZMLcx6sXG1QI47bbS4TbSTsTfpwB+U8k
 QTXeKq8HCOLMzRQuGzlJgAAB+xpH1VHENhhv7brBUlMf/DzGkhqsg5tnXrt+qtbMdMsO
 44zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zInIHyAvoPNZ/k8WdxhqxUFzosa8gXy9oigbO3HY2RI=;
 b=dlL9pgwhQQWWE7aRJtBk9TQ9Ec0hNixmh7qP+UCs4piSlBl339OOj6S2qJHKqHaLFu
 5spn+qnps0Go6CO/rDhK40w2eswcnCQpFiEykgclTnhqqBm3YzQ9mYRrlk2dwGmoUoA2
 +jQvtLl70ZGcIOYD4xiUilaSqDdKSB2l6trdqybt20XgL93kbOKfbbZvErIjK5Eqta5M
 X7BkGU310SQCsSUYV0nFglsubtehXUlG8iDdNC6x+z5wlV0YZ3x0KvCtqtOpEj1Jv1ms
 rmTog+3aVJ6q3+5BgcDB0USb7BcdK6v7Aq6O00TXZAPwhIVkQFx7wvzoxddLufwvuDGu
 ZW6w==
X-Gm-Message-State: AOAM531Fgt2CtgarfVV/NpSv+ilOldeqYhjhAwyTtBEEz72OJy5XWkm4
 FtHm1r/CPz9daF9du5q/f13Bp7bavwjKJGhPt1w=
X-Google-Smtp-Source: ABdhPJxS6BvbigYeXLjDWDRt7QdKuDKM8047ttLuIdfPbxIrx9Rms0iaYsvTrLvvV5T3BPdofTkYlciPNAlaE2Lt3DY=
X-Received: by 2002:a92:da89:: with SMTP id u9mr11971684iln.131.1616892426363; 
 Sat, 27 Mar 2021 17:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210325094150.28918-1-dylan@andestech.com>
 <CAKmqyKMGROe+k8=f=_Vw8eLwo-PF-ENQeoD+WSte_G8dRHmatg@mail.gmail.com>
 <20210326101833.GA21700@andestech.com>
 <CAFEAcA_FeHarfkO31=OS-gdBFKgQq4U7pPj1HBeuVLPkeMZj=g@mail.gmail.com>
In-Reply-To: <CAFEAcA_FeHarfkO31=OS-gdBFKgQq4U7pPj1HBeuVLPkeMZj=g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 27 Mar 2021 20:46:37 -0400
Message-ID: <CAKmqyKPC3CXGSUMKM-V=r01gEptvN4P6m+6Dp_wW8AT=X=QC4w@mail.gmail.com>
Subject: Re: [PATCH V3] target/riscv: Align the data type of reset vector
 address
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Dylan Jhong <dylan@andestech.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxhbiBRdWV5LUxpYW5nIEthbyjpq5jprYHoia8p?= <alankao@andestech.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "x5710999x@gmail.com" <x5710999x@gmail.com>, 
 =?UTF-8?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSjolKHlgrPos4cp?=
 <ruinland@andestech.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Sun, 28 Mar 2021 00:47:14 -0000

On Fri, Mar 26, 2021 at 7:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 26 Mar 2021 at 10:21, Dylan Jhong <dylan@andestech.com> wrote:
> > Currently, there is no structure like "qdev_prop_target_ulong".
> > So, we still need to use an if-else condition to determine the attributes of the 5th parameter.
> > Something like this:
> >     #if defined(TARGET_RISCV32)
> >         DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint32 target_ulong),
> >     #elif defined(TARGET_RISCV64)
> >         DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),
> >     #endif
> > I think this is not be what you meant.
> >
> > The other architectures seem to ignore this, they just choose one of the attributes(qdev_prop_uint32/64) as their parameter.
> >
> > So now we have 2 options:
> > 1. Use "qdev_prop_uint64" as the 5th parameter
> >     DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),
> >
> > 2. Use if-else condition
> >     [patch v3]
> >
> > Or if you have other opinions, please bring them up and discuss them together.
>
> I would recommend that you just use DEFINE_PROP_UINT64 for this property
> (and store the value in a uint64_t cfg.resetvec) regardless of whether the
> guest CPU happens to be 32 or 64 bit. In the case where it's 32 bits you
> can just ignore the top 32 bits (or if you're feeling enthusiastic, report
> an error if they're non-zero). This is simpler to code, avoids ifdefs,
> and tends to mean that most code doesn't need to care about the 32-vs-64
> difference.

That sounds good to me.

Alistair

>
> thanks
> -- PMM

