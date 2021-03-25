Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPHA7-00056R-RB
	for mharc-qemu-riscv@gnu.org; Wed, 24 Mar 2021 23:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPHA6-00056G-Px; Wed, 24 Mar 2021 23:59:58 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPHA5-0001UX-7l; Wed, 24 Mar 2021 23:59:58 -0400
Received: by mail-yb1-xb33.google.com with SMTP id j198so852298ybj.11;
 Wed, 24 Mar 2021 20:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/eFLjDGfCYZzDWZOLpraw4xy7B++vMpmESRmEs7tqKo=;
 b=RunVZYoOsPCauPm3t/qENS0AT93lhzwDxe4/vb2ggSwd4iTXf+BmyCivatPAJr7uPK
 DrMjcAhsbh7GB4oFxVlc6NFc8Rndk+vNgEktgBHUyylXB/RLyzKYSESWEZnAndDm5xdn
 8aBwjSnmQt8c6NlSpFMS7ByDFPmBnN8xY/20Gt0RVGwRP8c6xboiZsQ5Px7SA00MXHUH
 szeW6JtqYgVYIlX2rtT5X2s8qKR7/0ZKdGazQq90+nnJiOGPRjaL4wK4eYC3qniwgKwN
 61BANhp45JPcrXJdYutlKU3E6A3n+AF/et/yawpDbTZDI6SbQwsyKArb3RX4bbJh1/jh
 fgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/eFLjDGfCYZzDWZOLpraw4xy7B++vMpmESRmEs7tqKo=;
 b=V4/K3PhJ8h5pWWT6lfjuIu1D7rvlwiAI8/RJqe3I4vBa1xiS7v+9RA/RCB41MYzLmw
 JWBHuXaDe3ln8nUUtJ7/BVaFgbZZzXOAC0ENeO7DPOwJfjW/hC2+Y/3dATqNKN98SmbT
 OV8XPZFrs4wJTwdLtorcGv8WFmmrAV6JScSeIANeS2BytYHvfOv8ryWXOZPZB6WhrUvl
 NpgsamIWqnFP7+t89PLXzdGuUPVR7DauO4tYkvYw/byI7gL/lhfxuPxRLFYIXKxBIrgS
 fG3VDcFWZmyiwnz19uzz5zXm7lM6IRCzFCh8lCmVnz0/w1by+2PTa5B+6lymCNLplG1x
 Rcvg==
X-Gm-Message-State: AOAM533iF/ybf42gcwDXK+3Gp8WIZu/aJwjJZHOXfLLH0c8dM5O/PtZR
 BRefxh+lEW8zspZtB/ga8dsbvJCBAZdR2Eg+mic=
X-Google-Smtp-Source: ABdhPJyTmVs9E6wzOxf0qV6Cor/4OXOxkLpnghiwXy+b2n/cs/j3K3JBwxO2zjqbq2m5RHzuOX0G17mgFChIKE6ioMA=
X-Received: by 2002:a25:73d1:: with SMTP id o200mr9932575ybc.239.1616644795998; 
 Wed, 24 Mar 2021 20:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210323091409.1226-1-dylan@andestech.com>
 <CAKmqyKMTkDcO9_in28QSg7Spk=K9PdsSghUVJF4i1744fNdkYw@mail.gmail.com>
 <20210325033121.GA9484@andestech.com>
 <CAEUhbmWr6+fSHyM2RJUmoB7Np7Y4pY3J_dvsDAZEVpt6ceiRiw@mail.gmail.com>
In-Reply-To: <CAEUhbmWr6+fSHyM2RJUmoB7Np7Y4pY3J_dvsDAZEVpt6ceiRiw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 25 Mar 2021 11:59:44 +0800
Message-ID: <CAEUhbmXK3aniZtqXDFKkGvz=M36eaNmTZhEyceOFrFkBLX0J1A@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Thu, 25 Mar 2021 03:59:59 -0000

On Thu, Mar 25, 2021 at 11:40 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Mar 25, 2021 at 11:32 AM Dylan Jhong <dylan@andestech.com> wrote:
> >
> > On Wed, Mar 24, 2021 at 10:59:55PM +0800, Alistair Francis wrote:
> > > On Tue, Mar 23, 2021 at 5:15 AM Dylan Jhong <dylan@andestech.com> wrote:
> > > >
> > > > Although the AE350 has not been upstream (preparing for v2),
> > > > the reset vector of the AE350 is known to be at the 2G position,
> > > > so this patch is corrected in advance.
> > > >
> > > > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > > > Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > > ---
> > > >  target/riscv/cpu.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index 2a990f6253..0236abf169 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
> > > >      env->features |= (1ULL << feature);
> > > >  }
> > > >
> > > > -static void set_resetvec(CPURISCVState *env, int resetvec)
> > > > +static void set_resetvec(CPURISCVState *env, uint64_t resetvec)
> > >
> > > resetvec in env is a target_ulong so this should be as well (instead
> > > of a uint64_t).
> > >
> > > Alistair
> > >
> >
> > Hi Alistar,
> >
> > Thanks for your comments.
> >
> > Indeed resetvec should use target_ulong instead of uint64_t.
>
> resetvec being target_ulong means that rv32 cannot have a reset vector
> beyond 4GiB. I don't think the spec disallow this.

Ah, I was wrong. The spec says: "the pc is set to an implementation-de
ned reset vector" and pc is XLEN wide.

So for rv32 the reset vector cannot beyond 4GiB. We should change it
to target_ulong.

Regards,
Bin

