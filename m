Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzZ4m-0006TX-3r
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 01:56:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZ4j-0006Qv-Aj; Tue, 21 Dec 2021 01:56:41 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=46861
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZ4f-0001Uh-Qk; Tue, 21 Dec 2021 01:56:39 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id g17so35816414ybe.13;
 Mon, 20 Dec 2021 22:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FXuUmZHffSDY1iyZmTTVx1bEeQ3EHUR9dOuaCQy8FbY=;
 b=Uikz90mM9TQ00qygIkdHaRHK0iwyAUsLm96UB90j7BzcmTNP5ivyfR3taY2sUz4gkf
 ZwW7SwMVAtn+HHO2QA47zIvIA4VbknVzLe4ib+ZVSTx2RW25a73axjrvogFFEIowcybq
 0o52quyNXuczIC88ASnul20JyE1qR2N4q17dpc1HPKHnAUQMejtJhWn6/vSKrBZwdgTT
 j4pFTa1s8Jl7cqcLQtAwALmQYHfTuliilY3uejkFbsxryR1/Be1yCZlv7lgPjYUl6f0E
 uDNMkA5BThGb2vnv7aZUd9CPEL2Xv6hTdqSro4MnmV6ACOOYg2guUTtRu0b40qB430qt
 7jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FXuUmZHffSDY1iyZmTTVx1bEeQ3EHUR9dOuaCQy8FbY=;
 b=dsiIqKkjyjB0wQvtFGSg/SW0k5aJcp1n5aJ6LTrDXQsAsktt5UWVPeP254yJlYaPbv
 Z62Ryh2StwoZeAg0rtf+nuLM9a7ggTmfy5gF8Y4dX7M0/65rkjI5EjdfDdLNxe0wyzsy
 zCHShIj2OxAjmB/1rodoXbaMDzngBIez1mke1kvGeXCu1bzwefOjJWElhTQ3U7gYNnFj
 1qzeIyuqNtPb9mxUshNQZGRcQ08Flb/jwJHuXeG6TO1YuO49ao0zLdERyEEcSXbj3RMC
 F1CK22Uxq7A+QBgNbFtmzQpmh5WgX8pqqZG6xV6tyl4E9Pc6HrPa7anmX76IsqD70ZuW
 +RAw==
X-Gm-Message-State: AOAM533cN9wqTGSNjbfmqu4jZTBRb1H6m+V+yMy9ETWshVZBgQP1+xzn
 UVvYe+0pYqXL7VslnxNeo6muVQNC2DvUQcCnkrc=
X-Google-Smtp-Source: ABdhPJx59i3Si/kV1Jvs+j+jRwQiE/FUPoM7WTEAgCI6e5/d+n8TyL4dWVp3+zfIptu7BgJU7jI6FXaufbVhyBB0+48=
X-Received: by 2002:a25:3787:: with SMTP id e129mr2761964yba.91.1640069795857; 
 Mon, 20 Dec 2021 22:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
 <CAEUhbmVpGwjqvhLN1LCY3EokL9_a_v9okL=ZwUb_JYMZcvv3zw@mail.gmail.com>
 <CAKmqyKNLZGD-81xnFp_NMXKRuK-0EgP4FqW4AeLeKuMD+TAQEw@mail.gmail.com>
In-Reply-To: <CAKmqyKNLZGD-81xnFp_NMXKRuK-0EgP4FqW4AeLeKuMD+TAQEw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Dec 2021 14:56:24 +0800
Message-ID: <CAEUhbmV+RWb8HpH7=YS0B-qwzVpBznDqP_F-H5qBtzuZ3PoioA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 21 Dec 2021 06:56:41 -0000

On Tue, Dec 21, 2021 at 2:32 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Dec 20, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > As per the device tree specification let's set the clock-frequency for
> > > the virt CPUs.
> > >
> > > QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
> > > nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)
> >
> > I tend to think this issue is not valid, as the comment in the issue
> > says the value should reflect the running frequency.
> >
> > Note the "clock-frequency" was once in the codes but was intentionally
> > removed before because it is not needed:
> >
> > See commit 7ae05377b85f (" riscv: hw: Drop "clock-frequency" property
> > of cpu nodes")
>
> Hmmm... Good point.
>
> But if the device tree spec says it's required then I think we should
> include it. Even if it isn't super relevant for us

The Linux kernel upstream RISC-V DTS files also don't have
"clock-frequency" properties. I doubt there is benefit to provide one.

Regards,
Bin

