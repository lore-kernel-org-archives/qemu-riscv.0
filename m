Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C39C0032E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 14:09:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtqBH-0001nk-6V; Fri, 20 Oct 2023 10:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtqBE-0001l7-0h
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 10:08:48 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtqB9-0000G0-Ek
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 10:08:45 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c51388ccebso12815811fa.3
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697810921; x=1698415721; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mD+mtuR9y47g2JJlaAJDMPPS1KcwIe47DWnTIUKNwuA=;
 b=heCFkl8EtB0UjrUAKkLnCK1w1wr0WVyv4sDyAV3yYxjziFEXdjTP9Ef6UrMIE/aYL7
 iXnm2w370Z5thFYkHhBFAjzc3S5aa++o8IAfiE4yn4qiYGp+kWz+OHRAZnDYeKGPrNvk
 fyShya879YPSRBlZ/8R+OQtsZeLfOeg/ZyPB6vs5FImqtYTjN0EoPEl351xSsc945zk6
 HQ0YvzFT9P9UYADx+rGKSG9vZEZW0fyREd970qW/cCtVW88sEfq3SLypY+/bWcvDSeAF
 jPn5cedjyO8jocBVl1ixU+b+QwmOCGcGE0TqvY4QvBSftRM0qvkVBFLQXSYhpkGFcnm8
 62tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697810921; x=1698415721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mD+mtuR9y47g2JJlaAJDMPPS1KcwIe47DWnTIUKNwuA=;
 b=rPYGYgNBLo2gVjJXBOCy974W/xpYhLAGhpbV9zmqQa6hJ6IuWHqudXesT8+7br2uHY
 OcDa6AbCPA5fbj2Lj+0SEI3xce1dajDpQyOVX9zz+a/CzCXkhXv845OsqpqupcjmJxeV
 cDePw7uptoUafUs0/For+V+NB6QqQX0kh7WtrQbOZoDHqRrhSyTDXxb5TYlHDXOp1Oem
 0yEdkYKYvI9+Hq0W5GbPb8xEziylAUvUXvhRhDUUhfwwLEXwetCjs7UwHXJgcQbdOKwn
 eRiPlwK/ewbroFoYVg98oTPKswvQQwII+3n+1ozHCEv76zS/HEFBxiZ3zJ5fJuPCrNns
 zPBQ==
X-Gm-Message-State: AOJu0YwfJPaDa2s1GjrxTCX4xy0inSdhHom84/6/tkB5Olbx91jk+8TE
 ByLv7fC4mE3p61EnBLaK0EgMWg==
X-Google-Smtp-Source: AGHT+IFlzm3BZ1UhJKKsl+ECL4vK7gy0iPgpfNqMN6LsNC4EoQvpOOvAJpxoMfFO2KuQ4ztA73QPUA==
X-Received: by 2002:a2e:81d6:0:b0:2c5:1553:9129 with SMTP id
 s22-20020a2e81d6000000b002c515539129mr1696130ljg.35.1697810921523; 
 Fri, 20 Oct 2023 07:08:41 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c210100b004068de50c64sm2213225wml.46.2023.10.20.07.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 07:08:41 -0700 (PDT)
Message-ID: <e0c83090-244d-b3cc-7127-39baa879b77d@linaro.org>
Date: Fri, 20 Oct 2023 16:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] linux-user/riscv: change default cpu to 'max'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20231020074501.283063-1-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231020074501.283063-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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

On 20/10/23 09:45, Daniel Henrique Barboza wrote:
> Commit f57d5f8004 deprecated the 'any' CPU type but failed to change the
> default CPU for linux-user. The result is that all linux-users
> invocations that doesn't specify a different CPU started to show a
> deprecation warning:
> 
> $ ./build/qemu-riscv64  ./foo-novect.out
> qemu-riscv64: warning: The 'any' CPU is deprecated and will be removed in the future.
> 
> Change the default CPU for RISC-V linux-user from 'any' to 'max'.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Fixes: f57d5f8004 ("target/riscv: deprecate the 'any' CPU type")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   linux-user/riscv/target_elf.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


