Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48137C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 02:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxHar-0008VY-Ei; Sun, 29 Oct 2023 22:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHap-0008VD-IR; Sun, 29 Oct 2023 22:01:27 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHao-0002vo-1u; Sun, 29 Oct 2023 22:01:27 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7b6eda04180so1347882241.3; 
 Sun, 29 Oct 2023 19:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698631283; x=1699236083; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChB1S6pMCrI/seiWZ7xp4vnduZocMhPdDhplYHNG4IM=;
 b=cUpT1b5bMrTA9SNxrdIcICa93bDj/+C7VhQZw5dY1zeNORaSAE8TeHbx+Qwd3EoOut
 /7Vh1uHrqkYTYID8R4sMFqKziPQTN2UiQhGdUgZv2hxAO1ZjaDsSt5nUfFn3IG51r6kp
 j6BgFpJSzWPnoKWC+Sol4omY9Ybebp70a3hgiodGY6Dt65HnEMOthS3Pv1Ax+7Tj1fWe
 tdAsKQNEvfknm8eqU0kVKLF58+erUmgNLvYNimnXM/DYONnwK8qNeMzjUuFsV2Yc0Ivf
 iUJ6dh8QPgUyCUDGLIWWulGIcLSWW64LkLmBtcsjWyJwU1ajWm2n1MWwK9wGUSacAXcC
 T9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698631283; x=1699236083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ChB1S6pMCrI/seiWZ7xp4vnduZocMhPdDhplYHNG4IM=;
 b=j8fed1YgBGD7S840aIxwD8x/vybjueUKiw/mMhz8ddBTAcbnS7EabVyFYyS9XCNLaT
 CQZ3QzV77ZlhTWB0L8nluoupRWbiSJyrsUtIid6F2d81hVuXB7gJynIMxLmN9SnJbbu+
 9eopPMqeqlQLBAlaH/ao9gFBHIib3CWBU1xTPQMbV5M7bAzEVZxO8LIg4QJZ/h9MLePd
 zeO9X5urBSbBmSvKVzGvdTH4ttvYHOjrL7FxeQIb1GyRhpgThoKy/2WpLuAqQXnPo0ba
 UPj69EF27HI0enLGzzVX1JomtG67ATUi7UNj0bhnNMFAI5GjC5FpGyC+PobO2nAxdhyQ
 n7FQ==
X-Gm-Message-State: AOJu0YwaLhnEm010CKocZpWrsZQqA8vfMKJhnIp3nxhGFRf+srEIKMzJ
 MXPMgmDUpFvqtOHkexPMcgdBSCXr2RDylnj8zDU=
X-Google-Smtp-Source: AGHT+IFnqMNqj8BR7IyKJIvVAW7zlUGEdJO4qksUuwKx9z2mm/06TTT8Pj/ZcauJrRN12kSPhwsecbwrrdpxI/xZLSI=
X-Received: by 2002:a67:c308:0:b0:452:7232:5c22 with SMTP id
 r8-20020a67c308000000b0045272325c22mr7481653vsj.18.1698631283324; Sun, 29 Oct
 2023 19:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231029004247.21217-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20231029004247.21217-1-heinrich.schuchardt@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 12:00:56 +1000
Message-ID: <CAKmqyKMgM3MCNLShUFzfA8CTOcDEjh1e4GT0KZtZfCs4As64sw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: correct csr_ops[CSR_MSECCFG]
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Sun, Oct 29, 2023 at 10:47=E2=80=AFAM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The CSR register mseccfg is used by multiple extensions: Smepm and Zkr.
>
> Consider this when checking the existence of the register.
>
> Fixes: 77442380ecbe ("target/riscv: rvk: add CSR support for Zkr")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4b4ab56c40..07c0cfb7d8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -523,11 +523,14 @@ static RISCVException pmp(CPURISCVState *env, int c=
srno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> -static RISCVException epmp(CPURISCVState *env, int csrno)
> +static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
>  {
>      if (riscv_cpu_cfg(env)->epmp) {
>          return RISCV_EXCP_NONE;
>      }
> +    if (riscv_cpu_cfg(env)->ext_zkr) {
> +        return RISCV_EXCP_NONE;
> +    }
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> @@ -4379,7 +4382,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw_=
vsiph },
>
>      /* Physical Memory Protection */
> -    [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
,
> +    [CSR_MSECCFG]    =3D { "mseccfg",   have_mseccfg, read_mseccfg, writ=
e_mseccfg,
>                           .min_priv_ver =3D PRIV_VERSION_1_11_0          =
 },
>      [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
>      [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg =
 },
> --
> 2.40.1
>
>

