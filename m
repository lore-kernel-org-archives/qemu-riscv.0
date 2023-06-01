Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A5C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:29:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4as8-0002kr-5U; Thu, 01 Jun 2023 01:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4as7-0002ke-5t; Thu, 01 Jun 2023 01:29:15 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4as5-0003p5-IK; Thu, 01 Jun 2023 01:29:14 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-78701841ccbso137537241.2; 
 Wed, 31 May 2023 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685597351; x=1688189351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WAf3FwYaquyP3n6zsFjaj+Lc2oHghxoItTC7sa3SRZQ=;
 b=VdgJXWxCnOWcfaJtyfP0BhuUvu7QhdDTQeVBvI5H17KCu/GrIsEBVLk32mz2cMyWXW
 01gxqUanz+Raldybj6G5otUNTb2BnfXD+9P+AsKnutcflaWcxQs/VumwZFxCvY/LFjDQ
 +yjZiBcfT7o2VfyH7PRha2YtZyT/Grq5OUy4IT7HJlRuMNt66tXSHybQgI1rB2e8G3+n
 y0I0F8KNpzIPBVYKY36hZRIsNRGnWhebKxCrYyRF7enFBOYpLCfRhC55WS/d15UqZcjj
 hinrXS1SQoKdIjyuLOdTyHkrfmVLptE2qFAuVpPhrpz5s9PuyGyzVrF4dRs3yq2Tft1k
 o2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685597351; x=1688189351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAf3FwYaquyP3n6zsFjaj+Lc2oHghxoItTC7sa3SRZQ=;
 b=bZemhEg3CYX85eXY+mLSlXyPjbhBiWInNUBiFH6AFh30P8xvoCTsSo4LhQto8Rbz0i
 5q+fSs/QQZkXy7G5Go7KBe6yZ6KJy/gU0B56uScojLrBFKsowEQfxih+ncdzVwTWIK7k
 7UjvRGqlU4qi9V5ptmiF1xhuzUXxZgtaNt8s6ALGoKAMy7KlGMd+zUJIdO4BQmGrR06W
 Qdnqih+aTwZlIXQBE7CGqdoO0F972fEJ42CUHDeFodRpZIF6AfUxW4H0JJjieHn4pmh4
 gZ7bv87nXzR025+ZyJ8nbiyR2hfmDyaVQwfJOvCFJ+9yADAk3QvVBHEINhNPpi28UWy2
 dcew==
X-Gm-Message-State: AC+VfDwnqM3y+tVbYZ0WCdET3nVKl5KuU0QbO0s4/idka6qWBkH2v0+1
 hOJBatXtjwdSHrVn5P7i+ZNQp6gxvDp+0+5fg2c=
X-Google-Smtp-Source: ACHHUZ5EhfgeLcjA3h7cnEJkfiXrGeRe5jvObgTunmKmHF9QnfUG/RtDYcR0ev9+Ti9MSzr5ES4MjrXtV/oE+PJZqFo=
X-Received: by 2002:a05:6102:103:b0:434:536c:7078 with SMTP id
 z3-20020a056102010300b00434536c7078mr3238975vsq.26.1685597351478; Wed, 31 May
 2023 22:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230529121719.179507-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jun 2023 15:28:45 +1000
Message-ID: <CAKmqyKOunX0nDZe4od9LVUYFccZ-6q4Buv5ie4g4DiV7v9WnCw@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Support MSTATUS.MPV/GVA only when RVH
 is enabled
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
> MPV and GVA bits are added by hypervisor extension to mstatus
> and mstatush (if MXLEN=3D32).
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 58499b5afc..6ac11d1f11 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1311,11 +1311,9 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
>      }
>
>      if (xl !=3D MXL_RV32 || env->debugger) {
> -        /*
> -         * RV32: MPV and GVA are not in mstatus. The current plan is to
> -         * add them to mstatush. For now, we just don't support it.
> -         */
> -        mask |=3D MSTATUS_MPV | MSTATUS_GVA;
> +        if (riscv_has_ext(env, RVH)) {
> +            mask |=3D MSTATUS_MPV | MSTATUS_GVA;
> +        }
>          if ((val & MSTATUS64_UXL) !=3D 0) {
>              mask |=3D MSTATUS64_UXL;
>          }
> @@ -1351,7 +1349,7 @@ static RISCVException write_mstatush(CPURISCVState =
*env, int csrno,
>                                       target_ulong val)
>  {
>      uint64_t valh =3D (uint64_t)val << 32;
> -    uint64_t mask =3D MSTATUS_MPV | MSTATUS_GVA;
> +    uint64_t mask =3D riscv_has_ext(env, RVH) ? MSTATUS_MPV | MSTATUS_GV=
A : 0;
>
>      env->mstatus =3D (env->mstatus & ~mask) | (valh & mask);
>
> --
> 2.25.1
>
>

