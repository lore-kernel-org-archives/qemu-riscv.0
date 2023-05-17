Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B800C7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:06:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6YH-0003Jl-IW; Tue, 16 May 2023 22:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6YG-0003JQ-7u; Tue, 16 May 2023 22:06:04 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6YE-0005OY-KZ; Tue, 16 May 2023 22:06:04 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-783f17f0a00so109601241.2; 
 Tue, 16 May 2023 19:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684289161; x=1686881161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vb9crPlgGFjHyByByS5cBbAtAWr1asL2FUDwEX5WH4I=;
 b=cQmdJk66JduoKrD94C2oJMAk3EAU3rcMZCff0EUsr8b546OWvlmiQQ/JcBFlHG4oO4
 BpgnJREuacu7zJUiF4H/goln1GXJCyNjUw/T8uEUa2NbBTGRH124iUaTj8aSmWKx3gkN
 Hsh2rrePM2rUFr4R1YWzvoguqxo1LX4OBC2QjAklSmWf1WIzEdiq+m2VBxjJnn5exn8/
 yVpdB0NoqMKH2hBJDG0g1R60m/262/aS4KIF/hBDFNZOyxE/68w8razMnGNvGFUAGZ59
 Usuvwa+K+Ozba1ZPESpOUiMqXY16Uz7PKInXZRRy9rF8zk92k3qdzvhafOU9HYAURPJT
 CTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684289161; x=1686881161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vb9crPlgGFjHyByByS5cBbAtAWr1asL2FUDwEX5WH4I=;
 b=UMjWH6SUwW6E8qWtGZf00CBkt5lHhpRf4cH0eew99qwnwnhSDVjHnFNaAa41eCE/64
 gQuv0UnnfNvhk84RRZa7eb8iWpwM3ZnvyXXE6zYie+39dqewBxbxXXicHzTffWBlAq2u
 6vXRSmPKawPLDgYG6dyhEgyCa95jkbN0w70V0IynCxVYiA3xvLPofDVsKP7LFCSc7W5R
 DPAKF1r99Fu32bqx4ksEz4/1qFRfVYqpQ/V9g9XmGXs44kIAq6CDeMWro9CexoPfjH7U
 otaex+a3GsRUw/cNPqp0te5isPMyz/NvzCMzlFKXHRzRO1QuqQch/M10gRiwgnvzHFs2
 o9AA==
X-Gm-Message-State: AC+VfDz7LRhX3PWKxxW+SVbMq0EkxcSxTCoCxgKNRQSYaZuf2XyXYBlb
 CQKPGsozaxHq7JNxF3kpXWv+eECNU2jZa0ATfDk=
X-Google-Smtp-Source: ACHHUZ6vZN6/ucmBfb4l4vFDNGYEwO+R+8MzGko9Ou7wBICB4vpo/pjGiii8RW5Rd1t9oN1bnvMWI4OpmCxjSsmiuPI=
X-Received: by 2002:a67:e455:0:b0:434:81b9:76a3 with SMTP id
 n21-20020a67e455000000b0043481b976a3mr15195059vsm.30.1684289160969; Tue, 16
 May 2023 19:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:05:34 +1000
Message-ID: <CAKmqyKMMEnhm35MO5dBPK-WxQPn4pAkNtFR1=V+hTZyZw4a3KQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] target/riscv: Move pmp_get_tlb_size apart from
 get_physical_address_pmp
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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
> pmp_get_tlb_size can be separated from get_physical_address_pmp and is on=
ly
> needed when ret =3D=3D TRANSLATE_SUCCESS.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 075fc0538a..83c9699a6d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -676,14 +676,11 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_=
ulong newpriv)
>   *
>   * @env: CPURISCVState
>   * @prot: The returned protection attributes
> - * @tlb_size: TLB page size containing addr. It could be modified after =
PMP
> - *            permission checking. NULL if not set TLB page for addr.
>   * @addr: The physical address to be checked permission
>   * @access_type: The type of MMU access
>   * @mode: Indicates current privilege level.
>   */
> -static int get_physical_address_pmp(CPURISCVState *env, int *prot,
> -                                    target_ulong *tlb_size, hwaddr addr,
> +static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwadd=
r addr,
>                                      int size, MMUAccessType access_type,
>                                      int mode)
>  {
> @@ -703,9 +700,6 @@ static int get_physical_address_pmp(CPURISCVState *en=
v, int *prot,
>      }
>
>      *prot =3D pmp_priv_to_page_prot(pmp_priv);
> -    if (tlb_size !=3D NULL) {
> -        *tlb_size =3D pmp_get_tlb_size(env, addr);
> -    }
>
>      return TRANSLATE_SUCCESS;
>  }
> @@ -905,7 +899,7 @@ restart:
>          }
>
>          int pmp_prot;
> -        int pmp_ret =3D get_physical_address_pmp(env, &pmp_prot, NULL, p=
te_addr,
> +        int pmp_ret =3D get_physical_address_pmp(env, &pmp_prot, pte_add=
r,
>                                                 sizeof(target_ulong),
>                                                 MMU_DATA_LOAD, PRV_S);
>          if (pmp_ret !=3D TRANSLATE_SUCCESS) {
> @@ -1300,8 +1294,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>              prot &=3D prot2;
>
>              if (ret =3D=3D TRANSLATE_SUCCESS) {
> -                ret =3D get_physical_address_pmp(env, &prot_pmp, &tlb_si=
ze, pa,
> +                ret =3D get_physical_address_pmp(env, &prot_pmp, pa,
>                                                 size, access_type, mode);
> +                tlb_size =3D pmp_get_tlb_size(env, pa);
>
>                  qemu_log_mask(CPU_LOG_MMU,
>                                "%s PMP address=3D" HWADDR_FMT_plx " ret %=
d prot"
> @@ -1333,8 +1328,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>                        __func__, address, ret, pa, prot);
>
>          if (ret =3D=3D TRANSLATE_SUCCESS) {
> -            ret =3D get_physical_address_pmp(env, &prot_pmp, &tlb_size, =
pa,
> +            ret =3D get_physical_address_pmp(env, &prot_pmp, pa,
>                                             size, access_type, mode);
> +            tlb_size =3D pmp_get_tlb_size(env, pa);
>
>              qemu_log_mask(CPU_LOG_MMU,
>                            "%s PMP address=3D" HWADDR_FMT_plx " ret %d pr=
ot"
> --
> 2.25.1
>
>

