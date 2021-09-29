Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVQiV-0005Sv-DZ
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 23:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVQiU-0005QR-2M; Tue, 28 Sep 2021 23:57:10 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVQiS-00033w-Mu; Tue, 28 Sep 2021 23:57:09 -0400
Received: by mail-io1-xd2e.google.com with SMTP id h129so1444108iof.1;
 Tue, 28 Sep 2021 20:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uvfu72jYXxQtTM+bdHRJ2B03KoZx0gex6Ijn/YngMN8=;
 b=Dq5k0lwSwH8IcNa/+Q4qCjO06eSCFFHVtdV3+VEWfiblm66C0iUxFqWcXG6HU2YScB
 1UX6HezEbAFcMA6WW1cNjp8J8vIMTGsd5z7Sit83IIN6Is6agUKmmi/B6nbtfCBrfIa3
 +E9bXSHXXr7C/1+wTZ8kUYNaUbyG22WO7eZUPmhpP8IMEsCPnTBWBOHRFGp4UsoQJOT7
 Q3m9MKgM5azy/zGmH4SwkIMy7d6aCQBwzZ7UXCNSmc8I9ybDEe7+Rve95AJsS1rY75Sy
 fXcSSWDcxFikhGee6gfde08IBw/kcKUen3QzkbwnuU7s/iNcIAoLlxuIcjfOqUicdTnO
 1tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uvfu72jYXxQtTM+bdHRJ2B03KoZx0gex6Ijn/YngMN8=;
 b=0MxOvvlzy5fcsiGSpsXbVdBIdMDGHpjBJ7FFznN5bYju3eU2f9wLVr9OYlT201ejCm
 9Re9oYNZPfeJ/6dfFwjCK7FT6yIq3CrFyTMAjWYmy8VSN/U3ocZM+BCtUHjEP4wxGiJA
 QGfVU29pNc8FprZH6K3xnomhBfqLWAQDyxTxG9CMfnmi0f/cQAkja2NYC0FO/INA02qx
 VCICKrn6tL+bMXUJUKOnbuIvQKpOsnkkLviXDFIjBgZXYQwBjl/izTbPt+Ia7Yf8N9jc
 JJrMxylXu1zONMoHg15MKwZdsj3CwaWTrULpQeMoCA1rqVqUPw9RWPRmsueGmv7LIfOc
 lZCg==
X-Gm-Message-State: AOAM533YC1KQcRv8a4nBL8h5iIXP4SftFY3cJCcxILZASi2ws6oSjuCG
 g4dXLd4mreN2KRAwlnNJgPoyXfKV97x1DCWszeU=
X-Google-Smtp-Source: ABdhPJw//yGn5RFYIKu7jMY+Ng1w+CYLTU127ZRlbaomOX90PPUZyBKri8iNlN0vkD8I5LBUKeQPCgl41QyKbm+1otQ=
X-Received: by 2002:a5e:c101:: with SMTP id v1mr6472616iol.90.1632887827386;
 Tue, 28 Sep 2021 20:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
 <538d9688-0f2f-c406-50a5-d962e3ce2963@linaro.org>
 <CAKmqyKNDLcp22Jqe=UhE6sG3XEMd2pcW5bfFDYwpwrOL3kb0iA@mail.gmail.com>
 <627458f0-01f1-9381-cd25-931e953031e3@linaro.org>
In-Reply-To: <627458f0-01f1-9381-cd25-931e953031e3@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 13:56:41 +1000
Message-ID: <CAKmqyKMJfBqCkNrPYKZEJ-c13cn1OQ2C5AR=o1uwZefYRdCqmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: Implement the stval/mtval illegal
 instruction
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Wed, 29 Sep 2021 03:57:10 -0000

On Fri, Sep 24, 2021 at 10:57 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/24/21 2:48 AM, Alistair Francis wrote:
> >> But... more specific to this case.  Prior to this, was the exception handler allowed to
> >> assume anything about the contents of stval?  Should the value have been zero?  Would it
> >> be wrong to write to stval unconditionally?  How does the guest OS know that it can rely
> >> on stval being set?
> >
> > As we didn't support writing the illegal instruction stval should be
> > zero before this patch.
>
> Ok, that didn't quite answer the question...
>
> If *wasn't* zero before this patch: we didn't write anything at all, and so keep whatever
> previous value the previous exception wrote.
>
> Is that a bug that needs fixing?  Because you're still not writing anything to stval if
> !MTVAL_INST...

Yeah, that sounds like a bug then.

>
> >> I simply wonder whether it's worthwhile to add the feature and feature test.
> >
> > Do you just mean have it enabled all the time?
>
> Yes, if without this feature the value of stval was undefined.

Ok, I'll have another look at this. Thanks for pointing this out.

Alistair

>
>
> r~

