Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13560CF8869
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 01:11:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swtJh-0002Jn-3X; Fri, 04 Oct 2024 21:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swtJf-0002GI-TJ
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 21:10:39 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swtJe-0004Hp-97
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 21:10:39 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-71dea49e808so990084b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 18:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728090637; x=1728695437; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LEMMggDTZaOuKhxsdWNC9wlZXzM5eEyf67p8QFxmr04=;
 b=n023rBWTZbffv05GtLq/ph5Xg9aDzWbwFJXF6MAxBbuKnfEUU9TNE6S1eRvKk7cbSM
 me9i+tVpWYfDxGUEnjTN/00k+ZO+OE5IiiyW4umTVgD1cVCggWtWJUaL3hI/h6AkXKE8
 m8jR+yPJeVoXrr/k2CT/BIUk1kH6tqtqM+e8mZ9c7FyE/w8K48YV5VIq5HwYVMCJ4xyu
 waTLB8UqELb3H5OqRuECNl6gQOhGKtjYS2T4x60LQe+VY0CRQmWt4GEVhD8rRMoghaIp
 Pd8BiRJVD3veRTsx6BnVCjolJL1D/WFERAt4Y3qh3DrfUB0R0/YBRAos8/X9wk+g/P9u
 8sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728090637; x=1728695437;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LEMMggDTZaOuKhxsdWNC9wlZXzM5eEyf67p8QFxmr04=;
 b=EVMlTbBFWJDAGyg2ZU+xEfBsSPd+o9vJXZD/+qIAle+AD6fKIMxGqcb+SZJ7x6TMtm
 mMbvdpKhAiZnZssLTrDwUpvvJUm4nxKFrbRZLaLDPBvl5ZUDgkqYANGfJYnmofIwzAWo
 2E20ANHhFUueN5gZ9bX1zx4OR0E7G3sedfRz0Oit8LRpreBORxBZ+jZbeV8CYoe3zZoN
 +GLkFH+i9wuITeQrhYnNecOg5NuJ2nmbg/+P630WpVMUCrWWpWUVTWtBL72YfzS5EqZB
 Hb4NJ9/GgcfuZ/2s1opSeuAxdWNpwzH3BENKw29cZj6Q8K0xH51MN0jdXHgtTvvkk+yL
 glXA==
X-Gm-Message-State: AOJu0YzIjeBkJ3hAEpVQ4MNKzJuihNJtnjPSbiCHiEUWLR/G7srHKBn3
 juQG30JpDdjhVLQarfGEWtwE4jjPfnUL4zaceXMIGYfDAw+jxBQGCeCYNAUFKgg=
X-Google-Smtp-Source: AGHT+IHZwKcaNdo+BG1NA0+x+5P6W2gEj/7CxlNWviyewGuRuCGuy1xNxwHyG8ISfuMjHQFKAIRpfg==
X-Received: by 2002:aa7:888e:0:b0:71d:f2e3:a87a with SMTP id
 d2e1a72fcca58-71df2e3abdamr1033726b3a.3.1728090636815; 
 Fri, 04 Oct 2024 18:10:36 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0cd3528sm504378b3a.86.2024.10.04.18.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 18:10:36 -0700 (PDT)
Message-ID: <b131bfdb-5a76-4c86-bb8e-487c8e352013@linaro.org>
Date: Fri, 4 Oct 2024 18:10:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/25] target/alpha: Replace ldtul_p() -> ldq_p()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org
References: <20241004163042.85922-1-philmd@linaro.org>
 <20241004163042.85922-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241004163042.85922-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/4/24 09:30, Philippe Mathieu-Daudé wrote:
> The Alpha target is only built for 64-bit.
> Using ldtul_p() is pointless, replace by ldq_p().
> 
> Mechanical change doing:
> 
>    $ sed -i -e 's/ldtul_p/ldq_p/' $(git grep -wl ldtul_p target/alpha/)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/alpha/gdbstub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

