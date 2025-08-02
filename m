Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1C9C87FDA
	for <qemu-riscv@archiver.kernel.org>; Sat,  2 Aug 2025 23:58:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiLvr-0001Vs-HJ; Sat, 02 Aug 2025 19:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLot-0006vl-Nz
 for qemu-riscv@nongnu.org; Sat, 02 Aug 2025 19:39:19 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoq-0006Wg-VM
 for qemu-riscv@nongnu.org; Sat, 02 Aug 2025 19:39:18 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-718389fb988so32096567b3.1
 for <qemu-riscv@nongnu.org>; Sat, 02 Aug 2025 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177956; x=1754782756; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w3HQj0uQugwNY/q3lKzRpUuD+MAh2mwqDvVFwmHi++A=;
 b=oKllchGLEwXGUenIOXkom60ZAmE4JMmIPjQjQz8Aa06Q2j5mshDNdlyQk+B5XP8289
 nIoRrOn6sPLWUQVMKCp7Gu69imOrquctJ5nZdX/qscsfPtqB9aCYvwQMpIjWOXm4mVFE
 QPRQKfNNi2M9mExo880y7RETEisxv2eb8k3V0u/K/1nTzgGKl/10cApobubRdpBv4276
 Cdn4SizMjk3bZKfrRYvboG7H1JHVrBcaj9v8MavGhsXvGXl6BiGMlXGS0MaeKTIUA8+q
 lOYNeM3B1ALLI9BB935bNwPo/UMAzPBWPHllAJQRVSUKQjlXV5vuHJTYqtfiTJI11p0e
 CyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177956; x=1754782756;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w3HQj0uQugwNY/q3lKzRpUuD+MAh2mwqDvVFwmHi++A=;
 b=QeDY/UVNFgJn1Y8/D8UEH9TXLSYO+QQ6pg81fAFu+E4T28Qp65KjI6/oNOwO8Q9LVb
 Al/C+3HtWCZuHswwu6MTRT39ljocVnJEzw2Q+KtpQXD6Hs8sagRNaJg7bKjdxDOkyk+4
 SirdZyMxQrreSl5TF8EXicqqcfHW+9BDM3qMixL7UOCjYz0eVvGVcBhM/2XIusGaRdqW
 CUnoYus7rCO+kxFMiD1uvSnHq/W595R09koHqjwFrfcPpLPm6ZTv+mg59ELMWNXJ56be
 z7IiTZ/jzTx54sJCWef5172cMn4V9YO7xuIpMOvrUlcOSCU2v/ZAML61XnHbfqHpQ0pS
 fUgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP/a36yUi17MKA9ORvkK8NvQVcIVza9iQCenQBCBkBlhAL69Qm4oOGa3dCVS7ha2v4k+hvQhFw02+R@nongnu.org
X-Gm-Message-State: AOJu0YwqMN1M0FV548zzFmoRs4IbWdvKKz5lBmI5gR8RuHrUvZjnFKWj
 duEWLM+h5nFsz5vGzPHxGim3Xkehvl7Qg6Rm3GUYxD6TULPpMD5+9//Km8LoabEHGZk=
X-Gm-Gg: ASbGncuBkPvMRy5JV8jLBG5ba2TYwY3rPdJ3PTw1WsofILCbEhi1e267BEvA2WOm51O
 3I3f0KWHK1dbIguSbpuKLl2nZlx+DtmPPafbrPL6qSH2IKKg0y9xEZ+sl4mKaJSSLWh+f2yBYFP
 1NzPgBiPE3kGg/wzFbDoI6kObG+v09ylT3Y9TdobjCzya7V+Afal5ygubrLGvWLgSMcmtKc3/wu
 1Pb1ECbogvuG7oEEXVkSjnzXXkwfJRMpMAUH6mAb0WQzfFIvghEWR7aOiYljMXuNs2LKbQGhjn2
 S2Uc+BOZAntiYWtPHUjgZ/A0ywF/4p3cEl+7gHB45gx6pYITV8fY2Rfc5GCeRvoqPvmaas/rNnT
 M48mnRUQyz/iKgSheo9VkrZ3vtt4eoX+YS08ZMiIbHesk8f5Jls36b6IbtqQlzcPQW553wJgNab
 s=
X-Google-Smtp-Source: AGHT+IFGznS+Hw8McaLjAA3gQO64P49RYXazhR+8mKLSQxLYWFjg8xh8UdDAfaWzpQalAw0we1iUKw==
X-Received: by 2002:a05:690c:660c:b0:710:e81b:f7cf with SMTP id
 00721157ae682-71b7ed716bbmr61813197b3.13.1754177955755; 
 Sat, 02 Aug 2025 16:39:15 -0700 (PDT)
Received: from [10.153.194.227] ([172.58.111.133])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a3a9b89sm18231637b3.15.2025.08.02.16.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Aug 2025 16:39:15 -0700 (PDT)
Message-ID: <2ab7fe7d-e2e1-41f1-b4c9-13de6306d75e@linaro.org>
Date: Sun, 3 Aug 2025 09:39:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] semihosting/arm-compat-semi: replace target_long
 with int64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
 <20250801232609.2744557-10-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250801232609.2744557-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112f.google.com
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

On 8/2/25 09:26, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

