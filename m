Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C50EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:39:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLw9k-0002NS-Od; Tue, 18 Jul 2023 21:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLw9f-0002Mg-2T; Tue, 18 Jul 2023 21:39:03 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLw9c-0001mG-TI; Tue, 18 Jul 2023 21:39:02 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-48168bbffbfso1771372e0c.3; 
 Tue, 18 Jul 2023 18:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689730738; x=1692322738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygo07RPcqR77bzzKpIlmnDE/b3n985698K8wkWp8lgg=;
 b=fsRTQ9nehRrM9kr4/zfJclsqRB4RHTVQ8T0gxFScQGEObYJ/yrlb5of1p30ZDn18NZ
 bTIwuf/xUq2bRwrQfUASPhT0p3h6Li/jxApAfOpw4jneHS6ol/hwM4ezWMRNjoLwpOl7
 PfOTXbC7K2/ROkGChaRBN27YliQ75LsWG9UkOhtwMs6HaDtHhrAiSYZyc54M78qnLe8h
 hYqRoKm2AxctOM/ikaOqiBKumDytEJzN3L45xzTNjcLc89D7hI0CKDMgCEtxBHiylZvj
 xYDW+nNSXG/DKKMquGTGS1Ug/YQrKgB4eElLBJ8OLJ3vXXK1N5YP1Dbwh3cStgUNeSC2
 G9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689730738; x=1692322738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygo07RPcqR77bzzKpIlmnDE/b3n985698K8wkWp8lgg=;
 b=UEocb0fqz3ZM82YBcvJfXn4bwA5Jddqdiyo/JliY/3Ymf9UGUFOWFeU/5gLtuxJWJR
 XtP/04qMoqHobbKlv0rJZPzTs/FzkTtmEuSeuy9iUpGELViX+K8SXZRepprBOfcFTGyd
 Bc4yqkrFbaJiewH7apYDLxILC8DpmaIAi1J6zA7IBi1l7U5j5OPi+ZUeL5e3CyLqeHiJ
 9oRqYrUs5ahiLo9HgmUGZNMzqPuKKRdzRtgxiRCyHHY8dTKnSGwjWE6XqongD+YJwoSw
 FqMWCc4wELpt1hWnUKJc/vfP48gYahXWmrUoeIczu33mXLJkpM5XArIJQ5VDanJWffku
 xvHw==
X-Gm-Message-State: ABy/qLZyAK2rPHe/0NxEAfq6DFLFcJkIteDJtvC/fQWlgcQeSD0JHuk+
 fYQWX3WGozUMmCnhiaiXPi5rr+KMNd6jubBcnToi33jl7kclZg==
X-Google-Smtp-Source: APBJJlFKAdGkVn6TRiVYpJw5ymKS9UvDYGdBNCgfAEsgs57P0FuWe54bEXQIwEw4ImTzihthT7wBIAWKgkeQOTW6ctE=
X-Received: by 2002:a1f:de43:0:b0:471:549e:c1ff with SMTP id
 v64-20020a1fde43000000b00471549ec1ffmr930799vkg.7.1689730736939; Tue, 18 Jul
 2023 18:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230718131316.12283-2-rbradford@rivosinc.com>
In-Reply-To: <20230718131316.12283-2-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:38:30 +1000
Message-ID: <CAKmqyKPHxVqntprdxBSdP8ehSb2dTmatAmhDn0VG05adX+_ESg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Fix LMUL check to use VLEN
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Tue, Jul 18, 2023 at 11:14=E2=80=AFPM Rob Bradford <rbradford@rivosinc.c=
om> wrote:
>
> The previous check was failing with:
>
> VLEN=3D128 ELEN =3D 64 SEW =3D 16 and LMUL =3D 1/8 which is a
> valid combination.
>
> Fix the check to allow valid combinations when VLEN is a multiple of
> ELEN.
>
> From the specification:
>
> "In general, the requirement is to support LMUL =E2=89=A5 SEWMIN/ELEN, wh=
ere
> SEWMIN is the narrowest supported SEW value and ELEN is the widest
> supported SEW value. In the standard extensions, SEWMIN=3D8. For standard
> vector extensions with ELEN=3D32, fractional LMULs of 1/2 and 1/4 must be
> supported. For standard vector extensions with ELEN=3D64, fractional LMUL=
s
> of 1/2, 1/4, and 1/8 must be supported." Elsewhere in the specification
> it makes clear that VLEN>=3DELEN.
>
> From inspection this new check allows:
>
> VLEN=3DELEN=3D64 1/2, 1/4, 1/8 for SEW >=3D8
> VLEN=3DELEN=3D32 1/2, 1/4 for SEW >=3D8
>
> Fixes: d9b7609a1fb2 ("target/riscv: rvv-1.0: configure instructions")
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> V2: Switch check to use VLEN and active SEW vs ELEN and minimum SEW
> ---
>  target/riscv/vector_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index cfacf2ebba..4d06754826 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_=
ulong s1,
>                                              xlen - 1 - R_VTYPE_RESERVED_=
SHIFT);
>
>      if (lmul & 4) {
> -        /* Fractional LMUL. */
> +        /* Fractional LMUL - check LMUL * VLEN >=3D SEW */
>          if (lmul =3D=3D 4 ||
> -            cpu->cfg.elen >> (8 - lmul) < sew) {
> +            cpu->cfg.vlen >> (8 - lmul) < sew) {
>              vill =3D true;
>          }
>      }
> --
> 2.41.0
>
>

