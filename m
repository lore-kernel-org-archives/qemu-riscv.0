Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A695AC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 04:48:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxKBt-0006L1-A4; Mon, 30 Oct 2023 00:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxKBr-0006KV-4p; Mon, 30 Oct 2023 00:47:51 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxKBp-0002iE-IU; Mon, 30 Oct 2023 00:47:50 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-49dc95be8c3so1639474e0c.0; 
 Sun, 29 Oct 2023 21:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698641268; x=1699246068; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wb/mlLKiAqcp0+xIWi5KWtS3q2aHhhFvYBDHhNx2P/w=;
 b=BXVXLFZDHhxNLdMl2iuyEXECLveO1zlpMy+K7K0rHl4k0AJ6ECLOkoGfAbvxte6Z4A
 ieGCSYHRYlnypqhEkanWq1BNQyyTLqAlp7rp/LB6eYFTbrb0rfBFopiKMV4mvKhvm9rj
 xZRD/rAMAn49iALlOwASVxNFYu98m3JApSdKfQ2MFOfha99CUZjVVnJO/5Lz09fVUhBF
 o7QNlXLaKc1vnHTXzy/0NfNvq27cGeaULupbnT0fhnpX7LeKQtH6C/WCEAnAbLxIK8+b
 hJoHPceAStOB/DbUsTr34DCxi9hvaUWgbAnZxx7tIXJ5PIHW/N4gjRJv0RsEgo2C6NBs
 wcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698641268; x=1699246068;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wb/mlLKiAqcp0+xIWi5KWtS3q2aHhhFvYBDHhNx2P/w=;
 b=CxEoSlKnLBZ8ftH436LRaLxjzg9DxK2I6A4Ca0am6vyiepVp2yaBsonlCnl8Euxzo+
 vNltxCme2WdXrCVSm75zg1m+nJxOVfdagknfw8IpjzoPbCT9wwSnfnLWo1iTX+fHSnat
 3CZz3cTjv/Dp03V4iR7bVFEOQRjW/6DRmwu1kPkRd0s8Apov9fAJnhVTQDL+Yph3+LLv
 JZSvDPG9NbCHSJJUwwbxCSQYm1VgF9resHbd9q/qPKpVS/eej9EsmPtcg2qEjYym92QU
 2P1WPVaebV5fjN7kdC5bwxR0F9BwJ8Xggy7iE0ezDOkP6Q1fphXP1/OBySuQpFpgYaVC
 KHTw==
X-Gm-Message-State: AOJu0YzrqJ+d2154o9y9jhGC+pDVGu0nAdJ7BtbMTcCWFp0Ti+7e2hTR
 g5tBmSLO2AVDxNw1ZE5LQHkGrNy42AoB9Xd8MQg=
X-Google-Smtp-Source: AGHT+IFtE4GHyj60Qc5mqhY8BOYaKEe+Hhe/scO8CrqvIZMovkbXAlu8/AibUGMEOEZyubhk/5lBWtuTECiXp0dDwtk=
X-Received: by 2002:a67:e094:0:b0:45a:adb1:e731 with SMTP id
 f20-20020a67e094000000b0045aadb1e731mr4642681vsl.18.1698641268205; Sun, 29
 Oct 2023 21:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231025151341.725477-1-max.chou@sifive.com>
 <20231025151341.725477-2-max.chou@sifive.com>
In-Reply-To: <20231025151341.725477-2-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 14:47:21 +1000
Message-ID: <CAKmqyKPKkDb_gL-qx97jzhY==_4Srv_G6X10+H4NaxFcO5fURw@mail.gmail.com>
Subject: Re: [PATCH 01/14] target/riscv: Add cfg property for Zvkt extension
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 26, 2023 at 1:15=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Vector crypto spec defines the Zvkt extension that included all of the
> instructions of Zvbb & Zvbc extensions and some vector instructions.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_cfg.h     | 1 +
>  target/riscv/tcg/tcg-cpu.c | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index e7ce977189c..d8d17dedeed 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -94,6 +94,7 @@ struct RISCVCPUConfig {
>      bool ext_zvknhb;
>      bool ext_zvksed;
>      bool ext_zvksh;
> +    bool ext_zvkt;
>      bool ext_zmmul;
>      bool ext_zvfbfmin;
>      bool ext_zvfbfwma;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index c5ff03efce9..b9eaecb699c 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -499,6 +499,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          return;
>      }
>
> +    if (cpu->cfg.ext_zvkt) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> +    }
> +
>      /*
>       * In principle Zve*x would also suffice here, were they supported
>       * in qemu
> --
> 2.34.1
>
>

