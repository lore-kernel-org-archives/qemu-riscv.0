Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntFyi-0000LW-7e
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 17:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFyc-0000Kg-3I; Mon, 23 May 2022 17:52:35 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:42873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFya-0007TJ-13; Mon, 23 May 2022 17:52:33 -0400
Received: by mail-io1-xd2b.google.com with SMTP id a10so16658123ioe.9;
 Mon, 23 May 2022 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JvNoFbAPArw3M3BUkTp7tvRUH3qgucaaQPgtTpl80uA=;
 b=b0MmsKKx1+Xpu3qnZ9QySO1ieF2rtsrrKTMoMYT3FawNq5RHc7Tx/S88wtKk3pzNit
 pSEs4LxWPZ23oLJ+1f6PhWunDyuCsblI3OTCoYKqu9qAI1BwrpoHwnDWB3vyGW9rtyyT
 RtrvJ/FK8aOVkdcEil+MhcCSLfP7etR2pCT18URRPY0wDYhzX7jGCce/agj1gLImlrcA
 Ji4O8jU7zBynE0sse4SiEyGWN1Nzyi+POPTqmhn8DPobWj4GjvPNF30ovPD6UgLPZehk
 I6hHUo3QGfhnQnnYrWAPBjgZjSgD5dzSPpIJqyRrVoc4VzJxI74lKTqAL+snmQYx0pBo
 hreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JvNoFbAPArw3M3BUkTp7tvRUH3qgucaaQPgtTpl80uA=;
 b=jl5LDe5jqvCMFe2Q/Fd3BXhn4EzHef1uoUW9orvgEo90TWqjf8dXaBiUsCm14tLUot
 /aavh7+LYghw8Tbv4vMJQQ8HE2DTm9AhBljoL3VA6O5TJ8g8b3Hdpnt8+MxGMcYqpZq1
 88A5AdGD+VOxcse7TibFWAHecFhAGpK4KoFqGDud/S/unsBBgIp38RRajcWD/2XDm6Hq
 jyJi9biSMjz/f/pSvFdA+mO3R4ZKx7Dx9/gZacxdOSDJh1krr1ztPZ9mbCjrUuRGbkMt
 eeuSUbrMbyuJ1KbGkN9Mhv9BaShqh/hg7G6B2TYIY/ZDs2E/qs/r9XiivGMQvXbs7X8+
 gDHQ==
X-Gm-Message-State: AOAM530Go5zkuuKg1+ijnobVdieJt7qngXiMGq/UbxxVkITJsSpx4LQ4
 ZZ210XipmQIdfddqRK5eaQ6/a2AJhdRdrZ7Zjto=
X-Google-Smtp-Source: ABdhPJytv4zcAzy2f32EhFJTJUgJqdcfaVGBjDmLV8FSULaUhwqjdg5M5WVHLVlwKdjFWwlVxFDIcmjrLYwDlU5dzoA=
X-Received: by 2002:a5d:9818:0:b0:65b:ae2:863e with SMTP id
 a24-20020a5d9818000000b0065b0ae2863emr10845836iol.31.1653342750283; Mon, 23
 May 2022 14:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-8-apatel@ventanamicro.com>
 <CAKmqyKN5U927XfL7n_8S=3ykMyHPLM_kyM9qfYV5dq_eSmoEfA@mail.gmail.com>
 <CAAhSdy1SRGnG9An-hKHBaEzoG=0eSZQCwQDhoJ3J387Lwe5Pdg@mail.gmail.com>
In-Reply-To: <CAAhSdy1SRGnG9An-hKHBaEzoG=0eSZQCwQDhoJ3J387Lwe5Pdg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 07:52:04 +1000
Message-ID: <CAKmqyKMy66XQsgmAnMEEaYrH7k1g2MC6kHqrPaRWKxvSuOz3Xw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] target/riscv: Force disable extensions if priv
 spec version does not match
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 23 May 2022 21:52:37 -0000

On Fri, May 20, 2022 at 1:07 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, May 17, 2022 at 5:46 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, May 12, 2022 at 12:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > We should disable extensions in riscv_cpu_realize() if minimum required
> > > priv spec version is not satisfied. This also ensures that machines with
> > > priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> > > extensions.
> > >
> > > Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> > > device tree")
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >
> > This will potentially confuse users as we just disable the extension
> > without telling them.
> >
> > Could we not just leave this as is and let users specify the
> > extensions they want? Then it's up to them to specify the correct
> > combinations
>
> The ISA extensions are not independent of the Priv spec version.
>
> For example, we have bits for Sstc, Svpbmt, and Zicbo[m|p|z] extensions
> in xenvcfg CSRs which are only available for Priv v1.12 spec.
>
> We can't allow users to enable extensions which don't meet
> the Priv spec version requirements.

Fair point. Ok we should at least report a warning if any of these are
set though

Alistair

>
> Regards,
> Anup
>
> >
> > Alistair
> >
> > > ---
> > >  target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index f3b61dfd63..25a4ba3e22 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -541,6 +541,40 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> > >          set_priv_version(env, priv_version);
> > >      }
> > >
> > > +    /* Force disable extensions if priv spec version does not match */
> > > +    if (env->priv_ver < PRIV_VERSION_1_12_0) {
> > > +        cpu->cfg.ext_h = false;
> > > +        cpu->cfg.ext_v = false;
> > > +        cpu->cfg.ext_zfh = false;
> > > +        cpu->cfg.ext_zfhmin = false;
> > > +        cpu->cfg.ext_zfinx = false;
> > > +        cpu->cfg.ext_zhinx = false;
> > > +        cpu->cfg.ext_zhinxmin = false;
> > > +        cpu->cfg.ext_zdinx = false;
> > > +        cpu->cfg.ext_zba = false;
> > > +        cpu->cfg.ext_zbb = false;
> > > +        cpu->cfg.ext_zbc = false;
> > > +        cpu->cfg.ext_zbkb = false;
> > > +        cpu->cfg.ext_zbkc = false;
> > > +        cpu->cfg.ext_zbkx = false;
> > > +        cpu->cfg.ext_zbs = false;
> > > +        cpu->cfg.ext_zk = false;
> > > +        cpu->cfg.ext_zkn = false;
> > > +        cpu->cfg.ext_zknd = false;
> > > +        cpu->cfg.ext_zkne = false;
> > > +        cpu->cfg.ext_zknh = false;
> > > +        cpu->cfg.ext_zkr = false;
> > > +        cpu->cfg.ext_zks = false;
> > > +        cpu->cfg.ext_zksed = false;
> > > +        cpu->cfg.ext_zksh = false;
> > > +        cpu->cfg.ext_zkt = false;
> > > +        cpu->cfg.ext_zve32f = false;
> > > +        cpu->cfg.ext_zve64f = false;
> > > +        cpu->cfg.ext_svinval = false;
> > > +        cpu->cfg.ext_svnapot = false;
> > > +        cpu->cfg.ext_svpbmt = false;
> > > +    }
> > > +
> > >      if (cpu->cfg.mmu) {
> > >          riscv_set_feature(env, RISCV_FEATURE_MMU);
> > >      }
> > > --
> > > 2.34.1
> > >
> > >

