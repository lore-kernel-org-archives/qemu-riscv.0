Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPGrM-0001Ke-Mp
	for mharc-qemu-riscv@gnu.org; Wed, 24 Mar 2021 23:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPGrL-0001Im-D4; Wed, 24 Mar 2021 23:40:35 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPGrJ-000651-Jl; Wed, 24 Mar 2021 23:40:35 -0400
Received: by mail-ej1-x631.google.com with SMTP id ce10so613102ejb.6;
 Wed, 24 Mar 2021 20:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8NGhxvh1d5UcdmYEuS0UY8AjiZWvo5cTBsxnuTCkLA=;
 b=S58KPStoOla5l7rLFNUiaH2tokWtbwWMmDyoJyOCNHqFKcJhh9yBrUo5CB6NzcgClW
 HLSDDNEG4hUdGtCn5oo2qZUpUk0hV7dyEBPjYcMRX21gbuudHr8Ro39yWkZZZp7Bj8AF
 8IvG4ctZffHh1JrSbpkbp2Z8S2l2L72lNigZJouGcwM5/WIiRaLjAne48gLNjntycG41
 q2MAbYPoc0VP5OoLSms/n6YD72e8kJuCK7k4UFalHQcBoLzxQOBBTwd68EJrdQEYznNt
 xduqdU1AVvqEZxlKRJ1sl7cJUY4gs+X+PrwuiBho1MMT7yPUQAiFc8Zzt90XWCPtizGf
 /6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8NGhxvh1d5UcdmYEuS0UY8AjiZWvo5cTBsxnuTCkLA=;
 b=YxTl70l0I1zjd5kBlAmCrxjIqOZTmv9wwKHmwgGjJ3hqmmNxulbplJopR1yiYxoEOR
 Y/2g4BLRLF5VPyrxhYyH6vLB9TFFME6EOagSwp6d/klt2MITUePWeM2nRgxHZ9a5K7uS
 m13OOZzYXIF4unqL++6LPvF9TfS8B0R9M0PxCuckojJEOnnbq7X4nfn0JVHb5Q9BVcRy
 sKMJHnhaLY7YMKOc5bHbpqipahEEEwoQ0dOBMwQXPcFkysLqbUatSVxbH+OK1QJTG3nx
 Jr44P3iaPO7q2pc+3ilOidUjGRJHLeyOwSrnPAPUr2QqlIcBCU731ISqnOPAfZH0YUM9
 SjMw==
X-Gm-Message-State: AOAM5317T98hxh3MOlz47Cca+ef+gbk/uIDdbIplPfGfXfzIjsRs0TnP
 u62XAu5nH3TtI5OOjsPJjQsBS0EjU2sE8FQxGx8=
X-Google-Smtp-Source: ABdhPJwKf4G8zkmLBvY5ij8uCMABtQMpkzb0UaLfnN61cveR0ESSsK7rIPbWKwwYbzjocwwZRl+LstpCM98tW+j9wU4=
X-Received: by 2002:a17:906:58d6:: with SMTP id
 e22mr6877137ejs.112.1616643631354; 
 Wed, 24 Mar 2021 20:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210323091409.1226-1-dylan@andestech.com>
 <CAKmqyKMTkDcO9_in28QSg7Spk=K9PdsSghUVJF4i1744fNdkYw@mail.gmail.com>
 <20210325033121.GA9484@andestech.com>
In-Reply-To: <20210325033121.GA9484@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 25 Mar 2021 11:40:19 +0800
Message-ID: <CAEUhbmWr6+fSHyM2RJUmoB7Np7Y4pY3J_dvsDAZEVpt6ceiRiw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Align the data type of reset vector address
To: Dylan Jhong <dylan@andestech.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 =?UTF-8?B?QWxhbiBRdWV5LUxpYW5nIEthbyjpq5jprYHoia8p?= <alankao@andestech.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "x5710999x@gmail.com" <x5710999x@gmail.com>, 
 =?UTF-8?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSjolKHlgrPos4cp?=
 <ruinland@andestech.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Thu, 25 Mar 2021 03:40:35 -0000

On Thu, Mar 25, 2021 at 11:32 AM Dylan Jhong <dylan@andestech.com> wrote:
>
> On Wed, Mar 24, 2021 at 10:59:55PM +0800, Alistair Francis wrote:
> > On Tue, Mar 23, 2021 at 5:15 AM Dylan Jhong <dylan@andestech.com> wrote:
> > >
> > > Although the AE350 has not been upstream (preparing for v2),
> > > the reset vector of the AE350 is known to be at the 2G position,
> > > so this patch is corrected in advance.
> > >
> > > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > > Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > ---
> > >  target/riscv/cpu.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 2a990f6253..0236abf169 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
> > >      env->features |= (1ULL << feature);
> > >  }
> > >
> > > -static void set_resetvec(CPURISCVState *env, int resetvec)
> > > +static void set_resetvec(CPURISCVState *env, uint64_t resetvec)
> >
> > resetvec in env is a target_ulong so this should be as well (instead
> > of a uint64_t).
> >
> > Alistair
> >
>
> Hi Alistar,
>
> Thanks for your comments.
>
> Indeed resetvec should use target_ulong instead of uint64_t.

resetvec being target_ulong means that rv32 cannot have a reset vector
beyond 4GiB. I don't think the spec disallow this.

> But in target/riscv/cpu.h:306, there is also a resetvec in struct RISCVCPU but it is defined as uint64_t.
> Do you think I should change it to target_ulong together?
>
> ref:
> commit 9b4c9b2b2a50fe4eb90d0ac2d8723b46ecb42511
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg730077.html

Regards,
Bin

