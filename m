Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FB2CA0EFC
	for <qemu-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 09:22:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uq6vi-0006hJ-47; Sun, 24 Aug 2025 05:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uq6vd-0006dD-7Z
 for qemu-riscv@nongnu.org; Sun, 24 Aug 2025 05:22:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uq6vZ-00008M-LX
 for qemu-riscv@nongnu.org; Sun, 24 Aug 2025 05:22:20 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-244580523a0so32350485ad.1
 for <qemu-riscv@nongnu.org>; Sun, 24 Aug 2025 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756027333; x=1756632133; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=10KVTjiTjkDeYAW3f7yc0y5TY4emnBCzSRWe4eb/+jU=;
 b=hZNvYHC198vViWvNgWvxQLwH7+9Xl1dQWx0ONX3KG4ygbBatRK1QGICT1BdGqG7768
 C6ACABkpmrh0ZWcSB8hpwMtFeNdR26/ymDnWjBNCeqevdxpNmcebYtsdfpxjpzsjrvUZ
 T2+kMVeGhmjPEfJuliazL8VMIoaHqXxQtVwiTmGow57wuQPFA0v0reODzoq+ni7B5Yp+
 Q3F1hFhzlxy8dRl4v9ByEuPKg/s0evaqdSRHet/GWHlpfMyXIqZi2dGXWkT5eBeQSA22
 xR2pgSAijJQE87Hp5Lpho3KruFJC0W/l3GVJaFwFaJQi1nS+k+YZshxpsqJaFVj0umCM
 0xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756027333; x=1756632133;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=10KVTjiTjkDeYAW3f7yc0y5TY4emnBCzSRWe4eb/+jU=;
 b=VXt+mZsQ5yrh15/l4QFkmWG40fvIlc6kG2GSY35+rrI9NvbRgesRI/NQTYRZPAIXWp
 PIWKM646wM+OzFPe8fnjMcNUq1UaH0PPIWktxT/octk0SizzBy2cIungKH58ca87godh
 OxoNnj3B1hT9F3mSPct/LMqay5Bv3UG1XW6cAXRK0DQ3r1gSbHPPRW1Fq0oPCcskw1Yz
 fqz3S4+3yu8yFfP/Qhbz6SFtwPHAhWxoqkoq5TnOShkf020Fz2nC+FvqO22lqoLJto8L
 4N5FBqXx6/GMnDGNKp+Yk89eoIaJb1KZ+sqLoEsXC1IhgSBGkd7zUZR44/4XspPcQQYf
 aM5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqiHFeENHJPjENTIlQYBh5vDyecWTYTPmB7Bi4TpZmndOxT4qvdSMTFwNSuv9swIaOEw31yOtRMMiA@nongnu.org
X-Gm-Message-State: AOJu0Yz98fYxmIGo1QRmcbAsBuCZ3nUs/FT+PYxrFo2MeLzjqgVU1Ph2
 dF08GhcD4EJP9bNgc1DWoMkSulLNigYcmAJGuo+1+QLDfYuU2tE/o+bWG4mTd69Z+Uc=
X-Gm-Gg: ASbGncu4abyzrLmoktXkuUMuBHpeeyk2TH6SOuueO3zK0LRFninakYfSw2iBRwCFhIh
 8gckffBY3NkZwNKeAncmXIIZyN9FEmldgmeeSSFvFUFFhGsVMdym8JIdLGFVW31EFxzqJhH6YJJ
 MmpjUzjATNeTEXIZEACBvPbviG0mQ2QmZJYmjdikH02VGXUT8DyIopKFH/vgC0cyFzvKK8cd0+c
 QT+VD8v8ukjOXieFSJdW9RupPMdHa6r0JuvzbQzyazdMvwuafs7zEUB0UD/DM3uE6A3nxZI715u
 FNynG4asCtk9LLb+1GCfhLm31zN5SvU+XxHVHNEUsOm1Qb+UmRpwIsbiRkRSlHWOYo9xN1h3BVJ
 FLt7+rhQeHuhgDhUOhqiB+QwopH7LW28tYTM=
X-Google-Smtp-Source: AGHT+IG3QuVXZba8kDezAVZAOutqReXs8MTo6BPog2Bt5V6xYiY5YoOVEyaapszgsryCM//bIZIJPg==
X-Received: by 2002:a17:902:e888:b0:240:a54e:21a0 with SMTP id
 d9443c01a7336-2462ee13154mr117050765ad.19.1756027333379; 
 Sun, 24 Aug 2025 02:22:13 -0700 (PDT)
Received: from [192.168.68.110] ([187.11.154.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24668871071sm39558425ad.103.2025.08.24.02.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 02:22:12 -0700 (PDT)
Message-ID: <0c7c5894-3f57-4c95-b863-d9fce8d8f26b@ventanamicro.com>
Date: Sun, 24 Aug 2025 06:22:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/9] hw/riscv: iommu-trap: remove .impl.unaligned =
 true
To: CJ Chen <cjchen@igel.co.jp>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-3-cjchen@igel.co.jp>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250822092410.25833-3-cjchen@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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



On 8/22/25 6:24 AM, CJ Chen wrote:
> Since riscv-iommu does not support unaligned accesses, drop
> `.impl.unaligned = true` to avoid the contradictory pairing with
> `.valid.unaligned = false`.  This makes QEMU reject unaligned accesses
> for this device and prevents the assertion in memory.c that previously
> caused `make check` to fail.
> 
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Tested-by: CJ Chen <cjchen@igel.co.jp>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index a877e5da84..277746598a 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2288,7 +2288,6 @@ static const MemoryRegionOps riscv_iommu_trap_ops = {
>       .impl = {
>           .min_access_size = 4,
>           .max_access_size = 8,
> -        .unaligned = true,
>       },
>       .valid = {
>           .min_access_size = 4,


