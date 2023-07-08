Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC7BEB64DA
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 17:20:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIBba-0000zS-M7; Sat, 08 Jul 2023 13:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBbX-0000wa-EZ
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:20:20 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBbT-0004KA-Sg
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:20:19 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9922d6f003cso399538666b.0
 for <qemu-riscv@nongnu.org>; Sat, 08 Jul 2023 10:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836813; x=1691428813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MxhKU43bs1JHSSm0qPgBg513gg2gr4mB0L87lM7uzVc=;
 b=NTD3TzbcDaBttxDjvzKyx6unCgyI2PJiiG0H1fhXeZbn6ns9mkoMXyA3fTH+w7tfBD
 at6xQQM+H59gLVUJ7QIW94DDaWVe1wjosPOLNgH8SP1kVznH/RbwnQBeYWnRdWBaRUe7
 IDEsIdV/hmab9bNWalqBxoDohyLXhsjNfqo63HRc43v3LDVK6j7myY6zts3JqlOMPRZq
 slYJalyyp+n8vaLENVGQVghABxvdkgw97p00wapbsB3zuNY8G8aXpa9zy51wAB2n64wJ
 YlrHmK6+m0qeCN2XYjdbscQahSGXNiWhr4FZz9Fdz6NC89aeti5Wuet26B7gYjTD5LCl
 A7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836813; x=1691428813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MxhKU43bs1JHSSm0qPgBg513gg2gr4mB0L87lM7uzVc=;
 b=TDuAKoLCc21B3+54u6L/j/xOMcTCDDMK5EuUgqtQW5t7SRzEUeqWcmBk7WRpbLi/QC
 z8TfS/rmssZ8c1YmY1tbb+74jEhg6B++cPUlFX4XO2od+r4gWG5i3tJJm6oXeI2+aCW8
 StFJlYe/wU6FJEqSPyYp7KyutatQOc5b5YjLG2RnBQlYlxjuMSpLoM/X+v41RzRZq0ri
 vV/rsE51ouqHBD64Xv+hZIH6dgfKFUNw9pDB4NhK3dtKlFtcEW2ZxM4dthzfARgwJvby
 EBLFOj7j3K7IsTlZTktdARtcLKbnSqFxs84GeuZEZ6jGR0MjtHpLC6vk646lZnggcWIB
 UZ/w==
X-Gm-Message-State: ABy/qLZdkmeFQoZwkyWk+E7cGSL1LA8GrN8h1AQ9C8g42MqlP6Xl+awP
 mvOgMZaCnpsJLAtyGlinfGA9gA==
X-Google-Smtp-Source: APBJJlGRcACcnrYSfggOoHD4z64BNPNPwszVGAGxIv9UQJ3AKWef5Y/n7FHCovs5+dr5oO6lxBKBEA==
X-Received: by 2002:a17:906:5c:b0:978:ab6b:afd4 with SMTP id
 28-20020a170906005c00b00978ab6bafd4mr6995548ejg.43.1688836813661; 
 Sat, 08 Jul 2023 10:20:13 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a170906925500b00984822540c9sm3760146ejx.96.2023.07.08.10.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:20:13 -0700 (PDT)
Message-ID: <8d230498-06fa-c4a7-b461-19dcc047b4ff@linaro.org>
Date: Sat, 8 Jul 2023 19:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 27/37] target/arm: Use aesenc_MC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESMC instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


