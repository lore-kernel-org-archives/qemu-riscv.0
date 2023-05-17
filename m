Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E0C7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:22:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6o9-00019b-So; Tue, 16 May 2023 22:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6o8-000199-Qe; Tue, 16 May 2023 22:22:28 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6o7-0007uS-9A; Tue, 16 May 2023 22:22:28 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-43478543ad0so44987137.1; 
 Tue, 16 May 2023 19:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684290145; x=1686882145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXjmbTs7T408Q+X/1jFybFrnaTrbqTRAA24MKKA6TYM=;
 b=MM1eMW+dAEgtmDc7JlV+VvrRHuDrE3EYb7WZ7yUYmCx/s6Oa+cTAvV0h8W0coTZ8FA
 oJOCIboL+FGbNoE4Gmr7VMH3hZ6d9gezX/Q8PpxiJcIG3Gmy93hIxOKZk2xes1uXsnFO
 d72D+U6v/Z9XrgCquEf4OCI4hqRkR1GrB8jmebz11pqX+AXJxrPWEyebdF1IYCm1p1k5
 8iWqhk6PbjmpKaO89dl73MnZ0QKFRhjEYN0mD/7M89jQ8uUh7YMK8CEyZQHpbyVXR6/c
 HPSd17N22GrlOVuySjpXqAQ8a+1ZDpTNQQb5eUON2KXJmzBHTa7GLi+R/Mg9n4ig07af
 ewjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684290145; x=1686882145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXjmbTs7T408Q+X/1jFybFrnaTrbqTRAA24MKKA6TYM=;
 b=Gupx4onVZwp3sMv3hxdZroiJ35afgycvlvQJ4qRP6jUSpgLNQFSp0Vopw2YSFBwDxW
 V8bT/auQsfH8v4uTX5h3KicZdGc7XyMJ/FiJHj+rXq8+y6aHJZEw2sUgdtaUKs3IkgBk
 ekVrLHKXwLFA9jneMFRTozNUSYAyXub++9pek191XEEBjj2zSgwHBRZUaanRoeZXdmvv
 Db33CWJK4o8gLhuGsFHWlv8GeTiSbcsQ2cGJpvOXfpXkh75qq7RBa9ao/zQl0V6LXz+N
 hz03l8etTBNoZFCm8RiGJGrULaXhi0CgmaFRUPC19VAT1qyGHFbgLB5EMmx93NcCrUXT
 wIyA==
X-Gm-Message-State: AC+VfDzmWCfkgKKgMeDhnUXFXpgFZOgNyEE1UEeX4rr8jBFDO65mN1E1
 pVFWT3+IiD5xi3EbPZ02NVzPK/5ImAawmKC9CTM=
X-Google-Smtp-Source: ACHHUZ6aXqKBx+CrmFHvjWtlycCnO2Tf2QteiLy8VJYqRjL2GcAbPZAsKqCNfNH3ZkEPujt90muGXCjga4lkUj6tEWs=
X-Received: by 2002:a67:f50a:0:b0:432:8c1d:88a with SMTP id
 u10-20020a67f50a000000b004328c1d088amr16695772vsn.23.1684290145349; Tue, 16
 May 2023 19:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-9-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-9-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:21:59 +1000
Message-ID: <CAKmqyKPJ2SxHUg0kvOvX-XwJkRWyvmwHAWsn_hXm9me1qZnHKg@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] target/riscv: Update the next rule addr in
 pmpaddr_csr_write()
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
> Currently only the rule addr of the same index of pmpaddr is updated
> when pmpaddr CSR is modified. However, the rule addr of next PMP entry
> may also be affected if its A field is PMP_AMATCH_TOR. So we should
> also update it in this case.
>
> Write to pmpaddr CSR will not affect the rule nums, So we needn't update
> call pmp_update_rule_nums()  in pmpaddr_csr_write().
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 80889a1185..3af2caff31 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -507,6 +507,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t a=
ddr_index,
>                         target_ulong val)
>  {
>      trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
> +    bool is_next_cfg_tor =3D false;
>
>      if (addr_index < MAX_RISCV_PMPS) {
>          /*
> @@ -515,9 +516,9 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t a=
ddr_index,
>           */
>          if (addr_index + 1 < MAX_RISCV_PMPS) {
>              uint8_t pmp_cfg =3D env->pmp_state.pmp[addr_index + 1].cfg_r=
eg;
> +            is_next_cfg_tor =3D PMP_AMATCH_TOR =3D=3D pmp_get_a_field(pm=
p_cfg);
>
> -            if (pmp_cfg & PMP_LOCK &&
> -                PMP_AMATCH_TOR =3D=3D pmp_get_a_field(pmp_cfg)) {
> +            if (pmp_cfg & PMP_LOCK && is_next_cfg_tor) {
>                  qemu_log_mask(LOG_GUEST_ERROR,
>                                "ignoring pmpaddr write - pmpcfg + 1 locke=
d\n");
>                  return;
> @@ -526,7 +527,10 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t =
addr_index,
>
>          if (!pmp_is_locked(env, addr_index)) {
>              env->pmp_state.pmp[addr_index].addr_reg =3D val;
> -            pmp_update_rule(env, addr_index);
> +            pmp_update_rule_addr(env, addr_index);
> +            if (is_next_cfg_tor) {
> +                pmp_update_rule_addr(env, addr_index + 1);
> +            }
>          } else {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "ignoring pmpaddr write - locked\n");
> --
> 2.25.1
>
>

