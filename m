Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C356C7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:00:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6TC-0001ME-0E; Tue, 16 May 2023 22:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6TA-0001Lk-5j; Tue, 16 May 2023 22:00:48 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6T8-0004Mc-D8; Tue, 16 May 2023 22:00:47 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-783f93cf803so5459241.3; 
 Tue, 16 May 2023 19:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684288845; x=1686880845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvoqKqiSzKq6w/J0Q5O3s30jBs89GYnFBErLdPT8KFM=;
 b=oECbFrs/N2VIdpSOoIKBOSwb+xSiTk0j7nDa2IlJnDxpSQKcvAX2NEnxuciYyrEvmi
 I0g9YQj6GPKKrtJewDpdgknL08hMcRJkiZLe4p0n98SjhcJgaFvDG5+7/ue7ga6jeH7D
 Ud5tJzukThrnxJoJdFXN8Rd4k2+Mj8mGMxJg/HHI0H9iIQrHUZYGOUZDhWT22YZMNiBz
 linD7Fw5DLnl3hQHbicYOqb0uGO2tzp1HjRLvWr0O4xI/SmKxUKP+jd9gSvs3eXgYnVO
 88IVQkSdScbChdx6wR8vZ9+pY6K18dJ7ZRjxa8XFao68bYq2e3zmy/vLtvbV85tbFaol
 5C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684288845; x=1686880845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvoqKqiSzKq6w/J0Q5O3s30jBs89GYnFBErLdPT8KFM=;
 b=DeU+weQm0/4fzN/X5P7A7k+8q7jYPzqmMHr9N4npGbU8GfOUnYyAhRYIkiKOUNBfcj
 lwBnDy6VDpDI3+h4s+QubEJWZS/0uPufTyfJnq2hF1vdHGJOjdIWKwNq8wvfeCbZ/ile
 AT6qI9DcGfbar3P/yN39edXuaTUDQOOQqpMXwK9cehRWAKaeGda2Kh5lnOSD4F+wI/Sy
 TtCgx7aMJWEms4X1gswvwHKyri7/RXXim0lbX+yEcqkG8oo/hqfs2gh2plmoo4IERu4g
 DoqpGe3yHtxWsxk7CFpRIMjWUffHj41Y5DXOQ+ms/0qgp6g/GCoePWgFX9z7PdN0Gh7e
 KaGw==
X-Gm-Message-State: AC+VfDxqF0IP+QHUg0xxVbpIBBm3CyFGwrCAfibY0Q0mYs0tJIkBaqqE
 Mmy6m4Tdm/sJAtbg8cBSN150KMIhviP2jigqqGo=
X-Google-Smtp-Source: ACHHUZ6tlthBh5EbNT23dDy7/F18PbNrJDtHREXZNKI2O6sqFjxx3+CH4FNIl7Xcy5IGm66M/N3U6POJ1r1lgr8/2Q8=
X-Received: by 2002:a05:6102:4b3:b0:436:695d:1351 with SMTP id
 r19-20020a05610204b300b00436695d1351mr3769938vsa.27.1684288844852; Tue, 16
 May 2023 19:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:00:18 +1000
Message-ID: <CAKmqyKN2xt_bSFqjHEQHuB=UbnPe-scJuBG1z42=esHaDsQFaw@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] target/riscv: Update pmp_get_tlb_size()
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Sat, Apr 29, 2023 at 12:37=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> PMP entries before the matched PMP entry (including the matched PMP entry=
)
> may only cover partial of the TLB page, which may make different regions =
in
> that page allow different RWX privs. Such as for PMP0 (0x80000008~0x80000=
00F,
> R) and PMP1 (0x80000000~0x80000FFF, RWX), write access to 0x80000000 will
> match PMP1. However we cannot cache the translation result in the TLB sin=
ce
> this will make the write access to 0x80000008 bypass the check of PMP0. S=
o we
> should check all of them instead of the matched PMP entry in pmp_get_tlb_=
size()
> and set the tlb_size to 1 in this case.
> Set tlb_size to TARGET_PAGE_SIZE if PMP is not support or there is no PMP=
 rules.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/cpu_helper.c |  7 ++---
