Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKoe1-000097-0X
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 17:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKody-00007k-Pl
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 17:53:27 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKods-0008Fy-Ld
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 17:53:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id fl24so67985wmb.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5S9AdAYHG/UyStTSLM5+quyKBcHwp3+/6AfE5D87uvQ=;
 b=XLfmT+G/ibPnhnWJ0mBV1o0dv7uomrw805zEMkDoIouQ7NUtWR7psB1a1Bu5/yhafd
 +QMIlMD4ZC6lIMwxarlTGH3RYMbD26HWc9yXsiIVac56oaBMf5lCaqNKJhAKH8GKrr+e
 Dr/f/1LAG5wo1GunsZMCqEjAeBhpM20tlRl+46JfIGTGE9MomH9/VnGFclBD28JObhu+
 GiC8bV+/T94kKsPNJPFm22qsk0536rv8rVAsTskMqOMYxhoKHRfEPewaSDRkkYqHy3aj
 TPFxf2YT2qe4B2ZmWw0jkbiKotokdO+k9F1HlGhNLJAgapPWXFUwGq9Y5v8vHIFxQK+k
 qNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5S9AdAYHG/UyStTSLM5+quyKBcHwp3+/6AfE5D87uvQ=;
 b=gY9hs2Rb3fhPiCFmAguo5133Y5yrSsCvpTtk3SxawrXeBGOXARp6KH25Pu/lgcWoUh
 epcSNuK1hN927M53TOiVJZ9ygUgYcmp3K0kdl0UjCWVpBzQ6nsptDTas/QxsjXlnY5o+
 yQuONgpcsF/MGZrZClJaWkEU8y/FcVRehtUl0GNq9VA5om7FXHD/R1y3I2u88XysCCDU
 dU9Ful2jbI4t+zZiHNw6MW9XJOQlbnbj9bO5FYQWxxoXMQgutEFx0nMJDFOuqoeKgaHn
 r7P4guVH60nbjKx65pzBWjTTVOmntDhd3ZYpt8mSzsdFtrkKnVj/8+x9QLgmMdqw/coe
 rKTQ==
X-Gm-Message-State: AFqh2ko524BjOVVwNkAsK7fYF6dH9nnO4tAZxJjo1/eDGAgB1pgxppzM
 v1YZeNWJ/RlQTrtr16RQeJRrjA==
X-Google-Smtp-Source: AMrXdXvdBKh1uzcW/QhNtZsVMUqjuDBJ3w6CL4eOrga3reOXSHUwv0IKbQ+jKtQJOj6Kzzyw2l9TFA==
X-Received: by 2002:a05:600c:4e05:b0:3db:1d8:9f25 with SMTP id
 b5-20020a05600c4e0500b003db01d89f25mr32398931wmq.2.1674687194750; 
 Wed, 25 Jan 2023 14:53:14 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b003daff80f16esm4429343wms.27.2023.01.25.14.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 14:53:14 -0800 (PST)
Message-ID: <3fe9d8c3-233c-4673-78af-694f0a452400@linaro.org>
Date: Wed, 25 Jan 2023 23:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 34/36] target/i386: Split out gen_cmpxchg8b,
 gen_cmpxchg16b
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Wed, 25 Jan 2023 22:53:27 -0000

On 8/1/23 03:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 48 ++++++++++++++++++++++++-------------
>   1 file changed, 31 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


