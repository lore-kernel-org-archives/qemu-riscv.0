Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E711C7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:10:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6c9-0006Pv-Kd; Tue, 16 May 2023 22:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6c8-0006PA-2R; Tue, 16 May 2023 22:10:04 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6c6-0005kC-GR; Tue, 16 May 2023 22:10:03 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-783f88ce548so41004241.1; 
 Tue, 16 May 2023 19:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684289401; x=1686881401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0No0m2mRFxSAqTu2ZK0g/Uj5QQcLw0du2yARPBYqmJs=;
 b=JGDZEPYm6atmHsW63kTpXpAVOfnMVzgX+/f9V4ySjJUdQKLhQ6LqeAvEuhS67XNEtT
 sNzGlP/Dejb7duTxYcTt/bZg/bAYX0S5rUxt7WP80mRkmUE1juTWWWbRNjF8ziXJa3+w
 g0Z8mxGUlS7eELcpKZ0xqh/50RZzacCQTjxOdz/C36dzzDEpG9FcrIuSDvz+H69TLsf5
 dqbRgytKnPxvyzTnudQM/wSiRYMkN4tYh+pB83vVXKAC9Cqs3FWgVyKy0RJvBOIps/g/
 Lmw4bnKz7YT7+q7644DdOjwWUfTQbG8x12ryQTOG6P/Fo3MqAjcDUAKdfC2YOlZdwpjG
 hrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684289401; x=1686881401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0No0m2mRFxSAqTu2ZK0g/Uj5QQcLw0du2yARPBYqmJs=;
 b=aRtG+aBvewpk7omy3KS+n7WCQCHFCC8quKqco6FXoi8ySYpsWw4I0bxbKUKrP4iJxK
 RAh5jhulUZCzPZUaFZ1SdnWqflst5XfP9DwJt+WdiMD2IgWcA7Wr/cdtl/Jco/WaOz6h
 Awq21DyQjX/JJFhYJXg6y2nqWS+9uu6xnwObIxOTqls9xjG2moXYRAqhBWAqlqiXnxlj
 5oLZeBI1r0gBddPTeTLxhJLu+lYXMwmRkfD+8S/YkvioE2FH5h5fA4f3LLezxNuQYxKt
 /p9fOeDwssrtaQLARYO15vtQdiPBTILb/4UkTI7bp04L9cSEoXrOuN9/MI8vhPW6LA7O
 WT6w==
X-Gm-Message-State: AC+VfDxIlSLHPdbW0HnGaJsj8fol6wtad1BIIQJFWIUodNvb4TdndNQP
 DMSkY2uhnj22q9q+FuKdBRu5ewHNJf79GI9hRiQ=
X-Google-Smtp-Source: ACHHUZ42y5jqKmJlZDmDA2QpLM4d8p08zozOukr4XOzMTB985UajKXCoAvivoYltDrjk8kxo9Q3UAKd81N/VmB0DX4k=
X-Received: by 2002:a67:be18:0:b0:42f:fc44:be5d with SMTP id
 x24-20020a67be18000000b0042ffc44be5dmr16822214vsq.27.1684289401039; Tue, 16
 May 2023 19:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:09:35 +1000
Message-ID: <CAKmqyKPc=mDqXta_hgVgt86GRzCmsdD6wb05upqPpeRLsw5XZg@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] target/riscv: Remove unused paramters in
 pmp_hart_has_privs_default()
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Sat, Apr 29, 2023 at 12:38=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> The addr and size parameters in pmp_hart_has_privs_default() are unused.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index e745842973..d2d8429277 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -236,8 +236,7 @@ static int pmp_is_in_range(CPURISCVState *env, int pm=
p_index,
>  /*
>   * Check if the address has required RWX privs when no PMP entry is matc=
hed.
>   */
> -static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong =
addr,
> -                                       target_ulong size, pmp_priv_t pri=
vs,
> +static bool pmp_hart_has_privs_default(CPURISCVState *env, pmp_priv_t pr=
ivs,
>                                         pmp_priv_t *allowed_privs,
>                                         target_ulong mode)
>  {
> @@ -309,8 +308,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>
>      /* Short cut if no rules */
>      if (0 =3D=3D pmp_get_num_rules(env)) {
> -        return pmp_hart_has_privs_default(env, addr, size, privs,
> -                                          allowed_privs, mode);
> +        return pmp_hart_has_privs_default(env, privs, allowed_privs, mod=
e);
>      }
>
>      if (size =3D=3D 0) {
> @@ -454,8 +452,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>
>      /* No rule matched */
>      if (!ret) {
> -        ret =3D pmp_hart_has_privs_default(env, addr, size, privs,
> -                                         allowed_privs, mode);
> +        ret =3D pmp_hart_has_privs_default(env, privs, allowed_privs, mo=
de);
>      }
>
>      return ret;
> --
> 2.25.1
>
>

