Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F298C3DA7F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 07:54:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbbUw-000172-H6; Wed, 07 Aug 2024 03:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sbbUq-0000Z6-8t
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 03:54:12 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sbbUl-0003Pj-TN
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 03:54:10 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f01e9f53e3so22857431fa.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2024 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723017246; x=1723622046;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xehxSr42kUuPZ+SjmpfI6hFU+L/t2ECDF/UePcPTq4M=;
 b=uZ1XkBc/eeMFNbczMVn80tOrpILDngAJ5CbRniBj51CicIMlmw8jfM4JOWnXw6CkJE
 G4m8xPY2D8ydChnhDdmP2NtFDOWIrwCDOsRHt282LC8aC7WzLOBCRd7SlyDTwzz7Tfzq
 L+/NroKCGPLqKUoz3LPdCvboDK2KnV5+QhK9lP76Aae2DvBKDluTZBsk22/xA/4+Q9uY
 CXw4DWLY+BZraQxAPSmLgJEnqmOosf72YkwCEkFBF2z2yC+ZPZ3Wf24Q0BNGD1yxF+6/
 2L9pqBdAPWWE9SPad/ha7Yc50YlvYiS8JGd+LLBof62oJkrA+nMqZf0tYtIANYIDj6le
 TKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723017246; x=1723622046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xehxSr42kUuPZ+SjmpfI6hFU+L/t2ECDF/UePcPTq4M=;
 b=pMORZyBB54Ah63HYvSR5RbDGpUlOXXbHMARyKJkSjRJLMpxB6HWJ186JlrzvYmgznW
 vGtkWJtDwU0PshBNQ9Ay64rR6C/wnbM836LLqgEcwslqYQUpgBL6vnHwfSVcJ4k2q8j/
 3bE5jHj/Q4MH0WwXDV4YDIxaAChueWXUkGvYkSUF6rjXMCUw9ta0g2MM2CDDkd91PvNS
 T5naTJQjgVXnS1W2zdmIhuqQGxgoTGlII7b/RFngRIfdxzdQZ6zreWzFNQIwkZmeYJoh
 GVbewTeewbXSHpjXTOxUt6T2jCRbtQjyuxb+GJoKWFUQ8fq3GHOsvtcF95VC00cGWMe4
 b6ew==
X-Gm-Message-State: AOJu0YwttIURxvgbdeXXMNUqBPE1XuQ0AY8r4RoW6a89c9XlmrvaroUM
 07ZdHK9CZhTd70o2YAhEHuX6npKpzf5yv+obnOrnCh1C3mfzC3r1Exbm/9gSNwGkULx3v9BLQLN
 C1TH6mfzOWQJyF9/2yFyzZhD6Ue1pE5u95Y8I1/nsARMEughY
X-Google-Smtp-Source: AGHT+IEPIs09BmaFr7lvKwpJewnQdS24RKkS7jYEOFHexIX3s8/vWYz0yMOistNjm365Z59lYo/anw6DPXM2u4E0t8o=
X-Received: by 2002:a2e:9ed3:0:b0:2ef:17ee:62a2 with SMTP id
 38308e7fff4ca-2f15aaab018mr147841431fa.14.1723017245805; Wed, 07 Aug 2024
 00:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
 <20240723-counter_delegation-v2-3-c4170a5348ca@rivosinc.com>
 <CAKmqyKPo0K0JkUrer0EQXGWHmEU8oQ=9KQb1QY2sTx_zeH9ArQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPo0K0JkUrer0EQXGWHmEU8oQ=9KQb1QY2sTx_zeH9ArQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 7 Aug 2024 00:53:54 -0700
Message-ID: <CAHBxVyGHZycmQna87v=u_dqDPqp+UwmV9ebuv29+yotSPKehDw@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] target/riscv: Enable S*stateen bits for AIA
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Aug 5, 2024 at 5:12=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Wed, Jul 24, 2024 at 9:31=E2=80=AFAM Atish Patra <atishp@rivosinc.com>=
 wrote:
