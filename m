Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC0FC27C4F
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 08:10:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMNjY-00088L-S2; Wed, 26 Jun 2024 04:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1sMNjX-00087R-IB
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 04:10:27 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1sMNjV-0003YA-Cd
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 04:10:27 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f9b523a15cso2388455ad.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2024 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1719389422; x=1719994222; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=56al8rfmz+IISTG36GjDVUAQaugM4D5TdUAuCV0KTPA=;
 b=bZ5KQ2V304EmiYLwyFIDMyOHlvoz0HFp7uVvOkn5BpQb1tKuZlT/hyHnO0wpxi84yG
 DRhWVgr9A2r1eyIXVmx7xjRtEEA+9eCtzybVjH4bl56/Sz9g0CNcdvfbrFhXKIQmZj1s
 3kWMccz/QtPXeEkNtbzCMQ/PW0hiNA7UYBhOXJbw2wMEIZgYRfpwqW7cblSsUHldoq0K
 8JLG6S19npxW/dYqPtRbbSL1yqpZ92HCsgAK8E4AAI+I4LrRU0d/iIGyWoRNJA1gdMFP
 DvDGPz7yl0eqS7WvYcpVQKPrL3lVlqxtDJzrr+gbKrwWO917LudPLzIXer8N7G8/0h41
 VKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719389422; x=1719994222;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56al8rfmz+IISTG36GjDVUAQaugM4D5TdUAuCV0KTPA=;
 b=im5GLOr+L6ycw4DOyHF1Sv3AFICREHGfGguxDDqi+KDJZ9MdXPxx2+Ar67jLz5VYXI
 mCqZfnitox7UuwcMab4YF5mMMcNJRFSuxu0stZQUb09pb3n6/r0J6fg9+T6M6iTEprA5
 AwxVzhGQZL4JCGW9ZIzr/3laUWMdJm04V8/4caWJWEmpv9AyiZ3W8vQnI7G8YHJ6SipF
 IK36842e6TyW/UOGFrH6TAPjZhzY/6nud7hpL30oNAci8znJStZ7q1Sir2S1U9TO/oLE
 1EioaXgV9EZq/IdWPtDynUVxk18OZbdbFeYrHUSmyJLRjqxpWZC73ftmuV6KZXgTtJvk
 gZxw==
X-Gm-Message-State: AOJu0Yxc3rwaj60VQeiUt0skafRiRNeARPcIWJyLeN/9LWkpGbldAQi4
 rJXwEigw8Oe6ER687EFJaJ8O/ewZ3YNCGbHISCWQt1UaDxoWuWOSDphzIFfBA3Q=
X-Google-Smtp-Source: AGHT+IEcQ36vivM4+eFA7xoLwLD+c5Uif/zqXZpL1Zz8LfZxfT3DlvZJME+eahB5L5UYQyWWQFbkeg==
X-Received: by 2002:a17:902:da8e:b0:1fa:918e:ec7 with SMTP id
 d9443c01a7336-1fa918e10a2mr11935875ad.62.1719389421692; 
 Wed, 26 Jun 2024 01:10:21 -0700 (PDT)
Received: from [192.168.100.252] (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fa3229f936sm57293235ad.85.2024.06.26.01.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:10:21 -0700 (PDT)
Message-ID: <a702ee19-16d9-4619-8e89-0af525059de3@sifive.com>
Date: Wed, 26 Jun 2024 16:10:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] exec/memtxattr: add process identifier to the
 transaction attributes
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com, frank.chang@sifive.com
References: <20240624201825.1054980-1-dbarboza@ventanamicro.com>
 <20240624201825.1054980-2-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Jason Chien <jason.chien@sifive.com>
In-Reply-To: <20240624201825.1054980-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x62a.google.com
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

Reviewed-by: Jason Chien <jason.chien@sifive.com>

On 2024/6/25 上午 04:18, Daniel Henrique Barboza wrote:
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> Extend memory transaction attributes with process identifier to allow
> per-request address translation logic to use requester_id / process_id
> to identify memory mapping (e.g. enabling IOMMU w/ PASID translations).
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   include/exec/memattrs.h | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 14cdd8d582..46d0725416 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
>       unsigned int memory:1;
>       /* Requester ID (for MSI for example) */
>       unsigned int requester_id:16;
> +
> +    /*
> +     * PCI PASID support: Limited to 8 bits process identifier.
> +     */
> +    unsigned int pasid:8;
>   } MemTxAttrs;
>   
>   /* Bus masters which don't specify any attributes will get this,

