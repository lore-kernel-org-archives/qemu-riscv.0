Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB5ECCA468
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 10:05:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3XDs-00074z-4P; Tue, 30 Sep 2025 06:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3XDq-00074j-8y
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 06:04:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3XDj-00031A-Qc
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 06:04:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so54942895e9.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759226665; x=1759831465; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j0rzO/VT1zC0JROCevxKtQYy0KyGXEt7waNrDHcyX4g=;
 b=aBec8NuPWUYp8dmdBnseBzb/NPN1/AubaRVNAGqBGijV61cBe2zYsPtd9lop3vjxqN
 cAsjVL5988mhoa4VoWnFB5u8W33JzkiCpvSRG8ffFEQtSs6hHLr2ni9zgnRhBQnG+kLX
 qJn0rWcHhKyimH50xAfOlruVxRAIbu/iA+Uk3gXl2goSIGywM+xTAteGnwRGm0xIonWk
 W6SUfLReglCPH48jRkdUr+G8OGY2YZ7Z1oGkOAAe643l5wQieq8tdev4rtNnfTCc4kEn
 nrOQWuvuKQx+vmLEUgXCGIwVEnkPcuVkmo8TCFgeEnbmhKl2mDA0B1Ul3PAzaDHZ1kxm
 21wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759226665; x=1759831465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j0rzO/VT1zC0JROCevxKtQYy0KyGXEt7waNrDHcyX4g=;
 b=laCC6PvFUyzillwLGPtggI2F9M9jhK6L+JCd3OeejtvTXEFicLTTgYncx1Lf907TYW
 /CG5rdfmESw71mcF4sciYzuxSZpCQElyzdWomRx0QGObuxC+ZjbBcMoFzOudD56xFHIU
 yJbYQsMghnz/LdhlvG5T49uhU/VnuX7pQTQdpSG+nou77mLOUizAAyuR712xVDQyPQPi
 uQvdm+J1TAaXBA1GyGXJLr34jtdKjJmpw10D3aBctRAAcQ4zgCAMzy+vMdvtJag50WiT
 judS7CfNS964LMxDvTd9G279ASE6CdC3IUwPGb5DRV5r2PSm/aSVszHsCMJQcohCGjdt
 h8Gw==
X-Gm-Message-State: AOJu0YztldemkLfbiE7yRp9+LsVl8M7gvqcTDNOBf3YVHbxc5WeMpMxR
 9SdGNJeX0NC22A+a2UssmfEa/Qc71ob/j/8OLY4OtLXalyq2tOEg3YYxItVFeJg8F6U=
X-Gm-Gg: ASbGncuWmt0HZPiJlODuxhrz3JdgnYzXeBC+B1SEHrDA1A9OhttSZEJooktSDhplkh8
 V2eBasva317CSkF5AYU3GZztN6Y8ZGdvxY8g31WTwzShZOnog8Z0bFJZ8d3UDYecdHNIKTlF781
 XSG7xWcjzY5ePFdg+Rz3NY84S1Szxx47HNZhn4XVUPm+jYR8yXsiITcu5/MkdAG8f9xBdywSvQM
 ScKZK1FnUVMHsBGhHtyYGTFeLTqhRyrpIWh6kfgl3+59J5zYe/hv4l+QoeXoyOZ/hGBDhwefbJR
 kcXY6smoQ4FZtYifW8Dgn6hZxVMvnbJDkCjwBPHs0aUcRtih5qTNgD6z74c0I5eisDRHa2Q3AEm
 8EFdUyb3Rri4WdyfD9yRM06UX/6VvnCK6DY3c1KpTVDGPki98abOQGP1T727zDdVLLd6xC/6YVq
 szTKwhUGRCRd/BDMEpkENRE5QB
X-Google-Smtp-Source: AGHT+IH/MLFqaqpbjAlBHCfbxfU/prxhPdDUbX2SCsmuyFah/8ykfhCrUjP6QGTw3gXQUxbrfLBbdg==
X-Received: by 2002:a05:600c:314b:b0:46e:3d41:5fe7 with SMTP id
 5b1f17b1804b1-46e3d41626cmr145802425e9.29.1759226664964; 
 Tue, 30 Sep 2025 03:04:24 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602df0sm22064227f8f.36.2025.09.30.03.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 03:04:24 -0700 (PDT)
Message-ID: <a9cb3275-4707-4476-84e5-e42711e89116@linaro.org>
Date: Tue, 30 Sep 2025 12:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Flush the TLB entry for the specified
 address
Content-Language: en-US
To: wang.yechao255@zte.com.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20250930174849833XG1Q1ETbNvg66WU2UVBTV@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250930174849833XG1Q1ETbNvg66WU2UVBTV@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi,

On 30/9/25 11:48, wang.yechao255@zte.com.cn wrote:
> From: yechao-w <wang.yechao255@zte.com.cn>
> 
> When the guest executes sfence/svinval with an address parameter,
> invalidating only the specific TLB entry for that address rather
> than the entire TLB enhances TCG performance.
> 
> Signed-off-by: yechao-w <wang.yechao255@zte.com.cn>
> ---
>   target/riscv/helper.h                          | 2 +-
>   target/riscv/insn_trans/trans_privileged.c.inc | 4 +++-
>   target/riscv/insn_trans/trans_svinval.c.inc    | 4 +++-
>   target/riscv/op_helper.c                       | 8 ++++++--
>   4 files changed, 13 insertions(+), 5 deletions(-)


> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 110292e84d..0fe5fcb3ac 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -555,7 +555,7 @@ void helper_wrs_nto(CPURISCVState *env)
>       }
>   }
> 
> -void helper_tlb_flush(CPURISCVState *env)
> +void helper_tlb_flush(CPURISCVState *env, target_ulong addr)
>   {
>       CPUState *cs = env_cpu(env);
>       if (!env->virt_enabled &&
> @@ -566,7 +566,11 @@ void helper_tlb_flush(CPURISCVState *env)
>                  (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
>           riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>       } else {
> -        tlb_flush(cs);
> +        if (addr) {
> +            tlb_flush_page(cs, addr);

I suspect tlb_flush_page(cs, addr) is the right thing to do,
even for addr=0.

Can you point at the doc?

> +        } else {
> +            tlb_flush(cs);
> +        }
>       }
>   }
> 

