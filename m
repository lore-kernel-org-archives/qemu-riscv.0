Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZMqw-0001aU-Uq
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 20:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZMqv-0001aK-1M; Wed, 21 Apr 2021 20:05:53 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZMqt-0005Jj-6N; Wed, 21 Apr 2021 20:05:52 -0400
Received: by mail-il1-x12e.google.com with SMTP id y10so14479927ilv.0;
 Wed, 21 Apr 2021 17:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=copbDKTdyTYKEYSS1PhUVpQqRk8o/vJZx6NZsG/f50c=;
 b=S381HGEc08HTZE16BTTDLvsV1VKaGIB4zh9QDbMLg79Eg4mTYi4EQ/bJN81KlPVxCW
 syf2KWRQc58fUKU6K/V4N+upY3eEaN3drbRy4JmWe5Lrf9zqGm5cycmaU3UgRoqaYl9s
 4NvL+aHH0f63P+PO3LH/iUTyhlBabm/dtkdY4sNGc0hpY5V2Q0V/sDzvlecVcfKSdfA8
 +/reCAPrTQZMXwfE1wyuUfzqMrUGXRv06tARlxz83vyIUTw4Tu6Zlqzkn3nbPffb5Bb7
 c+F2gYxZLzHj6PJ+yBLS4UmpJhLZEH36GXbuIIvHPomsc8bRyQGhIW4vuPmimOhtpCez
 695Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=copbDKTdyTYKEYSS1PhUVpQqRk8o/vJZx6NZsG/f50c=;
 b=YH6mfFlEcYcIBwlpzowSOENW+QPppLeJ2+hQZ/HSOlGNK8CZ+p3PpqS7TYftAD0ALY
 yyVAoq7GUZ0zxxTx/EgugTSS69Uw+eIg61QNNWOIugdM3l2C91AiYvJgBk6Sme/TtvAX
 D1vP0rjwrIbvvdmFfS9e14ZDKbnmpn3HNLljoENjr1EMjE95KbuKy0TxF03rkVrTNq/S
 Q7Pq33LwLHzdiCtxFk7mzeJ2C1OW1hLTUJMmVt5i/f8kUUcSDKlvWaHu+JGT/JRtcH3t
 05rBTWQ58HzYw19S0pCIjVAEFY0DA21elsSsGlSy0czh8IKgVeIqjA3YiFSkuj8oihhS
 TxKg==
X-Gm-Message-State: AOAM530PSlksei6uq4TaPtTrj9IFHi/y51QUqxq+wqfzNZR00Z0EnVdi
 esOqYaCaAqj+ki2OEp7tATyR1mPQ6hEq4r7Eg88=
X-Google-Smtp-Source: ABdhPJwbLi30e7e1C3ZH44xqrrp1E8UF1a3uTx5jMQskpEptw9HKndr0283LJGIlwyQhLy7DSByCH5YfizR/uBBWiTA=
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr469160ils.177.1619049949137; 
 Wed, 21 Apr 2021 17:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210420013150.21992-1-frank.chang@sifive.com>
 <639de1d9-294e-9fd9-14b3-5268d45e71e0@linaro.org>
In-Reply-To: <639de1d9-294e-9fd9-14b3-5268d45e71e0@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Apr 2021 10:05:23 +1000
Message-ID: <CAKmqyKOAa8TsCWHPev+m9Ep+nnYUuLUuQmfSsm1TdGnwd7d4mw@mail.gmail.com>
Subject: Re: [PATCH v2] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 00:05:53 -0000

On Wed, Apr 21, 2021 at 12:17 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/19/21 6:31 PM, frank.chang@sifive.com wrote:
> > From: Frank Chang<frank.chang@sifive.com>
> >
> > In IEEE 754-2008 spec:
> >    Invalid operation exception is signaled when doing:
> >    fusedMultiplyAdd(0, Inf, c) or fusedMultiplyAdd(Inf, 0, c)
> >    unless c is a quiet NaN; if c is a quiet NaN then it is
> >    implementation defined whether the invalid operation exception
> >    is signaled.
> >
> > In RISC-V Unprivileged ISA spec:
> >    The fused multiply-add instructions must set the invalid
> >    operation exception flag when the multiplicands are Inf and
> >    zero, even when the addend is a quiet NaN.
> >
> > This commit set invalid operation execption flag for RISC-V when
> > multiplicands of muladd instructions are Inf and zero.
> >
> > Signed-off-by: Frank Chang<frank.chang@sifive.com>
> > ---
> >   fpu/softfloat-specialize.c.inc | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Alistair, will you take this via your riscv queue?

Yep, getting it now

Alistair

>
>
> r~
>

