Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbUUJ-00018X-SH
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 17:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbUUI-00015i-NK
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:11:34 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbUUH-0003Pl-1w
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:11:34 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i5so907807pla.5
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 14:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pxCtg9t5Iq82/54Y8zlgCwY7l0W/yku20X0M7owIDAE=;
 b=mRzXClbQjcx8XR/iu/fdgT35NSxV9lgJUoCjjG3nVxFQxr+wrOaLqwNN9i9WS5w352
 hDm9o9NVQ4JMy6a5TPeP3f/mv0shR5lsFDTUL8URL5bRqtrRprGO6aixwzINwAWs4aDg
 4zZsaM7wa9CMCegaJsuz5lOXXVNxR7+z66ULV9j7CS9BDJG9o6wzSvpl6Q25FKroDASB
 nHHiCAb7AyAa6yH+cBqQbFGWQk8H7G3tK1SgngZsD1hCkkF9gvZUZwMAFfhTppvB131+
 wCM1phRTzJtjBzNF7WJfy/jsAW0MZcA1sKh+KcJTlg4a6IiGOTdr2nwNb7gqWwenICRa
 +Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxCtg9t5Iq82/54Y8zlgCwY7l0W/yku20X0M7owIDAE=;
 b=eKKf0O6R+C63P9I1PWJBWexOAVgg8hrH62QcMVhlI30CrSOV7guy27wWwnhUGZuGc4
 wcg86+6Y6eAB8uQ/EhymtJYW4jY1meWKBEhj61VFb4X2FFB82tLQgSGDgjd1TI1kG8gO
 95ocmh2s/IZNw3kkJl6F1b9SeT4q0UmC2xRe4nocxR/L7VIy6XDDR0fLAgliiY0uThyU
 YXl38Bh0yI0m4oL2z8GD8Rd0e/7PfPlUK5la5H6ZjA3DSXaLyDtrEO9xblhZ/FbLQ0bm
 NA7G4Roi42qZkWdOVB9aOc6Z28YMcX5kJilLFKRCzygP1zE8hp8wvMqkpmfOSzt/8zHk
 YA2A==
X-Gm-Message-State: AOAM530QzRj4ALI2kyGWm4nvvM5S6EgcpuRa3X5W7mndVqxKrL8yAmP3
 /4wn5zJ3SpnWqY+x8KHzfMl0LA==
X-Google-Smtp-Source: ABdhPJxjk3QaqwQVzv4xaBwceIT59WO8n+yZKHfqHoZgp/7q3/Wuvu0V37fpSj/bMkae1d2S5r8GMg==
X-Received: by 2002:a17:90a:bb82:: with SMTP id
 v2mr30477382pjr.57.1634332291536; 
 Fri, 15 Oct 2021 14:11:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m11sm424877pgv.84.2021.10.15.14.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:11:31 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] target/riscv: zfh: half-precision floating-point
 classify
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Chih-Min Chao
 <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-6-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36df2f4a-4116-2eae-79c5-6c28f5b9165d@linaro.org>
Date: Fri, 15 Oct 2021 14:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-6-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 21:11:35 -0000

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng<kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/fpu_helper.c                 |  6 ++++++
>   target/riscv/helper.h                     |  1 +
>   target/riscv/insn32.decode                |  1 +
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
>   4 files changed, 20 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

