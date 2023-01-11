Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFZQY-0007Xg-No
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 06:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZQX-0007XL-KT
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 06:37:53 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZQW-00085p-44
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 06:37:53 -0500
Received: by mail-wr1-x432.google.com with SMTP id bk16so14705749wrb.11
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UsZIA4qOEEIR12nEva/g3EWyOB93VOs7vlFpxNN2OxA=;
 b=su7N+DjL+hI+0ss7KDZTp4Ht0xOGW0DCFAZpZriljkNOs91SRoxY9/ZSn6+3wZoc9X
 I1BW8aytMmY21NmKvxBc0mv563vV0yIy3v2uKHNsymuHRz5+0RUixHcZWsn/wq89/99J
 HRz/cy9JKEWo/7/P9mO6fzVJS11qNn4uaAGuEPyE5NQR0sJICma97GNCqVfhHIQb5hCE
 ZjYFmOeJ5ohgk6zEMj1dWatQ17Y0n8Qx4fKACHKuqh6qgfO76aLXzFsM1UEvvQBwMSlh
 9xHuTppYWUhY3k+v2zNAOsD6oSgJCBKwYahkGsnzYsXUDUyfzGTCsedCjpiQDgB9Nm+J
 6rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UsZIA4qOEEIR12nEva/g3EWyOB93VOs7vlFpxNN2OxA=;
 b=oskzrEIYIw79jJ2e++36hWDFMwpi18rJdwJH3y0VVrOvsVr5mbyabgwbGcdDJbWR+X
 ZsDP0f4Duhwc/7NVkxJks9uwItbeewD2MPk0nfMMlLkhSe9dRaGTvN/vYUJl7K+WxTnl
 qYI1r2TFiAiRjfdt3AVO+a9G9JCy1RnONz8MP+xiDQa1KrmQ7QzaNc0X4/KxmFwu6orO
 bJZJnouMYCOAmsz56GQEEBW1mdSndLa/6kb13FwmhrenY2HBqzjz4nKvNofk4tJLrO2P
 6zkqDDIbF5s6abXQtTFB9IuZiU1BG7z8KHZXt2DcMz+f/L77YcR2VSKkXQ4wvuwNfj7C
 MAlQ==
X-Gm-Message-State: AFqh2kqUxk2cmJmF3mUtabxkzutHv/Xu1U93idp8vibxz26SPGwjtNlU
 4o1Bcu6jyreZnmH0gaFDSE+Mnw==
X-Google-Smtp-Source: AMrXdXtuQYW+74uoaJsXRRQG6pFozZuQcQY+4rLb/QEUumW0pOXuro3quWrO12uniYnzWcXoKf+uxA==
X-Received: by 2002:a05:6000:4088:b0:2bb:e896:5a09 with SMTP id
 da8-20020a056000408800b002bbe8965a09mr9559762wrb.66.1673437070139; 
 Wed, 11 Jan 2023 03:37:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002ba2646fd30sm15983289wri.36.2023.01.11.03.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 03:37:49 -0800 (PST)
Message-ID: <466be876-011f-40b3-8d2b-7ddd64fecded@linaro.org>
Date: Wed, 11 Jan 2023 12:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/36] tcg/tci: Fix big-endian return register ordering
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 11:37:53 -0000

On 8/1/23 03:36, Richard Henderson wrote:
> We expect the backend to require register pairs in
> host-endian ordering, thus for big-endian the first
> register of a pair contains the high part.
> We were forcing R0 to contain the low part for calls.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