>  target/riscv/pmp.c        | 64 ++++++++++++++++++++++++++++++---------
>  target/riscv/pmp.h        |  3 +-
>  3 files changed, 52 insertions(+), 22 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 433ea529b0..075fc0538a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -703,11 +703,8 @@ static int get_physical_address_pmp(CPURISCVState *e=
nv, int *prot,
>      }
>
>      *prot =3D pmp_priv_to_page_prot(pmp_priv);
> -    if ((tlb_size !=3D NULL) && pmp_index !=3D MAX_RISCV_PMPS) {
> -        target_ulong tlb_sa =3D addr & ~(TARGET_PAGE_SIZE - 1);
> -        target_ulong tlb_ea =3D tlb_sa + TARGET_PAGE_SIZE - 1;
> -
> -        *tlb_size =3D pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
> +    if (tlb_size !=3D NULL) {
> +        *tlb_size =3D pmp_get_tlb_size(env, addr);
>      }
>
>      return TRANSLATE_SUCCESS;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 1f5aca42e8..ad20a319c1 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -601,28 +601,62 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>  }
>
>  /*
> - * Calculate the TLB size if the start address or the end address of
> - * PMP entry is presented in the TLB page.
> + * Calculate the TLB size. If the PMP rules may make different regions i=
n
> + * the TLB page of 'addr' allow different RWX privs, set the size to 1
> + * (to make the translation result uncached in the TLB and only be used =
for
> + * a single translation). Set the size to TARGET_PAGE_SIZE otherwise.

I think this could be clearer, something like:

Calculate the TLB size.
If the matching PMP rule only matches a subset of the TLB, it's
possible that earlier higher priority PMP regions will match other
parts of the TLB.
For example if PMP0 is (0x80000008~0x8000000F, > R) and PMP1 is
(0x80000000~0x80000FFF, RWX) a write access to 0x80000000 will match
PMP1. However we cannot cache the translation result in the TLB since
this will make the write access to 0x80000008 bypass the check of
PMP0.
To avoid this we return a size of 1 (which means no cacheing) if the
PMP region does not cover the entire TLB.

>   */
> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> -                              target_ulong tlb_sa, target_ulong tlb_ea)
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
>  {
> -    target_ulong pmp_sa =3D env->pmp_state.addr[pmp_index].sa;
> -    target_ulong pmp_ea =3D env->pmp_state.addr[pmp_index].ea;
> +    target_ulong pmp_sa;
> +    target_ulong pmp_ea;
> +    target_ulong tlb_sa =3D addr & ~(TARGET_PAGE_SIZE - 1);
> +    target_ulong tlb_ea =3D tlb_sa + TARGET_PAGE_SIZE - 1;
> +    int i;
>
> -    if (pmp_sa <=3D tlb_sa && pmp_ea >=3D tlb_ea) {
> +    /*
> +     * If PMP is not supported or there is no PMP rule, which means the =
allowed
> +     * RWX privs of the page will not affected by PMP or PMP will provid=
e the
> +     * same option (disallow accesses or allow default RWX privs) for al=
l
> +     * addresses, set the size to TARGET_PAGE_SIZE.

Sam here:

If PMP is not supported or there are no PMP rules, the permissions of
the page will not affected by PMP so we set the size to
TARGET_PAGE_SIZE.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +     */
> +    if (!riscv_cpu_cfg(env)->pmp || !pmp_get_num_rules(env)) {
>          return TARGET_PAGE_SIZE;
> -    } else {
> +    }
> +
> +    for (i =3D 0; i < MAX_RISCV_PMPS; i++) {
> +        if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) =3D=3D PMP_AM=
ATCH_OFF) {
> +            continue;
> +        }
> +
> +        pmp_sa =3D env->pmp_state.addr[i].sa;
> +        pmp_ea =3D env->pmp_state.addr[i].ea;
> +
>          /*
> -         * At this point we have a tlb_size that is the smallest possibl=
e size
> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> -         *
> -         * If the size is less then TARGET_PAGE_SIZE we drop the size to=
 1.
> -         * This means the result isn't cached in the TLB and is only use=
d for
> -         * a single translation.
> +         * Only the first PMP entry that covers (whole or partial of) th=
e TLB
> +         * page really matters:
> +         * If it can cover the whole page, set the size to TARGET_PAGE_S=
IZE.
> +         * The following PMP entries have lower priority and will not af=
fect
> +         * the allowed RWX privs of the page.
> +         * If it only cover partial of the TLB page, set the size to 1 s=
ince
> +         * the allowed RWX privs for the covered region may be different=
 from
> +         * other region of the page.
>           */
> -        return 1;
> +        if (pmp_sa <=3D tlb_sa && pmp_ea >=3D tlb_ea) {
> +            return TARGET_PAGE_SIZE;
> +        } else if ((pmp_sa >=3D tlb_sa && pmp_sa <=3D tlb_ea) ||
> +                   (pmp_ea >=3D tlb_sa && pmp_ea <=3D tlb_ea)) {
> +            return 1;
> +        }
>      }
> +
> +    /*
> +     * If no PMP entry covers any region of the TLB page, similar to the=
 above
> +     * case that there is no PMP rule, PMP will provide the same option
> +     * (disallow accesses or allow default RWX privs) for the whole page=
,
> +     * set the size to TARGET_PAGE_SIZE.
> +     */
> +    return TARGET_PAGE_SIZE;
>  }
>
>  /*
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index b296ea1fc6..0a7e24750b 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -76,8 +76,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong=
 addr,
>                         target_ulong size, pmp_priv_t privs,
>                         pmp_priv_t *allowed_privs,
>                         target_ulong mode);
> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> -                              target_ulong tlb_sa, target_ulong tlb_ea);
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
>  uint32_t pmp_get_num_rules(CPURISCVState *env);
> --
> 2.25.1
>
>

