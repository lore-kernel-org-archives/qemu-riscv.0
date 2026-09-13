Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E32FC88E56
	for <qemu-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 03:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5avo-0005oN-K5; Sat, 12 Sep 2026 23:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5avn-0005nz-Jb
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 23:31:03 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5avl-0006y5-Vi
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 23:31:03 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2db3305f94fso33069245ad.0
 for <qemu-riscv@nongnu.org>; Sat, 12 Sep 2026 20:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789270258; x=1789875058; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0o5SYxek6plPn4fkQF86P9+LXv8vVx7gjk7fIvFwFVw=;
 b=i3qiYa/4+NvRFISyYjDbsHgxVhcG5Z+q9Cz8wOumnH9wrDxhp/MXP57h/FW9Bz1gyc
 CFezscL3c/gfG1yas5GzXqeXxCxbGr7LgbJSU5ixLaHxGaAHKEX43OEdtW4qarsUjrhY
 J9o/CqVo60bvGTED8x/lAM7np1oXzxpdQ6WKayTZS4CAbyT/KSDfDSqXbw2AqicNd1wH
 xKpUnBBSY7Rn7YhJ4joShJWATrsKFQW0hXCmNte7ECDE25p5lIgJfsAAgfAJGgnVc+7q
 2VkwZ03nrZW/2jIqAM50acoc9rc9SupHYx2XwkdFXYzCyqmSPfI2kTcFwAiZXhkptOcI
 znMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789270258; x=1789875058;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0o5SYxek6plPn4fkQF86P9+LXv8vVx7gjk7fIvFwFVw=;
 b=MMEZblL5yTraFBuCaNnyL8xCyZHIO9lRvJFbcE6b01tMV6E47DdmoQFKEfSzXUa2VU
 /MR8KAT8+1JDxUNdn1+E2y0s15v9/AOZbznp6asHr3Sh35oUAugzmrS5L4UwV+fKCj9t
 KCdAGm5drDlUqsfy6gCk/i8aOtgHekPUW1znd10JUFJ2zeLTXP8ErPfuglACZVUqBmLA
 /LSrTH4mlFJqRDPscpCTIb7kJLcVf5Wnu641gUyLAFc7jKNtswbSmwJ+6nQLapp+8DVY
 L24HmqxnjB0rtENt6JN7SBzMEUvHNRpBzxP7HLbmZPQozbgofvLlcJlLq65S2W1Y2989
 p6cA==
X-Forwarded-Encrypted: i=1;
 AKwUvByGFbJfniMiDQ3vj6o2JyUQ31J3W8s4ZRwzzEn+5AO1CcVTpPOnJCNiaC1stFFzsaKWPSsxgqtFNF0X@nongnu.org
X-Gm-Message-State: AFuF++ljChZu/khAOyR+D2HL+m/LqVVZiE4xjE8sKFXdTCarpNYP1ZNS
 gB48higlXNmEQOs9qyf0RIkaZufcedjdYi2eO4eElpCrZNRgM7mA3mKmbYCNVSTYAmqmQHWFbj+
 pkryjSeY=
X-Gm-Gg: AYBFou1sq83qTgdCsoPKi0Ljvzbz1lF5ErfOOF/mZFL88oOpGKDO9FXvsdcyLeyk2SR
 Ctm6ee4xM+bvpmlIdmJXmDaFvpyXrsSsDbjF3oagLFQDrEXT97uyc38VfLjgGxHNswybs5sGlY0
 pH83QpXtzXgo+cArU1mxBXsb4gNUdYYyONntDtN4TrdeLYphYSyuo88KDvAd3BuZbe8wbOPXbYq
 KJIp75FGj2AKElh9f5q1qK7ovBo5uWiOSxIZYYQDzCRgsG8mDN1Q36/jCdyZ8J8TdVJilmjrdMR
 NlSXrQrBQVFp3TK7zOb63g/zQOHD/4amloIXxPJy0SkMwOSrgNcZERahV3IdFAeQfcgf30dJnom
 gc2c6SOgcAYLfnaPNRSr+3WVM/cK0FNuLr0JnFCTM/Tk2ENUHrbLV9XdjNWNjEVB6qz9wOZ35Hg
 P9Sblz7KSCll8oPTdRbh1VxQ0u/n+ATZVw5mBw/KlwepCZ9VdUyNKGitflTBi2KgtfjJAY7Ymhh
 FESs2Yo36iJNym19UvTecifG4H+B3/lu0R1wT1FQ2tB9sAQM3P9q5MXj6zfg8nXTlB1/did
X-Received: by 2002:a17:90b:4b81:b0:38e:49c0:75a7 with SMTP id
 98e67ed59e1d1-39d9bc6a1b8mr18907582a91.8.1789270258047; 
 Sat, 12 Sep 2026 20:30:58 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b8f1f7sm14786661c88.11.2026.09.12.20.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 20:30:57 -0700 (PDT)
Message-ID: <9cd6b3d3-4f67-43b1-879e-7ec5b5edd7fe@linaro.org>
Date: Sat, 12 Sep 2026 17:30:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] accel/tcg: Document do_interrupt() callback
 contract
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-6-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-6-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> Expand docstring to clarify the handler is called with BQL held.
> Add assertion that this callback is mandatory and never NULL, since
> all targets must implement interrupt handling.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h | 11 ++++++++++-
>   accel/tcg/cpu-exec.c        |  1 +
>   2 files changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

