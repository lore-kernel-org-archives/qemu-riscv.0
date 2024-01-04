Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D41C47074
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 23:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLWkL-0005gn-WB; Thu, 04 Jan 2024 18:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWkJ-0005g4-Se; Thu, 04 Jan 2024 18:03:28 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWkI-000696-7g; Thu, 04 Jan 2024 18:03:27 -0500
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bba50cd318so746690b6e.0; 
 Thu, 04 Jan 2024 15:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704409404; x=1705014204; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCzrQyMuMExD3Z0zD5rR0ydiPP4ogVHjkmtmPn7Lan0=;
 b=glUk/Ro2TIlV+j3A0llh8muIZliDtoQblYvrfNzd58cvCDaeken4qpeB2AW6mmG8B1
 UcLpp6Wqrea/oG4dg/OTuYRp4cdeanWKrSgxKKYt2kL7/FAX9gScBuZT+jaKuqNwaQMh
 Yy3k5kM/96skaQSkMTIB6ATD8Xz33jPtDzYfx8mkymUYtGTHkmoqIbV0NplCEHW3WIWY
 GkOhYr0W7quhXKIRN5awLXd2wO2AA76VzORXj4QZxV3ZSLfJtxvtYNRRtfqQwVgGSg43
 W4wN4UkYC8ILG5mTM60H2+mgZWWgvC406qImR7mIHKwFl3ktCDsjRYsQHzx15DVKkAUF
 fqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704409404; x=1705014204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCzrQyMuMExD3Z0zD5rR0ydiPP4ogVHjkmtmPn7Lan0=;
 b=GIVtEHJnmFHBdxIjI6XuDDNY5mRj6gFG1gt/Ei9kjR2Qi0U3EbWLXlMisjKD0wphHW
 Va5nKO2bp41W1rONynKSq1ud+OWfhVOttwSpPN5XWsLjjtVwW2J4obLc30ss5je9p99i
 pfZTcCdfxuqmcPnZmq7cSJH1ocF0pfK9bEYyOWBEMWm41gNEc+lkw5SGih68qt3J4HBc
 5XOLVEHgBjlXNXA+KSXvkYydKK1c+Yk0AN/UW8Dd70e30UlEH95DrmtZyu5EvicP0IXJ
 a9+UKQYv5+lV6MQ2rw+wRDqVtvwdZ8/bCe8/1tKeXnilZy75nGhXwrVA+7AFhPs+d9V3
 Mm/A==
X-Gm-Message-State: AOJu0Yz4tizOAuVwk3+sizGZ1oC24bxGjBRXlfwsHCaB0j80X4QK+qLs
 tGvn2+sJ63RoAvooFkjFRxCivJqXNJZK/bGiu2U=
X-Google-Smtp-Source: AGHT+IGm+Wh2zOLGBz1G9zl2A5gF9CTkfo9CFFVFCBwsZphQL/qSJddokEVuwMGCADu2D+jmksAjwaYFcHWeqZHKMwA=
X-Received: by 2002:a54:4696:0:b0:3ba:3743:693e with SMTP id
 k22-20020a544696000000b003ba3743693emr1153636oic.95.1704409404250; Thu, 04
 Jan 2024 15:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-22-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-22-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 09:02:58 +1000
Message-ID: <CAKmqyKOfdD0xwXrXZ7VA8Tmgcv1FH35Jdq5Z_ENa0=fUOe=wMQ@mail.gmail.com>
Subject: Re: [PATCH v13 21/26] target/riscv/cpu.c: finalize satp_mode earlier
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x231.google.com
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

On Mon, Dec 18, 2023 at 10:56=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Profiles will need to validate satp_mode during their own finalize
> methods. This will occur inside riscv_tcg_cpu_finalize_features() for
> TCG. Given that satp_mode does not have any pre-req from the accelerator
> finalize() method, it's safe to finalize it earlier.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1ba85c6d1c..6af1148cf5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1056,6 +1056,14 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Er=
ror **errp)
>  {
>      Error *local_err =3D NULL;
>
> +#ifndef CONFIG_USER_ONLY
> +    riscv_cpu_satp_mode_finalize(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +#endif
> +
>      /*
>       * KVM accel does not have a specialized finalize()
>       * callback because its extensions are validated
> @@ -1068,14 +1076,6 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Er=
ror **errp)
>              return;
>          }
>      }
> -
> -#ifndef CONFIG_USER_ONLY
> -    riscv_cpu_satp_mode_finalize(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -#endif
>  }
>
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> --
> 2.43.0
>
>

