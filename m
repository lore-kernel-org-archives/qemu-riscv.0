Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3104C87FD3
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhcZT-0008BO-Uw; Thu, 31 Jul 2025 19:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhcZQ-00086M-0M
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 19:20:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhcZN-0007yB-8s
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 19:20:19 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76b6422756fso1521590b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 16:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754004015; x=1754608815; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q2nZsecv83kF0uT4lgJ7ppi6ESf2XYzqA4O8sHnlEl8=;
 b=J+dpknCBYaOyWr6X9uvAJMByqgOpbRG1jKgtJOSh4vZBznXvIFCEnQJytAPaw9/DpT
 3wO4FovCI+ygS7O69i3NN9tIrR2LV449WWTXHhtj7fhRAke42yVLyLAUSF2Sol7vg5ZV
 lDLhPE2/HJ/r7beSb+n+FQuXF3gV+Zz8G6Oe9kHe6gtpGNEweCoWMSl1hznp53uh2tlO
 dE3pdSCmCVxwhhT1PHA6gI2VgDOVuui3rYb6uCrSmNQuLlXyXAshsj7KjnXVSTDSFeQA
 gOApVPnQ3KztDsd43+Xm+ijBNxNKY7MLM1qaa/NSQb7hcffEcHJB9ocNJ9eFGzI+EHuF
 19pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754004015; x=1754608815;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q2nZsecv83kF0uT4lgJ7ppi6ESf2XYzqA4O8sHnlEl8=;
 b=hQqjrUPErrxyLPzqOEfqB4ZoChd3H5f/Sv7xTjHZbFmG7e3wIGbpqJKEjdFbBNToXb
 8ZmBxJkyScAAgq1c8t8/9TLyy/CM3YKxVEV80ZlTUtRmuXTwgunR06Bn4osf+97T3zjX
 U2U6riD7kgL22b+Ai/avVD0E+8y+p4fuOAQf7v4vb6yVuRp7xHQh/bLcSbwxAcFJOsz8
 5KA2zyfUl5HLucXzf4Mfmsdgq7i2n1c3Hje1O2hfZEha0Jtn0NhSU0OEX9fcc1a16JEa
 gkSWYDV4X5+TiNLpQpnq+InO0HEIU+We+NGNxUxxGra4yzFsyDM9sMIbrm0zRzepj19W
 JGIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOLy/0M5giMJNgcePlerhhcO8hHJTWc+OU+NPkm69Bz1UemBzRpwJL+g3sMVwr9FOfI1X9DutucAuN@nongnu.org
X-Gm-Message-State: AOJu0YzuQiAwsn+yQhgr2xm8Sok7y9uG+C3BdNuyIvP/Qkox1ytGErCE
 9LP+oEPdbwZYLcYygP29aul/Htx35IBH4ht0Jyl2hxDLL1QBpTJMuvqDLtMZEcjsTHU=
X-Gm-Gg: ASbGncv8E8ZVFs9o8BGHI2l8bDJFE6Hc54RlgissEzotH4+tOOJUDhfGUPV2duR0G4m
 pxb6rPsc/7McCesX8hVsYXfi+ajQ4Ou7AHhnC2pG8okOZnnb0qt/EJvK2fkz1x7dxnaDbbRqcrf
 pV44ZiTyu2UI+IoAf9IoMPUTMphCbdWcurxWPp31kNWKwwd4TTta8Qv60kfj4M+gfLSc+DTaSS8
 cAKL65+OyRPMB8TV0BHJ3zD7/cuhYJksHh34PdaGYGDSPYj73BPdQBUqC8Y4EqsF0KjYvgNdRog
 gKr58tSs3AjvuRr/cP4TnWNwBkxpBMMJN/X830/FnGYas5Fr+VvMlW8pl4ElZaDV0bCl9Lu8N5R
 m451uPHY/JSFGd5EMhbzCYl5CSJiwlYQ4P1+oPSAoztQw1Er+PQI=
X-Google-Smtp-Source: AGHT+IENU9IojxoAkXkjD+II3gOIZIl4Mh47K0C1ISpX9CwL3hf8r7TShXjIj0+JXeleZ+9Li3kyDg==
X-Received: by 2002:a05:6a20:958e:b0:238:3f64:41a5 with SMTP id
 adf61e73a8af0-23de8226eacmr639454637.45.1754004015536; 
 Thu, 31 Jul 2025 16:20:15 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3208c170d2esm2977272a91.32.2025.07.31.16.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:20:15 -0700 (PDT)
Message-ID: <d13e61c1-1825-4a30-a470-c24fb0702289@linaro.org>
Date: Fri, 1 Aug 2025 09:20:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] semihosting/arm-compat-semi: remove
 common_semi_sys_exit_extended
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-4-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 08:06, Pierrick Bouvier wrote:
> This allows to get rid of sizeof(target_ulong) for riscv, without
> changing the semantic.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/common-semi-target.h   | 5 -----
>   target/riscv/common-semi-target.h | 5 -----
>   semihosting/arm-compat-semi.c     | 4 +++-
>   3 files changed, 3 insertions(+), 11 deletions(-)

I suspect riscv32 should have matched riscv64 in always supporting extended, and that this 
was blind copying of the aarch32/aarch64 code.  However, what's done is done.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

