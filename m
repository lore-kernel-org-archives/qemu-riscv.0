Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mON1X-00040H-9u
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 12:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mON1T-0003wv-Cw; Thu, 09 Sep 2021 12:35:35 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mON1R-0006o3-QE; Thu, 09 Sep 2021 12:35:35 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id z18so5074820ybg.8;
 Thu, 09 Sep 2021 09:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+S+P4wV5uUVN5lXN34e6jbCrRMKIEvw1oSRjL7Of1IU=;
 b=maMk5RtMjts8ornz7O7oG7PPaEDdGimzYzMmfKA6evsMh8si+KFQh9WrpR3RH5ZHe4
 63qqr7RazxUCpRqhAHCWY9e/WTenDrSMy1jhRjQZ/MXzenopbNAwFuC5kcTjzmVkopvU
 hfXXAzGIwfRLppCG2oYqgNmEVOFe0BVZGU8LoTh95RTueDgfgYicurmZo5Xbyz4Hzgqq
 05AL3UmAVBDQdAw0wPa3763PcFqmgUzxnLSLDafjBRKrxuXKt8g3usi8Ca04fcaGVLvB
 lDuMsHV9byPHb7qh4kTTuwc28e95GblM3bHQkbT/tVjyOzcMGdHgTMk6IusAuWLUJlui
 68GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+S+P4wV5uUVN5lXN34e6jbCrRMKIEvw1oSRjL7Of1IU=;
 b=kQ+GtGUkiOaF94stE6PTiIQG+puTD4gsiN0htx80J/VRMrdapqUso+pZDKnWAj7jqO
 OGPh3QFTdy0V5X1XJ0lDRnxcS42pQBWPNRnIt5kglK0Gf7Pam6UaZ3TSW4geNYl9GHID
 TghzUlKEEWFAUXa2u6zMAAJGHqaTDg2q0ZDzzJmMiUPHr/FZYA2u4lsB5u2y1n0z5G+r
 jaTQgDqjRhG9x9PPGbIY1YKYI+guax/r2XflZwkKH/c36tC0mCwJZdcfVQIjkLfqgTvc
 KbD+hgFCsCpt59ACISVIkWRWVcXODFM8xa1puhE5BeJfkQGgJuUv5rXJFfmk0gF+6iPB
 6yOg==
X-Gm-Message-State: AOAM532Zjp9FV8BIyPek8cv3nboUXi0M9DAa8wBmDEtozMknT80tlHgL
 Pizj37Kk8cWUbZ1gZOKP1GM6wqcM6wIlBpzBsII=
X-Google-Smtp-Source: ABdhPJwAkC4f8qnmpuKIDz8X4HV5id8Rn5hB+QxuibKz0//wM2AbySMP+xAoFrn9oZDQiNLgj1IGaNvokfdhsqfyT6M=
X-Received: by 2002:a25:5956:: with SMTP id n83mr4854859ybb.109.1631205332154; 
 Thu, 09 Sep 2021 09:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-5-anup.patel@wdc.com>
 <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
In-Reply-To: <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 10 Sep 2021 00:35:20 +0800
Message-ID: <CAEUhbmVCZrCrTOhHJGVqkCNHt3QUoij9uDigjYObUK9F_N=big@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] target/riscv: Improve fidelity of guest external
 interrupts
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Thu, 09 Sep 2021 16:35:35 -0000

On Thu, Sep 9, 2021 at 2:45 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 9:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The guest external interrupts for external interrupt controller are
> > not delivered to the guest running under hypervisor on time. This
> > results in a guest having sluggish response to serial console input
> > and other I/O events. To improve timely delivery of guest external
> > interrupts, we check and inject interrupt upon every sret instruction.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/op_helper.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index ee7c24efe7..4c995c239e 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> >
> >      riscv_cpu_set_mode(env, prev_priv);
> >
> > +    /*
> > +     * QEMU does not promptly deliver guest external interrupts
> > +     * to a guest running on a hypervisor which in-turn is running
> > +     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
> > +     * every sret instruction so that QEMU pickup guest external
> > +     * interrupts sooner.
> > +     */
> > +     riscv_cpu_update_mip(env_archcpu(env), 0, 0);
>
> This doesn't seem right. I don't understand why we need this?
>
> riscv_cpu_update_mip() is called when an interrupt is delivered to the
> CPU, if we are missing interrupts then that is a bug somewhere else.

Agree. This change looks like a hack to me.

Anup, with what configuration did you see the issue you were trying to resolve?

Regards,
Bin

