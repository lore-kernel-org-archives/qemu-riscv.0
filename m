Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B403AC6FA8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 17:08:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb2Cq-00038T-3f; Tue, 29 Aug 2023 13:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2C6-0001xi-HN
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:07:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2Br-0006YK-5u
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:07:50 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-26b44247123so2956091a91.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328860; x=1693933660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DWe8xrxrAKaRgYVZbkCNn+0qtKDPiuD67ILvhzs1Ec=;
 b=ZTBuiAiqhnIB1R5HcOUJtPkDTg87CA9Gh+jMHyWbuV5x6hHzeSX0DjwI3z8V0A5/lw
 Hg7aOAcK1AnNKBQyASRq3MI3k+pBiIxyyGlKHzv/Z40oKD66zcL3KOGyAWjbnP4gSTR/
 EkkuMCx+iya6HJfem9tLmQlOu/mGLJNPI/EHWsmRFVW5omd5FB1zD9ZPX9gka2Rwv1Bg
 2JMm6E9MQrrp7+vClKhTjngOGhsZ/7zy6xmp0MbPjzn7YonBjnM/ShcdFpoodUS78mF/
 T0bhwR/ikROigDTCoUaCzVatHigDNOgKMkUIW0e1DMxJ4eQNSfNoGf3xRHhGjL+fsrQ/
 yr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328860; x=1693933660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DWe8xrxrAKaRgYVZbkCNn+0qtKDPiuD67ILvhzs1Ec=;
 b=JTM1os84VyMhwB0Aofg1WctOSKxTM9T0jstcibSq+xP/a8FgnqY4CeQpaZBCOctKTQ
 dA3eYg7/AnGRu3w/cg1CQJQyNLb2xn5cdFnW9jyMSWCxrE3nv+Qqr+5NMH5/mR3ACE3G
 RqBqeS59xMXzs8RpiMOHWoQdwkn8TcpI5v1ir3gS8H6jaYQPbLOhcVTMjeENBcpRcaGY
 AaZ+JOYYK/IB16ex7UVlRNRWV1QuwYfcHxDB6HwmgrKp2e0wpkKMtN2y6YlyBkgZbMhD
 L7YfKmVipZXjkyS913A2NFIW8W5s7GcmFH0QOQgKVvPnZg7D0DP7cfyPL4xVB+qDzTwf
 XQ3A==
X-Gm-Message-State: AOJu0YyBZ60nSnb3iZ5rcGOexdqTzLiIdP/PChLSN98qXifKid/ta6gC
 xVuluG3tf4oYMZFTKh0kmrBnrQ==
X-Google-Smtp-Source: AGHT+IHRh/3G141nH6nIh7WHBsaZxVjjaKGQruEG1Pt+93t3x9Vw50UwrdDFl1H5EjcCM7H5SnM41Q==
X-Received: by 2002:a17:90a:318c:b0:26d:416a:b027 with SMTP id
 j12-20020a17090a318c00b0026d416ab027mr27954413pjb.31.1693328859987; 
 Tue, 29 Aug 2023 10:07:39 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b0026b30377c14sm9047231pjb.6.2023.08.29.10.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:07:39 -0700 (PDT)
Message-ID: <fe32a49d-f898-4347-9844-679eaab3f07c@linaro.org>
Date: Tue, 29 Aug 2023 10:07:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 11/11] exec/translation-block: Clean up includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> 'qemu/atomic.h' and 'exec/target_page.h' are not used.
> 'qemu/interval-tree.h' is only required for user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/translation-block.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

