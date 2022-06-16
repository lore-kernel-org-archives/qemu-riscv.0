Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1fSO-0007Rz-Cx
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 22:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1fSJ-0007Re-2B; Wed, 15 Jun 2022 22:41:59 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1fSF-0000Ps-MA; Wed, 15 Jun 2022 22:41:57 -0400
Received: by mail-qv1-xf30.google.com with SMTP id p31so423827qvp.5;
 Wed, 15 Jun 2022 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bcQwWN7hsKp3/vE0fznk2AjlCHdyHuRRA0NpqPrDKlM=;
 b=fJZTN/Zq2SHrtAXEwCmXXQ7KyV5lPNvajZYlNZrYbIx55/XvbK290sW14P0GWYbkyI
 oyDoEEKCmOm6vzUnIq0mNhFrq3+8HGSqwb7m2Ru8NPG5Fy0U5xanauUfE4B4wQh4eheY
 SXztypkDMDFUFQmI3Mr+bQkXU2Gr+pYQp3kdqvCqK8JZTr32zYCHin3V1HDYLj8JHLP9
 BOIqKw9FWtR5g/KXt2K83Z9aWHH55SrUmH43TGHh47fLgjrv1fMFRtM3tzHBPbve4c/M
 tuh8zGWUbkllQWDhGYeGaKuf2QhX0Xwk0FN7qlmcw1aObasJmDpYRQ4vpBdZmXu2zl1T
 qWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bcQwWN7hsKp3/vE0fznk2AjlCHdyHuRRA0NpqPrDKlM=;
 b=8Pcyj6EKqjcYDG9bPwHssq6OZD/R4mLp3Kh+KVnh4zeCOtEG1JzIdlhJQuvmUOLmdP
 sN9IIJuPJvcZiXzljTYCKHrlmTwYmsFQ7qRT17xoR5SW+zTbBA6RcG6FR+3keyNVQGu6
 8XO17+j+D25EsTRbr55RTCKVttub9MD4Vw9MEBc5WqSBQnDFM728Nr14Bl5TY4z6lONG
 zgsNY9SUxR/yerlRuyJ1F4+hCGE5SNjij0VI9uT7SFezwKwb2y7uMrATh1AT9pqqmtUD
 W0OyYfMEB0mKBBUe0cV0XsMSZLO4VKbZ+7RU8ITDj5DV42DbYn+WBiWEf+ZkaLo96fV0
 FnaA==
X-Gm-Message-State: AJIora9fP8v2KDlRabY0obXPhF1VSgC1FgqEYfzVi6pvIjCKs2lxMVGP
 2dNoYT2Vu9xfaYQ3IFnN0o/dKaoRy96Qzgc1cmI=
X-Google-Smtp-Source: AGRyM1uWIgt5v61SkJyvNPjXIlQxJoM0PwoGYDfVSW+irhFPuqc0TmRqvE8V8PepzX3G4eliEYVgZE0zr/sOjAtNHV4=
X-Received: by 2002:a05:622a:156:b0:305:2b8e:8ae5 with SMTP id
 v22-20020a05622a015600b003052b8e8ae5mr2258912qtw.543.1655347313808; Wed, 15
 Jun 2022 19:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
 <CAKmqyKPOj2YesmskC5q9Xai3D0edb6TzvxkfzdkK7tork3QAPw@mail.gmail.com>
 <CAEUhbmVakz7sKACQgYO77mw7kw3WtAcxy4=0++BHfQyaCHCJ3Q@mail.gmail.com>
 <CAKmqyKOJ5W4Z_sqx=NLkB4UmmhbpC9-nvGMR7yh9XoNJa03=Ug@mail.gmail.com>
In-Reply-To: <CAKmqyKOJ5W4Z_sqx=NLkB4UmmhbpC9-nvGMR7yh9XoNJa03=Ug@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Jun 2022 10:41:42 +0800
Message-ID: <CAEUhbmVDaOP-EroNc6+ok=DMoTcwemQiWcb0_UwhUcSB-8KE-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Remove the redundant initialization of
 env->misa_mxl
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 16 Jun 2022 02:42:00 -0000

On Thu, Jun 16, 2022 at 10:34 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Jun 13, 2022 at 10:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Jun 13, 2022 at 8:33 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Thu, Jun 9, 2022 at 11:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > env->misa_mxl was already set in the RISC-V cpu init routine, and
> > > > validated at the beginning of riscv_cpu_realize(). There is no need
> > > > to do a redundant initialization later.
> > > >
> > > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > > > ---
> > > >
> > > >  target/riscv/cpu.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index a91253d4bd..61d1737741 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -752,7 +752,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> > > >              ext |= RVJ;
> > > >          }
> > > >
> > > > -        set_misa(env, env->misa_mxl, ext);
> > > > +        env->misa_ext_mask = env->misa_ext = ext;
> > >
> > > You're right that we don't need to set `misa_mxl`, but isn't it
> > > cleaner calling the helper function here instead of manually assigning
> > > it?
> > >
> >
> > There is no helper for assigning misa_ext only. Do you want a new
> > helper for that?
>
> No, I don't think we need a new helper. I mean, is there any harm in
> just calling `set_misa()` even if that means we are performing a
> redundant operation?
>

No there is no harm to perform a redundant initialization.

Feel free to drop this patch then.

Regards,
Bin

