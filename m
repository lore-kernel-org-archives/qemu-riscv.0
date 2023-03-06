Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZKaB-0008V6-HP
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 18:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKaA-0008Ug-RO
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:49:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKa7-0008Qu-VQ
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:49:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso9372357wmi.4
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 15:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678146566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bThY2eI5Ds5muPeAlltRAb1kZcFCFT3Ulo1RmRXTQWE=;
 b=bn3ZY8abyq0sk5r4wQEr+W1aa3KEgSS/GTvBKzl0txVHtI/1V1tBm+RSQdnDVBdYNR
 sRB6cj7E2HYk4iJ3B5eyt/18ryMK/FbCiDsDZh9LIG5Cz3tE9b/4NZ8VeZCt5RQK5X22
 7vMKV7b4GBE8ByNk7YAuOyJrX/5FOUIplJUawty4gc4hmiIg3a9+rospsteWLOR+3Vee
 zjaapfP2Pq3Y+3yGSFqYjihNl9C9vbOnD/xnJOJR90YzOAB3if6REgA/M3fCbjZ6Mgpt
 WW2L7tja/USBaDBXVsgTvdaGKDvIIBWFNWQFDG2QuBlh18az2c0Z0sGOOYPYaHIlykge
 d3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678146566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bThY2eI5Ds5muPeAlltRAb1kZcFCFT3Ulo1RmRXTQWE=;
 b=a5oQc+/mEgCedSOzjNpjP7A8Inf32NWgKK0o194TM2a2D5wHepizTRXd02Kt1j4mmv
 lrtef66kr9pmu3uwe3EDQMCWvv348eFmQ530jhafxnp5boH53vCFQbcY/D8aEvKDOXB8
 ra/xeYDbR6FPTSYk2a9oDvuKx26G4cP9d9XfOLxICItrRShj/313o2eP3pId291amQsC
 opIQHMIVaDcqYt9kqV6PWqXLpZ/FfWnF1MEKBe42Um+dzy/gThjG12k0OEJujGAuCeoz
 qBr50s0ahqHI0UROezDi+P5b5uRAGV6rv+N3FcZHUBcbQTHtHBfP1CSrfU3Uy/EclgDW
 +A7w==
X-Gm-Message-State: AO0yUKWc5fJfIDUssJMMeQ7vq2P5wcpV4RixmtIJ2I+8OPh2vEFAqAVv
 xT2TZuGbVyqvhPCcDw0RSc1xTw==
X-Google-Smtp-Source: AK7set9gNFvs/N7ZO9QtD161x4zzg6TMcg8RJFB3O4Sa+Okqg/TqGEVjGevKF71OhfDfXuNGmU8P9A==
X-Received: by 2002:a05:600c:19d2:b0:3eb:37ce:4c38 with SMTP id
 u18-20020a05600c19d200b003eb37ce4c38mr11102440wmq.3.1678146566306; 
 Mon, 06 Mar 2023 15:49:26 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 m7-20020a7bcb87000000b003dc4a47605fsm15212311wmi.8.2023.03.06.15.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:49:25 -0800 (PST)
Message-ID: <2ba8d293-9f86-9ed6-f8b9-e8c930f13e8a@linaro.org>
Date: Tue, 7 Mar 2023 00:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 13/70] target/avr: Avoid use of tcg_const_i32 throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 23:49:31 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/avr/translate.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


