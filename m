Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D5ACA1002
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 10:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu6yz-0003rq-PV; Thu, 04 Sep 2025 06:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uu6yy-0003rP-US
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 06:14:20 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uu6yr-0008Bz-UC
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 06:14:20 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-746d3fd3a04so187223a34.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 03:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756980850; x=1757585650; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F9GxhJmWfwBye7noMnqDJZ/ZX2guxAEgJ0FNB26d/OM=;
 b=B/oxHCGFptNR2Ph8rqWP4ECYJi+kJzJyfKBiPMmzLKb5N+phWMVrw4vpeSaajIP4SL
 WEnODLSc9p83pnmFenXLI7wNuXGuJx9OlWfezPjtU/Mxp1qS9JIRhfh5Jk4k9SQjaCMc
 O5AFmAdRXjATws1dJOlLtglvDh9ZclAl0ssM9Yv2NLuXrcadRu8lr+dXzRTG/KR1rQok
 C1RUTpdJzncSM/McUiIc2YKwfFMNE0obyFR25ywxPdsUkzTyXKDt/7v37DnIMxHNPV4y
 Th4KPSGZZAIWVa/fgJB4yTQF0gTT50ZUjT/Lq27nFQOQEa7VRicUxORmfoxH+06hiLc4
 /GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756980850; x=1757585650;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F9GxhJmWfwBye7noMnqDJZ/ZX2guxAEgJ0FNB26d/OM=;
 b=GkT2ismdBzl687Gsm9a3wEM5AwK0bHLscSmXct+jT5hZL/GxoL6aikp536Jz09aAk8
 +leyHpDpWUKYIZFJWXwkHojaNfs6c2xnW8M4ypB3oDOa2ZzfPazL3wRZ7Z0kfjQ5V6wx
 +i1LOrWo4ZVeAdqgz2TrlLYqmq/Nn6kOD5s22b4+kNQr6NNYvbf/AtTnJmKezQJO2niZ
 FTIuAII5S/p/n3eGw3T0zCwpe0X2baKWzJMeMWEot9jisuYhOtN4jnqLpDYtSAJj9vbu
 EcqEHgwGeTWMfiUziTb8Q5g1mdhPLJrApEnf0bm2FJxQPVcvKjcWOi3Ue0bGASeQ9sc/
 HpUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhDxpKdsmdadyJwnYV6c0fQiqEXd1RZkGG7pUuKOKhH6x7gqrYRrwmAHxXLULhYojOMfFJgDeIzPL@nongnu.org
X-Gm-Message-State: AOJu0YyppmtO4aN44OjdcZ+GAcOFiJTMgtxbBO2K6UdixEXRSLt6Vw9u
 6aNf/v8KXWNf11FjBVQ+aPhS6sG3eTgNO28lxp3eQw8Y+L2fkizO90d9X0BRmVEUybg=
X-Gm-Gg: ASbGncu+sevo6bAPTNDwOyyUAEBKJEWKzxX2i9J6bzWqQO5dmoiu9tPQtSodnlIPq+t
 SvPrBGbJZRinyg0jiK6xW08R0FzL4jlUygR9NsWbFL3LqOmtsB5ZigJ5PNN+nfMSFlSdHgXs5rk
 YwPbQ3dXI1p7fFDnZocG0RiTg6Fv1BvkwefSMKOq1ctNXgVYc52WzlUw6pBhvrstwEvHcInSnJZ
 ZtSVeBUyooIs3yRswJnkfeUWiKOZz92u0oogFUHhz/CrLBlwHGxWOuNL1ovlLZXr2TXDHVuKgx1
 2ksC2zvh9wi2Bs3YAlP7Loes7VBxLV2y0z/RLIB+VtenMcgFFsWouRpCFhCAtxtnJzf+wkkJ85c
 KlG4DyTl4h6khovCx5cahO+DgWPcSg++9YqYvSt0zokRzyAQ=
X-Google-Smtp-Source: AGHT+IFMxCTjr2ulg1tUf6aQ5+QiW5mTfsn/q3zJ6U9Y39MM6DVTIllosa8QvDq4q3MRLNV+oh6wyg==
X-Received: by 2002:a05:6830:648e:b0:745:615a:fe6f with SMTP id
 46e09a7af769-74569db5623mr10148022a34.11.1756980849845; 
 Thu, 04 Sep 2025 03:14:09 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-319b6063d3dsm2049136fac.26.2025.09.04.03.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 03:14:09 -0700 (PDT)
Message-ID: <da524d10-fee5-45f2-ba9e-23f66a754e9b@ventanamicro.com>
Date: Thu, 4 Sep 2025 07:14:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] target/riscv: Add Zvqdotq cfg property
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 richard.henderson@linaro.org
References: <20250903140308.1705751-1-max.chou@sifive.com>
 <20250903140308.1705751-2-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250903140308.1705751-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 9/3/25 11:03 AM, Max Chou wrote:
> The Zvqdotq extension is the vector dot-product extension of RISC-V.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/cpu.c                | 1 +
>   target/riscv/cpu_cfg_fields.h.inc | 1 +
>   target/riscv/tcg/tcg-cpu.c        | 5 +++++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf462..95edd02e68 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -187,6 +187,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
>       ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
>       ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
> +    ISA_EXT_DATA_ENTRY(zvqdotq, PRIV_VERSION_1_12_0, ext_zvqdotq),

Is this really 1.12? If it's marked as experimental I would expect it be a new
extension, e.g. 1.13.


Thanks,

Daniel

>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, debug),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index e2d116f0df..5da59c22d6 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -100,6 +100,7 @@ BOOL_FIELD(ext_zvfbfmin)
>   BOOL_FIELD(ext_zvfbfwma)
>   BOOL_FIELD(ext_zvfh)
>   BOOL_FIELD(ext_zvfhmin)
> +BOOL_FIELD(ext_zvqdotq)
>   BOOL_FIELD(ext_smaia)
>   BOOL_FIELD(ext_ssaia)
>   BOOL_FIELD(ext_smctr)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 78fb279184..7015370ab0 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -767,6 +767,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zvqdotq && !cpu->cfg.ext_zve32x) {
> +        error_setg(errp, "Zvqdotq extension requires V or Zve* extensions");
> +        return;
> +    }
> +
>       if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64x) {
>           error_setg(
>               errp,


