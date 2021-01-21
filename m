Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2fqb-000638-DA
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jan 2021 14:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fqZ-00060z-7Q
 for qemu-riscv@nongnu.org; Thu, 21 Jan 2021 14:42:23 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fqX-0003uZ-Fr
 for qemu-riscv@nongnu.org; Thu, 21 Jan 2021 14:42:22 -0500
Received: by mail-pf1-x435.google.com with SMTP id o20so2157807pfu.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Jan 2021 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eoNu+9m4hceDv/2W7c6hKIDWo1agg/U94hcnQhbeUiY=;
 b=ylOeElOgcxC9kPCgT3KS/jiumWkl3mYhL5iz0AUchgJtJQKJJ7rwpYkuRE2f/JiL4c
 k0Jfedn3Qu+eLIINporG5kgqpxOunBxHDcdj0NZfoBf25UA/OUObB5KeyBlpk19l/HGY
 VkKeXEbL9961Xd7EZNoicQFxhQ4pGoo4tVAgEb2eXS2vR+AxqtR5W6YqsSxDvonlKoWN
 s0lVXPocKE43tsBKyOao62OnZ+0xjHHFIZw9O0BRTBIIr6I0OM3yGV110Fqg2f5Jco2h
 z/+6roBLjkEtasXhkO+4miWw5DSTLBsAKhlz9+ZuxkHyWbxlMUwaLuU7jnq/PAWKm6Gg
 YcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eoNu+9m4hceDv/2W7c6hKIDWo1agg/U94hcnQhbeUiY=;
 b=cljZTfdHml5PtJEOqGaAsIOsSWn5pNb6JEWRRHOIUpH4WzmUL0QBoNAUNEDhx7pYpH
 o+tNRqy+UXjMoHD7fQPVrsLWq/+X+pmx3aISNkGPNJPYml2LOZo+2ykFk5ZKm8DqC0Di
 z4kb8tzEhk90kM6Kuzquoz9hEwb4Cm1WE0rFWmSbXp62EwKB3bHxWBwTwGx3Pr38ZXi5
 NqwH5FC/oSQ8O3MAZ4qwjKRYpMkOJPjSX9TgjurGmxD0uzLj9xU/l7tV1GT/HvAfqDw/
 qySXbB9Y6ck6stcw9LwugXfSuxPhg7stGW86goNbz5bGM6yhfSqJSN23ds08sStwBP1i
 d4oQ==
X-Gm-Message-State: AOAM5317AICl6z+Mwh20VRueVpklVZP6EEjs/qoCkAR3zcSBWBeu7za8
 cyxN5SLciry2Fv9pSLoYK5iHOj/dxPyRKQ==
X-Google-Smtp-Source: ABdhPJxfLy3NXQxIyYVAOhWv/mda19i0eDQU19/GIpZXuk5MP7Vr+5A2WoFagvrRDiD1H8i9dh6atw==
X-Received: by 2002:a63:520d:: with SMTP id g13mr834512pgb.289.1611258139835; 
 Thu, 21 Jan 2021 11:42:19 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id fv12sm5831479pjb.22.2021.01.21.11.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:42:19 -0800 (PST)
Subject: Re: [PATCH v7 4/6] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-5-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58c2088b-10f4-2f39-bc6f-50457ed45788@linaro.org>
Date: Thu, 21 Jan 2021 09:42:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110185109.29841-5-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Jan 2021 19:42:23 -0000

On 1/10/21 8:51 AM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/insn_trans/trans_rva.c.inc |  3 +++
>  target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
>  target/riscv/translate.c                | 14 ++++++++++++++
>  5 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



> +static void gen_pm_adjust_address(DisasContext *s,
> +                                  TCGv_i64      dst,
> +                                  TCGv_i64      src)

Don't bother aligning variables like this.  That just leads to additional
changes when code is adjusted later.


r~

