Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pogaI-00022V-7T
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogaC-00021h-Fj
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:21:01 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogaA-0005wy-Ue
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:21:00 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-54c12009c30so554768617b3.9
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681806056; x=1684398056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5GyMFZl1wvkS+TnY6IdvXKMmJjkXVXnzXl0IPbdtSiI=;
 b=VyS+AXgIbJRAAITc+1wjWDPt+iBcTlFa+2eZBbAkQLiiXYD0SHbpCG0EtcE9abPCw/
 LrQWELZrOJcqNCPLQkQlAbLctl24zrxy8T3eBaqjFJ7B8qJcdIAK7XHxg2l5idsRgHrN
 h1UjmOvPgyK2xvfoDhfUvw7wPv+xM14HBAHygnPmGl64pFq66qfJIjE3zHH0ydAy4qeP
 yqMeZG5jwS+qLUhFHW8c/nJEHZFI7k8nrnzvTyagHWXKp5Jw5ccHPQeNO10aJ3MY4/RO
 Ah1nwx6uQEME53uIcrtn0Rvg+vtGNEda+qwQFCU+IIfivMDWZAHn9yzr+AVRYe2Aeeb9
 lT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806056; x=1684398056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5GyMFZl1wvkS+TnY6IdvXKMmJjkXVXnzXl0IPbdtSiI=;
 b=JukNpIxEg3xGqP9sPcrSFwD9vw5xGdJOSkaId5m/5FvRnH/YUeNRRneuMsWf5QkqCX
 XdTXxPJnoRp3SsDWUUkMdI5wEGodo+UIv55Nkh8Ee8u2GOKIttFkav4rdA3NhsFnNbC9
 PekXCNGRzOrUjnApDw33A+mujJ19SGxxBKCqKPnMti6uSbb0M7pHTxcxhrJu/1NhV5zl
 LcMZHHFyAcHzsdsxKmbpXZ7tQjIYkIhPwskQnTNRgmJrGMHWdfQ6TvZg5kBRd78fk0lg
 KLXwiXbhvKVLI7YlmDt0CTnmEnYJvtjvAQc5mNAy7b7P9t1CAQ3aaoo/U1W0xXuOCZqk
 zHSw==
X-Gm-Message-State: AAQBX9fdBRIztY5doEQjjqPvHxEZunijRQbs5Tymf9UMGSjaleFLzOFx
 b6ooCmyhX9w/g9EqLOlnNRpbeQ==
X-Google-Smtp-Source: AKy350bRsyXvhp3DLwM8KLxcmydqNy5oZRprfmunMHvXSkKaoI+PzuwyhKig723x6daLyfnwCSWtLQ==
X-Received: by 2002:a81:9114:0:b0:54f:92b3:5459 with SMTP id
 i20-20020a819114000000b0054f92b35459mr19079592ywg.6.1681806055175; 
 Tue, 18 Apr 2023 01:20:55 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a25cb01000000b00b92579d3d7csm1075334ybg.52.2023.04.18.01.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:20:54 -0700 (PDT)
Message-ID: <d897900d-9429-34ad-284d-60008c500fcd@linaro.org>
Date: Tue, 18 Apr 2023 10:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/17] qemu/host-utils.h: Add clz and ctz functions for
 lower-bit integers
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-9-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-9-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
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
X-List-Received-Date: Tue, 18 Apr 2023 08:21:01 -0000

On 4/17/23 15:58, Lawrence Hunter wrote:
> From: Kiran Ostrolenk<kiran.ostrolenk@codethink.co.uk>
> 
> This is for use in the RISC-V vclz and vctz instructions (implemented in
> proceeding commit).
> 
> Signed-off-by: Kiran Ostrolenk<kiran.ostrolenk@codethink.co.uk>
> ---
>   include/qemu/host-utils.h | 54 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

