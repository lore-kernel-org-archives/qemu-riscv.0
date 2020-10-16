Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTZS9-0005cP-TP
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 19:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZS8-0005b9-04
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:48:04 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:37979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZS6-0007hY-EN
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:48:03 -0400
Received: by mail-pj1-x1042.google.com with SMTP id u3so2340264pjr.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2020 16:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZVW7yJ/13kjwcl8Wy0IS9kr1o+xMer4wX7nQcI21J4o=;
 b=GdXGz2Z+VOcN05o17rt9PJJFiF2VGMNIu35mEFneyj/x5vRS5iV2+SjY0meyRqcMEX
 k3BbfR0SfUiPg1SZk5QXP6hnZfzUzYeAf6oQEqdqy3n/XUzl5BvUabBlvudY1kQTQonw
 EZsDoPqA3/Uso6nn9UOIGp75F+ULbTZqKQL4Cbo0NOcU+LHYDEMjjyPBfYlRKV6i5+Lr
 +ykWL9SsVHx97QlCfEudwr/L/FjqpkXYacM7g9fZGjWyCpvgR+/eaXomdQ7X5wX6EXrq
 vh9kP6Pv2xn9osCs4aiEPyf1MhY90lYsupHOPzT2Mg39prSmJmKSOzsJoRDUJ4DOL2pd
 rXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZVW7yJ/13kjwcl8Wy0IS9kr1o+xMer4wX7nQcI21J4o=;
 b=t/Sdwe9dCjpOhOFxDEbmkj/0OBY7/pNATtqKF/nBvAAJnOJuZ2Z6OJuQLjqCGN0xDD
 AbW6DFctmHE5DnW0v3S+QtNDDLC9SAeV8CmuCK6yTUXujZBKwhj7bDzz4yse63PPZBM9
 ZAOZyDfsJtTSb12yGQtXDul8gBsLq2G9zuiOOFmlf6DyCSSe0fn5IOAnuyeM/UIS4raU
 Qs+vek+XD1pfLmDyuTS69GCSGvU54MtuOmRbkHtGXSagtuRo5YTFkAMjGanXb8+fyUcz
 VzyD48XMff7Rgz9g7iR1shrHqElSYmFDnVQrVt7VcJ5DQcqCqOgk6wjeTGxfwMwn51+Y
 +a8Q==
X-Gm-Message-State: AOAM532Y+uNjDdULftv0ztC3bm2AjrtlgsaWYyymwF5RJcGtHdUtwl+Z
 l42Bp+8AlAtTbW9QiRuRWgWpzWzfqS0Vnw==
X-Google-Smtp-Source: ABdhPJwdYNfEYRMH75xIVG+RhBiRzP6bpP+bw5QuETN2OCuCyM9NTzb9f53lF8tujIqGINd27FBLYQ==
X-Received: by 2002:a17:902:b107:b029:d2:ab87:c418 with SMTP id
 q7-20020a170902b107b02900d2ab87c418mr6653395plr.40.1602892080647; 
 Fri, 16 Oct 2020 16:48:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t3sm3700794pgm.42.2020.10.16.16.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 16:47:59 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201016221138.10371-1-space.monkey.delivers@gmail.com>
 <20201016221138.10371-6-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed0a6658-76a7-d9cc-574e-93b2fb8af6c7@linaro.org>
Date: Fri, 16 Oct 2020 16:47:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016221138.10371-6-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 16 Oct 2020 23:48:04 -0000

On 10/16/20 3:11 PM, Alexey Baturo wrote:
> From: Anatoly Parshintsev <kupokupokupopo@gmail.com>
> 
> Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
> ---
>  target/riscv/cpu.h       | 19 +++++++++++++++++++
>  target/riscv/translate.c | 34 ++++++++++++++++++++++++++++++++--
>  2 files changed, 51 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

