Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pobTx-0004kd-PT
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 22:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobTu-0004k0-Pq; Mon, 17 Apr 2023 22:54:10 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobTt-0003Ck-5A; Mon, 17 Apr 2023 22:54:10 -0400
Received: by mail-vs1-xe32.google.com with SMTP id bl39so960477vsb.13;
 Mon, 17 Apr 2023 19:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681786447; x=1684378447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5w6mTIn+n0QKAOz6KhmjhGbNnnyPlC2h5PpodeCi4vY=;
 b=fJW4JhcDmzOByIVuOgo1GFk8QzLvhhiLax7oNn/NyVHz511xmbAV399gI+RWVv9FLO
 1tXQKt2SgLH7B5HrL7oXEslRxBo/bTrS/3CI/z0tqe6IlAuCh3036FFi+h+jyvO75G6m
 zSAsMgTgrxD9yoAtZSrMdWH6QCECr/u7H/fSsmgAi6ej6LWXqfiy7q97w+9tAumMJXAa
 bq/AX4EyktibrMaPP7Q/1ew49bCsUDggTuD59OBNBbH+s0GrchYvNQN5RUHdGnzQmzrm
 QuojiIs4Og0Oa6xxzPhhU74TcRstw3g3tvtr0aWtr5upfYJ0XMVYWQl058ddlxz8Rib7
 WGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681786447; x=1684378447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5w6mTIn+n0QKAOz6KhmjhGbNnnyPlC2h5PpodeCi4vY=;
 b=jedNSEdjZjbAjHbyjhP4LISrX+m7p+hJWoE9VatqQlbMdAfjTiFgvu1NIgYOy1+MW4
 ln5DVcF9JsR0vMUrfvxPqkGZ5TxUgZoXjcD9i/FFA3hhf81D02pIYm92cq9cuVfplOvu
 ec4h00B3EkN3SzdWBlPCwxtlsAzQhMa2CXMArNEMQhQEiB89UTjc+yLofXr791QcECoO
 ay+hnebEoGtQM/te+P+PKLZWHt/VZD+O+Nuu3ADCRw2wjgzO9SAmV2HiZ52/347MmU6i
 d+p36yFu4a/X/dS51KTD3zWk/G51YBtoaw29ptqslLTdjZVJkg7ijCF6Xjbv08zW9lYn
 awsw==
X-Gm-Message-State: AAQBX9ele+Sl8mEgEtwiEtaM8KaOGQ7NXyCtzu7c2exA1U9IxTgD/MaO
 1aN43UDtSjcMEm8UalQ2LP7sehDgektbUkyZ7rI=
X-Google-Smtp-Source: AKy350bLmoL94o/IHDltpZSA5fsY2xq8KftXpoNgpPHdyGL554fEdOzd6Jo6iec7eZiABsl9bDBy0ECoRSrQQxdOwQQ=
X-Received: by 2002:a67:ce12:0:b0:42f:e944:7ea7 with SMTP id
 s18-20020a67ce12000000b0042fe9447ea7mr1619734vsl.6.1681786447634; Mon, 17 Apr
 2023 19:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230413090122.65228-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:53:41 +1000
Message-ID: <CAKmqyKO4zAf18FPAzkKF9j1CV+RBaLc6-e45ZpBkJoKf8Y-dvg@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/riscv: Update pmp_get_tlb_size()
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Tue, 18 Apr 2023 02:54:11 -0000

On Thu, Apr 13, 2023 at 7:04=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Not only the matched PMP entry, Any PMP entry that overlap with partial o=
f
> the tlb page may make the regions in that page have different permission
> rights. So all of them should be taken into consideration.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu_helper.c |  7 ++-----
>  target/riscv/pmp.c        | 34 +++++++++++++++++++++-------------
>  target/riscv/pmp.h        |  3 +--
>  3 files changed, 24 insertions(+), 20 deletions(-)
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
> index 1f5aca42e8..4f9389e73c 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -601,28 +601,36 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>  }
>
>  /*
> - * Calculate the TLB size if the start address or the end address of
> + * Calculate the TLB size if any start address or the end address of
>   * PMP entry is presented in the TLB page.
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
> +
> +    for (i =3D 0; i < MAX_RISCV_PMPS; i++) {
> +        pmp_sa =3D env->pmp_state.addr[i].sa;
> +        pmp_ea =3D env->pmp_state.addr[i].ea;
>
> -    if (pmp_sa <=3D tlb_sa && pmp_ea >=3D tlb_ea) {
> -        return TARGET_PAGE_SIZE;
> -    } else {
>          /*
> -         * At this point we have a tlb_size that is the smallest possibl=
e size
> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.

This comment points out that we should have the smallest region, so
I'm not clear why we need this change. Can you update the commit
description to be clear on why this change is needed and what it
fixes?

Alistair

> -         *
> -         * If the size is less then TARGET_PAGE_SIZE we drop the size to=
 1.
> +         * If any start address or the end address of PMP entry is prese=
nted
> +         * in the TLB page and cannot override the whole TLB page we dro=
p the
> +         * size to 1.
>           * This means the result isn't cached in the TLB and is only use=
d for
>           * a single translation.
>           */
> -        return 1;
> +        if (((pmp_sa >=3D tlb_sa && pmp_sa <=3D tlb_ea) ||
> +             (pmp_ea >=3D tlb_sa && pmp_ea <=3D tlb_ea)) &&
> +            !(pmp_sa =3D=3D tlb_sa && pmp_ea =3D=3D tlb_ea)) {
> +            return 1;
> +        }
>      }
> +
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

