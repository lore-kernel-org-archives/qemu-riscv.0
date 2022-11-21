Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox4Tk-00056w-Mj
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 05:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Th-00055k-2W
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 05:56:41 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Tf-0005Cg-KY
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 05:56:40 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso8715857wmp.5
 for <qemu-riscv@nongnu.org>; Mon, 21 Nov 2022 02:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PrhP+8BdzJ+r7HsFFtF+iiGmMetkUrkfwrd1uq/fOD0=;
 b=kjokjABnQMTbf0l9Hjlx62ELbq9EPaP+X+atmZcbLNDOyZk7x2ZCeFzWycqkPGDe/F
 j7k7LCEioH7gWzDAPL1T5UrD6BNlOvNL5R/LLOzSNv7VOg/jLFV0i389dW2tKBK8uNZc
 j05X92e2xx7PwMwrw/+fiF6NuXDGATsrljb+qerqwC3TY7yMA8EyFN4aFT2AY22jNZOF
 4MKUJcKrZ6V1aepzAREz4O1mlkmMMsDb19lQlW5v9l2h8Iraw2HwG0hwYjw/PVmzywG5
 +jLda71KSQ1WxBAdVNtDQyhKz6nchDsEjNhICaq92pz0x/ZvGhJK0YrZFttp6+LBv5ii
 X/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PrhP+8BdzJ+r7HsFFtF+iiGmMetkUrkfwrd1uq/fOD0=;
 b=VoZvl9yp9qwj3IuE+x3y/QnwDLO3eTDG2jxj2vxqLxeHYCULZ1R0b6NUdLkKFmDp5i
 0FscawuKaEuzeAQWgo47crxMOXGt9xk4qG2eUsril+2zF/l5LuH0+nHK4anrJVXw5LMk
 9jolx4JrmcMdptOGr0WB4sPwXC7W8sXIgwcXwWutSnTotv5KN9K6Yhnjp0HXr8eTcMz5
 BvAic+RIdZKokm26mnd3OvvQgWUdQvuBeeRZHSfKRzuve0/fQyRrdwCLUSKZAsR/J89f
 KWLhI9A0YI/rj3bXhBIz6C1rdfouPj2saGzD1Cg0c4JMP01Wb+BrIpZNGMfwfwgnocXb
 JjAg==
X-Gm-Message-State: ANoB5pnitvCZ+DV8ssd3kOQ9DNP6wzEN22R4/GhhU0kafUrB6WSVlFPy
 kEBCPKKO+Qg/xrh6obyj5H4JrQ==
X-Google-Smtp-Source: AA0mqf5Ab7xBoA71bmvL3eg9rOT+IXZXTIzvpJhqC2y1nK312pGGeg3wmqY0fDe010Y1yKZU1TIpbw==
X-Received: by 2002:a05:600c:3b8f:b0:3d0:2485:c06a with SMTP id
 n15-20020a05600c3b8f00b003d02485c06amr1433485wms.26.1669028198078; 
 Mon, 21 Nov 2022 02:56:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w4-20020adfec44000000b002415dd45320sm10888592wrn.112.2022.11.21.02.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 02:56:37 -0800 (PST)
Message-ID: <66ba1285-04d9-10dc-2504-5462f5687057@linaro.org>
Date: Mon, 21 Nov 2022 11:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 5/7] target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in
 riscv_cpu_update_mip
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118091858.242569-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Mon, 21 Nov 2022 10:56:41 -0000

On 18/11/22 10:18, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: qemu-riscv@nongnu.org
> ---
>   target/riscv/cpu_helper.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

