Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1803EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 10:52:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBCTq-00051N-Vo; Mon, 19 Jun 2023 06:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCTp-00050g-Ix
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:51:29 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCTn-00065n-6A
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:51:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f900cd3f69so17849975e9.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171885; x=1689763885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/tXYHj4tqP/yuNNxU0HqmVh9BRHOC/MoQmXO2yuMD40=;
 b=v/Qd1ah1pmEZ33YZ8HaqhJXtUdhKiwZtj9WJmQttybcMnInRWvJBj8NAau3Ey7kOnZ
 YgY9HwP5I2mZ6O+MDwQDjg+c86Fom0xAz+jCjZvE2YdgyMhOU+i78gBKGzzgkAB3iDnM
 bF2o5i5C07zAVf4nghbXduypVN+RfJni02auZ2vtuNhd+dw1vmn6b3n7PFXh92mGOMw3
 2YE0GGajrorfGyGWtz24IkcYOQh/SINti6ZJPFrSqWI4ILvmu1xieiLdSezzPJETQN95
 lEu6pfE6h8/KCHYg2bCtu0kHzXGgrFsZ+2UK/gIhf7KOSCwzcO/NjQN0MsLTkiLdBm7k
 qpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171885; x=1689763885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/tXYHj4tqP/yuNNxU0HqmVh9BRHOC/MoQmXO2yuMD40=;
 b=BgDnWjlQEduwUakx1UpOBKM+xnEW+g70kfxYmjSyRW1Fbwv+gkL4+Sxu0Xzjhrd2KY
 VEIJG30yQtr0cMKP3XONoMd9i6fsu6cLomaBKtK6qjacCSWBFkFTEvFKFrf6gWBa1bQW
 zh5jITF8IqBhWRwXLH7LVGiAgEXf+ZrSvC4KUTY3yqO69q2vy9Id2vJH6jVRHSv9QyTm
 jUbrmz57kLoyrnkrQP1xcW9CXpVJ1Sk2MBtSA0MKDssiUwzaVW2UeIfxDMQ6Me+2XWRJ
 TfaaIQdpHwJOLJkGosLKZWuiaWKZHk7ECrQ9tLFx+zyth0IPRZVDBLcRoCJ6tHj5Qjn4
 zpOQ==
X-Gm-Message-State: AC+VfDzdpuF8UHBlthk2yCzOM+TFsc5x4xy1Ybv01L3ni7RfnLEBz61S
 QWNvKdMyctEm04T7dxW2ZfQp1g==
X-Google-Smtp-Source: ACHHUZ4FVdAfRrxC3XcbbFvrezLn5h7Iar+qrGh1up4qIBqiT9xq5u4sZUpEVlHIPo7lTNCgdeybEg==
X-Received: by 2002:a7b:c7cb:0:b0:3f9:b0fe:7e12 with SMTP id
 z11-20020a7bc7cb000000b003f9b0fe7e12mr1230771wmk.4.1687171885353; 
 Mon, 19 Jun 2023 03:51:25 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 v26-20020a05600c215a00b003f819faff25sm10231233wml.13.2023.06.19.03.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:51:24 -0700 (PDT)
Message-ID: <6855fd3f-0b08-95d2-19fb-bedc1d7f0e21@linaro.org>
Date: Mon, 19 Jun 2023 12:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 13/38] target/i386: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 9/6/23 04:23, Richard Henderson wrote:
> This implements the AESDECLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/ops_sse.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


