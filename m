Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD8Ny-0004Bd-7L
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 11:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lD8Nw-00047q-8j
 for qemu-riscv@nongnu.org; Fri, 19 Feb 2021 11:12:04 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lD8Nq-0005tY-02
 for qemu-riscv@nongnu.org; Fri, 19 Feb 2021 11:12:03 -0500
Received: by mail-pl1-x62c.google.com with SMTP id y3so383339plg.4
 for <qemu-riscv@nongnu.org>; Fri, 19 Feb 2021 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=595R75jp6aA/qFqLhq14f0hccd1YYdJDQfsUxH0wtEM=;
 b=mXzfG6zKxVKyNrgVFLzi2hFYWxDY5s/WaKrI/kwoX7/EB8OkqwbwTGovm8s2j4o+Uh
 UhuvA+jVEJjbHlbgTPTW5H55TdiucSf+Jhj5M1h9221qXuKJacusAEVxaHd0q7OnsqkD
 hqx7M2oo8xfmErgm0Qj3FOoxsfCbfPdTxqW4MGtku/4W30iefo0jOOsl1oDcytgmUwtK
 MsIvGdPNOb8Dl/bY8H1GwL3ZLcos7+EqlJwBAGSuWxvFhSkIwbz+A/eWvk27775DHwah
 bZB9Z8W92rUiDoJKdnbr6i6VcvuI0vwE2FCEGGpO/27Sw8kXkisY0EybwAlUtij9osmw
 c/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=595R75jp6aA/qFqLhq14f0hccd1YYdJDQfsUxH0wtEM=;
 b=mP3OYylK2MKwxoNN25A9hrGzkrdfNuqI4pEmeuMBo0Pr9SmUzl75gbq1Ad3s7Espx3
 Sdcg9SP083gVmBvv4pceGOUKCyf2UCRux3ydPuGUhhY3ihhAFlbfC0B8An87CFNHyQKb
 A+6vX0PLh9idzkozatJY9Ku+QjJu5oZLXoRgtcgbeLCvjF3ESNkn/t5smGppRLc+nPZi
 CxDLX1R+GzFfRhXlRwXZQ9s1YrWlTwdMgFPRC3XA8gr2TwHyaBW9mAp1cVAAsB0tBH5e
 T+GVq73JB8jkumamF4PmK/wJ48X6BUAUArBLi4Kjt92W+DXQfZq7qmhnQ3cSoSu7RLvB
 TDhQ==
X-Gm-Message-State: AOAM530gFRwwoRKF1q9f7eedIC/sQRJKOwFBQSquAyDqsTpuozdeaWkL
 MVOjOJG7Zx1QEhIOOOPwRHaXJg==
X-Google-Smtp-Source: ABdhPJzhkYSHMs3dNXwRhgzZbH1p1IWTy+LHaXyWNkpfaOHTa6QmG5mWIbhfEsL7YqEvc/SOsVEskw==
X-Received: by 2002:a17:903:141:b029:e3:9ade:bbe5 with SMTP id
 r1-20020a1709030141b02900e39adebbe5mr10072425plc.6.1613751116455; 
 Fri, 19 Feb 2021 08:11:56 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id j73sm10623284pfd.170.2021.02.19.08.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 08:11:56 -0800 (PST)
Subject: Re: [PATCH] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210219095902.3602-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cd7260d-4c09-696c-6a8d-0a74920adcdd@linaro.org>
Date: Fri, 19 Feb 2021 08:11:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210219095902.3602-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2021 16:12:04 -0000

On 2/19/21 1:59 AM, frank.chang@sifive.com wrote:
> +/* Skip mem_idx bits */
> +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)

Why not just add the mem_idx field to the list?

The separation between the FIELDs and TB_FLAG_*_MASK is unfortunate, and will
be a continuing source of errors.


r~

