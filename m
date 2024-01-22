Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97131C47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:01:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkZ0-0004Jc-Nk; Sun, 21 Jan 2024 22:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkYx-0004J3-NE; Sun, 21 Jan 2024 22:01:27 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkYw-0004OM-8a; Sun, 21 Jan 2024 22:01:27 -0500
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7d2dfa80009so740344241.0; 
 Sun, 21 Jan 2024 19:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892485; x=1706497285; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsYQdKNCiouNa37zI+Af3M9dUgRQ1b0ZpvHSO1IS+DU=;
 b=ZW1LQ+e2l86RG+jcxIAmDaRqvwV7e7To6ZMiWEcqW3ss858uaKf+2i1ZGNpxmuWu9e
 Zg2+uTMeDZB/q+puHVvr4avdbfmAYUQkPHo5nKDISc/wewuqIzhKsotnx47bBPMu1xRc
 I4n1EpyYD6IKX0w1yFhQVwns8AXyNvyZ+Jj1PFo6d/p79GoiK4EiGHZqhWAXa9Fmf8CX
 RvTT3X9nh6eLTPtwjKBQFrZQdmpn9hgqJL0p3f5MpG8S5vyr6JNXja5X5mO95W6OXYVp
 ErLuGt8tT3MwmA11i4u2rYjD37Ume1Br4LudZ9C2hTFhq8hziDWEQOWwnKMLxayVtZJd
 T0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892485; x=1706497285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DsYQdKNCiouNa37zI+Af3M9dUgRQ1b0ZpvHSO1IS+DU=;
 b=V6nwVXHuq7Qo04pwmb458sRBAhnIvTEzdE+SbxmxXaDeBkuGSoJBIfTp9mTikmUzf3
 W6LMfPV/AeQth7rB5IGqvxzwgCbmdn2y81COrUtDRNE+QuKEyWNdygVbg5RSpVj2rzJ5
 7wQgrgFaI5MsceVixjzCxxWBmnq2fW6hZd4xTOoQUFbctK5W6+55U3jy5PKcu4qBhN+D
 jv3sG8tOgO+2paJiXvV0PhbCVFdaI7EZt6Yj62vXHCtIjyTUwRVdckAQwntdiwYsUZ3Z
 KgQhGPHMyYvM+wvmh/L08ia8pORosUADbPxbhFr9fK+RmoGfCvRTcNDm/DDnF50fSC+s
 1ImQ==
X-Gm-Message-State: AOJu0YwpfJa1Sb9v0gFUBzGGPSG3HxXPXh+NNLWICwTVhDjuzrH1p0yp
 r10vm9/cder1ZdiIt7AsqqcsFbz18ABSEHTXa7o/nzeVSpmlAJ0ZwYXr01W/r5NmdNo3W4LC7Hm
 KuUdkczTfmdDHLYhgXPnUOpJ+I2E=
X-Google-Smtp-Source: AGHT+IGStZqO4J4kuHqLCDx0dc26o+kklZGBbdE/HVCAnVTvV/zQsVyhovncDQ2j4Xoo2Y43jC8KgdyP22iseLl/MYA=
X-Received: by 2002:a05:6122:21a2:b0:4b6:be94:acc6 with SMTP id
 j34-20020a05612221a200b004b6be94acc6mr886478vkd.10.1705892484863; Sun, 21 Jan
 2024 19:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-9-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:00:58 +1000
Message-ID: <CAKmqyKNai62qX7LvF9OW07zv1+w5QOGE_A5y-9AK6K8cLgaqTg@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] target/riscv/vector_helper.c: use vlenb in
 HELPER(vsetvl)
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

On Wed, Jan 17, 2024 at 7:02=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Use the new 'vlenb' CPU config to validate fractional LMUL. The original
> comparison is done with 'vlen' and 'sew', both in bits. Adjust the shift
> to use vlenb.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index cb944229b0..b13be1541a 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -45,9 +45,16 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target=
_ulong s1,
>                                              xlen - 1 - R_VTYPE_RESERVED_=
SHIFT);
>
>      if (lmul & 4) {
> -        /* Fractional LMUL - check LMUL * VLEN >=3D SEW */
> +        /*
> +         * Fractional LMUL, check:
> +         *
> +         * VLEN * LMUL >=3D SEW
> +         * VLEN >> (8 - lmul) >=3D sew
> +         * (vlenb << 3) >> (8 - lmul) >=3D sew
> +         * vlenb >> (8 - 3 - lmul) >=3D sew
> +         */
>          if (lmul =3D=3D 4 ||
> -            cpu->cfg.vlen >> (8 - lmul) < sew) {
> +            cpu->cfg.vlenb >> (8 - 3 - lmul) < sew) {
>              vill =3D true;
>          }
>      }
> --
> 2.43.0
>
>

