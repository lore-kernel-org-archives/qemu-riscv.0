Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148DFEB64D9
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 20:27:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHs2B-00079R-HP; Fri, 07 Jul 2023 16:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs28-00078B-7r
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 16:26:29 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs26-00042g-Kg
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 16:26:28 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso432953866b.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Jul 2023 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688761585; x=1691353585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e3c2G3RIpd96h33HaZMSLOVAsyNtgF61aubCsEvIZPg=;
 b=EVPkwoooR9z5ptWEdnnlL9X52LgjnHNBI5TRcLZq/2OAQ3lG//iA0F5WZXCMHaQ+27
 jeVljN2VXi/u1aSZzdsG3dLpglPjIL06A6YNQAiWkM5vyh4Etz6G2I/xTBtkRY7aPK7W
 Y2lljMHg8gTYXp2QRkFVNihkHrUZ7nHtomqzoUeUyYL8EahNyWL2FYOmRlrSkQbv09Ap
 Wa+ubvFENn/o6I8WYs7vMmCnoJ4MqLdgyIg8dn3MNOTOOvU1NVKdC/GIb/4vonF7r9oF
 IumDp2nDqO4xNSsN17mrMdibGvdRQhOqnbTwhMgRHQs1hnfvpTKIEyczQBeuUclfqcUD
 MXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688761585; x=1691353585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3c2G3RIpd96h33HaZMSLOVAsyNtgF61aubCsEvIZPg=;
 b=hNA3HvFpU+YzC/lCG/wBbZDwkVsI/rxtL5G2IXpzBjbugLtfiM1g59SUVYmjc5msEe
 DSO7g/NZsnxq8kureaDF2uQb2b1HrLgj0Q74IqvFg0FV4tt0x0RwMnj71VB4jXzRSSKm
 bi8F22zWdKQS209iiT3f3RIUbnVyJq36aSr6wNzIyoMlTOkrXuNqDWhZ0CGNUIpHQGmg
 up6BiAFaUI9hKPNX/yMNID1/LiylEfOALbRI6ROT25loGmHyNCDy2JcY73OZ/gT/VF7l
 YcMr6/WticPg3ay/UyLnY2Iz2srv5C/eranAcfT7fkZ46wqCduiu33E1roP2unFEbQY1
 dFmw==
X-Gm-Message-State: ABy/qLbeBgAh2GmWxKOt+x4b+h+Gd6VEntRj28ziEO20mEItqRdZWE/r
 CyJjd2YhOfTn+nskWaIgcAiixg==
X-Google-Smtp-Source: APBJJlGd0ixYIMvT0DNAdTMFToL5m1sSIRMEYMO9tj5j53gblrB/83ZiLpb3oNsN2Q1U5iSAGbbnzQ==
X-Received: by 2002:a17:906:18:b0:992:1653:3402 with SMTP id
 24-20020a170906001800b0099216533402mr6814212eja.25.1688761584697; 
 Fri, 07 Jul 2023 13:26:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1709066b9900b009894b476310sm2557232ejr.163.2023.07.07.13.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:26:24 -0700 (PDT)
Message-ID: <c221b000-a2cf-7b3c-9e1f-42f43f458752@linaro.org>
Date: Fri, 7 Jul 2023 22:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 32/37] target/riscv: Use aesenc_SB_SR_MC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
> This implements the AES64ESM instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


