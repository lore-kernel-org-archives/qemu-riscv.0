Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6BBC7EE25
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:13:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6f2-0007Nn-KM; Tue, 16 May 2023 22:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6f0-0007NX-NP; Tue, 16 May 2023 22:13:02 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6ez-0006Wb-7z; Tue, 16 May 2023 22:13:02 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-783f88ce557so41992241.3; 
 Tue, 16 May 2023 19:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684289580; x=1686881580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YNudKxMlvxNXh9Wo4pZAW2Nj780aCUWYPoe82YfKJDY=;
 b=o6eVoV68MFDIT/VbgU4bxeeLDjOufWDqwE2xsYtJY6y2orwU45fKFmvqhejEKgiorJ
 650lHl+bys2ZPwfmcnDdaoaTnguL9lZfoRhVE/uex9l0ZsfD8LtjIMEwfFKsu3uaOX9M
 fAotGogGhOXDETNlWt5XszRO1dWncFmN3ZJSbfS5fLnGuey4b5aBgKOeranDy7zmQgxW
 j0vL7jDXjggsXVUDbc2hvIgq7e4OFCetY5/exbRTy7nKeam5NGJsWq/HJubPAeynMLHx
 lISYuJhoyA9SkdYl90EyVjMJ4BUbAZmmCdvZ+M2X0xvSKgvq9S//qInUO3LXeQ3XqJfn
 +C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684289580; x=1686881580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YNudKxMlvxNXh9Wo4pZAW2Nj780aCUWYPoe82YfKJDY=;
 b=Grz4OH3sdJWb5P7pLhwjyYBlWp9Scf3tzOz2+LWbuFeU7T/FKWqEEgh70WYljo1mqS
 Z1rIH687PHgFe88DPLUhRUt636VOi7jL1eMBYKDScH5LEi+ZnQB2nDElmT/8NaNqS6jv
 acz2wcX8ZuZn+9N36E4sl9oXUUvz2S9Fpv2Qixjnqeuy37nh8tkZg7wbej0bDf2ASX0Z
 Vz05u144pa8pvpcYk42QaisbgOTCI1lnBYNr5YI2kHIRjrBdQNjc3KeqXYXwBn0+Iz/l
 v4JeJbiC322digjnOOnFuLiW0gyBV71lIERYKEmS1EB7JObX+7FuK0LDLrVEP8puvxbc
 d/Sg==
X-Gm-Message-State: AC+VfDx7Dghbz4pN9qc8iP5mxM6piiGnTDm91NZvqKTy0jhFYmF2Oi84
 LQ28qgmbcMZifwPBeKpnG+KMEDNcCsL8XzC2weo=
X-Google-Smtp-Source: ACHHUZ4AHVblHoicV4eQe7islkOODNQRIOmIK70PmU95mTDBu2i0qILM2NTsIlQZP9VkhTMaxRyHL/M2AEld7edFN3g=
X-Received: by 2002:a05:6102:3a47:b0:434:907e:d2aa with SMTP id
 c7-20020a0561023a4700b00434907ed2aamr13598544vsu.34.1684289579762; Tue, 16
 May 2023 19:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:12:33 +1000
Message-ID: <CAKmqyKN6Ff-jj3P_VqNJa+huJQZpqHpA0OKCz_osigNZYA5C0w@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] target/riscv: Flush TLB when MMWP or MML bits
 are changed
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Sat, Apr 29, 2023 at 12:39=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> MMWP and MML bits may affect the allowed privs of PMP entries and the
> default privs, both of which may change the allowed privs of exsited
> TLB entries. So we need flush TLB when they are changed.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index d2d8429277..80889a1185 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -578,6 +578,9 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulo=
ng val)
>      if (riscv_cpu_cfg(env)->epmp) {
>          /* Sticky bits */
>          val |=3D (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
> +        if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {
> +            tlb_flush(env_cpu(env));
> +        }
>      } else {
>          val &=3D ~(MSECCFG_MMWP | MSECCFG_MML | MSECCFG_RLB);
>      }
> --
> 2.25.1
>
>

