Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08722CD98F1
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 02:41:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZgCz-00063A-Pa; Tue, 16 Jun 2026 22:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZgCx-000628-3t
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 22:40:51 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZgCv-0002F3-0q
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 22:40:50 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-7fe4808741eso6389247b3.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 19:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781664048; cv=none;
 d=google.com; s=arc-20240605;
 b=FT9iM0qm48jHAW0QFXBB9ovZXK8OGDH8Hw2oZP0c6yCNSYDjOXxHoR0L80HHUGeTnH
 yRk/AH5V+lmFSmrx6UNTS+9qrXwHxWP84hrQoLTzH4uDW1IGRDZE1Zh3+9PYcCa/0vsz
 TFRv+Ae5BmMigd+vuY4UK38UTpifg4S8oYT7Li67z1L9tHXN98madZZPjU8U2uaPocfg
 ShRqtb6NY1ff9YsYjbgYPgMN7BUPNX0dM+P41vH3ZbMu/tLogNjEdGxpuX5Bxhr/yUtt
 gN7j+91k0Hgwuz91fPfRR8YQ9LT/53n2jdgooN7eh5WJ+VJygaq8201rr+zmMKas0B8J
 qELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ki+tQbmsrw6Ylm0o1sjml5MOnRY8/qYyCKJzfB4soxA=;
 fh=PbiEHeaGlA90sTOIhKeLHKnv1VrqaeZElaBlhFIHTyU=;
 b=eTlMj32iHGreiCoxkn1B+7ov1ewlF1RxcbFQeKuAgkGAaaksrfYwNsEmPnZEUDNaiD
 iTZVnQH3LNJ3bcrFesMizVtNJMmwdq1BS9zRVYGcuiOd5WNeKGkBpGhsbDkMkQLOL8bX
 9IeFVNUr8pz5y6zhGsOro2IarRRLt0D92RP4y73JlisN6L0ZKiPcDy5ECpeq9nYhqdJh
 LjaJoBoPwomii1qgg6w6q7ZX32w2qzEnnJHpv1J0H2gtK6HbXpHin22M/UsiGioaACcP
 iFMERRXuZL0sCuF5rhq5bq2kw2eY5+vhK987GFsGZHs0S1K67KOGC1LPRgfDCmTc0Q0b
 DyOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1781664048; x=1782268848; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ki+tQbmsrw6Ylm0o1sjml5MOnRY8/qYyCKJzfB4soxA=;
 b=KakuuWWzV+utpx+ZUBD+hro0fCFfXch7MFvnfXZ5hLPEeutdWcLoJIcB0OnYeVSc9Z
 d7XkBsQwA7GnZPxzgaoy4PLeFFQXpwXC3dN85uMKOObgyc46wlhSTCLnZxOPOHy3tFP2
 rho8MmDjnJYwnBpqG2IazWTF+psHM+CJxPf94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781664048; x=1782268848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ki+tQbmsrw6Ylm0o1sjml5MOnRY8/qYyCKJzfB4soxA=;
 b=sV2+9o0F2iW7fkGwkkjYuFxgW6C4mQcDg7X4xpE0kWL6BVPbzc1fLyOhVgBApFDziE
 /+msUxbymz1tw0xqenE4n6Pq5F5Kp2ey59KFC9uItI7OKsKZuf4M97v3180VmKqV01Xf
 jq8TytEKVzxbWOwf70LuDhwC12puuJVOopQ1XFlkKGtG+D1M1XtEqTV6eaXjUYxa2M5i
 r5hJRpE3RkTbVM0q0mKnmN1WrokgsHSKFjXZyXOtQcd8Rl8TtGMy4zPl9SJw+RCF20Jl
 2rEHGDFbD2u5dbhKquuEvYHFmp4kOisqk5lINh/gVtmM3NXaOWfA/+xGzCDSSrvxbhqQ
 meCg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/H1/t7Apv/+UvAfJGhjbSxwGeD/vGHaSdx4dlQP0hWCWonN59izIldSXEhJCpIrikobqKQvwhz4oyX@nongnu.org
X-Gm-Message-State: AOJu0YxaYWzzqINEBuCyiSgplicZ14da56fnUdS7uWcS11J66Spj2u0J
 /xg7bAVZHXHaPSfRauAAhZAF/sCoMTo4FWGtJNzbzvjtkHFmBnwQpWfPLYU/zltoi0KZXKhhUFE
 Q3EzE93RPQRrBGThmHOD7kkf+4tuKjTU=
