Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgL0S-0004Gk-34
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jun 2020 00:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgL0Q-0004Fg-3l
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2020 00:27:58 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgL0P-0007e4-33
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2020 00:27:57 -0400
Received: by mail-pf1-x442.google.com with SMTP id a127so712446pfa.12
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2020 21:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=quRMxeImeQm2SMl7+Ls1gDvxLR0VJAl5Zjikf87gu4E=;
 b=aDnQtyCw+hwlEXHzvL4/Nmsz0UyEadqm9x4fHGOM7egXBU0P/NuhuMJOyvTD2gggJP
 8p3ZbeazptAv7ZMs+GoIuB7uc5ygufdvC0PiqXMNJZc1iKk1RXmauAhLD0kiEjidAFEH
 kcszv8H1pjKzhw2XkFoeMYrr6HWDTMzn9OYLtHHw6sM1XktNQ4FGlY9NZt41zdJu4qe8
 3c0FDnY+hmwMikzaTgiAr07XMjvtTJMeLht5ucwcpQBhB+5e2vCY0YKhWC1cC2+T3e4C
 hlOFpsRfW12+37JisaWuMZZDwkkCHlHhkx++r64vpCHnex5lFyK2I9X6KYHHiv4QEsHt
 KmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=quRMxeImeQm2SMl7+Ls1gDvxLR0VJAl5Zjikf87gu4E=;
 b=XYF1dkstCQGClhY13WdORCj51CSPzfTbpHHAujZUdbdJg5OW/55fhfAkN/a4hfjmeH
 lkejxI7AbqMJ8s4Ab50txxa84jFDIyVf4E/kyVFwZw5zJYSo76m6Qf4cvoEd3WdKwx9O
 gEV5W8oRe85WdZVaz+Pd0ugMCPz1C/VRcbfmZQKmut8vaDrWLMOMvULgrg0vHEu4EZ8y
 7Ihkv8Knp53duIuuQQHHUEk23XibqR8K6iWmWEhjKpGdZ4S8D3Gh5OIyWyIH2dW2X3O7
 yoHs5ZU1h8+rQRSZbIl1JNTIAjbw4m8CtAwLHnBCb/75KrJjioFpN7Zm6YajDr8L1Af6
 DHpw==
X-Gm-Message-State: AOAM530ltvqWSQfI4u69DOpYG1BzMr5r0YqXvczIQKFEUFoIgzflAQpI
 DAhi0Mo0krfBfXkN66OTC1DEPw==
X-Google-Smtp-Source: ABdhPJwPOavZ0nv14HgofDBk5No3GTGJEIab629qI73swrUebQ3Rz06fy0akY5O4JSzzoHEUifqr7A==
X-Received: by 2002:a05:6a00:2b0:: with SMTP id
 q16mr12545305pfs.104.1591158474292; 
 Tue, 02 Jun 2020 21:27:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 2sm577877pfd.163.2020.06.02.21.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 21:27:53 -0700 (PDT)
Subject: Re: [PATCH v8 30/62] target/riscv: Update fp_status when float
 rounding mode changes
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-31-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7cb2aa5d-833a-8544-dadc-5aabba06ecd2@linaro.org>
Date: Tue, 2 Jun 2020 21:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-31-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 03 Jun 2020 04:27:58 -0000

On 5/21/20 2:43 AM, LIU Zhiwei wrote:
> @@ -174,6 +175,9 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
> +    if (!riscv_cpu_set_rounding_mode(env, env->frm)) {
> +        return -1;
> +    }

This will raise an exception immediately in helper_csrrw().

According to Section 8.2, the no exception should occur until the next fp
operation that uses the invalid frm.

You're doing this just fine in helper_set_rounding_mode(), which is sufficient
for scalar fp ops.  Without looking forward to later patches, I suppose we'll
need to do something else for vector fp ops.


r~

