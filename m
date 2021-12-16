Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxlFQ-0007ZA-1c
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 02:32:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mxlFO-0007VD-Hm
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 02:32:14 -0500
Received: from [2607:f8b0:4864:20::82b] (port=40742
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mxlFM-0000CM-DA
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 02:32:14 -0500
Received: by mail-qt1-x82b.google.com with SMTP id t34so24579920qtc.7
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 23:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gFwrhkElM1Y2hJ6QZkOR/2kGNE0jOK+RD7TWWWgc1yE=;
 b=Vv5wV9m+ofuCt5sF5Ba9SV48QBDMB+XAgiL0g1BzV9FJOu4ikjLPctOQEXmMKeC+I5
 b4HZo0wKrxfR2GpXQSzBeNI2ax9XqeBS3N0HcDHo9JVJwq4Kc5vNyW/VNlQ7tXCZj/L+
 bj2fWJWoSQ8ZuILwVCTeM6V4hvNFwD4I40IOibhuyhPWaOoQFWcGQlvLJfan1vXV3LNm
 TsM11YG3AvBF3HhQGpFi+sx+SRupqnypAr7uxwi8aX2G+SevrpIqNzwmP5ISaG2kLUz1
 Aj2rt0vZQxI0MXdvrRx+PjJIlJbQ2NZIvPLF9grDY0GeGAbkp4HVjOIv/aTy2ThC+v7F
 eKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gFwrhkElM1Y2hJ6QZkOR/2kGNE0jOK+RD7TWWWgc1yE=;
 b=iZQu1D7/bqomnBlG0wJAPXP09Z7XoQe6hvXm3wQjZHgorp7OYv1TJeTf7AozrxHoD4
 7YlBuIV/hor1LtfoaoZ+eMXWcbEHD9hwbKUGT7ZtEF1Zcm7uWJtICjnJONutha8nVr6q
 HbeIYmWt1wIVU4q17bdSgVay2kJ6i/DreILtkA1Av6mW7eEKAr0M/v+RZy/9E4FNPB56
 6pXsBrG+7rjfwwgE7tsB+9emaRgV+c0J+v6kkvKgSCJswN2wluerpQIlWn0kUOR4xWBM
 vup9I+epHhlbo4lRLKp80kTCl7qV6win/SaiXwjHt63WBHR2EmB2yV0lVYKxWbX9lecN
 JYcg==
X-Gm-Message-State: AOAM5335dvy2sEfAaIjB1TKiy09p7Q9MIV5cLvSkQxhX2fFMJhYH79fu
 bNmaQCd0W1KgmVG1dluHSXOmnYpUhrmfglWcvRGoikylJ1Y=
X-Google-Smtp-Source: ABdhPJzqM9BgG3MRZgzxSVtA6oueo2CVmzQErJ4Nnyoiv1QO0F33P11/P5U0ZL9Xw6rSrviUNOUifc/3LSdm6ExX8Iw=
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr15623603qtw.185.1639639931432; 
 Wed, 15 Dec 2021 23:32:11 -0800 (PST)
MIME-Version: 1.0
References: <mhng-65f14cf7-b8bd-4ee3-a4f8-5f288cab7c30@palmer-ri-x1c9>
 <aa5be67a3b23b45254cebc90c28e3f5fc42e88c7.camel@wdc.com>
In-Reply-To: <aa5be67a3b23b45254cebc90c28e3f5fc42e88c7.camel@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Dec 2021 23:31:44 -0800
Message-ID: <CAMKF1srKSqavJfTkdDoY7YpLr9_UUKUYFBgAJsAEi6oxmBh6xg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "bin.meng@windriver.com" <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=raj.khem@gmail.com; helo=mail-qt1-x82b.google.com
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
X-List-Received-Date: Thu, 16 Dec 2021 07:32:14 -0000

On Wed, Dec 15, 2021 at 10:24 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> On Wed, 2021-12-15 at 10:04 -0800, Palmer Dabbelt wrote:
> > On Wed, 15 Dec 2021 09:26:08 PST (-0800), Khem Raj wrote:
> > > 5.4 is first stable API as far as rv32 is concerned see [1]
> > >
> > > [1]
> > > https://sourceware.org/git/?p=glibc.git;a=commit;h=7a55dd3fb6d2c307a002a16776be84310b9c8989
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Cc: Alistair Francis <alistair.francis@wdc.com>
> > > Cc: Bin Meng <bin.meng@windriver.com>
>
> Thanks for the patch!
>
> Can you please send the patch to qemu-devel@nongnu.org as well?
>

Yeah I missed that. Done now.

> Alistair
>
> > > ---
> > >  linux-user/riscv/target_syscall.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/linux-user/riscv/target_syscall.h b/linux-
> > > user/riscv/target_syscall.h
> > > index dc597c8972..9b13161324 100644
> > > --- a/linux-user/riscv/target_syscall.h
> > > +++ b/linux-user/riscv/target_syscall.h
> > > @@ -45,10 +45,11 @@ struct target_pt_regs {
> > >
> > >  #ifdef TARGET_RISCV32
> > >  #define UNAME_MACHINE "riscv32"
> > > +#define UNAME_MINIMUM_RELEASE "5.4.0"
> > >  #else
> > >  #define UNAME_MACHINE "riscv64"
> > > -#endif
> > >  #define UNAME_MINIMUM_RELEASE "4.15.0"
> > > +#endif
> > >
> > >  #define TARGET_MINSIGSTKSZ 2048
> > >  #define TARGET_MCL_CURRENT 1
> >
> > Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > Thanks!
>

