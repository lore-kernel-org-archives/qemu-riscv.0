Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9FFC47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 02:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkTh-0000FW-Pr; Sun, 21 Jan 2024 21:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkTf-0000F1-VL; Sun, 21 Jan 2024 21:55:59 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkTc-00039m-9s; Sun, 21 Jan 2024 21:55:59 -0500
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7d2a78c49d1so1592835241.0; 
 Sun, 21 Jan 2024 18:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892149; x=1706496949; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6D+lUHCaaaLaTEc1OzGOFgyQeexGGSTV/qw2ByYNTO8=;
 b=EDnDNHlqWcX2aSaVC3maQjOA4XE6ztWPDWYaPTJI29jFPXlS/KeJUaONAbG/8YUwW+
 CY7tlQEorM/sLgu9M7/8BwGSEfVPqJ/DE5oowUBELp0PUZyGaNkCTrSA33SBEwh2KhU6
 ol0dMfvpm259RNogpds67bkRFRmLSWt64WeYpslE0MCQoAEx/GDRyuD3doYbCMk9Iz3Q
 x32me6IqDB2mjVZ0qlcMQ45Waqgb9eIZ+/witS4wnaW1ojWnysRtPJ8UPEKSbYrE5Job
 tEwG4V3FQxs2mktgetq10A0wQL61VgeyiGnQAM1DT97lDejL3X8chZYnJNknjxgu6z6K
 hiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892149; x=1706496949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6D+lUHCaaaLaTEc1OzGOFgyQeexGGSTV/qw2ByYNTO8=;
 b=uVAUFLQv0Lp3WDlypdUILR4qaDPE1zfPYozTSkm8UdyxaZ2qxLxv+76Yl678c6wuMU
 4YaPB3JL8L5cwxzpeT9Aqjzvwn+7sAsaJmH1A19wM8WFkCHRxekxuxCDsbw/mSHc5DC/
 DMDedQSXCUrANviNnHdkPc5hMd4ildrdeocc1oWvFXJi/pQ+nYtr3xEVOATFtg9qlXvc
 CCiw+7cudApbLkrLuY7Lwo2+4l/M9yWaky8KZRQTWsl3alrHW/Hdj42XQ8uU/SpyVhIm
 SHMJYpYC8fBm313J9TEmDzw8vIf0lIV355a0nqHDQeBeq0y69L4h2fY0/kk4tcET9Kwy
 j1Xg==
X-Gm-Message-State: AOJu0YzgN4PEvCLBY5wv71ChyBe/yd7SiIZg3h27CZ5vYnYZmicU2dOv
 bq1+hTtAuo9jDFvQHu1JWzTwBZBVp8Ps0A5q1xE4rMpNDNxTwensac2iAQee/uVogKKLf2a62kf
 pzKI4kUVJ+6YlHi85z6Zr4k3JWTw=
X-Google-Smtp-Source: AGHT+IGi4PxwTAXfBDawVvVyAlFxxRi8FGqFiyFF9MtPuNy0soyXOqqV2PFLc9KTR0+AL/XfhzNE8dHGx8dMGoxy68c=
X-Received: by 2002:a05:6102:9b3:b0:469:7b0d:6b6b with SMTP id
 f19-20020a05610209b300b004697b0d6b6bmr2168306vsb.5.1705892148715; Sun, 21 Jan
 2024 18:55:48 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-3-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 12:55:22 +1000
Message-ID: <CAKmqyKOWc2fPwz=WwQCyC84BOyQtcXJDXnUL+DRoVQon_9JK_A@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] target/riscv/csr.c: use 'vlenb' instead of 'vlen'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Wed, Jan 17, 2024 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> As a bonus, we're being more idiomatic using cpu->cfg.vlenb when
> reading CSR_VLENB.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 674ea075a4..5c8d22452b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -683,7 +683,7 @@ static RISCVException read_vl(CPURISCVState *env, int=
 csrno,
>
>  static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    *val =3D riscv_cpu_cfg(env)->vlen >> 3;
> +    *val =3D riscv_cpu_cfg(env)->vlenb;
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -738,7 +738,7 @@ static RISCVException write_vstart(CPURISCVState *env=
, int csrno,
>       * The vstart CSR is defined to have only enough writable bits
>       * to hold the largest element index, i.e. lg2(VLEN) bits.
>       */
> -    env->vstart =3D val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlen));
> +    env->vstart =3D val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlenb << 3=
));
>      return RISCV_EXCP_NONE;
>  }
>
> --
> 2.43.0
>
>

