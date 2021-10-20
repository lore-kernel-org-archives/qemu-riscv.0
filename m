Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKzA-0003bW-2s
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKz7-0003Zo-11; Wed, 20 Oct 2021 19:27:01 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:34651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKz4-0007OD-Bs; Wed, 20 Oct 2021 19:27:00 -0400
Received: by mail-io1-xd2d.google.com with SMTP id i189so26776002ioa.1;
 Wed, 20 Oct 2021 16:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cG3bcLQyGDeBGMCVs6EtuMtBLgQGNDzJqzaq/Egxg74=;
 b=R30/zxDTgN5wPp/+KY1Yo7daGbc2aTL/6HfFSNMnbOJ38LJ4dhX2AF0JPwMiVpfLNy
 ag5Q2rFCL7FgyhswZrox6MiRmrk82gG58731h+wg2AunPwXZxkTurdndevjQSKIjPEZC
 9NQQkmeOZhdC25kwr4/5zb3DteXzFvwhXfclJ8MNACaPZHTAhJCx6pJ9h40qiy3wUfPp
 w5VzArZXydHYgJKRydu11NlF6lYR9ZQq8yt74kS72XYNfhoZnwHrc7L+N+3U8LJ6ADK2
 lpa9nEYw2aWZjZLnliKuILJdydwxRRoxvqqTP8W6SegmgdFeucs4wsuLuuoSpgfrP5+s
 Y68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cG3bcLQyGDeBGMCVs6EtuMtBLgQGNDzJqzaq/Egxg74=;
 b=f8BfYcIUYF9RVfvYVYlTftLyxCLfe+2ZS2sEQM0wU/zMdsScVZA1R/bfKWXBxaQSOh
 NvTlRong7APJOsKAQZBD3Q32QJPdhrywI32YrGaGtw/d8ywSFs8Nh5LAzdAT3+9vIQ9C
 xSLW+hNZKr32LmbJRA28bcaz+HglTmGY0gZaYwFoO/d1jUSYBTBAJnah68eH+b9bcgge
 IA6s0ptf2VcKRBr/26rh4DX1lAZSwanp675ZjoJ530D+Xst/IdhA6/FDB01R7LqJFngz
 JLsNfAUb+qKTP9BbAJ2mqZNZbyYhXE0uZCuVPhYN2L9qSOjo/o25MgUsZCOUDTqkHXoy
 mJmw==
X-Gm-Message-State: AOAM530r2a4/T09k9F0v3WG10CBbdhjO1QJ0wlwrhkkO2y4bY/5w9O6j
 CwcLQgrHTieWmX8Z3Fh+jR/lKQD7sBzbMVBhlQZ+2q9iMA+b88LR
X-Google-Smtp-Source: ABdhPJxni7bobjMbj4DcH1MM+9swBS10c/yAlOqYZgNhTS99fPui8omWjUrDzU6+nrDzEUny1sGbIlI3L3F+hHpdWd8=
X-Received: by 2002:a05:6602:2599:: with SMTP id
 p25mr1548490ioo.90.1634772417097; 
 Wed, 20 Oct 2021 16:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211020030653.213565-1-frank.chang@sifive.com>
 <20211020030653.213565-9-frank.chang@sifive.com>
 <CAKmqyKPrKaRt=m9BBjYJyF4844kkuTKXod8FWjNkHMDCe7ukXQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPrKaRt=m9BBjYJyF4844kkuTKXod8FWjNkHMDCe7ukXQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:26:31 +1000
Message-ID: <CAKmqyKN_DZhDcexuFme8B8baX4pFnWUpP=WwSVM29O5qG83cqw@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] target/riscv: zfh: add Zfhmin cpu property
To: Frank Chang <frank.chang@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:27:02 -0000

On Thu, Oct 21, 2021 at 9:25 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Oct 20, 2021 at 1:13 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> >  target/riscv/cpu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 8c579dc297b..4c0e6532164 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -602,6 +602,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> > +    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

> >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> > --
> > 2.25.1
> >
> >

