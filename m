Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1738ECDB466
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 23:57:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbS2i-0001aL-BO; Sun, 21 Jun 2026 19:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbS2h-0001a7-IC
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 19:57:35 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbS2g-0004UP-2Q
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 19:57:35 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6978f0870c9so1332675a12.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 16:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782086252; cv=none;
 d=google.com; s=arc-20240605;
 b=MNA8I6RsAe8+iXqhY3kfvVOdymK2UAZkQL69TedeMyyiLrEKYpgDT5HCWbzbKc4fvP
 LrV/wIS1mJOHFSDF/X82b69sTX0agWENUZg7lv4QPQ3zQrZNVFz4Gt71aiivM/80xi9D
 QUT1FVvKz8fYsqGwBopseFELxb9UUjQzL9bllEZb4LZV99RbFFNiAvctl4GiMxvymy52
 Rsm1ItQUFNha4L/V1CGV2d75ROVTs4m4iHzzwfg3nJseA9quVun2Yr0P9xXZCOR2oWxV
 hH1ZSx5+VeHGhXn0NhFnprgDvcz+3wz0TtL+pUch6CbCd4Kel6/3MFWtJD4tZ31jCVIa
 EjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LDMAoyM4aclkV3vCbjNWWErpW3ALnmEMfaOuJwiY/Qo=;
 fh=Zbn+8jQ1su63YmUZFRD4eBHPGWGCjFSc6Htf6saE9TQ=;
 b=ebj76hZvweVi5AP0oeXe3CbY9MM715yo6abZBH8azY8zIUO/P9XwdGvo1rtUif9Svl
 4PTvAcStRrRGBxOdE5lXjkgslPg02ZttF5UT4BoYUtuBf0u5YBv22JVnL5YB+MZbWT+3
 TZCTl+OtXp1OSH8Xu31c2d5Rzwr8UXgWdG95tE5s1ug33a2UIz6sS+fjbnj8s6ZjcVsX
 d0BQuTBiYUAnG+iJ8pfkmP3fgtpJ19yP4J/11eI6GZQCU7CPTVervk1ANhO1zTw10A7N
 LlGYHB0aADQAVSuKDSl/cggiZGU9ZFuGlkSpkM457ted25lVV8INo3ExttZlXZnK/0HC
 B9Xg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782086252; x=1782691052; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDMAoyM4aclkV3vCbjNWWErpW3ALnmEMfaOuJwiY/Qo=;
 b=iCQffeqNHEjJSLN21fmXtOEVoseCKtyAaHE6MQEKt4XRNZQQ1Rr8u53tBzMHrXIAeb
 GXFylN5G2SwkvsMoKqkJGOVNZKPvAe8p9I8LYggDDBgz7YY4zAxZGosCY4wG+Fy8eM0V
 RSWWo+e8kdOBzaUwy+J3WD2hUxYZanuqYWsvLaGOTBRtly965j2SNGdA90oWWZPFMeyr
 ilTSLszlWDCUOx/YNOuLQzF8HJMQ11UXVT9T2maw7uO0UwMelGNHpwsJ7XpnqpckkhLS
 89iXm1xu0dqrlm2onw1HcMkUXaOMwqgQa2xo8N1KFu+uIgnT3bUuuqc4/uk6BY8Ok4xL
 zaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782086252; x=1782691052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LDMAoyM4aclkV3vCbjNWWErpW3ALnmEMfaOuJwiY/Qo=;
 b=WkvhzMbBohxZKNp5IeBcoudpQIqLn6Wh0CWs2hnhNBJaq3H5mpbb2pNJp4V0rhgZlH
 GBX3AlFqREeSnS1y1vI6gQDh/+Ys5y4HvPZFegpLIE3FNJeJvFZdcSwECojj0nX+ao0f
 rflH4ssRiO/TCHLOov1V0BoQM6pmK7BjYKyFW9ESyEAm8IYNiASbNPQ1LWZVi+1j2eBf
 4cMfbrNS9M8YBj2GQwgOueEYvl5xkcijWEs0ofjIgEiSHZ9gG+eBmeLiMKcQz+fsaJkG
 FmR8WztQNB3aCVPddaKyV0lWHyjCZXUMIqKVHP64tMK71WZJFarcVQYwZiCmwy2lhrE1
 qmPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8OwHloGsSyQ8nPhOGo6objKiCQzqiBZHfWIaw5XCRYcG8FrBRV+rxJ5bfKYfEmhT6u+2iAj1VaDlm@nongnu.org
