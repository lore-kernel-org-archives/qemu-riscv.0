Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZN0G-0005Tn-HS
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 21:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN0F-0005TU-KI
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 21:24:35 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN0E-0008Kd-25
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 21:24:35 -0500
Received: by mail-pl1-x629.google.com with SMTP id y11so12663029plg.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 18:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678155872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dExFf6s3Ic3QnTf7cCF6RvMH66LT8iARfR05LVi+wy8=;
 b=q0s01l/R2fa/mSwI7Tye7X+Z8Adf24rSUZ8BUvQoSMH4dfhCw9EHp/Srt61j1l2QZ7
 6qpO3ARAFpwuzIXQBCY6HG/fg/ZofEjvA9Dk2AGLape1L6+IzoRjkV8PtJiNucrS4Wwm
 Qr3kW4lhE8V+oK9iQtIjIIeVyzh8LUXq2WZm0iX2yECU/vgANWPFYzfU2zGYqbEL/keD
 f5OJRZcp6f+epcojlZ0knO3k+SFn8AX6+QfbcInRzFi6nID/9o/UBEA9F7cMZj28Bfrm
 AH0WyHR6ansQZ8fCNVuMBAmz56tr1xs2W1q4yM33wEi8QsSO8OEo0vIauE/qDpCVHCq6
 J+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678155872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dExFf6s3Ic3QnTf7cCF6RvMH66LT8iARfR05LVi+wy8=;
 b=LAsNQxYl40qcy2p0FXRWU9Vp2UsQHIH8nkWqOgAShl1WMo/JbhLqepG9Jy5Je0CWvK
 wK+dQcdW3itlVeGeJ7pyOJ+O+wBVx5g5t9eBe8YII8l3EVLxpk9Ccev7vXMKd43X/LfZ
 0NQOtrznpQQMIcZSyXsx3z+huJ4xO2Z5zRIo0wSdtfg388PqV8H5B0QIOxox/8usVPgM
 5OKmDKTGhS6MT3GbwhuIynQJkWNDpT/w4VQPc0DmZA7gJq7VLIyGzFGZOkaupmABhZrz
 mtm0mz+EG0TG3YCzEFEx+sn96qndtjPCj7gVu5z/Brvhwgs+s0CA8SGAVl023hi+f9lI
 9H8A==
X-Gm-Message-State: AO0yUKWRJ7icY694ANZEd7rLPKgotIls0aDxUVQI4d58cnqjXcDCfMBP
 RuX1LEAcD7wUNA80Rhdlc/Eflw==
X-Google-Smtp-Source: AK7set8KwarBOF38jrh/fVS29fM02W+mk+ncAm98THZjHiELY0f+vpctpzR4FIsIYu0I0eSjAMc7Sw==
X-Received: by 2002:a17:90b:38c7:b0:234:b03:5a70 with SMTP id
 nn7-20020a17090b38c700b002340b035a70mr13515969pjb.35.1678155872413; 
 Mon, 06 Mar 2023 18:24:32 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a17090a648200b002375c356b0csm6484537pjj.19.2023.03.06.18.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 18:24:31 -0800 (PST)
Message-ID: <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
Date: Mon, 6 Mar 2023 18:24:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 56/70] target/tricore: Split t_n as constant from temp as
 variable
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-57-richard.henderson@linaro.org>
 <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 07 Mar 2023 02:24:35 -0000

On 3/6/23 16:19, Philippe Mathieu-Daudé wrote:
> On 27/2/23 06:42, Richard Henderson wrote:
>> As required, allocate temp separately.
> 
> Hmm not quite accurate; this patch contains functions
> which don't require separate temp and belong to the
> next "All remaining uses are strictly read-only."
> patch.

But they're all renaming, in the similar contexts.
That's what I meant by "As required...".


r~

