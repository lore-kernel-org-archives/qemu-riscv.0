Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C798C4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 11:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxmYn-0002Um-KK; Fri, 19 Apr 2024 07:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxmYl-0002UO-5B
 for qemu-riscv@nongnu.org; Fri, 19 Apr 2024 07:37:39 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxmYh-0007M2-49
 for qemu-riscv@nongnu.org; Fri, 19 Apr 2024 07:37:37 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso1834973e87.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Apr 2024 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713526653; x=1714131453; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nrnrRegtkyfxduWxtrS4OrBikimShihaGMlaDw1dgQE=;
 b=q38erFR9CGbunf/FWmI6FDq/IBREDeK+0Xr3MwDUJfLJsVYmLDtinBgLRKk+ob+S6m
 xEfjbLs1s3AETywxiQR4OoUnO8sFdhnMOPu6hVzmPUabDzegpHzAZocVnGAl3o7691dj
 djyvS2nkkeTIqyuvHBfhbEvWBvq9p80SPZ/rH12m1FdoI2JMCearXDI6r+r+O8BqZmu0
 BVb9IrLFhcHcMBsL40LvQEC/ovbhPxkczZhY7ZL8cuSFT8TAbQ6/OeWIYkKpWJD1tqya
 7DtBiUlpndzMrrCF3hm+zeMomT0hTsdtg7M1eoaRCqNHm1d+Ybai9UO+yfLW0EZdFXlb
 vB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713526653; x=1714131453;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nrnrRegtkyfxduWxtrS4OrBikimShihaGMlaDw1dgQE=;
 b=p4U0LtM/bxRNZ4jLfm+q0K/Nop1PsHkX10KPwPRGaw1WI51zzP+DjQ9TjUy0P4wdEI
 wDVkdQnmuoQuVKpPSjTXT38yHcS+awe2hGJQMZijK0vOWltUmzfYeLV2crpOh7BXYYwG
 903e1QG/F8D18gbFg2G/AEAFK1/govXRgdwmf14MPY2ExPbGo2VnhamnGwyCU+fg08lq
 QPW4TuoVTrfYnxUiGtEyglZfj5tV5AUmGqffGPk+9hOJBJWKtoR92i7u3FlQHKa6HvLg
 Cl7Qw/G8OQufdO5SPQBMAXI4aR0uK+CnfHLiS8/GQY22HzgIWQnnhsK1NP6JhI/f1zay
 wdYg==
X-Gm-Message-State: AOJu0YzawKLVqgNAMaN8lbvZzNB76lBXvYHzPaNjOlemA6x+cYIT/LXu
 qRCGN+7+LhFu0bpmnkx+hX4DnTyM9xbY8kJwjanE3U/W9QyOF/v2+eRX6XRa73QeSPflW6Xh2Ky
 OQyI=
X-Google-Smtp-Source: AGHT+IEWuhHMr9JkSxAwII12GwpXGXIjLCc9viAj/wuXl7+UybKzGS/XdcbUaaTvfiAYxcQiR6jtcg==
X-Received: by 2002:a19:6442:0:b0:51a:ae0a:26dd with SMTP id
 b2-20020a196442000000b0051aae0a26ddmr921350lfj.28.1713526652843; 
 Fri, 19 Apr 2024 04:37:32 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.143.233])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a056512345800b00516c9ab5779sm662000lfr.275.2024.04.19.04.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 04:37:32 -0700 (PDT)
Message-ID: <e70bbb7d-7048-493e-b359-88472e73c199@linaro.org>
Date: Fri, 19 Apr 2024 13:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Use get_address() to get address with
 Zicbom extensions
To: qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Zhiwei Jiang <jiangzw@tecorigin.com>
References: <20240419110514.69697-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240419110514.69697-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
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

On 19/4/24 13:05, Philippe Mathieu-Daudé wrote:
> We need to use get_address() to get an address from cpu_gpr[],
> since $zero is "special" (NULL).
> 

Cc: qemu-stable@nongnu.org

> Fixes: e05da09b7c ("target/riscv: implement Zicbom extension")
> Reported-by: Zhiwei Jiang (姜智伟) <jiangzw@tecorigin.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)


