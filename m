Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCLS-0003dT-Fo
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLP-0003aV-RW
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:01:45 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLN-0003Zc-7g
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:01:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso5364514wmp.4
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678114899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AVFWsc4JCQQip3THMGr7jXqyQsdTZCuJDQ8O3g3jdAw=;
 b=w3n1IKdlyWnbleSQImgj3TOyS0NMlcX0ipfZCN6NFuNtTFUslWn+kegVUYIlaO0X1h
 MBJWzi7PxsEAXrKfBRB/CJathZND5UWfqN9H6wza9LZ9PAWL8InfZyLAyPinipqI3ZpU
 xH+MbLSoBbY1034yhUzaRLULW4VNie91fjl2TAPowpzwTYHL+0d3GjD8W6IjFzd9xGkF
 wHEWUe14LlzG7Yr0nebBmP7JbgdkyHydw93z82+Y+aDggEg4ZUWnOuoxkD7VDpQ37zKk
 IuRk3Aeea1Au+ED6N3DvpT0jvBa4k7QCO5hZ4iSqOhgxrmb77P6CETGtT/3WZ9s/k4GY
 q8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AVFWsc4JCQQip3THMGr7jXqyQsdTZCuJDQ8O3g3jdAw=;
 b=HAij/yRGUd4QBE+MGLCC2VSDbYH+x8UT7Ackb1IMhUK0U/K99GZBKGFzpS+NG5LHtn
 gt+XALVHC5jFqRJEtuqXrCAtuhSeDbtSj80NRw5QGI+LosNrrKHunJvKDmLwD+61rHO/
 vI7K3dlRel6oeRqv+XdxhfTV/4+W0xmGAWzGQipZDHmQ74pXQVmgBHGEG4hOfRq8pVAd
 53pQBqUnAZaEISzZmMMJhgi2AuFd010zgBpfb8vOMdw1uPoLFvpktJn5uabG5P73usA7
 fhgjenAeC7C0kN7C48GRMBqLGYdbibE1MiwJfq+dWoSxOqFMsQ3sA4ygu74JRFQ//6Qa
 Pgig==
X-Gm-Message-State: AO0yUKXi3l824HzPDoP6BSJ51d8WMAmMUg8cW90OXDD5qf8yKo0JUF78
 9lyan4BvCdPSz3fT1jC/oQFoIQ==
X-Google-Smtp-Source: AK7set+illo//exGL+eI4L95nxIijxmlXsLFOVc+DmAWEXd2PHQM3CS32ZMvEO3mrM2xzI56pZJZaw==
X-Received: by 2002:a05:600c:35cf:b0:3de:a525:1d05 with SMTP id
 r15-20020a05600c35cf00b003dea5251d05mr7715459wmq.8.1678114899324; 
 Mon, 06 Mar 2023 07:01:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05600c189500b003e71a6be279sm10192798wmp.37.2023.03.06.07.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:01:38 -0800 (PST)
Message-ID: <46a95da2-cc44-66e2-a20c-fce21a6f7d83@linaro.org>
Date: Mon, 6 Mar 2023 16:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 66/70] target/xtensa: Split constant in bit shift
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-67-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-67-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 15:01:45 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


