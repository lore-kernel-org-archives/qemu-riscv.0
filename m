Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F097C47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:46:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRn8w-0006pv-Lu; Mon, 22 Jan 2024 00:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRn8s-0006pW-Jj; Mon, 22 Jan 2024 00:46:45 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRn8r-0004yO-4x; Mon, 22 Jan 2024 00:46:42 -0500
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7ce603b9051so756274241.2; 
 Sun, 21 Jan 2024 21:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705902399; x=1706507199; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YdJ2czemUsaHJpJg0DhAPk/LGaceBp+lfKkunkosdKo=;
 b=N9NkLIq0My+UVCc/mI8svnJbDP2EKZtyql8cJi+UwwF+92vLfU9QcMDEcxM11f6TMr
 R11nuABMyCYH8vsU3DqK75FejHjHzQLshMOsGQ8/SZ74eYNEAMZHknMV1djQYpPDzLaO
 hRImDkOxzegzxz8p+NFpovnvhTUAHaJRwBR+/hJWfcQuntT8/vPElwSp1dfKoFPV1vcg
 TbrQOr9qRKT5lz5mhlTZNfLPd1qQWzUUzNUehFZeglr/luF0DuPJ3nRx8tgZeX2D/WqN
 8Bbc/pvlJJqbHCovHRj0ogm6MrxQEO3DqmzQRp3FUMRm+HT2jheRR9trDz3W4QVU0V+j
 XqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705902399; x=1706507199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdJ2czemUsaHJpJg0DhAPk/LGaceBp+lfKkunkosdKo=;
 b=D7Us7vsW755ChEF6pWmh/Sl3dvt5c+viVUQm+PqlGb1BSvBc0rBeLMEVV47YQS8eOo
 K3l2yHXCWmJwTT1KZ6sb0Qc2hYJtngEKpblTqrbJnRbJqJtUucpCK02mrd2CqYFOZT1z
 4dBpuNnDxbNssjbI/4FBAmlMLCh4mSIW2wsX8EmybO70UxfLgT11os7Uv23Qsot5oV86
 Yh9kF42JyJozSUxc8fKhb/lcWos4QQvxu9UmSvVwKnwqfcI6+BlO8QrIhyOdJS2e8KCJ
 HOWrK+oFgJ63CVoyyX3HF9ZWvqT47g6yvR6Uc2ps3sccb6KB8vJyTG/h/68H3ZVZBUan
 /LSg==
X-Gm-Message-State: AOJu0YwhpsRr7WT4g9M+Wzx+Va7yo5AEj2ZZwvSwuk9fgZv8J9qzgJbI
 9tF7Z1ljtPCj+PcCocDRKMW2dvAT3Csd/pAKZDyAejTCMzIHlE1gMVs9w7LQxBnatINfUf86NCw
 5X01AJYA2qjQOHV64PYuheAXs0K8=
X-Google-Smtp-Source: AGHT+IGCaMbM+bBhyteRc07mubGf3RCKJNV9TXHx4MZLMxel3Z5pkj9p0FxR2Kfq5y/PibvYQuX+d4aCF3q6QE9y18g=
X-Received: by 2002:a05:6102:e13:b0:467:da18:30af with SMTP id
 o19-20020a0561020e1300b00467da1830afmr1990993vst.27.1705902399178; Sun, 21
 Jan 2024 21:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20240119112129.20067-1-rbradford@rivosinc.com>
 <20240119112129.20067-2-rbradford@rivosinc.com>
In-Reply-To: <20240119112129.20067-2-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:46:13 +1000
Message-ID: <CAKmqyKMBYjwsb1uYuShz3jjnyWAvaZQ+i+943sr-T3RYz_Rbig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Add Zaamo and Zalrsc extensions
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
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

On Fri, Jan 19, 2024 at 9:22=E2=80=AFPM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> These extensions represent the atomic operations from A (Zaamo) and the
> Load-Reserved/Store-Conditional operations from A (Zalrsc)
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c     | 5 +++++
>  target/riscv/cpu_cfg.h | 2 ++
>  2 files changed, 7 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8d3ec74a1c..604baf53c8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -103,7 +103,9 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
>      ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
>      ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
> +    ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
>      ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
> +    ISA_EXT_DATA_ENTRY(zalrsc, PRIV_VERSION_1_12_0, ext_zalrsc),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
>      ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
> @@ -1491,6 +1493,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental=
_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
>      MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
>
> +    MULTI_EXT_CFG_BOOL("x-zaamo", ext_zaamo, false),
> +    MULTI_EXT_CFG_BOOL("x-zalrsc", ext_zalrsc, false),

We should implement the extension before we expose it to userspace.
That helps maintain bisectability of the code

Alistair

> +
>      MULTI_EXT_CFG_BOOL("x-zvfh", ext_zvfh, false),
>      MULTI_EXT_CFG_BOOL("x-zvfhmin", ext_zvfhmin, false),
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index fea14c275f..cc4c30244c 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -78,7 +78,9 @@ struct RISCVCPUConfig {
>      bool ext_svnapot;
>      bool ext_svpbmt;
>      bool ext_zdinx;
> +    bool ext_zaamo;
>      bool ext_zacas;
> +    bool ext_zalrsc;
>      bool ext_zawrs;
>      bool ext_zfa;
>      bool ext_zfbfmin;
> --
> 2.43.0
>
>

