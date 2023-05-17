Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0DBC7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:08:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6a8-0004kW-7T; Tue, 16 May 2023 22:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6a7-0004kE-2h; Tue, 16 May 2023 22:07:59 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6a5-0005aj-M9; Tue, 16 May 2023 22:07:58 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-77d53b41485so109038241.3; 
 Tue, 16 May 2023 19:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684289276; x=1686881276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E40BcXBg0Ve2PT1LYn5JAP8OiHZ/hnoHLP81+ySnSSU=;
 b=ET3+UuyQs759uTnmuZfLkrTc2dqZKGhUBacDMJ13XTrhFzsnXp2W6DejH9rbUltAeX
 O/pMTMNwy9+CtAkNSm+3vh3/h2UfE0a+L6Hae2cXltu5JSkCXvFuyksng8Q4TKBDcdIe
 rEr7fZjlHQLfNAWb22Rnr+NMHETjmW4knMPr/+Occ84SlS04ayl9WY8BQavWkKafRTj9
 59RHQfhnUPXg2ea6wwbHI6fcATcoktnLZetcKkmTCrQ5KCASsDyWuAGWmFPCPfKiyk2O
 8GKIi899U6dF87tt1PwoUOALKsQTnQQeQrJM1nmXhuV4C8pWJyhAM5P9EpxPYD58KTlB
 rfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684289276; x=1686881276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E40BcXBg0Ve2PT1LYn5JAP8OiHZ/hnoHLP81+ySnSSU=;
 b=DAaF2TtPbeD9x+ii5mhdELn9ErPAuuCNBWeoub6UeObcUbIKa1561ixraTXfYZEE0q
 yVEVjYY4Zkb9W7IeXmLPQHpYyQEooOIB+t2CfYxm2qlucf8rANzSiMBFkCm8LwlQNw1V
 nkAI7l6DsIykZoLPZDwN8VpBfCD5uS2Pkf1CxUi8rFDJsQ8cSafQRVndw++5yR8R1wUJ
 /zzb2mmkCTvRZ4M5DTFicWJ4DS+yeR/DGnkL2YtKh9Lo65t6yUecVJ3SwYGwd9JNUAt8
 EpFDqagd8XFIpp36MiCJqMb+EOEb5kGzGpDMn8fSn98aPiSdnM4OnCfRCaE951dDUavk
 TvIA==
X-Gm-Message-State: AC+VfDwpTKnH/dmMJf1SqFW1/y46Ij8Q7Efwq0GQ+GHvBy9z7KypMhqZ
 INIR1un0QiJ72gwJVnQP9gAHhSSHTgfkBzAP3Ec=
X-Google-Smtp-Source: ACHHUZ41K7IVAT1AGIk4WY9MFWkJvsKLtRuUhY5GxEiuHaJkCcO7PtAFZk6Oy9jNmw7kXQzBXF367guaNwa9hqI/t/8=
X-Received: by 2002:a67:e455:0:b0:434:81b9:76a3 with SMTP id
 n21-20020a67e455000000b0043481b976a3mr15196068vsm.30.1684289275773; Tue, 16
 May 2023 19:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:07:29 +1000
Message-ID: <CAKmqyKN6bYv8pN7adiq=B6oiFLkCj4s3=aWjwt-49Et1w2wnhg@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] target/riscv: Make the short cut really work in
 pmp_hart_has_privs
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
> Return the result directly for short cut, since We needn't do the
> following check on the PMP entries if there is no PMP rules.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index ad20a319c1..86abe1e7cd 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -316,6 +316,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulo=
ng addr,
>                                         allowed_privs, mode)) {
>              ret =3D MAX_RISCV_PMPS;
>          }
> +        return ret;
>      }
>
>      if (size =3D=3D 0) {
> --
> 2.25.1
>
>

