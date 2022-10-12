Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiS7s-00005t-03
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 23:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiS7p-00005a-RG; Tue, 11 Oct 2022 23:09:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:56215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiS7o-0008K5-5D; Tue, 11 Oct 2022 23:09:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id gf8so14115816pjb.5;
 Tue, 11 Oct 2022 20:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KC0GwpKQ3f2bMkr6SktN1/U3v1B3rKmkiW6mPLBwtcw=;
 b=Yzq/Rk4Pqlq/KA1yrkvLWUnhzPlahlcgYEUf0ish8sJKoJPjocK0XsoUnPhvGYGW8g
 tASa3IHZHH8vEmWhjypf4nwg/GaTX8dIOAXplefaAnlGHCXqFjk558ztV4D4jYrSRtyr
 V8OKYhfQ11tZiOnMGslKgjsQ74UoC2YnYQ+nX3lZ87eaf2cLx9phbO46608tcFDf2ZtE
 Xu2UvoFZRk/uwRoRdAf5oYOkxYTef/eKHXZdCtrNWFR2ohOBY01MNwYWzFVFumVRW0A2
 y1fSlpLf35IALHjhuWzpJAXCHfbCEyQ1mjR76/aBOhm0SQZuJvOYZHJu2nyD6inbOTYK
 S4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KC0GwpKQ3f2bMkr6SktN1/U3v1B3rKmkiW6mPLBwtcw=;
 b=w9ScgN5AZkVcwbzBQ6WtQt9fPWuQJ8L0yueDvZ0Fl9b3KHXIR1QYaIt+5c940RyhsO
 dqTd9JeIuE7yArO9DUh3vQt2bB+0O/DeUo5yXqub7e2WVadlzLLvR/tkPYQYl0UhrW66
 ymeZbO4WjS/qsFckVX2q4oVdGvqFrGccJ8a8eu4kaLGwCfqJ2iUYHnP95ADZakXMkvn1
 TC3Xndw2atG5ixkQDeKcTdJkylPzibRfrTCkOaMxsHQwif3OrXqINRo+GNUDkzSjsNSq
 zeyT9Ewokc4kta1XtTseujrkYLjYcThPaW5E6OMXMnkjKF495mFnoMo0vo5lh7SDT9jP
 PYwQ==
X-Gm-Message-State: ACrzQf2PdMAWfKSZKyX6c2MOfBF0Jr0gmDH3FvKfi5WVx4oZ14FYZdGN
 GbM6CZUP4kqCiFf0rOAuBbH27zgGuE41BMtY5lg=
X-Google-Smtp-Source: AMsMyM4aWraA7WGZjd45BrL9tCV2HV5U6iYir7xyHLYOg3CmxTNvWGTbLifF6zmYKoNrNbBVfZKuGeUnyMq0eNqm4QY=
X-Received: by 2002:a17:90b:314a:b0:20d:904b:18a8 with SMTP id
 ip10-20020a17090b314a00b0020d904b18a8mr114690pjb.96.1665544178280; Tue, 11
 Oct 2022 20:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
 <8ac0e17f-b902-6553-acdb-6ec0c4bfafab@linux.alibaba.com>
In-Reply-To: <8ac0e17f-b902-6553-acdb-6ec0c4bfafab@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Oct 2022 13:09:11 +1000
Message-ID: <CAKmqyKOCXPCK7U5ro09X4sw68YeEbprUH193VZL-traezH+nBg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Fixup TLB size calculation
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, bmeng.cn@gmail.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Wed, 12 Oct 2022 03:09:42 -0000

On Wed, Oct 12, 2022 at 12:50 PM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
> Reviewed-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>

Thanks!

>
> By the way, we missed one related patch that once had been picked to riscv-next patch.
>
> The patch v3:
> https://lore.kernel.org/all/ceeb4037-6d17-0a09-f35a-eaf3280339bb@c-sky.com/T/#m183e4430bda408bc3a2b2751aa94eff7fc02e23c

So this was applied but caused boot failures so it was dropped from my
RISC-V tree

>
> The patch v4:
> https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg02854.html

I think I misunderstood this comment [1] as applying to v4 and it
never got applied.

Do you mind resending the patch?

1: https://lore.kernel.org/all/ceeb4037-6d17-0a09-f35a-eaf3280339bb@c-sky.com/T/#m5e958d702d9905169a941f2ae59fdf7ac4a02383

Alistair

>
> I think the patch v4 should be taken at the same time with this patch.
>
> Thanks,
> Zhiwei
>
> On 2022/10/12 9:14, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Since commit 4047368938f6 "accel/tcg: Introduce tlb_set_page_full" we
> > have been seeing this assert
> >
> >      ../accel/tcg/cputlb.c:1294: tlb_set_page_with_attrs: Assertion `is_power_of_2(size)' failed.
> >
> > When running Tock on the OpenTitan machine.
> >
> > The issue is that pmp_get_tlb_size() would return a TLB size that wasn't
> > a power of 2. The size was also smaller then TARGET_PAGE_SIZE.
> >
> > This patch ensures that any TLB size less then TARGET_PAGE_SIZE is
> > rounded down to 1 to ensure it's a valid size.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > This is based on advice from Richard:
> > https://patchwork.kernel.org/project/qemu-devel/patch/20221004141051.110653-9-richard.henderson@linaro.org/#25043166
> >
> >   target/riscv/pmp.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index ea2b67d947..2b43e399b8 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -628,6 +628,18 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> >       }
> >
> >       if (*tlb_size != 0) {
> > +        /*
> > +         * At this point we have a tlb_size that is the smallest possible size
> > +         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> > +         *
> > +         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> > +         * This means the result isn't cached in the TLB and is only used for
> > +         * a single translation.
> > +         */
> > +        if (*tlb_size < TARGET_PAGE_SIZE) {
> > +            *tlb_size = 1;
> > +        }
> > +
> >           return true;
> >       }
> >

