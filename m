Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4478C46CD4
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 09:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJ8yD-0005z8-BE; Fri, 29 Dec 2023 04:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rJ8yB-0005yh-EL
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 04:15:55 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rJ8y9-000078-Ge
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 04:15:55 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d3fc184b6dso27029975ad.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Dec 2023 01:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703841351; x=1704446151; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hMINUQYMsguwjB/Gf5Ut/mxIdZPjCW6b8Z/XbgT+Rzk=;
 b=G6N0lgcwcQeRxibxMDDqj6tSEHtjWS+LY5uXxA5BanuvDC9zwg8tgag8vvShs7MotU
 /fIXhlljJvf60qKnvyLYFKAzNEjpk2B2fAX5XVKnMaGdMviTe7DaJVtKUcAVmolDQ/f5
 c/SykgJtxuYMheToDEScv4IjxoMYWYJe3gV6jBXrGOVm3aetBspL9K3i4BoPf7h942R6
 C4yD8BC2/hPHsR+G8jb93J8lvm9iBy3c60LXb4yIDwZabjs0u7VOuwN6ojQ57VnQGDrD
 8uwHCQLDIDFoHWw3Kp9djBbZ+bnWRyCK6cGvsddc6qvKg1LSrVkC+QH9YNIRF6G0nScW
 vcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703841351; x=1704446151;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMINUQYMsguwjB/Gf5Ut/mxIdZPjCW6b8Z/XbgT+Rzk=;
 b=pPyjrNKrVRcolwCqRSdIIE70DSjZ/dIIOW9iiQIcv8SUOHjQO61SD+rDA49ue9dWkV
 3MASWQEc25gwPGLMleRoslz+UZE/iQDOAJW2xpRFF5jiY9rTctJ43mi9BnLf3TrqmLrS
 DpCFc/Fy+ufkP7W9igfa8jH0XLOB4lEz772HtwVLsw5GN/TnFVQKdCoQhwi5GLaVxdBa
 se/vMLG10sajO1REy6oCI8n6Dhcd50I+FilUW4D11dgT1UNiS/7DeJ4ctsQ/Lzdbt1Lr
 WjobneNcglwg9abS2WvlpQu1Fy3ZzGpCY/cJD/vvNSQpIyoFcGwd9mm3Qk0NqkOh9TNZ
 wKHA==
X-Gm-Message-State: AOJu0YzQ1177IxzKFs5kMTLxY7894xQSWraV6IV91h1V3ae2R/9w07a1
 241mQdEBVtbi0xtMMge7lSxJf1aWDao/KQ==
X-Google-Smtp-Source: AGHT+IGxosM90UuI1wcmD5z7Zr9FTWsJjgvpxyTCTk2hrtCy+7m6WJnV9SIM6qmP8qeWI6q/QNErjw==
X-Received: by 2002:a17:902:e84f:b0:1d4:3094:72b5 with SMTP id
 t15-20020a170902e84f00b001d4309472b5mr4124972plg.135.1703841351198; 
 Fri, 29 Dec 2023 01:15:51 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0cfd7f6b9sm15323126plj.54.2023.12.29.01.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Dec 2023 01:15:50 -0800 (PST)
Message-ID: <44b63588-dfa6-4572-a767-84677ee6c0a2@ventanamicro.com>
Date: Fri, 29 Dec 2023 06:15:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/tcg: do not set defaults for non-generic
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, 
 bin.meng@windriver.com, alistair.francis@wdc.com, palmer@dabbelt.com
References: <20231229080302.125418-1-vladimir.isaev@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231229080302.125418-1-vladimir.isaev@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 12/29/23 05:02, Vladimir Isaev wrote:
> riscv_cpu_options[] are exported using qdev and some of them are defined
> with default values. This is unfortunate since riscv_cpu_add_user_properties()
> is called after CPU instance init and there is no clear way to disable MMU/PMP
> for some CPUs.
> 
> Can't define them as NODEFAULT since we still need defaults for generic CPU.
> 
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> ---

This issue is fixed by this series:


"[PATCH v2 00/16] target/riscv: deprecate riscv_cpu_options[]"

https://lore.kernel.org/qemu-riscv/20231222122235.545235-1-dbarboza@ventanamicro.com/


Feel free to give it a go. Thanks,


Daniel


>   target/riscv/tcg/tcg-cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8a35683a345d..9ffce1c9f7b0 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -937,6 +937,8 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>    */
>   static void riscv_cpu_add_user_properties(Object *obj)
>   {
> +    bool use_def_vals = riscv_cpu_is_generic(obj);
> +
>   #ifndef CONFIG_USER_ONLY
>       riscv_add_satp_mode_properties(obj);
>   #endif
> @@ -950,6 +952,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>   
>       for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
> +        prop->set_default = prop->set_default && use_def_vals;
> +
>           qdev_property_add_static(DEVICE(obj), prop);
>       }
>   }

