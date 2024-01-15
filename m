Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE85EC4707B
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 23:15:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPWAn-00064T-8z; Mon, 15 Jan 2024 18:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPWAj-00063h-PW
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 18:15:14 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPWAi-0008Ji-5p
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 18:15:13 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so7079449a12.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 15:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705360509; x=1705965309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CkM55tNJq7Lb1BMHT7Q+xL4VD4gDhBC/e1SlAK8n9AQ=;
 b=PY4RWdOInZhbWXFIOw7bSux6nIpfZNG45t9ys05VIrE/xS4oUNiRIoPzSOn+id7S0Y
 gKpQvOOdWoNZeLohfpESQrf4jqXbdxtAPvuZvemNGjbYh3bu1GtqokZW40ADaFH9QvSX
 8BM2+oFrwYZWJugPG9JB2MyHbqJN9aqB+cXzp6GgGR+BYuZ8rPM2H6ijnarsUgseVgDf
 IUwyzz/IAdAEx4I06EpPiyAYcUElJRpRqM1uD+7LUqTu3iewhMj4fLbAmYCNvp6KO7kJ
 h71lAJXq42VbAnDw9+KIPpcQQO9RgVTaIFfr58BXHNo3NiCgVeSs+l29rQgekNf7NJGy
 rCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705360509; x=1705965309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CkM55tNJq7Lb1BMHT7Q+xL4VD4gDhBC/e1SlAK8n9AQ=;
 b=NrrFBaQyGINqpth+X+JuB6ahIL69bzK+7KaJTLEuGqauqQqMmGdNJwygE96yEfrRek
 G2FvBEKPmA7keNQjiMaeOkP17E8+wLnoNCXyoycOZE2wcx5HYzkfLtOhL7r6A5QDcdk0
 VFhiLHFh6ueaqxrNvr0+xG9ttVUFyzNu3Yawfzx9fTEEXOEFa+LLUmkwUy3ZRJtJidW4
 77jAg07w/wdUPlBA5TIpKC/OBEu/hOuILqcgx4YvDL0lEY02OGzFZOwBAP8JvhK+U3V6
 VTUIJIVF35hMhhor6A6j04r68COtuxeXJbvlsxbrv+nAd9VflfZ5Rh+h6KM+t9i0J+vi
 gHVA==
X-Gm-Message-State: AOJu0Yxk6Wxtp1A6J8J4YAu2e5Gh9Vt1PXpSRfY4huWtTWxvChz7eJvP
 Z9XHM9i8jJeeB7eGSoxy2nRNJRLorQ8quA==
X-Google-Smtp-Source: AGHT+IEoD6rzn84/7KiJEnIUEOKOzK9STmDNAR2c5il3LIYfVLRdjupEEC+/iFMZPHCi10/Vso4M7w==
X-Received: by 2002:a17:90b:3652:b0:28c:afd9:5805 with SMTP id
 nh18-20020a17090b365200b0028cafd95805mr8698279pjb.27.1705360508913; 
 Mon, 15 Jan 2024 15:15:08 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 sb15-20020a17090b50cf00b0028adcc0f2c4sm10430621pjb.18.2024.01.15.15.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 15:15:08 -0800 (PST)
Message-ID: <e424edc3-a505-49a2-b6b6-53ae67c916cb@linaro.org>
Date: Tue, 16 Jan 2024 10:15:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] target/riscv/cpu.c: remove cpu->cfg.vlen
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-13-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-13-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 1/16/24 09:25, Daniel Henrique Barboza wrote:
> There is no need to keep both 'vlen' and 'vlenb'. All existing code
> that requires 'vlen' is retrieving it via 'vlenb << 3'.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c         | 8 +++-----
>   target/riscv/cpu_cfg.h     | 1 -
>   target/riscv/tcg/tcg-cpu.c | 4 +++-
>   3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

