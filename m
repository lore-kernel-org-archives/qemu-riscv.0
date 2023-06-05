Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAF2C7EE24
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:12:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Bt9-00083w-5b; Mon, 05 Jun 2023 11:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Bt7-00083b-IE
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 11:12:53 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Bt4-00023P-6V
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 11:12:53 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-652dd220d67so3739922b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685977968; x=1688569968;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a++GAF0MDAeTSIgN9SCoLRw68S+4x4zAoAJVrfMuAhE=;
 b=VKC39ID6CYknrWufmi4sox4GaxF3hoEX7bKlRonpRSlS2XC3dA/2bYbWVJ1FTGML4V
 gau4q4FirxRyIGLhkpS4tKZtP581qq9RuZRtlNQO0eGUMS92sU55CqdQSRBm/iRekNYU
 2UrTUuCA6SmlBNmA5c5Ua347ibHrFdjTTOJh5zmDm2heE4S7IXRXn4bu1l12tYx8ABa5
 Ba3X8WgifLL5B7dFhm5NbYsxSOgcuu5FQ/LsbJAiX7c19bfi4yTxvsevkaQub/Df7Day
 LH9P32cr2O9yiqrl87pJ/+7HC6aDTQa/BSX6W7ix7dCMJEIMIYbc5H9lviN5Q7t/IM8B
 gScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685977968; x=1688569968;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a++GAF0MDAeTSIgN9SCoLRw68S+4x4zAoAJVrfMuAhE=;
 b=Kdd1YyhUmnfpDcxx6ZZCb0jMq8AT5IJTkIxxPdBSKZ5mjz/8wmQEESNgtmAIcmVSIr
 5yKrEh7ijsq0yVnVSco//16QmPifrwmHpQGe2OEm55XGCxIgWQmSr3KpWbqRpGXxDVaY
 LGRh+m3g1fuz4/AVBzMRX2ibvHJRQ6NM0PuVKK+IcKmmqQ0+Fzv4WRCeBDXVHFbtBo24
 0c0NbJGrDFfNCqjrvnRoBQ6Me2iD+2lc5hoq494ixKGI15uBiDgwkrWGc4vwUbVwYH71
 zEior6iVnTYk0+d4Vg1G3KGfzxu0RIdtQf8KQmkosAf5IaXyUOcXo/Yet/VMARlHLI0K
 emXg==
X-Gm-Message-State: AC+VfDy4znPZj2C/bDdTJ1ai0TYYm68xL5N2kSC3p1B58rYXdqJcLz7M
 2DRm4UrYNW8yhRLzivO+QHRvmw==
X-Google-Smtp-Source: ACHHUZ7yKdBGRuSnMfSZPDyuS2nCd4H0oJ6Ws0Qo+tlrl0nTN3Z73rPwr8Zpqh3uI0lLh3Fgo88HIA==
X-Received: by 2002:a05:6a00:b50:b0:64c:a554:f577 with SMTP id
 p16-20020a056a000b5000b0064ca554f577mr26309559pfo.11.1685977967270; 
 Mon, 05 Jun 2023 08:12:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3f85:a600:6a3e:e465?
 ([2602:ae:1598:4c01:3f85:a600:6a3e:e465])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a655a47000000b0050fa6546a45sm1405085pgs.6.2023.06.05.08.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 08:12:46 -0700 (PDT)
Message-ID: <c807209d-4d2a-f7e3-ca46-eb08804c151b@linaro.org>
Date: Mon, 5 Jun 2023 08:12:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/riscv: Smepmp: Return error when access permission
 not allowed in PMP
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230605075150.367555-1-hchauhan@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605075150.367555-1-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 6/5/23 00:51, Himanshu Chauhan wrote:
> +            ret = ((privs & *allowed_privs) == privs ? true : false);

Never convert bool to bool in this way.


r~

