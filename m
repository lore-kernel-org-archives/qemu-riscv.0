Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACE3D6A221
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 18:15:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBeNE-0005IJ-D5; Thu, 14 Nov 2024 13:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeNC-0005H6-Uz
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:15:18 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeNA-0005Y9-6L
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:15:18 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-20c70abba48so10487635ad.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731608115; x=1732212915; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oK0qe6rZPZL+Jl4h4TVfnW307/hc1Lf6CUUL31FU6Ys=;
 b=bMVQbXGjZvMAp7xoGXTk8Ch3g7CcarcJsaVink5eIIa30zKIRmSlQsMVzU/tLqlzbP
 OulZ8LYGrHrZ0Je1eqofxeNDl66carFa7ckgEUluDEd+dgVZr4j6qc+0uUwh6LBMMTyy
 D125WdERAr/qYdF2t2BpZbBPWr/GlZK1saowrwQCl0tPGy756iQgkL583xa3zgKN47zG
 9OMgmy5XFHhRo3cIli1CEquM5jrGWsZEokw8JAYl9pGMtKtQMgf3BcLL+kA15qf15eU8
 mU9yi0guXxa/9NNK16ivVXsA/mmnh4ofAxhPSYOtJHbRWuhhTmGnXCcDsC/tQ4uub7SN
 sC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731608115; x=1732212915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oK0qe6rZPZL+Jl4h4TVfnW307/hc1Lf6CUUL31FU6Ys=;
 b=M1Jze5FAx5xQWJYRUxsHdniwXuyMD96LfBFmOS8SJV4oKsllCoI1xettBKDwzma58/
 vj9hTPMOOncHE24W3GW2Yu3Et9SlR5Dca7DMBkBoAmWinmOnnP5XCsmTTs5RaL4CBxEN
 sDn0/gylP7VpZjgbuq0uo+zgIsi+G4skEjG4dfj+0XAU2Ck+adJTwd4T97tER0tA05G+
 0KCIeoO+kP+V0YCAmjDKTB3CuE93wnE9LOBdTfa79vAzdBwAE8MbZsfoEU4nJZ3L2FkC
 NyRuINAIre/xAU0jbTeu2h8Y7zCT/tohbP626DRjJWftzRjiJ9yfwcnIBP5ADdKYQuJZ
 tTgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOqI/RP6qbzLLrJVJ7nHKOSLTzlu+jnIrtIBqnRUZ4KDCQKthM0L8+Spah1mjAI9fLQyqRUwXXyVL5@nongnu.org
X-Gm-Message-State: AOJu0Yw3NUiVseBjHk5zK+9OOCaMa55ppiJG0yQcOztWx/EE+7dPhFpC
 YtxnvWFmL2kBeNSkdm/Gsxt8iuU3EH0Q7Kyl8Pzuqtjs6pdsj6ZAUXu/vNhDDLs=
X-Google-Smtp-Source: AGHT+IGYnEjY0o4TCcklA07mwo3xxf2BLkscITbz+V4Hfs/t8tZqpH7EiiLxZgSdQVoyPwXASI38oA==
X-Received: by 2002:a17:903:1788:b0:20c:e4c3:27a3 with SMTP id
 d9443c01a7336-211c50c0c0amr37845065ad.43.1731608114713; 
 Thu, 14 Nov 2024 10:15:14 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211c7ce96fdsm13591905ad.160.2024.11.14.10.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:15:14 -0800 (PST)
Message-ID: <bb19efcf-654d-4476-b34d-72900df877f9@linaro.org>
Date: Thu, 14 Nov 2024 10:15:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] exec/cpu-defs: Remove unnecessary headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-3-philmd@linaro.org>
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

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> "exec/cpu-defs.h" should be kept as minimal as possible;
> besides these includes don't seem necessay. Remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-defs.h | 8 --------
>   1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


