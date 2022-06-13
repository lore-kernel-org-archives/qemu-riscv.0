Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o0jDW-0003jy-4k
	for mharc-qemu-riscv@gnu.org; Mon, 13 Jun 2022 08:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o0jDT-0003gk-FR; Mon, 13 Jun 2022 08:30:47 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:37705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o0jDQ-0002RF-GF; Mon, 13 Jun 2022 08:30:46 -0400
Received: by mail-qt1-x82a.google.com with SMTP id y15so3739971qtx.4;
 Mon, 13 Jun 2022 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R69ImHJIQerwyM+xsfWCHIgjtRKhfLYgoEgdfHmLLRo=;
 b=hQYmAucoYduvedIG087to3VoygKooFv/rd3m60GSuBG/f9H9B8uD0/cmoq0mgtABlS
 +FopA+nhmzzqIG9KaR00s/JuiNVqVHOrXmu/erSYts0h1ITJB77kR5PnvfIQxF3k27Jn
 J0HuPD2krbkagbonOvjrFJTUNpobXxSxuf1VobVH8r7d2K7GdFRON/zY4jmCaJmDuW/v
 h4aaFLicC2GozXvphQE1A3ROZ4iQYMQDSYNUnWB9DMCXL4QnkzzUPeZh/B6RLFnJcXIT
 TeF+PJSoz0kn9CECyoP0djKpNCtHfFTR/9gzba8yHcDwWqV6aYVB6K3MKy76jnrm3le1
 cdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R69ImHJIQerwyM+xsfWCHIgjtRKhfLYgoEgdfHmLLRo=;
 b=2+KTRSPYRMm/zPd0sK0zQKkmu5lhnxYo/Lc84QwBpPY7pM6Vv2XtSu0Jw0p245zbGB
 YZ32VlR53RcPNr3pN2m1UfQad+DipQ7aa8puYmiVEw+tP6CyKaJjfcShsMmjsJSxwC/d
 KGiOSturwARvsyEQSGyfWg5FvRi9PzbuUipqO5JeCVe9DOP9pXdsP+jzRy4tff/Jpsu9
 zyp/MNQ/Y4F3kHfy9ia9XYsKEFaEKZOJkOQTTRFrLzQKVM6nsKtImAXpb3RuDMNqE7pV
 khMdF8fCXuEJBUgJzzP1HOoKBRZkq6+l65EQ/qaKJHwtPPTakORxICONPTlkTbOy9BfC
 uk5w==
X-Gm-Message-State: AOAM5337jpCxgOPopr9R5baS/VwB1oFYbD4gkpKo4+CmKEMwktlvHPqr
 4nKCDTQEndiVC30120CgnZQTU7TRuhfCV8CVDw4=
X-Google-Smtp-Source: ABdhPJzXldGUc/kEd0ptDZvc5F/w2SZS6l7b4sze5oRKDf8edl8X5rTFqUK6Vwi+aRZlfi6acchXEMpROCqNv5aNJoA=
X-Received: by 2002:a05:622a:3cf:b0:305:2ea7:238 with SMTP id
 k15-20020a05622a03cf00b003052ea70238mr5560203qtx.334.1655123442524; Mon, 13
 Jun 2022 05:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
 <CAKmqyKPOj2YesmskC5q9Xai3D0edb6TzvxkfzdkK7tork3QAPw@mail.gmail.com>
In-Reply-To: <CAKmqyKPOj2YesmskC5q9Xai3D0edb6TzvxkfzdkK7tork3QAPw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 13 Jun 2022 20:30:32 +0800
Message-ID: <CAEUhbmVakz7sKACQgYO77mw7kw3WtAcxy4=0++BHfQyaCHCJ3Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Remove the redundant initialization of
 env->misa_mxl
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82a.google.com
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
X-List-Received-Date: Mon, 13 Jun 2022 12:30:48 -0000

On Mon, Jun 13, 2022 at 8:33 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Jun 9, 2022 at 11:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > env->misa_mxl was already set in the RISC-V cpu init routine, and
> > validated at the beginning of riscv_cpu_realize(). There is no need
> > to do a redundant initialization later.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  target/riscv/cpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index a91253d4bd..61d1737741 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -752,7 +752,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >              ext |= RVJ;
> >          }
> >
> > -        set_misa(env, env->misa_mxl, ext);
> > +        env->misa_ext_mask = env->misa_ext = ext;
>
> You're right that we don't need to set `misa_mxl`, but isn't it
> cleaner calling the helper function here instead of manually assigning
> it?
>

There is no helper for assigning misa_ext only. Do you want a new
helper for that?

Regards,
Bin