X-Gm-Gg: AfdE7cnPjDCniQA6a389/dPSBJXnjBwkzLvhfhhDHsOXrw23t7VTCSXi4S1E4vP+LOE
 Ma9g7jZd9nbgVjfSIG5Tj48KYP732ruw+0bQX+rUtbyjnRL0tMV+tUb/GGxiz4iYFT0fjXSlPlU
 UbY18KblYJMSqXo6b6NW98dWALitxXLJcb2vMD2RW6gm5Ekc3CJ+RK3XGvF5fYwpH5VI+D/ifOX
 e2FVRm0rDB0OGwW+fBJVV5ACzdwU7hOFaxZYGgKkXeEbXp19v8WN4g/V2o7CYUygky0oTDbCZbz
 1xmD5zI6W6h8SOASf8F3G8cF2jPaBpE5KfuohY75f1EqJvDPCLXae4Vv4z3VDrh8oCm/CyCoAzs
 CTn/P6cVuPekyXQ==
X-Received: by 2002:a05:690c:9b0a:b0:7dc:9693:57b0 with SMTP id
 00721157ae682-7fe5ff70384mr17848287b3.42.1781664047707; Tue, 16 Jun 2026
 19:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260520125406.28693-1-anjo@rev.ng>
 <20260520125406.28693-16-anjo@rev.ng>
 <6633f78c-2291-4f6e-9ef0-9d3198cd30a6@oss.qualcomm.com>
 <aiAc8ZZtYhJ5hJ-7@hive.localdomain>
In-Reply-To: <aiAc8ZZtYhJ5hJ-7@hive.localdomain>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Jun 2026 12:10:36 +0930
X-Gm-Features: AVVi8CcSIM56Ko_AT2ccLcq7kob5LvXphbV3UCG4mWf0MwgO5s5Dn0AyNcPR4Sk
Message-ID: <CACPK8XeM5HAjfUJ4t_crwB_wLfmYfigm_=d0qPPXNDVyFTECSw@mail.gmail.com>
Subject: Re: [PATCH v7 15/27] target/riscv: Fix arguments to board IMSIC
 emulation callbacks
To: Anton Johansson <anjo@rev.ng>, alistair.francis@wdc.com, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pierrick.bouvier@linaro.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=joel.stan@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hello Alistair,

On Wed, 3 Jun 2026 at 21:59, Anton Johansson via <qemu-riscv@nongnu.org> wrote:
>
> On 03/06/26, Daniel Henrique Barboza wrote:
> > Hi,
> >
> > This patch is causing a seg fault in rmw_xireg_aia():

It looks like this version of the patch made it into master in your
latest pull request.

We don't have any boot tests that set aia=aplic-imsic, so none of the
in-tree tests caught it.

I'll send a patch and a new test.

Cheers,

Joel

> > #0  0x0000aaaaab3bda20 in rmw_xireg_aia
> >     (env=0xaaaaac194d80, csrno=849, isel=114, val=0x0, new_val=0, wr_mask=18446744073709551615)
> >     at ../target/riscv/csr.c:2735
> > #1  0x0000aaaaab3be320 in rmw_xireg (env=0xaaaaac194d80, csrno=849, val=0x0, new_val=0, wr_mask=18446744073709551615)
> >     at ../target/riscv/csr.c:2950
> > #2  0x0000aaaaab3c5628 in riscv_csrrw_do64
> >     (env=0xaaaaac194d80, csrno=849, ret_value=0x0, new_value=0, write_mask=18446744073709551615, ra=281472560986724)
> >     at ../target/riscv/csr.c:5813
> > #3  0x0000aaaaab3c5884 in riscv_csrrw
> >     (env=0xaaaaac194d80, csrno=849, ret_value=0x0, new_value=0, write_mask=18446744073709551615, ra=281472560986724)
> >     at ../target/riscv/csr.c:5871
> > #4  0x0000aaaaab3cb670 in helper_csrw (env=0xaaaaac194d80, csr=849, src=0) at ../target/riscv/op_helper.c:75

> > >               /* Call machine specific IMSIC register emulation */
> > > -            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
> > > +            ret = env->aia_ireg_rmw_cb[priv](env->aia_ireg_rmw_cb_arg[priv],
> > >                                       AIA_MAKE_IREG(isel, priv, virt, vgein,
> > >                                                     riscv_cpu_mxl_bits(env)),
> > > -                                    val, new_val, wr_mask);
> > > +                                    &wide_val, new_val, wr_mask);
> > > +            *val = wide_val;
> >
> > Here.  We can't just do *val = wide_val because there's no guarantee that *val,
> > i.e. the 'ret_value' of riscv_csr_op_fn(), is not NULL:
> >
> > typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
> >                                           target_ulong *ret_value,  <--------
> >                                           target_ulong new_value,
> >                                           target_ulong write_mask);
> >
> > This fixes it:
> >
> >    if (val) {
> >        *val = wide_val;
> >    }
> >
>
> Agh, good catch and thank you Daniel! I'll address this in a v8.
> Alistair, if it's easier for you to do this change on your end, feel
> free to do so and ignore my v8. Unsure of the praxis in this situation.
>
> --
> Anton Johansson
> rev.ng Labs Srl.
>

