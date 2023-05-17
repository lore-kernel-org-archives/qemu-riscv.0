Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72269C7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:15:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6gt-0008JC-Rj; Tue, 16 May 2023 22:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6gr-0008IV-Gc; Tue, 16 May 2023 22:14:57 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6gq-0006eG-0q; Tue, 16 May 2023 22:14:57 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-77d049b9040so6496150241.1; 
 Tue, 16 May 2023 19:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684289694; x=1686881694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR5FXfE7Rmw0GIq0apMD/6eS2jMvPSplBxlV0yF+seI=;
 b=rIq5De1nnFs1+emRa3ScGtmVLzkRCLHnqEhiH/7VIYT4T63OXW1HZSeYYzmw4NH6TJ
 s3Jrb3w4opzQKwtx7ilVldjHcX0JJTcPRdMcy7b0j5TH6VE1T8sEppLTKJmDUKjE+b4z
 u7a+mok6ylVf3EjRFASkDN2PQukHm6ZT8j5RD1vSNj+SpWXQOT3n6x3/DavKklWVkz7z
 lTHWbtTr4m18XWGJmGxNhcSD0bGINKzVQ9hZ365xRtEZCOaHxR5ALEa/B5ae29Rp5X6E
 7UDfxi7oVONbViPH2jfNwXz6jJDcB8UxXY2ACvmozy7Wxjw6/jjMaCw5otYapYfJo+p6
 v3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684289694; x=1686881694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR5FXfE7Rmw0GIq0apMD/6eS2jMvPSplBxlV0yF+seI=;
 b=idk2COg43bsLrM9cTBaB/SxeTSEaqW4y+/QcNiaUdDBQO697zo0g+5/ZyUu8XoxzfK
 rrQkNRoM+K074+X3klRZEtudUeME3MZmVmlggXx5634JS5nFNCGCvAVkJreMxZ14hQMC
 l1StSKNJETq6UY8BqOHWNEpA/oxQJ2LLpyNmxAnxVeLYTvylxjIHt1MI6zas9XpCHZgb
 w4e6yoJouNiQO3VBFfalPijcxPuNy0HXBcphw741q1MH3anBdJW/rtLiDc96AyMNfhjv
 5407mUTRIWfJirScfhR50Rt4eGNm8x+vnz6e0l9U0hAvLbanb47sO1+tP2qXSDL7Yd4d
 Z35Q==
X-Gm-Message-State: AC+VfDwDzdR5mUSNxPsQp4CMaaHRXWbErwWyw2nLx0/RiGdCDNiCBrt+
 rKix19G2v4cQDOL+E1d8U26c7qyGPNS7WjnegqNVC8oKdbw=
X-Google-Smtp-Source: ACHHUZ7Hce26S4Je+fXLlwU/J5HDqkAe/o1Q5HDBd8uWO5BNJiaYmrrOOLKA6bDn+VIEkQza/XU98fBDvH8BEH4mi74=
X-Received: by 2002:a67:ea10:0:b0:42f:f1bf:681e with SMTP id
 g16-20020a67ea10000000b0042ff1bf681emr229122vso.12.1684289694602; Tue, 16 May
 2023 19:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:14:28 +1000
Message-ID: <CAKmqyKMZf+c7ZJ1j71VWgjJ02PNFUDeJmtr7J8k_mZF6WAiNKA@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] target/riscv: Make RLB/MML/MMWP bits writable
 only when Smepmp is enabled
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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
> RLB/MML/MMWP bits in mseccfg CSR are introduced by Smepmp extension.
> So they can only be writable and set to 1s when cfg.epmp is true.
> Then we also need't check on epmp in pmp_hart_has_privs_default().
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 50 ++++++++++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index b5808538aa..e745842973 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -243,30 +243,28 @@ static bool pmp_hart_has_privs_default(CPURISCVStat=
e *env, target_ulong addr,
>  {
>      bool ret;
>
> -    if (riscv_cpu_cfg(env)->epmp) {
> -        if (MSECCFG_MMWP_ISSET(env)) {
> -            /*
> -             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
> -             * so we default to deny all, even for M-mode.
> -             */
> +    if (MSECCFG_MMWP_ISSET(env)) {
> +        /*
> +         * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
> +         * so we default to deny all, even for M-mode.
> +         */
> +        *allowed_privs =3D 0;
> +        return false;
> +    } else if (MSECCFG_MML_ISSET(env)) {
> +        /*
> +         * The Machine Mode Lockdown (mseccfg.MML) bit is set
> +         * so we can only execute code in M-mode with an applicable
> +         * rule. Other modes are disabled.
> +         */
> +        if (mode =3D=3D PRV_M && !(privs & PMP_EXEC)) {
> +            ret =3D true;
> +            *allowed_privs =3D PMP_READ | PMP_WRITE;
> +        } else {
> +            ret =3D false;
>              *allowed_privs =3D 0;
> -            return false;
> -        } else if (MSECCFG_MML_ISSET(env)) {
> -            /*
> -             * The Machine Mode Lockdown (mseccfg.MML) bit is set
> -             * so we can only execute code in M-mode with an applicable
> -             * rule. Other modes are disabled.
> -             */
> -            if (mode =3D=3D PRV_M && !(privs & PMP_EXEC)) {
> -                ret =3D true;
> -                *allowed_privs =3D PMP_READ | PMP_WRITE;
> -            } else {
> -                ret =3D false;
> -                *allowed_privs =3D 0;
> -            }
> -
> -            return ret;
>          }
> +
> +        return ret;
>      }
>
>      if (!riscv_cpu_cfg(env)->pmp || (mode =3D=3D PRV_M)) {
> @@ -580,8 +578,12 @@ void mseccfg_csr_write(CPURISCVState *env, target_ul=
ong val)
>          }
>      }
>
> -    /* Sticky bits */
> -    val |=3D (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
> +    if (riscv_cpu_cfg(env)->epmp) {
> +        /* Sticky bits */
> +        val |=3D (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
> +    } else {
> +        val &=3D ~(MSECCFG_MMWP | MSECCFG_MML | MSECCFG_RLB);
> +    }
>
>      env->mseccfg =3D val;
>  }
> --
> 2.25.1
>
>

