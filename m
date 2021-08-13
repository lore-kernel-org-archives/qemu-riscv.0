Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mETMq-0004iI-Ro
	for mharc-qemu-riscv@gnu.org; Fri, 13 Aug 2021 05:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mETMp-0004iA-Q0
 for qemu-riscv@nongnu.org; Fri, 13 Aug 2021 05:20:43 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mETMo-00086w-Be
 for qemu-riscv@nongnu.org; Fri, 13 Aug 2021 05:20:43 -0400
Received: by mail-ed1-x52b.google.com with SMTP id dj8so6576698edb.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Aug 2021 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HcWlcWTTIirlrjQG3JQIKya0zKk6pTi3HOclxTjw02Q=;
 b=kEMzOuDGewnEoT6grofak4FNOsJ9jegAXCKXJaTZzwFyt/3ktlEMEsthdVe07RcvCT
 epj/lKjxNY1yt3izctMF8HD9bHN4zEddxQ7pTqJBQGYzEpf4Kw5ZiXMkigkeySXFKm7Q
 jNXV3lG8w9PwfJ+z3aISN+myO5hHatyIiaJrTINbHOYvHtj0eDdowkoBvaZgqYDQf4LJ
 o/V7wE1IOrOMv3YNFKdBUAWPiE+zOUDYDjBncrhc59WA0RcYGaq4xFwSgmRDT3toU7/R
 REgs8LZUKWDEOQClLiXZJlJdMZSkBCRjt67Z7WHD/c42x4nV0Lv41A28CDes1hIn/4t/
 0uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HcWlcWTTIirlrjQG3JQIKya0zKk6pTi3HOclxTjw02Q=;
 b=LZHFmdLWMqMhS3KLSUkaDPpOV4jqeLTKG/xooDf6VbOsi2DimXdDLiLv9sP3CKgxHU
 9MlAjQqyHBMI2jpE3a3p7u/CcMlH7/WJTlbsRwCi89Z61WvBA/WnQvMm4Jtt2AYKq9wn
 LB9k8wgJ/kgiVwYTmDUj8WJyXAFI7hm7CkB3U5/qezxPnWNe5W2f+Z7xjq1V+vPFbX4M
 tuekmvuREcPVlB7nj5Ng6TKYCi2T42jdaswuf5oLianwVtWlSMPejVE/GpxazhBWchHm
 tpJwiZo38UNSgRvvect66lLXFC+irhf+yFKY7oUxRgtbp3/y7CdqM/PfsXnvX61260yJ
 44XA==
X-Gm-Message-State: AOAM53158H1pOEsiLp7VR62ZjWT359RMU/+KvEhXAOxwtkzhJcuytSkU
 i2Zn9RYtxjAVcztdS9RxjQ3ZqfGAUlRmfGJ0S9vjpizkYk0=
X-Google-Smtp-Source: ABdhPJwf4YwgGrSRRz1+4qBMoulwHk9zdD9+nGTaLFK8KNmQx9HjCyBi7BI1c8pqA93c/+Hy/GCPwzlw4kxnA1SdBk4=
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr1820671edr.251.1628846440786; 
 Fri, 13 Aug 2021 02:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210812144647.10516-1-peter.maydell@linaro.org>
 <2465bcc8-7e8b-8b5c-71ed-d696f69e0f78@amsat.org>
 <CAKmqyKNFpPJqQ5DTTvSQGBWfB9UW2xrhFf6DJQgB6Zt4ZGp+mw@mail.gmail.com>
In-Reply-To: <CAKmqyKNFpPJqQ5DTTvSQGBWfB9UW2xrhFf6DJQgB6Zt4ZGp+mw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 10:19:55 +0100
Message-ID: <CAFEAcA9kft4UNv0DFjRe_CLvsqNBzpqUePMYVTWiKzWmw=93nw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt.c: Assemble plic_hart_config string with
 g_strjoinv()
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 13 Aug 2021 09:20:44 -0000

On Fri, 13 Aug 2021 at 01:57, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Fri, Aug 13, 2021 at 2:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > Hi Peter,
> >
> > On 8/12/21 4:46 PM, Peter Maydell wrote:
> > > In the riscv virt machine init function, We assemble a string
> > > plic_hart_config which is a comma-separated list of N copies of the
> > > VIRT_PLIC_HART_CONFIG string.  The code that does this has a
> > > misunderstanding of the strncat() length argument.  If the source
> > > string is too large strncat() will write a maximum of length+1 bytes
> > > (length bytes from the source string plus a trailing NUL), but the
> > > code here assumes that it will write only length bytes at most.
> > >
> > > This isn't an actual bug because the code has correctly precalculated
> > > the amount of memory it needs to allocate so that it will never be
> > > too small (i.e.  we could have used plain old strcat()), but it does
> > > mean that the code looks like it has a guard against accidental
> > > overrun when it doesn't.
> > >
> > > Rewrite the string handling here to use the glib g_strjoinv()
> > > function, which means we don't need to do careful accountancy of
> > > string lengths, and makes it clearer that what we're doing is
> > > "create a comma-separated string".
> > >
> > > Fixes: Coverity 1460752
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> Thanks for fixing this Peter. Would you like this in for 6.1?

No, this isn't 6.1 material -- as I note in the commit message,
the current code isn't actually buggy, just a bit misleading.

> If you want I can fix the other boards?

That would be great, thanks!

-- PMM

