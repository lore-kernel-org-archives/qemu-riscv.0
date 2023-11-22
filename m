Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B98C61D85
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 02:11:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5ci5-0005Sd-TF; Tue, 21 Nov 2023 21:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5ci2-0005Rp-N2; Tue, 21 Nov 2023 21:11:22 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5chx-0003CB-MJ; Tue, 21 Nov 2023 21:11:22 -0500
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7be55675503so2039654241.1; 
 Tue, 21 Nov 2023 18:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700619076; x=1701223876; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKYW+1FMRula75oDuQa0r3mNAWURp+1W8r9UC0snBAQ=;
 b=MF7qFwB47338Tj/XuakndX8QdjuzK2UYDrk/NJ6UMHdEQHROJ3MRMidLZrM3zT0Jfw
 CKWz/8SRNKMDB4//LWyKgRdUvQA0uDDbH2g9+QFFbxOAYLFjre5umLPBiQT8MU2nvayD
 nWacpsM9FK8VMn6NOMzBOEOiUP4nD445K7u0XwSKAAapx4SDxgtqQMwZl80W7feUJIBV
 AuzQcUB19pG9cMkt4yJQUEBbyUAP31b2UGfQ7/lohgkZr49w4LfK4ur6wNi2LPP32F3H
 dULpNlCGl/Zr/EDwfMVdiY4rbNqZmNNEULeF+TzCsZyzzSgdRVeppmCoJI3zPcNRvtrR
 Uc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700619076; x=1701223876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKYW+1FMRula75oDuQa0r3mNAWURp+1W8r9UC0snBAQ=;
 b=oU9IOkZTxINdcBDLBTe4HRb29DlWHR3sKUqhj95Pt+qGxHWbtdqsJY384Vb9uR6D2/
 y4KfHXouUqkUDuUtgNIfzUUQJiruHRE5HtmpdVmG7+6m1MWs+ikgA/V/zDuE0BoS8Wga
 RXmt+Pxe5f5siHBzI4b9O64Sz5tFGauIAT6UAKDdzmgt5KAyT6kgBtOpUXicVNrrZNor
 vq407/FsuDaLbj/TILX2FwyaWhRxbsqn9NXMssE0enkS93faMKn6+PTR2D1sMGw127H8
 +ZVcfpn2y2LREiCx7rWffp8lx5NHI93pxJanbqYkMsAYhM2xSowO/9JU+Swiraon6ar6
 pj0g==
X-Gm-Message-State: AOJu0YwQrb+r1Qc7yv6sqvg/7BNhjBVUHQnWShNX1dbml0R4qUAed4Hx
 qpuz3Ubqlw8yOtVBvYKInZiLM3O72zwRwHS+x6Y5cvqmfrI=
X-Google-Smtp-Source: AGHT+IGlEPyklZ3Uu2JuEV3VLoFAyzd4Xi5Q9Lwc8mv8OU6WTnnJKDVptB5S0UJ1jYIeHuYeIIFn2ArV4hvm/mIyCjg=
X-Received: by 2002:a67:fb99:0:b0:45d:ad5d:41b4 with SMTP id
 n25-20020a67fb99000000b0045dad5d41b4mr1116171vsr.26.1700619076169; Tue, 21
 Nov 2023 18:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20231121071757.7178-1-ivan.klokov@syntacore.com>
 <20231121071757.7178-3-ivan.klokov@syntacore.com>
In-Reply-To: <20231121071757.7178-3-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Nov 2023 12:10:49 +1000
Message-ID: <CAKmqyKOJaGaGqSFUq1yZOacCb8sKr0Zr8EcT7W13Mr34LDoijQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv/cpu_helper.c: Fix mxr bit behavior
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Tue, Nov 21, 2023 at 6:53=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> According to RISCV Specification sect 9.5 on two stage translation when
> V=3D1 the vsstatus(mstatus in QEMU's terms) field MXR, which makes
> execute-only pages readable, only overrides VS-stage page protection.
> Setting MXR at HS-level(mstatus_hs), however, overrides both VS-stage
> and G-stage execute-only permissions.
>
> The hypervisor extension changes the behavior of MXR\MPV\MPRV bits.
> Due to RISCV Specification sect. 9.4.1 when MPRV=3D1, explicit memory
> accesses are translated and protected, and endianness is applied, as
> though the current virtualization mode were set to MPV and the current
> nominal privilege mode were set to MPP. vsstatus.MXR makes readable
> those pages marked executable at the VS translation stage.
>
> Fixes: 36a18664ba ("target/riscv: Implement second stage MMU")
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9ff0952e46..e7e23b34f4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1032,13 +1032,29 @@ restart:
>          prot |=3D PAGE_WRITE;
>      }
>      if (pte & PTE_X) {
> -        bool mxr;
> +        bool mxr =3D false;
>
> -        if (first_stage =3D=3D true) {
> +        /*
> +         * Use mstatus for first stage or for the second stage without
> +         * virt_enabled (MPRV+MPV)
> +         */
> +        if (first_stage || !env->virt_enabled) {
>              mxr =3D get_field(env->mstatus, MSTATUS_MXR);
> -        } else {
> -            mxr =3D get_field(env->vsstatus, MSTATUS_MXR);
>          }
> +
> +        /* MPRV+MPV case, check VSSTATUS */
> +        if (first_stage && two_stage && !env->virt_enabled) {
> +            mxr |=3D get_field(env->vsstatus, MSTATUS_MXR);
> +        }
> +
> +        /*
> +         * Setting MXR at HS-level overrides both VS-stage and G-stage
> +         * execute-only permissions
> +         */
> +        if (env->virt_enabled) {
> +            mxr |=3D get_field(env->mstatus_hs, MSTATUS_MXR);
> +        }
> +
>          if (mxr) {
>              prot |=3D PAGE_READ;
>          }
> --
> 2.34.1
>
>

