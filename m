Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE469CDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 17:13:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrLiC-0006yy-Ce; Fri, 13 Oct 2023 13:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qrLi9-0006kP-At
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 13:12:29 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qrLi7-0005uM-9z
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 13:12:28 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-57de9237410so1349052eaf.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697217145; x=1697821945; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LRexPPl7QHV2nijanCK2pmApklcrJjvoQeIaZueYtVM=;
 b=GavE4Asurd/UIBHjuGu/OdBj6jzkNCpK/MaPh9+TDiUXoQh+zygQPXnaePiSh6nPyM
 Z9f33Xowxy9yiSzG22uCJsbeH6/i8scK/ECdAY5ScXILKk8Po9ioaGg6VXu3c8S1lbU8
 r4aky3rRAnvDH1zrxV/0ijEfEZKKqN+vRI7zMZ1kKYmv3TPiuxjH9UwA1lf5JzmG7/nV
 m+v5OTi1xP/JLKQVVZAvz5my3r86JI+3KotlvXfCC/5S/CxZv1JuRozC5te6fSVliQ2Z
 ED2LVPba0Aqa5/846DXB0ceYuKbUN3SwtI2vSmiTm7cbSxCl8F/ddfEiInUkjlyyotD1
 Hrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697217145; x=1697821945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LRexPPl7QHV2nijanCK2pmApklcrJjvoQeIaZueYtVM=;
 b=HGvXPIrlZ9pyda3GZOHg/ANkwUEepaZg+vs0HGQgxAfKDXzqWL2AX8YNdaaGsblb3h
 FsH4DcF1ptjLEWLK/lPK8HtNQTC7bQXHHZV4ySwdnpsxZrck2p4WF1850zmCuyHzjYsP
 YbYJXaegQQKLMFpXodXGsHFB3C+AFvML7NxvXT7ASOUj7wbyWPcdP8HU+nhYoB/QrAAV
 DI1KTrEin7DT/iCz6zCn5I8bch6TzoesCTPoZZL/50Rt8BVbUVppp4uLf8eeIIMDqekh
 hU/n9gHl5tXlK+s9m1dFl2TaTXXPCdBWfUaZf4O6loUZRB3wviGfcUgUiGU9undFSLJH
 y3gg==
X-Gm-Message-State: AOJu0YxUGwzMjwpMcSJpSi0Na2HC5Mk7BKXMaAM5w7Fd5AWFcjEFUzc8
 mB8PSIFahpwY9vTpxkLoss02Ow==
X-Google-Smtp-Source: AGHT+IH/0Kxc7tSeegV/Xd4V52jCdqQKRiD8EkR+Szhqut9m22jiqrswAasB4r+wsCwqlb4Q5fCMqQ==
X-Received: by 2002:a05:6358:2786:b0:142:f1d5:ef89 with SMTP id
 l6-20020a056358278600b00142f1d5ef89mr30295532rwb.5.1697217145221; 
 Fri, 13 Oct 2023 10:12:25 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 o26-20020aa7979a000000b006b2e07a6235sm1510979pfp.136.2023.10.13.10.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 10:12:24 -0700 (PDT)
Message-ID: <a54f5de8-93a6-4a03-b387-5d1e2b9abc84@ventanamicro.com>
Date: Fri, 13 Oct 2023 14:12:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] target/riscv: Remove misa_mxl validation
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231012054223.37870-1-akihiko.odaki@daynix.com>
 <20231012054223.37870-2-akihiko.odaki@daynix.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231012054223.37870-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 10/12/23 02:42, Akihiko Odaki wrote:
> It is initialized with a simple assignment and there is little room for
> error. In fact, the validation is even more complex.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/riscv/cpu.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f5572704de..550b357fb7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1042,7 +1042,7 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>       }
>   }
>   
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>       CPUClass *cc = CPU_CLASS(mcc);
> @@ -1062,11 +1062,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>       default:
>           g_assert_not_reached();
>       }
> -
> -    if (env->misa_mxl_max != env->misa_mxl) {
> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> -        return;
> -    }
>   }


Note that this patch isn't applicable anymore due to recent changes on master. These changes
are intended to be in target/riscv/tcg/tcg-cpu.c.

The changes LGTM since env->misa_mxl will always be == env->misa_mxl_max at this point. We do
not have any instance in the code where they'll differ.

I'd rename the helper to riscv_cpu_set_gdb_core() or similar given that there's no more
validation happening in the function.


Thanks,


Daniel

>   
>   /*
> @@ -1447,11 +1442,7 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> +    riscv_cpu_validate_misa_mxl(cpu);
>   
>       riscv_cpu_validate_priv_spec(cpu, &local_err);
>       if (local_err != NULL) {

