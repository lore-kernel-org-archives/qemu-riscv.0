Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxF7c-00035V-0V
	for mharc-qemu-riscv@gnu.org; Tue, 14 Dec 2021 16:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF7a-00032N-LX
 for qemu-riscv@nongnu.org; Tue, 14 Dec 2021 16:14:02 -0500
Received: from [2607:f8b0:4864:20::62e] (port=43988
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF7Z-0001cc-7D
 for qemu-riscv@nongnu.org; Tue, 14 Dec 2021 16:14:02 -0500
Received: by mail-pl1-x62e.google.com with SMTP id m24so14561811pls.10
 for <qemu-riscv@nongnu.org>; Tue, 14 Dec 2021 13:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/RJgQIN144AnxNs0T6g1xC7YS00CVY733YPmVMPuWb0=;
 b=VDdgcTC80s+nem8XM5/e28p3z6YBRwlZfGLlIEaASGZLGUBUBj4JpAV6Hpo2tl9O1E
 sIyu1IMU3bJfSPNRsvFQOb0Z8VyZEm3ZgEG2tdpRgDv16b9jfpwyloZ0yLV4okALlAKq
 +dZd004lcoXl69uF5iuod1ufzsNb0U7nTcyw+AKYTcHbmwYmUBfCEjoycmIh9kp2nEt8
 qBvCsyPetcHx71oNbwfbK8rrXKo7FyIVYwhz9Cxy8apSA2KcjAwBGKM43+fJ9SdLx6MG
 aMRIWoaySGthihiW2crUhUgHRI9vyQrgWMahAiglkQ1+1bML/0N0Hn/qI5ReAU5XGagO
 BbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/RJgQIN144AnxNs0T6g1xC7YS00CVY733YPmVMPuWb0=;
 b=5n0I8eklcjDYTzZ57Bu32RuUStNKrSKsWrb11qCRpB/11L+BrydizIkKlnfkISlMzM
 yI837If+noto0dOJV1Ro24tJM9vzjrsMn3YDGHr36k45eaxS4v+BheEBHuvU+P6i+fQq
 kaFEYEs7+lruVgrx6dtkoZaas+tKEiklM4XTdkzO9hhfN7UfksBFn9gf05tWM0L7VIMN
 eyPqTrywj2p2N5BKY0fGKY9rZuJIneqPWzGYlFNmepJetxxh3qJxkYP9Ed333qAjf3Ec
 NALYRR9I4hMrg3ddTsuMbet6oK94IKEpEsDVkYOjsHH0oPibgjQopFOnN1M7hxwrk9jt
 Z5cw==
X-Gm-Message-State: AOAM533OPnJjrzEM+ROIcHHRKOIhEr8hxpvU8IzFKGxd5PrZTV0scHed
 BGPTbfmf23xhjV9DKIfVR9jRMw==
X-Google-Smtp-Source: ABdhPJw+IIgGlSiByOtNXwzYbfPrxtjHjX5HPHooyvfmF7Fh7QsOB2E8rh6Zqy3/9jPeDHtTYl72Gw==
X-Received: by 2002:a17:902:8b86:b0:148:a2af:4ab4 with SMTP id
 ay6-20020a1709028b8600b00148a2af4ab4mr1510359plb.73.1639516438856; 
 Tue, 14 Dec 2021 13:13:58 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e7sm11658pfv.156.2021.12.14.13.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 13:13:58 -0800 (PST)
Subject: Re: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
From: Richard Henderson <richard.henderson@linaro.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: qemu-riscv@nongnu.org, Nikita Shubin <n.shubin@yadro.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, atishp@atishpatra.org,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20211214092659.15709-1-nikita.shubin@maquefel.me>
 <6a13ed88-e109-93e4-9254-62b6b04f5913@linaro.org>
Message-ID: <b165ef0f-3336-f4e5-61ee-b3d8cf9e02c0@linaro.org>
Date: Tue, 14 Dec 2021 13:13:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6a13ed88-e109-93e4-9254-62b6b04f5913@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 14 Dec 2021 21:14:02 -0000

On 12/14/21 1:12 PM, Richard Henderson wrote:
> On 12/14/21 1:26 AM, Nikita Shubin wrote:
>> -    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
>> +    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>> +        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> 
> When would the number of rules become non-zero with PMP disabled?
> When does this test make a difference?

Oh, nevermind, I see what you mean.


r~


