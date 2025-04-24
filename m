Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6EBC369AB
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:50:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7tDs-0007WF-HE; Thu, 24 Apr 2025 05:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7tDq-0007S2-UD
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 05:50:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7tDo-0002tv-5k
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 05:50:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so14666695e9.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Apr 2025 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745488218; x=1746093018; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U/IxSYn3XdAWmDi2s6aY1jPBFUSDraEBur2+gJweeXw=;
 b=XYK3An6/MHkULINCvV7cS906bG5DtF5S4vKxAyIz3PiRJxdlSEgQFlxdzwdVReXXWm
 DsnFLl7wjOH9Ht2Ffhl1Nk6vIgFuUZkz8OYS6faysNhp3yRcmVbs70NM/6FQTFUkytUC
 mptnCCNKKIPL7NbfcR+Uf0uR1bfMxnx6vSsKntLhNSflkchBakQ2PFIi5UFrdhF9zloL
 9dwT5SE71pY2FIDQmMw6Us5GqMCqD1rjnyrciEVj/ognmuXPMKywotxy1Qfas+JBEIOY
 v7utnjCE9n4djUV5JfLOy6qy1xVLi1hMCLxF978lcUemj6TGnQndheBhkG/BZ4T+DeJz
 K02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745488218; x=1746093018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U/IxSYn3XdAWmDi2s6aY1jPBFUSDraEBur2+gJweeXw=;
 b=KkdXE0ZX+2AlKMpjpt/j06SoX6CHw6CKZFqvQkp8gqx0+TRDhhP0lW/qyAiI/CDuVM
 e93k2s13EYASATbylcrX/uE6dRCj+/dI5JbtxiQpIlHoJH8o8NvO3XyKl2HcNBgOU/np
 61eVDy/LyR8ec+OJYdM63p2JFp23EAM+yrSyoKjzkpybvjegL1oLw0xxPsw1O7MLjk/2
 z+oOB7SvOWXOowAAxvKbaiRCkYSS/wI7ktUtpzr1VGztWK2qM/a0f0pvptpkGMyyPbWr
 DMGpMmpMcCFUzF+SuLxqGVdjH9h5P1qcfW0zUuHBO9Szq41eghaC19ctS/ccn4g9FlCs
 yfQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVEoOPakOexq0GFsJNhxRQXeLFxbUAkuoMBxlvWT0IFIQLaIn2lRDCpNkdpgu5uN88vPUz2DiAPKwL@nongnu.org
X-Gm-Message-State: AOJu0YyvGfQFQ3sXhYVl2iLQtaWKQk1Lu+k4CQMYSePdzqMy8RUCKwsi
 L1+vuQbW8C+DDUt592O6AOeuPZzsrBEJocHTj9Q5mKpjGMQa9zsur1lG9vMpRyG5UqiYKdo+q/6
 Y
X-Gm-Gg: ASbGncu5deaZexZyiFE8HDunvZz70VL4CrQr13vX2IWOnVlym94NVUhY6C/pJEYyEc1
 pR+TU91394eumUZcBlunVfwynEz+zwkO5W+2W10HSiW6phmw3Au8Czrgz3wTHpzmd2azgogbaqe
 hKMAVPMbEmXimfqM8Xewy83rWxDlqCWjMxYtYs3tfZGBM/IrOk2AnKjsfA0qr9VmKoPktlqZiq1
 urB1cDi25kLJrKEqqTD0ixedD0qN4P9e8sJs6650C65Lhuzdaapg9q0dfFyyUzI5kEWYpWdaqT5
 l5XwZWijRuNnQgpOZzkCQU4r8g/H+/2LlJd99myNC5UCbrgv0sDWDZDZwgb5I4BHqAdMsU8n5d3
 6DhHkqu6SAGZdQTvPTqQ5pFHs
X-Google-Smtp-Source: AGHT+IGt2x/BXfLenJOu/ixpYqiOd1SKhhvyBgpa3NxZ7H5cmk9C3jAkV6aI1X7W40NBeryXEbrQCw==
X-Received: by 2002:adf:f58a:0:b0:39c:30f7:b6ad with SMTP id
 ffacd0b85a97d-3a06d674aa8mr1268759f8f.18.1745488218462; 
 Thu, 24 Apr 2025 02:50:18 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ea37sm1525358f8f.90.2025.04.24.02.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 02:50:17 -0700 (PDT)
Message-ID: <f9ba5a20-ca41-49b7-9813-d8695138af77@linaro.org>
Date: Thu, 24 Apr 2025 11:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] target/riscv: Include missing
 'accel/tcg/getpc.h' in csr.c
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv <qemu-riscv@nongnu.org>
References: <20250424094653.35932-1-philmd@linaro.org>
 <20250424094653.35932-8-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250424094653.35932-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

+qemu-riscv list

On 24/4/25 11:46, Philippe Mathieu-Daudé wrote:
> "accel/tcg/getpc.h" is pulled in indirectly. Include it
> explicitly to avoid when refactoring unrelated headers:
> 
>    target/riscv/csr.c:2117:25: error: call to undeclared function 'GETPC' [-Wimplicit-function-declaration]
>     2117 |     if ((val & RVC) && (GETPC() & ~3) != 0) {
>          |                         ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/csr.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c52c87faaea..13086438552 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -28,6 +28,7 @@
>   #include "exec/cputlb.h"
>   #include "exec/tb-flush.h"
>   #include "exec/icount.h"
> +#include "accel/tcg/getpc.h"
>   #include "qemu/guest-random.h"
>   #include "qapi/error.h"
>   #include <stdbool.h>