X-Gm-Message-State: AOJu0Yzn8z/tCL62AEiz/VjUF6xe66Q/AdsntpXd2LPizur853mZgc1l
 HdbjT7RVnwfKOLTMk7i2bwXKFLjgF3BQi83Zg77cfnkjUwIjRK8qqU+u9BwxA5HRVroPpniINbL
 DWLuhYM808ex/a66E5GsTo+Tdb/F75g4=
X-Gm-Gg: AfdE7cm58EFQ73TNXc4NmTwegmDFZrflA0pdQnX948NaNWYtqR4NDnxF/vCmI3AXhVV
 2wby2tMsRRYXNaRL4feCQ3yjDqv/KDuxBXGH9/N3tjZIASfjscR1GrUiUBdJonJwpIpB84WIEtN
 z8x8yOPazUr4Z9o6oiW9+ZtrlwYH8iWo8e+byrW9NusvhLZdMFCEj060ZT9sOSl4Ff7dgumCe/1
 7E4dJuzD29STc5Wku3JVgTTvWO0NZOcQdkJ/Zdil8+J4frao4YRYNO9LvJWzQS6F8CyfhgfXP28
 nG+aZRBxgUx9pJiRkcQrjy/9l63oForY4fD5JQ==
X-Received: by 2002:a05:6402:a51b:10b0:697:7fe4:c3db with SMTP id
 4fb4d7f45d1cf-6977fe4c47emr1657897a12.3.1782086251764; Sun, 21 Jun 2026
 16:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260617054034.1020724-1-joel@jms.id.au>
 <20260617054034.1020724-2-joel@jms.id.au>
In-Reply-To: <20260617054034.1020724-2-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 09:57:05 +1000
X-Gm-Features: AVVi8CeFRjDUtF1P3XaXPENhSrSjNzL7ZqQP7cSQd8IfA334o05s3ipaoFlhYOI
Message-ID: <CAKmqyKM0pWWTzubMZqKB8k3hdZpPki2wszsmp6OJrfWE8mL7Qw@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Avoid NULL deref in IMSIC CSR write
To: Joel Stanley <joel@jms.id.au>
Cc: alistair.francis@wdc.com, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 17, 2026 at 3:42=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote=
:
>
> rmw_xireg_aia() and rmw_xtopei() were changed to store the IMSIC
> callback's value in a local before passing it back to the caller.
> For write only CSR accesses that pointer is NULL, causing a crash when
> guest programs write to xireg or xtopei, such as when the guest sets up
> the IMSIC.
>
> This only happens when setting aia=3Daplic-imsic so none of the existing
> boot tests caught it.
>
> Fix it by guarding the pointer dereference as done for other CSRs.
>
> Fixes: 63469ad75dcc ("target/riscv: Fix arguments to board IMSIC emulatio=
n callbacks")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ec931a8c3ddf..4502f2ab4788 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2732,7 +2732,9 @@ static RISCVException rmw_xireg_aia(CPURISCVState *=
env, int csrno,
>                                      AIA_MAKE_IREG(isel, priv, virt, vgei=
n,
>                                                    riscv_cpu_mxl_bits(env=
)),
>                                      &wide_val, new_val, wr_mask);
> -            *val =3D wide_val;
> +            if (val) {
> +                *val =3D wide_val;
> +            }
>          }
>      } else {
>          isel_reserved =3D true;
> @@ -3008,7 +3010,9 @@ static RISCVException rmw_xtopei(CPURISCVState *env=
, int csrno,
>                      AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein=
,
>                                    riscv_cpu_mxl_bits(env)),
>                      &wide_val, new_val, wr_mask);
> -    *val =3D wide_val;
> +    if (val) {
> +        *val =3D wide_val;
> +    }
>
>  done:
>      if (ret) {
> --
> 2.47.3
>
>

