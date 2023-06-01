Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17B6C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:31:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4aue-0003d4-Iq; Thu, 01 Jun 2023 01:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4aud-0003cr-DI; Thu, 01 Jun 2023 01:31:51 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4aub-0004OH-QC; Thu, 01 Jun 2023 01:31:51 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-4393c1b8d1cso31708137.0; 
 Wed, 31 May 2023 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685597508; x=1688189508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfCceekyQNkMZ71hpmNQjb3Nu0n6O3A+D7Ily3GMfF4=;
 b=iEy03CbvB1j0pY7YzEvYQovl+AdMA3FTB6J9/XA7pCV9PM9XRKxy2pq9cQexCutIFz
 +oaEcHHoOg50JQjTFLAWLYpjQBzt9c1EMTgoVi90MCYoNQ1AT4wyvhg3HIiABxHqYyTh
 jCZj5NU2I+OUmiahbPFO3zBIjvFHE57vExef3cuVdXvpsda5fcAwrV7E+hDvqYFItoTu
 TUML7mv3x4Z/2XpKH21o5ubv1uMLpmxAQvSKNx1EQaD6gEl2O7NQWgUx26AKBXR/RTml
 MmVn1w4zTSDnLAJXexGGNYUlFYdLBtj79dAzG8srnE5kI1gBB/urxy7yC3FxpylOL4wA
 G+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685597508; x=1688189508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qfCceekyQNkMZ71hpmNQjb3Nu0n6O3A+D7Ily3GMfF4=;
 b=EewDPhqoHF51ZMvK46dp0Fv8IAbWbjjLSWdwyF9i2GGQsOHKe3zhX/Z8nFQ3Asckhc
 ivioNVUXUNIJC1d51OqV9OtJtUKXuu9XHQq+trixJS+w+8Y5Pwzy6LpSHC/8JjYUq6gf
 KzJIcavMuzEWOznVux0RCcxGKJ9AEL+SVBDWUjzICCHk9GEBE1oMdU//Wh9IW/sMJ6BJ
 JILjcPdIeFFcdBS2P6rEqkA4mzke8fOKms+JljkXe9VDflk1z0/wyxsqg+lEYhG/D5PJ
 jxYzvRE6/RVzhjONU8V7essfghXb45pJEy+QTqcCc4JHF34OojqgjSTQmGSfex+BKnEO
 9d2w==
X-Gm-Message-State: AC+VfDyIUPbtt0FSmRt7sKtRRPFsS2A4r8ArzjE77uY+00e+SEJutoMx
 HxcH/f7dBPm1ZAs3AwO/C7rtP16KSqVCAbhoC+M=
X-Google-Smtp-Source: ACHHUZ76t6zmx+OnLOQi/fso/0gTaUwJZdRsZ/FBw5TZJijAN5+hACYXxDyH7L0OFsCJogrooYAZrXq1tZsi6i1+W9c=
X-Received: by 2002:a1f:4886:0:b0:456:ffb8:88ff with SMTP id
 v128-20020a1f4886000000b00456ffb888ffmr262919vka.5.1685597508249; Wed, 31 May
 2023 22:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20230529121719.179507-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jun 2023 15:31:22 +1000
Message-ID: <CAKmqyKNazWBT1CDd=1aP3wBGTDVa95jVbfW+KcdDRCeu-27r3w@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/riscv: Remove redundant assignment to SXL
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, May 29, 2023 at 10:18=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> SXL is initialized as env->misa_mxl which is also the mxl value.
> So we can just remain it unchanged to keep it read-only.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6ac11d1f11..25345f3153 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1321,10 +1321,6 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
>
>      mstatus =3D (mstatus & ~mask) | (val & mask);
>
> -    if (xl > MXL_RV32) {
> -        /* SXL field is for now read only */
> -        mstatus =3D set_field(mstatus, MSTATUS64_SXL, xl);
> -    }
>      env->mstatus =3D mstatus;
>
>      /*
> --
> 2.25.1
>
>

