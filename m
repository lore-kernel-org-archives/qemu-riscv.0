Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2BBC7EE26
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 20:27:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Ybi-0002Lb-5Z; Tue, 23 May 2023 16:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1Ybg-0002Kn-Hf
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 16:27:44 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1Ybe-0003Zb-Sj
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 16:27:44 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5208be24dcbso45406a12.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 13:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684873661; x=1687465661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gthB2hi/4raYnlXUOOUUEn0fcwBMc0nUqINHH1Z9JIo=;
 b=Ks0AeyOCvrKK3kdL2PgTZj01nZ3Mmfm2M4KpM2UGzTTioFnHwBsiuTtUVypK1K7+Ye
 bo8w7Wwp3giQThfUMMK6ml5321+RqjxTcDIDgwmotlRKdu/aMP81d/fpWAHBXXHh56Wv
 Obd1ijFB5pb3SwjBr8uukJsl1twOKNyy0WuYdM7m8xogF1Y63r/lFMCcT+HrRTTd/OTH
 yA7vILyrSqatKogSjrg8qvgOXCL9n1A9I7kZcz2TvdXBZw0ydqdLwcy1gA/1BCbpJLID
 L2L8EIYoqX8DBtAMvbLZbIeH3srtmPFZtlZw3dI5YJX7ammH30f9f3h6uKA23OzYq+Af
 rzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684873661; x=1687465661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gthB2hi/4raYnlXUOOUUEn0fcwBMc0nUqINHH1Z9JIo=;
 b=l4ABCXoY62CwqEi1b6XhZyhXkMXxD4gNrgIJex6bVaTPasAp6Y8NQpJpr2mBHTGQFa
 vCsshwe2JEU+Zpba7X+vsCR+hYkzdckX7Nvk9q7WZBNU/th+b6bjuR+bdFAb5kiATTtR
 63v4SuAHyStIpKlhWyA18xHe7H8FQVKYvUV67lhUGLzq1WLB8wjhXP5KEL0+RzLFIPWt
 0qgUg9cXRxhX/R3GOB1e0l8ugBVf/Ss225vKJNREWYdXJmboOg34T5AAIJVWyEy+ttgt
 5+JowLZBWxFXB69KYv5H4R0lNRfHJ8KKse62eghLDMTLajWwaDcumhxmRdMTqAtLql4G
 D1tQ==
X-Gm-Message-State: AC+VfDxTq2u5ZD9i3seydQKuE9b9hs8hTauSxKAlfQZnW8uDsA5tqOJ5
 NJJLYzTjOKvJ75+Gj8hk4avj6Q==
X-Google-Smtp-Source: ACHHUZ6XamnACMlgWmyN7p3ZQkrjc19uVaJNh8Ejc079kJOEAbikQTeTQmXFTe24u1hel19hQtrVmw==
X-Received: by 2002:a17:903:2287:b0:1ad:dac1:1955 with SMTP id
 b7-20020a170903228700b001addac11955mr19070705plh.53.1684873660910; 
 Tue, 23 May 2023 13:27:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c13a:d73:4f88:3654?
 ([2602:ae:1598:4c01:c13a:d73:4f88:3654])
 by smtp.gmail.com with ESMTPSA id
 ik24-20020a170902ab1800b001a525705aa8sm7280266plb.136.2023.05.23.13.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 13:27:40 -0700 (PDT)
Message-ID: <ce7cdf0a-d1e9-0a3f-8222-277375382b68@linaro.org>
Date: Tue, 23 May 2023 13:27:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/7] target/riscv: Introduce cur_insn_len into
 DisasContext
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230523135939.299246-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 5/23/23 06:59, Weiwei Li wrote:
> Use cur_insn_len to store the length of the current instruction to
> prepare for PC-relative translation.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/translate.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

