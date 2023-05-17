Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA35BC77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:09:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6bT-0005aj-Oe; Tue, 16 May 2023 22:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6bT-0005aQ-0l; Tue, 16 May 2023 22:09:23 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6bR-0005fr-AY; Tue, 16 May 2023 22:09:22 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-435f36ad948so42170137.3; 
 Tue, 16 May 2023 19:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684289360; x=1686881360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AniFj+UYnvb1Uv7xpgUW5zP3JI+w0nHjQEqh+9hUcvc=;
 b=UvKTBr4NhvfH+J+e7q82/zTvCwE4dp2KrJH/olRq0/7MDDoArPEvFG4kagLBmrZvhf
 bdlqEgy7vExSJ3wkZuT7isMQsmN00J9qH56yf/K938zuwBetqSTfEKGg0RHl1C3EFdUo
 dntjNfrSm4j/mWDqVAAhHlG9A31bj7zV67QC5WOPssm9ndAx5Dyc9sGSu44/HQ6+YuIg
 KarUbQQfoSHgqtRdbXmVOoG8bkjr26rbzs5ka0vhuhiJ675tljh6Q8N3szb4lF0xqTAy
 Go/+/wi8tvxZ9iqi9FqNQL1VI6J4SVX9htUkGZabDvNGRANZNrb5oOC5U6T8XswnEsii
 20Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684289360; x=1686881360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AniFj+UYnvb1Uv7xpgUW5zP3JI+w0nHjQEqh+9hUcvc=;
 b=UIp80+dg6oYd1Dpf1qfuqZL1TjqG5/2fNo3T6kdl9wkfdh42ZKvmmdgRaDp9+GwA7b
 jPaY1kBSV6a8fRwMWpZ6IjHvgPsuf4aGn5ed1qnrpVt9cPyJnxSB+1sGctVtTu3rBFj5
 RI6Urh+25dec/hL90Gi09AnPza8ihs9uZ7plx5BB4LfnPUWB/dGI1KiWuqiFxXVU9Jpb
 wQy6Azi9gkpGW9o6qRpt4kgeccAkPWEftwOpgKErjm4koXcOK6ILhcrQXtL73cvzxhM0
 U2HwwFc6RqX4WwKAeHWUWjBkjniWKCaUeC0Vbww5nh2wMU/8Wi4JrpvKTyA2NqneQ4gV
 6czw==
X-Gm-Message-State: AC+VfDxIZl/7mLDjgupb7bUemXqpylhqBr8+bKDPXN/qpKgYablS9oSC
 M5pwr+6wY0HYZhVWjo2+hA7XRbCFBa3xQYfxLPI=
X-Google-Smtp-Source: ACHHUZ7z48rWoLcZ4XAd8e1hQSU86zv5TULXkr/4UMHBTtXjEjr5zT3prurMxdX4OzDewHQiv5qCaGUqPRJA4BN7zlU=
X-Received: by 2002:a67:b308:0:b0:436:3607:957d with SMTP id
 a8-20020a67b308000000b004363607957dmr8452171vsm.20.1684289359896; Tue, 16 May
 2023 19:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:08:53 +1000
Message-ID: <CAKmqyKOMD3mDpPPZN1+sDW8iyzt0uLU5QOLVhhU8zjEnMkTGfA@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] target/riscv: Change the return type of
 pmp_hart_has_privs() to bool
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
> We no longer need the pmp_index for matched PMP entry now.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c |  8 ++++----
>  target/riscv/pmp.c        | 32 +++++++++++++-------------------
>  target/riscv/pmp.h        |  8 ++++----
>  3 files changed, 21 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 83c9699a6d..1868766082 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -685,16 +685,16 @@ static int get_physical_address_pmp(CPURISCVState *=
env, int *prot, hwaddr addr,
>                                      int mode)
>  {
>      pmp_priv_t pmp_priv;
> -    int pmp_index =3D -1;
> +    bool pmp_has_privs;
>
>      if (!riscv_cpu_cfg(env)->pmp) {
>          *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>          return TRANSLATE_SUCCESS;
>      }
>
> -    pmp_index =3D pmp_hart_has_privs(env, addr, size, 1 << access_type,
> -                                   &pmp_priv, mode);
> -    if (pmp_index < 0) {
> +    pmp_has_privs =3D pmp_hart_has_privs(env, addr, size, 1 << access_ty=
pe,
> +                                       &pmp_priv, mode);
> +    if (!pmp_has_privs) {
>          *prot =3D 0;
>          return TRANSLATE_PMP_FAIL;
>      }
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 86abe1e7cd..b5808538aa 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -296,27 +296,23 @@ static bool pmp_hart_has_privs_default(CPURISCVStat=
e *env, target_ulong addr,
>
>  /*
>   * Check if the address has required RWX privs to complete desired opera=
tion
> - * Return PMP rule index if a pmp rule match
> - * Return MAX_RISCV_PMPS if default match
> - * Return negtive value if no match
> + * Return true if a pmp rule match or default match
> + * Return false if no match
>   */
> -int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> -                       target_ulong size, pmp_priv_t privs,
> -                       pmp_priv_t *allowed_privs, target_ulong mode)
> +bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +                        target_ulong size, pmp_priv_t privs,
> +                        pmp_priv_t *allowed_privs, target_ulong mode)
>  {
>      int i =3D 0;
> -    int ret =3D -1;
> +    bool ret =3D false;
>      int pmp_size =3D 0;
>      target_ulong s =3D 0;
>      target_ulong e =3D 0;
>
>      /* Short cut if no rules */
>      if (0 =3D=3D pmp_get_num_rules(env)) {
> -        if (pmp_hart_has_privs_default(env, addr, size, privs,
> -                                       allowed_privs, mode)) {
> -            ret =3D MAX_RISCV_PMPS;
> -        }
> -        return ret;
> +        return pmp_hart_has_privs_default(env, addr, size, privs,
> +                                          allowed_privs, mode);
>      }
>
>      if (size =3D=3D 0) {
> @@ -345,7 +341,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulo=
ng addr,
>          if ((s + e) =3D=3D 1) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "pmp violation - access is partially inside\n"=
);
> -            ret =3D -1;
> +            ret =3D false;
>              break;
>          }
>
> @@ -453,17 +449,15 @@ int pmp_hart_has_privs(CPURISCVState *env, target_u=
long addr,
>               * defined with PMP must be used. We shouldn't fallback on
>               * finding default privileges.
>               */
> -            ret =3D i;
> +            ret =3D true;
>              break;
>          }
>      }
>
>      /* No rule matched */
> -    if (ret =3D=3D -1) {
> -        if (pmp_hart_has_privs_default(env, addr, size, privs,
> -                                       allowed_privs, mode)) {
> -            ret =3D MAX_RISCV_PMPS;
> -        }
> +    if (!ret) {
> +        ret =3D pmp_hart_has_privs_default(env, addr, size, privs,
> +                                         allowed_privs, mode);
>      }
>
>      return ret;
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index 0a7e24750b..cf5c99f8e6 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -72,10 +72,10 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>                         target_ulong val);
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
> -int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> -                       target_ulong size, pmp_priv_t privs,
> -                       pmp_priv_t *allowed_privs,
> -                       target_ulong mode);
> +bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +                        target_ulong size, pmp_priv_t privs,
> +                        pmp_priv_t *allowed_privs,
> +                        target_ulong mode);
>  target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
> --
> 2.25.1
>
>