> >
> > As per the ratified AIA spec v1.0, three stateen bits control AIA CSR
> > access.
> >
> > Bit 60 controls the indirect CSRs
> > Bit 59 controls the most AIA CSR state
> > Bit 58 controls the IMSIC state such as stopei and vstopei
> >
> > Enable the corresponding bits in [m|h]stateen and enable corresponding
> > checks in the CSR accessor functions.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/csr.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 87 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 58be8bc3cc8c..18b9ae802b15 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -316,19 +316,42 @@ static RISCVException smode32(CPURISCVState *env,=
 int csrno)
> >
> >  static RISCVException aia_smode(CPURISCVState *env, int csrno)
> >  {
> > +    int ret;
> > +
> >      if (!riscv_cpu_cfg(env)->ext_ssaia) {
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > +    if (csrno =3D=3D CSR_STOPEI) {
> > +        ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
> > +    } else {
> > +        ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
> > +    }
> > +
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >      return smode(env, csrno);
> >  }
> >
> >  static RISCVException aia_smode32(CPURISCVState *env, int csrno)
> >  {
> > +    int ret;
> > +
> >      if (!riscv_cpu_cfg(env)->ext_ssaia) {
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > +    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >      return smode32(env, csrno);
> >  }
> >
> > @@ -567,15 +590,38 @@ static RISCVException pointer_masking(CPURISCVSta=
te *env, int csrno)
> >
> >  static RISCVException aia_hmode(CPURISCVState *env, int csrno)
> >  {
> > +    int ret;
> > +
> >      if (!riscv_cpu_cfg(env)->ext_ssaia) {
> >          return RISCV_EXCP_ILLEGAL_INST;
> >       }
> >
> > -     return hmode(env, csrno);
> > +    if (csrno =3D=3D CSR_VSTOPEI) {
> > +        ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
> > +    } else {
> > +        ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
> > +    }
> > +
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> > +    return hmode(env, csrno);
> >  }
> >
> >  static RISCVException aia_hmode32(CPURISCVState *env, int csrno)
> >  {
> > +    int ret;
> > +
> > +    if (!riscv_cpu_cfg(env)->ext_ssaia) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +     }
> > +
> > +    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >      if (!riscv_cpu_cfg(env)->ext_ssaia) {
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> > @@ -1992,6 +2038,12 @@ static RISCVException rmw_xiselect(CPURISCVState=
 *env, int csrno,
> >                                     target_ulong wr_mask)
> >  {
> >      target_ulong *iselect;
> > +    int ret;
> > +
> > +    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_SVSLCT);
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >
> >      /* Translate CSR number for VS-mode */
> >      csrno =3D csrind_xlate_vs_csrno(env, csrno);
> > @@ -2162,6 +2214,11 @@ static RISCVException rmw_xireg(CPURISCVState *e=
nv, int csrno,
> >      int ret =3D -EINVAL;
> >      target_ulong isel;
> >
> > +    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_SVSLCT);
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >      /* Translate CSR number for VS-mode */
> >      csrno =3D csrind_xlate_vs_csrno(env, csrno);
> >
> > @@ -2610,6 +2667,22 @@ static RISCVException write_mstateen0(CPURISCVSt=
ate *env, int csrno,
> >      if (env->priv_ver >=3D PRIV_VERSION_1_13_0) {
> >          wr_mask |=3D SMSTATEEN0_P1P13;
> >      }
> > +    /*
> > +     * TODO: Do we need to check ssaia as well ? Can we enable ssaia w=
ithout
> > +     * smaia ?
> > +     */
> > +    if (riscv_cpu_cfg(env)->ext_smaia) {
> > +        wr_mask |=3D SMSTATEEN0_SVSLCT;
> > +    }
>
> This looks right to me, do we need the TODO?
>

cool. I will remove the TODO.

> Otherwise
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair

