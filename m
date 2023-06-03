Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576DFC7EE29
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:58:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5HTR-0002kq-HL; Fri, 02 Jun 2023 22:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5HTP-0002dE-55
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:58:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5HTN-0004ye-JS
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:58:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-256a41d3e81so2328714a91.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685761112; x=1688353112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kNrsoRKbastUWJLLGXL+8YUI563RvAXBaXvWZyu4W9o=;
 b=T+gcJAN+LtReWhZhYfv4LnhiESYzoNMi0MZubc49ef2D+SE/tvs87KAxtUUN2HRBit
 h14DQlhHHsWlSyt+SqAd5cKlq/2BG6NZAlr06b8X9Ngfr1JCwVJ+egK228XjDit7yamW
 Fk6B+MggRVcxiyj7CzteL7Exj0pbR63057yPXhlwl4yNmQ59LFUR8usD6xTqvtk+9alK
 Tp5weCsgALos9Pre/19Q0umW2rTLRjXtRtRO3lLFMEafbXaeRK7ThjuAkoiyNwkgdTJi
 zSLpPU0Go1R7T2fPd7um9gwbqa3dwdStIRz9+5AGHZyjl1FcUdTjcVL67P8Lb6KRnmqW
 YV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685761112; x=1688353112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kNrsoRKbastUWJLLGXL+8YUI563RvAXBaXvWZyu4W9o=;
 b=jD0toDthuA7521BZ4gzAJdNJGhjuYRYwfA5+3bBF19BP+c9tcCUc4dFvIMoMbLEr4y
 ttdW7K2VLo88pghFsq1GAxm0oEKTdCCXMsYqGL8dtjagWfsw4/c1RM34Hp44HmryEwhP
 6bYu08IidVEz2paDuIgRcBj18IquGWHu+u5DQQDiQu/8uHg+OA0BcTJoK3orQXidkVrT
 aWK47uoM5A8fMWJf05c+E1IH3uDCw1UKSYG86U5xcItQ/cYT5gHXavlmP2fsr5dIe3/9
 Hy8vAkpmCunCwOxswZeqE3ulaObPLCLHlAzjmHTIplPtc0v+BdMjQkdLOBu0NWPOeqUR
 1ojQ==
X-Gm-Message-State: AC+VfDxk9deVL3gQV7sfqJKNQToOzuvEzKmc8pcRxNKVlimQBH8SFmvG
 2aLKFqal7fmKljIII/xVTOzXVA==
X-Google-Smtp-Source: ACHHUZ4MPfGCvcrirWoIlp/DqYXfyFYbySea+tMvbmohVLs4XVvyMKdLatnhiyeYb2nBOh7bxvIaxQ==
X-Received: by 2002:a17:903:247:b0:1b0:3f89:9836 with SMTP id
 j7-20020a170903024700b001b03f899836mr1863378plh.22.1685761112184; 
 Fri, 02 Jun 2023 19:58:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a170902d48b00b0019e60c645b1sm1999282plg.305.2023.06.02.19.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 19:58:31 -0700 (PDT)
Message-ID: <995af08d-239a-f563-5da1-c2c245639d86@linaro.org>
Date: Fri, 2 Jun 2023 19:58:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v2] linux-user/riscv: Add syscall riscv_hwprobe
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-riscv@nongnu.org
References: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
 <20230602-86a3d8d9fad1fb3464d28702@orel>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602-86a3d8d9fad1fb3464d28702@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 6/2/23 07:02, Andrew Jones wrote:
>> +struct riscv_hwprobe {
>> +    int64_t  key;
>> +    uint64_t value;
>> +};
> 
> The above is all uapi so Linux's arch/riscv/include/uapi/asm/hwprobe.h
> should be picked up on Linux header update. You'll need to modify the
> script, scripts/update-linux-headers.sh, to do that by adding a new
> riscv-specific block. Hacking this by importing the header file manually
> is fine for an RFC, but that should be a separate patch or part of the
> syscall define hack patch. And hack patches should be clearly tagged as
> "NOT FOR MERGE".


Not true.  linux-user/ never looks at linux-headers/.


r~

