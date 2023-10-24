Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADA0C25B67
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:06:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv4vi-0003h1-7X; Mon, 23 Oct 2023 20:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv4vh-0003gg-Mt
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:05:53 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv4vg-0006jV-3j
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:05:53 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507e85ebf50so3998878e87.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 17:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698105949; x=1698710749;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cN2/Srw2KOFOVBfpZ01Hut8R12yJCDC2qVZmZqhZBvI=;
 b=EPTZ4jaq/XPGhOI11pD7vnnr/U9sDH6UA/EABX46JJpvgdfPi/ZOOcNnI5qWzwF7vp
 yxJzVMBSALWjN5pW/XH7yN4mb5ssa4bN+iVps/u14zolnDgu4p0RArst4qTMqN5K7GJA
 hVLLmbuS5noczgnSy2hPyyu6/mgurceZrqYZYvD8DX6YcBFF1fMyB2ff0zbMaea8Q9wp
 MgIUBg5Q0IrkpC2CVUKN0+SLQ73Op6iUy5YUTRz0/V2tiKvF0DY32Te0pcyKb1gRfs4l
 /ehJ70Cr8Kn9GoqJrUpfZIMpDb0dh1y/07IXD5RbB4XMHOWAC/Ftoe+jFKH3PsKPLjXc
 LCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698105949; x=1698710749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cN2/Srw2KOFOVBfpZ01Hut8R12yJCDC2qVZmZqhZBvI=;
 b=BtCcRscYPcZlq0D/VMSCsHIVHgbsAj5OCwS+nKU5ILxZNOAxi3Lw73rCur4sMwaHiC
 W/08YwRQHivaa2WuvqRF6XvlHUHpC3DtThgvvA7gxMPDCHfIP6YJLwthAkqgwG6S40kD
 tNnMx7ENdK9kvw58HcCLAteWcNLPPz3D1/S86JjoI6Ht9LvbSknmFDe66crNRkHNFTpb
 IvPx8NFQRoTWPTYRAgI3CzRyTy9Ov0GE3bgIGtjFjOZL28+ykiyI4i1w2o1RzPPUkBcA
 CrOa2Lu82GZGgHJTRpuxXRqEqcq2OSnCwPICdZsJ2U7V2COQ2cYIeGyxPWqTiFXMRWaR
 hngw==
X-Gm-Message-State: AOJu0YxOCkNr7GdhQcEk/1sedoriFuD/cundAePzRLH7jqALOKI33dVw
 GrMNYAB3exT/volwIakLaLP1BGnvLjxG3B8Wlm0MGQ==
X-Google-Smtp-Source: AGHT+IHfiRYcw3YSyfSSxUpWvAbyOQC0Sy8dU8y5CDAyXWwjvCi92SlGpuzZ67Y5J9YfBKfeeL+xEoywvZfRbn5ulTs=
X-Received: by 2002:a05:6512:6c4:b0:507:9a49:2d3d with SMTP id
 u4-20020a05651206c400b005079a492d3dmr8370622lff.31.1698105949086; Mon, 23 Oct
 2023 17:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231018154434.17367-1-rbradford@rivosinc.com>
 <20231018154434.17367-3-rbradford@rivosinc.com>
In-Reply-To: <20231018154434.17367-3-rbradford@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 23 Oct 2023 17:05:38 -0700
Message-ID: <CAHBxVyG2BiaBpqibW2KzP34gDFJrrS95r82-Eg+=5br4JcHFxA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] target/riscv: Don't assume PMU counters are
 continuous
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Oct 18, 2023 at 8:44=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> Check the PMU available bitmask when checking if a counter is valid
> rather than comparing the index against the number of PMUs.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4b4ab56c40..a6ea38e0ba 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -183,7 +183,8 @@ static RISCVException zcmt(CPURISCVState *env, int cs=
rno)
>  #if !defined(CONFIG_USER_ONLY)
>  static RISCVException mctr(CPURISCVState *env, int csrno)
>  {
> -    int pmu_num =3D riscv_cpu_cfg(env)->pmu_num;
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +    uint32_t pmu_avail_ctrs =3D cpu->pmu_avail_ctrs;
>      int ctr_index;
>      int base_csrno =3D CSR_MHPMCOUNTER3;
>
> @@ -192,7 +193,7 @@ static RISCVException mctr(CPURISCVState *env, int cs=
rno)
>          base_csrno +=3D 0x80;
>      }
>      ctr_index =3D csrno - base_csrno;
> -    if (!pmu_num || ctr_index >=3D pmu_num) {
> +    if ((BIT(ctr_index) & pmu_avail_ctrs >> 3) =3D=3D 0) {
>          /* The PMU is not enabled or counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> --
> 2.41.0
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>

