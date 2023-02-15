Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSQ42-0008EF-Db
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 17:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSQ41-0008Dw-8Q
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 17:15:45 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSQ3z-0002Ky-NA
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 17:15:44 -0500
Received: by mail-pl1-x634.google.com with SMTP id h4so132175pll.9
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 14:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUSkveiNOMwqdi0hsj5Gdnf+DlqMkBzA7/KKYUbLV04=;
 b=ptudH6f5/UevWP9vmbY94Rugm8I03050jEVxeEPzYpc6WpV6oqIDrzskrrWeEwszmN
 kJsLof7HQnVQ9Pw09H/lVOtpFuwykG3OvP3Mkson//zNRWrfx6yoEZ5J1eOsgSlRPUw0
 9ySVXsdKX+L7P21I9GcOdCGEibakIi7p0hr3sVAuUy4f1I2yeqQ5sRcH21dMMmzX2SIW
 FaApxk1lCGZXYBhou51T7PioKTVSVfshbP6uZIEF03sthBnmvCzB8pKadhAYNTOxxLw/
 u7xywB/mADWSnkVYF+8QnrJsLd3QzIfJrqJNFe8nGz0w+Kva2Tz6HDAIgIPne4ugzSti
 ZaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUSkveiNOMwqdi0hsj5Gdnf+DlqMkBzA7/KKYUbLV04=;
 b=HDVvBsi8j1tVvkpuL7UO5LkziAHZ8vSR/vrf0zaO+vniJ6NbN3Wm6Y/HVybTyAmRdW
 BCMMdJD5xFW951N5EIGOkOBG4CvBZpciLjvGD4T5UmuzmIXA49E9O2woTG0FXP7/zydc
 BQuj6e+1U3uyc9Mh10r6xqmAjnFz/g6b98kVVRYwsnmAKpBTxTdEWzqx6FM3oilnz8cG
 6mXFYTJWCf4RyALy/VtroxXB7ni8wFsveJWGxBxCQUzE9nUMHkGj1PUQHFj2PqXGMcX6
 T/6XyW35bQoFH/88YQyI22kxRSU0huURhz2mWNPmuKWt8OHIL2iD9mbXPyToxO3K9doX
 jlTg==
X-Gm-Message-State: AO0yUKW4ztM2iHb4+iAxz6f08tdw+A5cAP3A9VZMArNNNBkwaBzS6aZ8
 c7LcLkNL5CkEg84DREzzuuDXMQ==
X-Google-Smtp-Source: AK7set85n697HpuK+sdOTe0hEi3SJwA0/7bvrgieKYVCE57g6BuXOYKCm8JBjmGzeEupdCePETtWzw==
X-Received: by 2002:a17:90b:e0d:b0:234:68d:b8ea with SMTP id
 ge13-20020a17090b0e0d00b00234068db8eamr4522342pjb.39.1676499341897; 
 Wed, 15 Feb 2023 14:15:41 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 lt16-20020a17090b355000b002308f09460fsm1937951pjb.26.2023.02.15.14.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 14:15:41 -0800 (PST)
Message-ID: <d3deaa5a-2ddc-2dcc-b8d5-ac1fe4f348f2@linaro.org>
Date: Wed, 15 Feb 2023 12:15:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 4/4] target/riscv: add Zicbop cbo.prefetch{i, r, m}
 placeholder
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230215205911.695745-1-dbarboza@ventanamicro.com>
 <20230215205911.695745-5-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215205911.695745-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Feb 2023 22:15:45 -0000

On 2/15/23 10:59, Daniel Henrique Barboza wrote:
> From: Christoph Muellner<cmuellner@linux.com>
> 
> The cmo.prefetch instructions are nops for QEMU (no emulation of the
> memory hierarchy, no illegal instructions, no permission faults, no
> traps).
> 
> Add a comment noting where they would be decoded in case cbo.prefetch
> instructions become relevant in the future.
> 
> Co-developed-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner<cmuellner@linux.com>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/insn32.decode | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

