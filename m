Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE93C54E49
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 09:32:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reXLE-0002M2-RS; Mon, 26 Feb 2024 04:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1reXL6-0002LJ-0t
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 04:32:01 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1reXL3-000864-IQ
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 04:31:59 -0500
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3c1a2f7e302so253519b6e.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Feb 2024 01:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708939916; x=1709544716; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccZ5bJcvobWlI1SRGear5DT3BclbrKPFW9Nrv/yIA+o=;
 b=fX71Z4HSzbyHJEsJ7DzcjOy1UTe5qEwNJRJhkbdDHzne7YJRNetne1lFuR0aezSWbB
 I+arRxlYtRaRrHmEs8dPlqF3O8Mf8S9pONyuJFUQwLfvBg4RFHLbg/DcT3FTPCK48sgH
 9GmPGj0gUckxnFH2mt5kyn36DL/8i9B+Ng31L0mTYsW6SAlCT7NRhKYcO3opV6s5faxz
 yku69MLcXdV5tXmldylZP7hSgWXnH/Hla6+IpqwCXFRwdkUViZvs9u9ynVvucDK2F55b
 QfjBG9ZBUkA0TvFQkeV7ksh7MJuqljRhmHPxr/+BlYs78+igKyB5MMSnnatfd8rahh7g
 artA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708939916; x=1709544716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ccZ5bJcvobWlI1SRGear5DT3BclbrKPFW9Nrv/yIA+o=;
 b=CBsEoQFX+g8Ic/xRapSHF07Vs/Drjlui1uQlbGKQW+8NZs4GPSIhp9apwd2Y2By+zz
 G9fyVQ+WxyRnanp8n7FH7rE2pF042AMzgiXXH4w4la+89q9pFGR9SqjWd0kJ4sE4Umth
 RSXeMXyAowK6l3S28qVCY5S0R3wibwFx0L6dGKB9fSu8YByykZiq0ah3f/F1suAmlzCT
 fzS0lk9aGSZL+vPYCsXJqpYS14sSmlUSb3aUTkHZUtC/Y1W8gCrP5mo8wNXKJ1mo3SZQ
 lnNAyZ9cY+pq2chor9WdfCSw5aIdp4aijKjF7lLjfQlG/l3Eb2fxRFVv2KurpFRepW7w
 2Xtw==
X-Gm-Message-State: AOJu0YyYJ9/isZI6Afoj14Obcfcj6PzsDvLLqqGhagiT15Wr6j1UuCQB
 nhkcqbQXSGC+aGwkw9wbUQtKH1w/5v1ATV+Oxzy3n1qwltRkHG7eEGFg5vyWQxM=
X-Google-Smtp-Source: AGHT+IEvomSh8BiTiQXsCCTh6c2BFQcQV8J9lpWQTX5ECSpHY6y4C4ru0NuIySJ/uZ+FS+TKvztwRQ==
X-Received: by 2002:a05:6358:6422:b0:178:6211:871 with SMTP id
 f34-20020a056358642200b0017862110871mr9532487rwh.0.1708939915808; 
 Mon, 26 Feb 2024 01:31:55 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 v34-20020a634822000000b005dc816b2369sm3489594pga.28.2024.02.26.01.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 01:31:54 -0800 (PST)
Message-ID: <a5c8ed1b-0b67-449a-83b9-accf0754c562@ventanamicro.com>
Date: Mon, 26 Feb 2024 06:31:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/riscv: Fix shift count overflow
To: "demin.han" <demin.han@starfivetech.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org
References: <20240225174114.5298-1-demin.han@starfivetech.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240225174114.5298-1-demin.han@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 2/25/24 14:41, demin.han wrote:
> The result of (8 - 3 - vlmul) is negative when vlmul >= 6,
> and results in wrong vill.
> 
> Signed-off-by: demin.han <demin.han@starfivetech.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> Changes in v2:
> - Add vlen var
> 
> Changes in v3:
> - Fix commit msg typo
> 
>   target/riscv/vector_helper.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 84cec73eb2..fe56c007d5 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -44,6 +44,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>       target_ulong reserved = s2 &
>                               MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
>                                               xlen - 1 - R_VTYPE_RESERVED_SHIFT);
> +    uint16_t vlen = cpu->cfg.vlenb << 3;
>       int8_t lmul;
>   
>       if (vlmul & 4) {
> @@ -53,10 +54,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>            * VLEN * LMUL >= SEW
>            * VLEN >> (8 - lmul) >= sew
>            * (vlenb << 3) >> (8 - lmul) >= sew
> -         * vlenb >> (8 - 3 - lmul) >= sew
>            */
> -        if (vlmul == 4 ||
> -            cpu->cfg.vlenb >> (8 - 3 - vlmul) < sew) {
> +        if (vlmul == 4 || (vlen >> (8 - vlmul)) < sew) {
>               vill = true;
>           }
>       }

