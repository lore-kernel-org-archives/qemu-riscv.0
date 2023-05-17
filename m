Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6262DC77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:24:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6pE-0002Mn-RU; Tue, 16 May 2023 22:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6pD-0002MA-Ea; Tue, 16 May 2023 22:23:35 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6pB-00083b-UN; Tue, 16 May 2023 22:23:35 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-45046c21e55so125787e0c.1; 
 Tue, 16 May 2023 19:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684290212; x=1686882212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bG2wgxnKleCxhppVcCz9JO8+8ky4GGIOL5PH0OwHiLU=;
 b=lNQOCZUkS7II9rPDSIn04N8TUm/snDux4kCoJrSfTrmsJt+CUuuK+8Pq5PUNPud9ti
 maclaHsW1NEktJTa/cIjMje9RduAZDTPjzPJ98ibEkwO3e+uBdsj2XWQDetbRXEaLxHP
 KrmXdmsAR88N28GKlA87Z2I+SntEcVaIvFWu/5GvosrJ4PjrFY+IKU8kkHN61M0jlpjS
 NqGeCz/u6J2wz5PK1b5rdS+s2Dahb6V43wxVv0jvmGXPzJJa0Cm/JmC6yh3/hsRUDuo5
 WxEYyyvj8ePkLYY5bS0mmtnjs11S6YiCBIK+l9bOShZwXRniqwY8CuurpDMMQ0oXRyWx
 3X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684290212; x=1686882212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bG2wgxnKleCxhppVcCz9JO8+8ky4GGIOL5PH0OwHiLU=;
 b=kzPVJl+YhsrJRcw12Fzyr/K2abKXNu8GCXQ5uD0K+eG7fi8cco64o5S4UwWBCoLAB7
 Yt4eEzvivD8RGj9daj3sbN/AgELdiAZXQPULEOXPKFI9iZqOjTQH11i+KovFAXtXnWYL
 tO+arHs1aRLYJmY3PEbXdNQU3045RU3QpC8MvxbIKXq57Dhrl9mbMAQkLDVvRhYnaR00
 mZWM9AFeDiJd/eyhA9HDXnL8h+tpMoexCHJcWJUSPbmw2OxJnQO+WbubcvzebjWEtc8u
 f6ht5gvTOiCthQ+dhOofTOUcDOEC9ZmceEI7Xks0PgvSi7tsLRlriK6puM/ANgjKOqxI
 CNyQ==
X-Gm-Message-State: AC+VfDzX1JtxGmp9TZ8KlH1smbcqQ/swPzFpevz2/HImSheM5gfW2RAx
 rPACpL5vXmnBcbOX5Yh39ATBOytDUBI1dBGRh0o=
X-Google-Smtp-Source: ACHHUZ7QuQZl+o/BbKImh9j0JaNsYJ5U6gO+8tUbHadlvDn4qlmRG9SasA5ERITNoNhcO0VfBS17rhtllULslhiYXnQ=
X-Received: by 2002:a05:6102:457:b0:436:3474:6cfa with SMTP id
 e23-20020a056102045700b0043634746cfamr7691833vsq.33.1684290212511; Tue, 16
 May 2023 19:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-13-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-13-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:23:06 +1000
Message-ID: <CAKmqyKO5ca=YH5FDN=Ue6iGnB+iGd8T_iU=oS26-dSz-DqeqBw@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] target/riscv: Separate pmp_update_rule() in
 pmpcfg_csr_write
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
> Use pmp_update_rule_addr() and pmp_update_rule_nums() separately to
> update rule nums only once for each pmpcfg_csr_write. Then remove
> pmp_update_rule() since it become unused.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 330f61b0f1..317c28ba73 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -29,7 +29,6 @@
>  static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>                            uint8_t val);
>  static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
> -static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
>
>  /*
>   * Accessor method to extract address matching type 'a field' from cfg r=
eg
> @@ -121,7 +120,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
>              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - lock=
ed\n");
>          } else if (env->pmp_state.pmp[pmp_index].cfg_reg !=3D val) {
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
> -            pmp_update_rule(env, pmp_index);
> +            pmp_update_rule_addr(env, pmp_index);
>              return true;
>          }
>      } else {
> @@ -209,18 +208,6 @@ void pmp_update_rule_nums(CPURISCVState *env)
>      }
>  }
>
> -/*
> - * Convert cfg/addr reg values here into simple 'sa' --> start address a=
nd 'ea'
> - *   end address values.
> - *   This function is called relatively infrequently whereas the check t=
hat
> - *   an address is within a pmp rule is called often, so optimise that o=
ne
> - */
> -static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index)
> -{
> -    pmp_update_rule_addr(env, pmp_index);
> -    pmp_update_rule_nums(env);
> -}
> -
>  static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
>                             target_ulong addr)
>  {
> @@ -481,6 +468,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t re=
g_index,
>
>      /* If PMP permission of any addr has been changed, flush TLB pages. =
*/
>      if (modified) {
> +        pmp_update_rule_nums(env);
>          tlb_flush(env_cpu(env));
>      }
>  }
> --
> 2.25.1
>
>

