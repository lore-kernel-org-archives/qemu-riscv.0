Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m441A-0005Xp-MY
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 12:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4419-0005XU-DA
 for qemu-riscv@nongnu.org; Thu, 15 Jul 2021 12:15:19 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4414-0001a3-FM
 for qemu-riscv@nongnu.org; Thu, 15 Jul 2021 12:15:19 -0400
Received: by mail-pf1-x431.google.com with SMTP id b12so5917235pfv.6
 for <qemu-riscv@nongnu.org>; Thu, 15 Jul 2021 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SPwtlGI5qoEXvXGdhfVcsvqgdXqh3H6e2job1n4NMqE=;
 b=rKQRCSltJcMJ7OZbC6h7RUj0kL0fVXWsw2kvO5Xjl86QE1vdqqzq6ub+fO81vJilAC
 FIJxsLIhXkaN8aPtZ+ebhX24RnDLqBGnhqvVaJRDajIGSc1sEDcrUEVauCNPY/i/4tRT
 XanQzzUXRgo9fl3prKLlhdl3Ct8TXeYp0T1w5+nvPeUF2qxc6iaiyvRO9/3DpQARs8mO
 s4DUFzwMzrfzyFx2eX+9iSbRoNBunp38USUKnUP6PD3ujPBZxofWoiy7BgbsojNXJWty
 Wx+VivYyz7LLRT4CpNkOJlLYyP7SEBZPAN82sLhgU8Y1aDRS4949Re1C4iahJjFoLQvO
 DI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SPwtlGI5qoEXvXGdhfVcsvqgdXqh3H6e2job1n4NMqE=;
 b=BKSMy8rNwrXVAYtQ3vK0oQW6+RcHXTkk4kFmTFPAyxQAUD5KQsHLWjJvGRYFyCnOd/
 BGVw/FGK9L+Pw0Ukd5K3hO9ztvrl98kHXs3cYzC83PsXFdBVS7NxPF36KJRoi+Y7lNtM
 ctEhkheQB7xtzDN7WO7B8VFSctVa3DtPxkv+9OV+APVyragyVrg68Bxle/j8WNEGVApJ
 qy9u+ig8dH0eEGUhDdYLR2nr5oMYb+b7b3BNJC5a4ZtQvNa3Fz0dAQy1kO7cHRgbFhb0
 N/6tfwnyNWDx3ZlEvvWYre2e8U0HuUDhxILXVDDnJDoMYpngvOaSDSd5QmM0ZY/d471c
 eA6g==
X-Gm-Message-State: AOAM5332jQ+rHyiRrq2D4wgesDig4J1FDe2kRrm+ccA777jsigNzj9W7
 mxYMJz5/Nx3z6NjZG7aQ3L//GocK1ltYNA==
X-Google-Smtp-Source: ABdhPJyyRf2ZtTv+6fclonfpexJi1syigGwksUEaGbFEa0ufD2z75kESs87WF2J3jxRWzxaGPsddqw==
X-Received: by 2002:a63:e316:: with SMTP id f22mr5381536pgh.100.1626365712442; 
 Thu, 15 Jul 2021 09:15:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b19sm5946096pjh.29.2021.07.15.09.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 09:15:11 -0700 (PDT)
Subject: Re: [PATCH 00/17] target/riscv: Use tcg_constant_*
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <2a5cfe45-3fdf-9a2f-c0f3-682d30d521a3@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b70aaf7-b337-3b73-cdbf-c5693a826204@linaro.org>
Date: Thu, 15 Jul 2021 09:15:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a5cfe45-3fdf-9a2f-c0f3-682d30d521a3@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 15 Jul 2021 16:15:19 -0000

On 7/15/21 4:21 AM, LIU Zhiwei wrote:
> Also on a side note, could you give me some advice for the following question?
> 
> I have been supporting  running 32bit application on qemu-riscv64. After this patch set,
> it is hard to define a  method,  such as gpr_dst_s or gpr_dst_u, to extend the destination
> register. I can only extend the destination register(ext32s or ext32u) in each instruction
> with scattered code.
> 
> Can we just omit the extension of the destination register?

It's hard to give advice on code that I haven't seen.

In general I would think that the destination register need not be extended for 32-bit 
mode, unless the architecture says otherwise.  (What does the architecture say about the 
contents of the registers when transitioning from a 32-bit mode user program to a 64-bit 
mode kernel?)


r~

