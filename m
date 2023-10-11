Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D35CD6E7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 15:34:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqbEb-0003b9-Fm; Wed, 11 Oct 2023 11:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qqbEU-0003TA-98
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 11:34:46 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qqbEQ-0000y6-2L
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 11:34:46 -0400
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-419628fb297so57611cf.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697038481; x=1697643281; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUgTTvatpJ3XxLGD2nR5U17drPlzhAEMt5UHIAR1kSE=;
 b=YPRMQf3OYxHtkLbcPyigokNb118iugx2li55ff5Mk465uLRSLqDWPHCVQyUpqRXpJH
 cW4Pwntg7EFX82aN30gTOI60tJCTrh6KXvUbSYF5RoX6RigPrujT4h384zgZGNASzs18
 vTi2AS5QvnF5Z5DL+EuYivXw6D2BW3n1Rc7qacdplAidx0K34/rmphqUG+JhZM+NPdvI
 f+T5CXSNhwZSjg1hpLCKVfyGFfjx9YbERrzqT5Mc6xebGKBXNccX3PqYMnM3rp/jgmFP
 L6hWzWJc07sV01XD0vt4Sf+I4DR/J8Sh9/8n7EwRRPtD6tfs5/yye7yv1PuSnO68EiNT
 CWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697038481; x=1697643281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUgTTvatpJ3XxLGD2nR5U17drPlzhAEMt5UHIAR1kSE=;
 b=jGlLcrNlG77GcRQth0QwKUU8SbtDBrF5/im+WxH0RWdRmBnNMRBC1mjQmHin1P3loa
 f2dM7Qq5QiD0czTHb5MHSW5OTK2i5+IDZFwFHfiuZKHLIexRZG3QeGiQ3oNLDXHG0XjQ
 +7/nwwlIYNG2m7hbeJ7Lv0vCXd/mapKPIGLDwggB9gN+jJnpipI2kKP7ef8Ya/Jp3xzj
 /HPjlUKCbLd/gYbzwhs8iMWu6sBoM7PKq4Nqj01peZOgdiQpGlIDoI+1boB+C4mPYhPw
 NWg9yCKp7xzWcYbCU7wwgEM0j33+NWMunvkiMVsz3j9JvjnC1w0T08wlYCbfm+Ohqi6V
 gtaA==
X-Gm-Message-State: AOJu0YwmypfzCz7u4BjZiyC2da8BJIRNKf6b9vv93FRMYf39/lNGf0d2
 jKjbVvHY6n/8XvaCgy00z8H9aJG7Nfqimr5kqVI+EQ==
X-Google-Smtp-Source: AGHT+IESMWXkg8EbIlKaLHITnwFeGfsDo0dubAcyJtN6whs3fb0SNTtlOasrKukUnLX1g8OMSbK7nY69nyXxmX+ID5Q=
X-Received: by 2002:ac8:5b11:0:b0:40b:784:a06c with SMTP id
 m17-20020ac85b11000000b0040b0784a06cmr30195744qtw.0.1697038480641; Wed, 11
 Oct 2023 08:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230925111025.543094-1-mchitale@ventanamicro.com>
 <CAKmqyKP5kWQRUHBhHsXOFKuiB+Ac6cJGTRq9sBXsGD9G+1SNZA@mail.gmail.com>
In-Reply-To: <CAKmqyKP5kWQRUHBhHsXOFKuiB+Ac6cJGTRq9sBXsGD9G+1SNZA@mail.gmail.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 11 Oct 2023 21:04:04 +0530
Message-ID: <CAN37VV7YBOn0OZ-ih4thwqNdbF9LAo9p9zJOBsWK6QsUXaDi=g@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: pmp: Ignore writes when RW=01
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Oct 9, 2023 at 6:56=E2=80=AFAM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Mon, Sep 25, 2023 at 9:11=E2=80=AFPM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
> >
> > As per the Priv spec: "The R, W, and X fields form a collective WARL
> > field for which the combinations with R=3D0 and W=3D1 are reserved."
> > However currently such writes are not ignored as ought to be. The
> > combinations with RW=3D01 are allowed only when the Smepmp extension
> > is enabled and mseccfg.MML is set.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>
> Do you mind rebasing this on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
Ok, will do that.
>
> Alistair
>
> > ---
> >  target/riscv/pmp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index 5b14eb511a..8e25f145e0 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -120,6 +120,11 @@ static void pmp_write_cfg(CPURISCVState *env, uint=
32_t pmp_index, uint8_t val)
> >          if (locked) {
> >              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - lo=
cked\n");
> >          } else {
> > +            /* If !mseccfg.MML then ignore writes with encoding RW=3D0=
1 */
> > +            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
> > +                !MSECCFG_MML_ISSET(env)) {
> > +                val &=3D ~(PMP_WRITE | PMP_READ);
> > +            }
> >              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
> >              pmp_update_rule(env, pmp_index);
> >          }
> > --
> > 2.34.1
> >
> >

