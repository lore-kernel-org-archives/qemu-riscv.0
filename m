Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3EBC47074
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:27:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLZug-00060G-C8; Thu, 04 Jan 2024 21:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLZud-0005zy-Jz; Thu, 04 Jan 2024 21:26:19 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLZuc-0002bS-3M; Thu, 04 Jan 2024 21:26:19 -0500
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7cc7bae27b5so445041241.2; 
 Thu, 04 Jan 2024 18:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704421576; x=1705026376; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISJTGNFW3u5rmHSi5dR24wP4gVXB3WWktm1USyYsoUE=;
 b=dHQ073dyXx/0joj/lh7TAsdkbebbo0/334v7CRV0+ZJ+O2SS+NU7J+b0OtxKa0ZIZz
 Y7nK//GH8v11y14o7NhF5QInvjVtdhSQRgBmYQjFEz5lLkiTXeCeeX7L1q5Vt1G72e6T
 yfG2tx04X2EIla8sM4S/q8tuJV2/fESeOv3zwVcq6eUs9Yqb5oA6TQ8+sTmiftAnVcKD
 jKj+60s3gdZMTnbZsfzA7ZM5Rvy+CmlgJSwjVrvvAcX5e/ngIFI0FD5kki1+y35Ua+8f
 lQdqR0MU+enE2UrsOOmmHyhmE86TAIORLIQ5Ya6OaYAcW+g5pElqlDRv6Fx7ldMFsWuF
 mGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704421576; x=1705026376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISJTGNFW3u5rmHSi5dR24wP4gVXB3WWktm1USyYsoUE=;
 b=M0Hvlnk5oHuWNTW/D0tGfTRiiEHlczboGsLPRHFnkaNsfMeG64uwxFcACK5ikxvuYe
 Sjc9mteXcbhCYRPM7phvIMK2A866v3Ql8PVC52hkPz6SK/z8Yw3axMQ/mpznlFp0FwJH
 1H1w+uTFE2WO+mYCoO6GCJGecfvjubGWyov5grtlzJe/1pZ9sPe/GcZBV0s8Av+pO18e
 20FC57nbluaSqrfgD9o5/LLcag5lscd4cWXcC4ybz4Y+EqUHUVmqinr+jaKPMOd1BDLZ
 YLmXfl8jqg7jXysnmKu1fdDx9vtnzGCZQ9fCrj/GJQXM5yS+smxOvrvbrTE9jzucpRvq
 H3mg==
X-Gm-Message-State: AOJu0Yzi3eR2+ENQWHaZOT0WKNo1GbZGc4Ct2P6m5o1QmGW7hLe/Yyn2
 yqZxyQDuWd5v8Ix0TYnfiUY3F+Bxn3mvdbQv/M8=
X-Google-Smtp-Source: AGHT+IEp+FOAztSvtanxNa0yau3vfA/KiQEP1yJ/qa9EIQaz2Y1sNYajw0FBNOvYieaaNi6nILoZLrcz5IGnPatTLzE=
X-Received: by 2002:a05:6102:3e87:b0:467:74c:ef1d with SMTP id
 m7-20020a0561023e8700b00467074cef1dmr1306555vsv.28.1704421576595; Thu, 04 Jan
 2024 18:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-27-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-27-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 12:25:50 +1000
Message-ID: <CAKmqyKPW5u1MBagsKDjO785Jta_VimvNnAUHJzgWn7Triidrbw@mail.gmail.com>
Subject: Re: [PATCH v13 26/26] target/riscv: add rva22s64 cpu
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Mon, Dec 18, 2023 at 11:01=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a new profile CPU 'rva22s64' to work as an alias of
>
> -cpu rv64i,rva22s64
>
> Like the existing rva22u64 CPU already does with the RVA22U64 profile.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h | 1 +
>  target/riscv/cpu.c     | 8 ++++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 12fe78fc52..9219c2fcc3 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -36,6 +36,7 @@
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
>  #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
>  #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
> +#define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31"=
)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f57a9ee298..959c97c869 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1624,6 +1624,13 @@ static void rva22u64_profile_cpu_init(Object *obj)
>
>      RVA22U64.enabled =3D true;
>  }
> +
> +static void rva22s64_profile_cpu_init(Object *obj)
> +{
> +    rv64i_bare_cpu_init(obj);
> +
> +    RVA22S64.enabled =3D true;
> +}
>  #endif
>
>  static const gchar *riscv_gdb_arch_name(CPUState *cs)
> @@ -1968,6 +1975,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>      DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
>      DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_ini=
t),
> +    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64, rva22s64_profile_cpu_ini=
t),
>  #endif
>  };
>
> --
> 2.43.0
>
>

