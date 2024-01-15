Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72A1C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:41:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVdP-00056z-DQ; Mon, 15 Jan 2024 17:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVdM-00056X-Oo
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:40:45 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVdL-0000lj-9J
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:40:44 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d427518d52so66595655ad.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705358442; x=1705963242; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UQjOXFCCdXEUZ7BmttbQ6odKbMYn+G8Rcyt2evJdjMk=;
 b=oWXbkOpNk7S66p/EKkGI51WfmzallWIUot4MucLfOeXbUbATfpQOOkI6fs310Bf0Wl
 R6d9crVGjfU/+eHGabuYsfytGxofCV+hFcjhEDQXPpTC7qodLktkmDEsMRhMO2GwelHJ
 SfWCiNMHBTmodz/vTV87H1oV4HWhwfSPXHW7Fno0AwO9u88Ds1FpHv5ClqHJ7fS7H8mp
 xeFvhRNljV+o+O3XKABizFBJ5V2rrrxnsuI96AKyP+8OZKAPUzMQ4ljK8WwfxmcUnc34
 Qjn6fIpni8PLdcA718jlOejhCRh6ZHFIMRkZJd9yVdZNHEfaGKUVzxzwvq0ptuWyYajc
 92iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705358442; x=1705963242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UQjOXFCCdXEUZ7BmttbQ6odKbMYn+G8Rcyt2evJdjMk=;
 b=nOFwgWbEfl3PvXregtPhJJjdr7WSC8qT3bR/6KVdP6inC0UxRmHZdmRn0X1eOLDkdp
 bLoX5HZxYEF+LUnefiKa2qqRTQwXMPQg0FXSj2iSOLN2F1K/W/o4eeiPrkTK4/xnoiM6
 FZe3MqsYL5w4J42bRCQbL66EHVqYviIYIqaWjpAVsLPJTzYLtkepqRXHYR+MeAAs8wyn
 WE4ux884TqByk/lx+c30UPXJmkUO0a+c+LSHETC/xLGuG8kyxFvInm1JtiUJCYEuHWed
 kFoOtPEkB89rlHPZJ21jRyKxVTv21oFpjjUmE7yPn0JhMncYy5WC2tJ0bRxj1N8mAikM
 YUZw==
X-Gm-Message-State: AOJu0YyvNe9OTxjUgzyW/rHBIf6Xmc9lZTxIcIBdOt0ghByxVDtWa6pN
 0X8GsSlL93Wwr/LRsABF5jcst4y9+twXnA==
X-Google-Smtp-Source: AGHT+IEcJ3k/IXsYKnf3Oj9QM0FTHkpkw/23e7jZopyokchaq5Z7NwEU7u9z3Ke5/bIpe7BG1/cNtQ==
X-Received: by 2002:a17:902:8bc7:b0:1d5:73b7:5de8 with SMTP id
 r7-20020a1709028bc700b001d573b75de8mr7412740plo.49.1705358441815; 
 Mon, 15 Jan 2024 14:40:41 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 mf8-20020a170902fc8800b001d58b7cb7c3sm8111698plb.90.2024.01.15.14.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 14:40:41 -0800 (PST)
Message-ID: <f64e26e6-c87d-4452-8132-fe7db67a5099@linaro.org>
Date: Tue, 16 Jan 2024 09:40:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] target/riscv/insn_trans/trans_rvbf16.c.inc: use
 cpu->cfg.vlenb
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-5-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 1/16/24 09:25, Daniel Henrique Barboza wrote:
> Use ctx->cfg_ptr->vlenb instead of ctx->cfg_ptr->vlen / 8.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvbf16.c.inc | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

