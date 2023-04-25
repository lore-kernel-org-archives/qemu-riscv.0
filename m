Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prJZs-0003ax-Sm
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJZU-0003V9-5v
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 10:23:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJZR-0004TU-7A
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 10:23:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so60883655e9.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682432578; x=1685024578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0xPpJstq4gxueLzwpnuqz+z/PsoC6LFXV3Er/3MKPf8=;
 b=CR4XLKrSvlXTEFFnTJE3HePn+QdOgTOB0JzaykcEwHB/jMn+iVIwes0yeDy/PxRlru
 lQzTHdytEcjNDRMwnseXio7ZZrI0JGZN/ayvisiJ0/4BgZd+w7MYVQCPR8+hPeZSytkb
 hspeYHsRvbPXsDl+rzdPeUV+xdn+JDPnfUfn/YD02kMlU839rvWSs9PCvQxWzLI7uEYe
 WK7hRt8Mq2gAHBk1WTFJVjNF4O1uPTe0CzqlbEHU0qlN6KmFoSpF9YYpa88fUz6+kQCq
 ZTIrKxdG+K9XtaWXn7SWGaqXOufq1+XC0HDRk82W437B7wv7tDH9IQnDIUz6tJK/s7RV
 OeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682432578; x=1685024578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0xPpJstq4gxueLzwpnuqz+z/PsoC6LFXV3Er/3MKPf8=;
 b=fgsne38iIx1Gb/q2xzd6tDQl+zPOM1dM2fl3feo3yxqZb39R7aN/3dzMNjlTucJsCz
 HGBSxNXLZo/zZ8eGDfoBK78ItJ81rOHG+u+hvUeSaKvdQ1KB4hHCwqkr/YGQzpQib2ls
 JKgsK0reJ3NAA1P/mNSjsDGP7QE/KJu4vHJstyU2DpPd73vWhgbR0ctCcCcu6SLE1s/0
 XCciX9yWhRTS0FdcUwrCs+asJoZ2XzE06sYuRwAw1imTqEBfITUoaEYoKT1YBQtVymUF
 RazLo994JBLznB6VPPjc2+R5anHlhpp3Q8JjJhFQLVc8HIlSoBgt93lC6BLu3zm0R0yN
 QZUg==
X-Gm-Message-State: AAQBX9fBHfALE6ekNUtFN+ejWTqYNDbq1biLZr0lWKbGS7U7MtlXqKFd
 Vd76gPXZLfpwQO9ZUVrS1oDgvA==
X-Google-Smtp-Source: AKy350biscki8LBGWsgdcZ0nFQsHsTi7hxQ2bDGBqbB5bxZYE9hUCVZrj65tF5cjisOQagTUBqHrHA==
X-Received: by 2002:a1c:7404:0:b0:3f1:8b0f:96ea with SMTP id
 p4-20020a1c7404000000b003f18b0f96eamr10602634wmc.37.1682432578129; 
 Tue, 25 Apr 2023 07:22:58 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003f173a2b2f6sm18593760wmo.12.2023.04.25.07.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 07:22:57 -0700 (PDT)
Message-ID: <b446927b-ba56-d8f8-d806-d016b84d19d7@linaro.org>
Date: Tue, 25 Apr 2023 15:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 13/57] tcg/aarch64: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 14:23:10 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 3 potential parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 86 +++++++++++++++++++++++++-----------
>   1 file changed, 59 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


