Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBD2C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 15:00:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4jmw-0004AE-0o; Thu, 01 Jun 2023 11:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4jmn-00047B-8b
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 11:00:25 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4jmk-0006cG-AI
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 11:00:21 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d604cc0aaso618026b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 01 Jun 2023 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685631616; x=1688223616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8rwAKfFTzaxsQnHIy4Xv+vjlBMMTYcf/gqqPYZmY4o=;
 b=jxNfv/5w9pF7kPvkuyV5NKv0mPhkn1KcuAtavuj0V3QACnFbL2kdTnqbs5ZOo70BqU
 zNFslfsH+5Dlty3Evon19OOSgOnF/4nP2jzFaS/HSZamZWhSaroN1aAGX+TOlmltCVRA
 +iw04ZdZgy79Yp3rWLpgj6/8AI1LVIleZnErJ+qn4T5pM5vV2+rdqaJFf/vqMP0lw1my
 qwq5+70KfHoYZZ0WG0c3Lz1l1Z387j6NgNJ+3oG/Ee+kHGhprl4OoJlnhMECxAIPGwqS
 wILxGy1IaUOrS+1/CnA3xIufaIWUZrM+zKsbiTtZ9KJ0/+7rmIpB4alg9RbmGUdmI2rf
 Op2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685631616; x=1688223616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8rwAKfFTzaxsQnHIy4Xv+vjlBMMTYcf/gqqPYZmY4o=;
 b=FRQFM3KvB88vYPgEGyilzGr7M+rTM37N0nu7a7NYnob9e8KC37FIRj71QPe3FMxcSD
 8kcvzy76PiQ/mPF54aPYZV78Xs+y9nVlDwH76trgOSZe4dkl0J/EKqKLTk+zElv9rR7j
 mbeu1JHbBSO+tH7FRTR23+mtgqgzJg4Y+snNHlXQM/W+RutrawXWOJUDeRqPEU3JjrwT
 ZIOqti4sMXWNJ8bAmiHWaL0WSTZXAJkuO8RogMb/gwPq8PrsOtBdgrFwAleKf0DAxKdZ
 fUWDnX+4ZqAvrwBAkWKqWBGH+PccrFH452u2auQE/9CJBf6x7VCFD/gsdy1N2DX6UqpJ
 3+5A==
X-Gm-Message-State: AC+VfDzXVj7lLSyaQGnfRG6c2TVAqNsfwVCPCd4nJWW/xxLB9ldxpylM
 P4bNwWdPUC5jX8R7dgTJSmQziw==
X-Google-Smtp-Source: ACHHUZ4GV1+OR2sd4npWTEGbWudGc+rhoZB4UtZv5qsbPWFZ/UzHbRa6Xs8O/N/Dv1BCfTGABnEjRg==
X-Received: by 2002:a05:6a00:c82:b0:64d:22db:1023 with SMTP id
 a2-20020a056a000c8200b0064d22db1023mr8813391pfv.22.1685631615716; 
 Thu, 01 Jun 2023 08:00:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c935:f07f:4b59:7091?
 ([2602:ae:1598:4c01:c935:f07f:4b59:7091])
 by smtp.gmail.com with ESMTPSA id
 j10-20020aa78d0a000000b0063b6cccd5dfsm4034446pfe.195.2023.06.01.08.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 08:00:15 -0700 (PDT)
Message-ID: <f2596b97-01e1-0ea4-c82e-1d53e5172dc1@linaro.org>
Date: Thu, 1 Jun 2023 08:00:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] bulk: Remove pointless QOM casts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
References: <20230601093452.38972-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230601093452.38972-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
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

On 6/1/23 02:34, Philippe Mathieu-Daudé wrote:
> As per Markus suggestion in [*], use Coccinelle to remove
> pointless QOM cast macro uses. Since we have more than 1000
> QOM types, add a script to generate the semantic patch.
> 
> [*]https://lore.kernel.org/qemu-devel/87mt1jafjt.fsf@pond.sub.org/
> 
> Philippe Mathieu-Daudé (2):
>    scripts: Add qom-cast-macro-clean-cocci-gen.py
>    bulk: Remove pointless QOM casts

Cool!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

