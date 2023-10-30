Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8ACC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 14:49:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxTa2-0000FM-JT; Mon, 30 Oct 2023 10:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxTZu-0000Es-9I
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 10:49:20 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxTZs-0003k3-8O
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 10:49:17 -0400
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-672f5fb0b39so5464906d6.2
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698677355; x=1699282155; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+B9GnP5twRTxmsFP5YGoCSmYaARE3aqDrSF5Uegmaf8=;
 b=Znw4A2F3DeaobPaLHQHWyqTiIV7CvaEmVGkVrVYV8ekOiOGt3AnZzuGw4buJHCyE6g
 6xPzoYaCb523prfW8Gn+9DA5igwaEIxGyx34o5MRul/vDaod9jdFK6eIb3wYF2jhs+Tw
 8mxPGO1+kNWRBTzkq7x1uA/U+L1rcpecsw45pcp2FDXlaqybLlXSkj5D25lEnQ8AabsM
 pcbF1vcHG77HpCWoip8+wV77V52k/KFBeyyax76SwX+h5GzJPd/hYFLPWFY4GcfYj33j
 gpPmUXBnid+JV63e84Kli8z7rVR6L7A3C0LnUHi0NCKZ3Uy/bnqEPzHxLQCf81+HZMDK
 0Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698677355; x=1699282155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+B9GnP5twRTxmsFP5YGoCSmYaARE3aqDrSF5Uegmaf8=;
 b=oilqgNrUtsUP0bd1tI7lnY9xR5jZhEvDZxkKBlzAI4QdkNrYNiKyAy2sW69GAPpyka
 uvdA+5YWBtn1q4YA46TLRa4WEpy0+asSPeeN/wDDnf6iQAW812fpqbvx69ov/5Je5Gd2
 6+zNJmVP3pvnSbGvQEEZmtDKmLfKpMzOPVgYTj3eF1dOcrFPxTyoH5Gp7Ja7kCIK/iF1
 Yd7hbb7T7+A6vgJc2z4QQJvmsZbqxO9hnD7VgLFsik+hm0ghZaCrWfS+n8cDON5va8nl
 x5V1GD3CFRIubeYP27+SkSnP8YlsIutIbvLWWZZBIYbvDFcuWHe0EllINIW1RbevAPUi
 5f7g==
X-Gm-Message-State: AOJu0YzTMGdkxYW/ljQuFdcpZETJYssHaJ/jEGf4G3n8YINagWU0WvLs
 HZAWIJ185bTk/VEevF3m0PR/eQ==
X-Google-Smtp-Source: AGHT+IHHW+cdA+kvouVUVoE4wMQSJaaMqiTFqXwUj+R7WKPodidWmnZ8tWkO7KQnyPTV9lV4o0fbuw==
X-Received: by 2002:a05:6214:27ca:b0:66d:6311:f91f with SMTP id
 ge10-20020a05621427ca00b0066d6311f91fmr12497956qvb.45.1698677354980; 
 Mon, 30 Oct 2023 07:49:14 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 mi8-20020a056214558800b0066d05ed3778sm3473387qvb.56.2023.10.30.07.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 07:49:14 -0700 (PDT)
Message-ID: <e6ef2972-e06c-4769-ac05-5312452e0bec@ventanamicro.com>
Date: Mon, 30 Oct 2023 11:49:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] target/riscv: Add cfg property for Zvkb extension
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-4-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231026151828.754279-4-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 10/26/23 12:18, Max Chou wrote:
> After vector crypto spec v1.0.0-rc3 release, the Zvkb extension is
> defined as a proper subset of the Zvbb extension. And both the Zvkn and
> Zvks shorthand extensions replace the included Zvbb extension by Zvkb
> extnesion.

s/extnesion/extension

> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_cfg.h     | 1 +
>   target/riscv/tcg/tcg-cpu.c | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index d8d17dedeed..935335e5721 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -88,6 +88,7 @@ struct RISCVCPUConfig {
>       bool ext_zve64d;
>       bool ext_zvbb;
>       bool ext_zvbc;
> +    bool ext_zvkb;
>       bool ext_zvkg;
>       bool ext_zvkned;
>       bool ext_zvknha;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index b9eaecb699c..1b08f27eee4 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -508,9 +508,9 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>        * In principle Zve*x would also suffice here, were they supported
>        * in qemu
>        */
> -    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkg || cpu->cfg.ext_zvkned ||
> -         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed || cpu->cfg.ext_zvksh) &&
> -        !cpu->cfg.ext_zve32f) {
> +    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkg ||
> +         cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed ||
> +         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
>           error_setg(errp,
>                      "Vector crypto extensions require V or Zve* extensions");
>           return;

