Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1406CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 07:47:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkgIZ-0002JX-IJ; Mon, 25 Sep 2023 03:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qkgIX-0002JC-Lw
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 03:46:30 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qkgIV-0005xw-Pw
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 03:46:29 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7741bffd123so327961385a.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695627985; x=1696232785; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2UPM27VgmCT41l3PeXD9ZbgGbjdmzeS9hJ/0foCIGw=;
 b=f0dYlZdpY79FvbwL27PrtIjRmVrSkhqeWLKtAU1XRgwKDv9hXKJywNnUF1/WX7aMeJ
 YbPQT739UHr69vxlf0LU7ih7TUhownGVvHMbK4tLi9DkODhVEnIPAvH9Rf0USbZpnKJ3
 y3nB3mMUQbjDTIaI5q1kkePeFdyYcCGcw/XG0EEjcy0QkXZUgVsCViqbIb9A1VcVGqpN
 HSneCWT4k6jUEBlQh+X0/PchBkxtHm8FpyzAT5/bthxdrR+JAO+W/87sSSeNIlR4mjC6
 O8+fQ0R8He6Z8dTi8nr0sxWjLQNi4DamyY7U09k/sFrv7B5oTq5C4lJA9+HRj0qxoRrq
 on4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695627985; x=1696232785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2UPM27VgmCT41l3PeXD9ZbgGbjdmzeS9hJ/0foCIGw=;
 b=SKk5p9om6kLdvU11Yv8S2cJrgtgFEtY4HBrzAgGo9TqK4kf0hYbO/v76RPUzEZgkIv
 tWdKThfPiF46emajoBHeAM5LLbVYNAObrhhLeucSUBCHEkJP4ivMiEccqwwhYHHOzxsx
 1Y65IQ3CaROuNZzlQtFabl+umPdrBlgtV6YOMUA7L+AiyEm/k/U1a5INEEoBNzV4cwSP
 wIp62KUuts30UFh1msz5vG3GjQccaYgIhr8GcoTWmrozXRjdxwMnn8zkopZNg8WySVmO
 W+iZkfkOTSqHc7rfVvk50C1iI7v9G3v14qJjTboa5FD0H5ZETzOip3qV+hVoAK/gVRsG
 HqBQ==
X-Gm-Message-State: AOJu0YyzPPO81g3LUd3dKcE6S6l4TJ+CfC6rDa59k9t8FrO40T+O+vZy
 6fzT9T6c07tr5AGoWfdgEbni3QO3ZmOhczOHhKrkEw==
X-Google-Smtp-Source: AGHT+IFoWTVrsoW9+pi6FS0Oa8v6cjz2FUVEttBUpEst6HvoVX6caw8M3vY1GWN++hTVwaJt3JCCV3Q6x76uJRVcQFw=
X-Received: by 2002:a05:6214:12c1:b0:656:2696:9947 with SMTP id
 s1-20020a05621412c100b0065626969947mr5296115qvv.18.1695627985112; Mon, 25 Sep
 2023 00:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230907062440.1174224-1-mchitale@ventanamicro.com>
 <CAKmqyKOTmQ_PJTvCoKJJon_zEkKEsM7AoP7LEz9Dtq4MJR95Ug@mail.gmail.com>
In-Reply-To: <CAKmqyKOTmQ_PJTvCoKJJon_zEkKEsM7AoP7LEz9Dtq4MJR95Ug@mail.gmail.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 25 Sep 2023 13:15:49 +0530
Message-ID: <CAN37VV44=CtnjU6iXeCzP466QNb8xzMLwfgQDJtCaYgewas0Zw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Clear pmp/smepmp bits on reset
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Sep 19, 2023 at 10:10=E2=80=AFAM Alistair Francis <alistair23@gmail=
.com> wrote:
>
> On Thu, Sep 7, 2023 at 4:25=E2=80=AFPM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
> >
> > As per the Priv and Smepmp specifications, certain bits such as the 'L'
> > bit of pmp entries and mseccfg.MML can only be cleared upon reset and i=
t
> > is necessary to do so to allow 'M' mode firmware to correctly reinitial=
ize
> > the pmp/smpemp state across reboots.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c | 11 +++++++++++
> >  target/riscv/pmp.c | 10 ++++++++++
> >  target/riscv/pmp.h |  1 +
> >  3 files changed, 22 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 0843461660..77ed653b8d 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -896,6 +896,17 @@ static void riscv_cpu_reset_hold(Object *obj)
> >      }
> >      /* mmte is supposed to have pm.current hardwired to 1 */
> >      env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
> > +
> > +    /*
> > +     * Clear mseccfg and unlock all the PMP entries upon reset.
> > +     * This is allowed as per the priv and smepmp specifications.
> > +     * and is needed to clear stale entries across reboots.
> > +     */
> > +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>
> Does this compile? ext_smepmp doesn't seem to exist
It requires the patch below as well:
https://lists.nongnu.org/archive/html/qemu-riscv/2023-06/msg00122.html

I will rebase and resend it.
>
> Alistair
>
> > +        env->mseccfg =3D 0;
> > +    }
> > +
> > +    pmp_unlock_entries(env);
> >  #endif
> >      env->xl =3D riscv_cpu_mxl(env);
> >      riscv_cpu_update_mask(env);
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index 3f6c8cf08d..f3eb6e6585 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -131,6 +131,16 @@ static bool pmp_write_cfg(CPURISCVState *env, uint=
32_t pmp_index, uint8_t val)
> >      return false;
> >  }
> >
> > +void pmp_unlock_entries(CPURISCVState *env)
> > +{
> > +    uint32_t pmp_num =3D pmp_get_num_rules(env);
> > +    int i;
> > +
> > +    for (i =3D 0; i < pmp_num; i++) {
> > +        env->pmp_state.pmp[i].cfg_reg &=3D ~PMP_LOCK;
> > +    }
> > +}
> > +
> >  static void pmp_decode_napot(target_ulong a, target_ulong *sa,
> >                               target_ulong *ea)
> >  {
> > diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> > index cf5c99f8e6..2c5ec3cdf1 100644
> > --- a/target/riscv/pmp.h
> > +++ b/target/riscv/pmp.h
> > @@ -81,6 +81,7 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_=
t pmp_index);
> >  void pmp_update_rule_nums(CPURISCVState *env);
> >  uint32_t pmp_get_num_rules(CPURISCVState *env);
> >  int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
> > +void pmp_unlock_entries(CPURISCVState *env);
> >
> >  #define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
> >  #define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
> > --
> > 2.34.1
> >
> >

