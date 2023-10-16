Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F0FCDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:23:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsF8o-0000vQ-KN; Mon, 16 Oct 2023 00:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsF8k-0000uM-SC; Mon, 16 Oct 2023 00:23:38 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsF8i-0002qk-Dv; Mon, 16 Oct 2023 00:23:38 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-49d55b90a5aso2789888e0c.0; 
 Sun, 15 Oct 2023 21:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697430215; x=1698035015; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8c/OhOwG7l8blbTcISvTEA5VhCADzHnEaWQxp2XTgA=;
 b=EEEJl4z60Hlu5+NsOg5Ecxr9rMUTogXZdLnnGTchrtDXbSkqXBp6fHOCVsEuNd6REC
 RRk5FMjocrTQoKQbg/EFjPWvj4f1agtvVIvHmFNrUOI51sjMd93cMB0GtnJsHCwvhJae
 jI+s2Gcqd36ZwzShjcb97GaptTVGj/5tUHmiBDZql/ASO8ryQWdwnGbb0zjxo9DUrO+D
 NLUpYdzbunihnCQYOf37Ic61n08oU83/PGAKa4y8gZDUTWI6kxt9t5Sx0I0cRWOsNNo2
 Te0M2UoCHhwHLQ/a4EYM0FtrNVdtXXRZbqi7wq+IbTE0CLm+FPzUtqA2whUbZSfwJLcs
 Bd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697430215; x=1698035015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8c/OhOwG7l8blbTcISvTEA5VhCADzHnEaWQxp2XTgA=;
 b=djGsB5yFCykGsGlH0zhMcclwygbj77t4aGKry2s48J9I/LukcV5FnDVmjCHbGDLosf
 BEITQN+6zjSnQHeXo+qybkCDniCKtIPfBuAdM6ztcestGV13a64+lq4OgDdqU2v+F6sD
 +xXecm5iFvUaKFpOGfb5yCOcek5lLLVskHSp54y2olW7LvXgTMROf0bWG/gElXMdZU4I
 jUNdWI0vAIe4SduhR44Z8EpyjCSVihsGN6lQDq2ZVKGA8A7HFKM5QfM1HFZI2hFewLwO
 h9dJKPJ1NSljaH+7ANXmqreoyZY9aLpoenhygdIgbuOqyBPq078qNw/W7lq4Owet5McV
 fi+Q==
X-Gm-Message-State: AOJu0Yzqolgs0p6NogvIx+uaUb6PHBRhP8sZZufnofQv8vZelGTsEpJq
 YCqYyRHy5P8xwJH6Sy0hd/KUp8vYm78h/e1A+rE=
X-Google-Smtp-Source: AGHT+IFbytcr2vACaqbZJU2vTHBTq6AZKGvTFacR9l5A220J6Ch6HhakSznsQ20XHZ8yvcESZXF2Ay7U7eDh/bxBois=
X-Received: by 2002:a1f:a411:0:b0:49a:c528:10ab with SMTP id
 n17-20020a1fa411000000b0049ac52810abmr2696248vke.1.1697430214773; Sun, 15 Oct
 2023 21:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231013110111.34619-1-rbradford@rivosinc.com>
 <20231013110111.34619-3-rbradford@rivosinc.com>
In-Reply-To: <20231013110111.34619-3-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:23:08 +1000
Message-ID: <CAKmqyKMAGREL8ymzXof8Q9arSmyxFnev758HC8Y2qb65vvbBXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] target/riscv: Don't assume PMU counters are
 continuous
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
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

On Fri, Oct 13, 2023 at 9:03=E2=80=AFPM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> Check the PMU available bitmask when checking if a counter is valid
> rather than comparing the index against the number of PMUs.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 85a31dc420..4383805fa3 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -182,7 +182,8 @@ static RISCVException zcmt(CPURISCVState *env, int cs=
rno)
>  #if !defined(CONFIG_USER_ONLY)
>  static RISCVException mctr(CPURISCVState *env, int csrno)
>  {
> -    int pmu_num =3D riscv_cpu_cfg(env)->pmu_num;
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +    uint32_t pmu_avail_ctrs =3D cpu->pmu_avail_ctrs;
>      int ctr_index;
>      int base_csrno =3D CSR_MHPMCOUNTER3;
>
> @@ -191,7 +192,7 @@ static RISCVException mctr(CPURISCVState *env, int cs=
rno)
>          base_csrno +=3D 0x80;
>      }
>      ctr_index =3D csrno - base_csrno;
> -    if (!pmu_num || ctr_index >=3D pmu_num) {
> +    if ((BIT(ctr_index) & pmu_avail_ctrs >> 3) =3D=3D 0) {
>          /* The PMU is not enabled or counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> --
> 2.41.0
>
>

