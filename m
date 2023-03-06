Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZBFk-0007Jm-9O
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 08:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBFj-0007IG-BP
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:51:47 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBFh-0004QL-D4
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:51:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so5234941wmq.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 05:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tm5wyMoeZT7Hze5SiailHbhj+mbt27BZ3Y9F4zK+rHM=;
 b=Y1PvHo0Zz6w5Ikug2W+0ELb1PASI0hvPmkfluvPBVtgPVC5z13kmB6Pt8rUGghjcZa
 0dat/pltSfJ34gJSooP+2gmNHyMOCNK28lL/9N7bCwVBk52Oylbzr1Wmi3kgvNOBAH1G
 qLGYNiLIQbCvgE2La0UDpQIqWgCGZhS/Wn2/JGLIFO9daK+yfNunzYkOn41l+DjcsM0u
 okq3PemyDDme3Kgwh7sEUuPXuhYhgBIgtsIRqH32Nne3TKY7xe9dFxLOrbFqyywdWHYC
 T87hb4cu5Eq9h7F4GsvmExklLfwOnwRU9aneZErniP6dESvlr7qm5AWmdxagtZ+3ttWU
 bqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tm5wyMoeZT7Hze5SiailHbhj+mbt27BZ3Y9F4zK+rHM=;
 b=7YQd/jRoROD2w6KbYGYLek8ihU2hWV7dcsJs17PHb3ExUDQOmX3uUdP/rTMOIZ8M91
 MJgsS3AyiKO6essJuQzlCmExHWdVyr75cOETG1jp4zj/7keL0NlOTtahlkZhKkA8KfAS
 UtM/eCcr87LmF6+RKpL71MTuQopaFC+V2JdgXOYf9LEK5sdfwrGIp54G3KuYw6UYSfN2
 wE2egZKVFMbFjvsip43zPnXAreOEoKaz7jZon1siND7LjOynvEONq2u5WGpy9ytPZIiw
 qdZcC9mJTWCTxonbhdH+xMyQyhgPi6hXMy/WceUp2vW7ofZY+t4N4g24sSi58UbTEvf7
 jksA==
X-Gm-Message-State: AO0yUKU9GNsXuSZdd+7Xm1U84hol5+avg9Ot/8XZjeap+m2eal2QmzbQ
 ZT6ZxAtJV3/dMVnj0nRz1GFj3Q==
X-Google-Smtp-Source: AK7set9GXoZHnRz3FspEfBc4X4DlR2l4J5Hr4SK55XuIP+jdbW7bq7t4mihFh9VhTnY/gl5UG6QtFw==
X-Received: by 2002:a05:600c:3d8b:b0:3eb:578d:ded3 with SMTP id
 bi11-20020a05600c3d8b00b003eb578dded3mr9823514wmb.35.1678110703804; 
 Mon, 06 Mar 2023 05:51:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c47d500b003e11ad0750csm9882776wmo.47.2023.03.06.05.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:51:43 -0800 (PST)
Message-ID: <4d2f292b-85ce-3943-7fd8-efa9d87587f4@linaro.org>
Date: Mon, 6 Mar 2023 14:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 12/70] target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 13:51:47 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> The use of separate data/port variables is existing
> practice elsewhere, e.g. SBI, CBI.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/avr/translate.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


