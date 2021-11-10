Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkp7d-0006d4-1e
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 10:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkp7a-0006ZH-Vz
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 10:02:43 -0500
Received: from [2a00:1450:4864:20::32d] (port=51092
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkp7Z-0000wR-C6
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 10:02:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id 133so2511417wme.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 07:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dpI2Xz6NLO1nS5zqbS04Ga8aIoKZ333qxRJLl89Qio4=;
 b=nzga8W5eJlbeNXoLiDkgGpW9iSR7nG66dWnj+NpjT73iT2UvAAEO8d9MnUV5ob/fZz
 9K8f0AUZtXZ04+bp+IhIV2qqBOQSu+IjITFwvnej530V3IihEECpUDsxydPWGmN80eXS
 bBtvLmtbQlSwSo0LCSt1X93Ly19okDhDGzOD81di14tNS05kLBDwn0yWvrpISVbiMobb
 1s+T2aOnbcUWOfJJAY8X+imSPJ8ukEAsb8dy2TFuQicIT9+36/C0ODSNXkmZDXezLCdO
 2KC/PvrRSYeGDCwmy4VyRR7VIGEcRv7ciV99/d84Px+dbF670pprEf1oNidrs/T7JrZJ
 cwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpI2Xz6NLO1nS5zqbS04Ga8aIoKZ333qxRJLl89Qio4=;
 b=Y14ZK47XcWY9j9CzUgPEX8riVse/cgOZj8eyfwCixJLA4o7HxV4a6BJKB7FiqFWsHG
 jLVVa75Lc70dCmA7/eS6NYdfcvVTNCdIaiNnVHVNxxSnAlRVc1xoA8J+KfdfBSVDYsd/
 GFH5SvPxygwcF8gGUmrKpM+IvmjSWQZ+7aS7qlQWPZVNgRaPVeQGtQAK5CW0sGfhA4DU
 0drtYAx3KmRV6bgutzAwCcFOAY/iOVSr/uVgXW7NJ/vrfYldhUCCa8Hzgmhorqa9q4ix
 rJSsF5Gu90xBeP6pAktmEZBDBg9uhs1VmnnZ/trqcG7Q7Llm9CNMyfZtgC5nw0B+FBKV
 APqA==
X-Gm-Message-State: AOAM533uAkwSCz5fKSfSMtlnZMB7ADWxUbB+eAmM9NHvic6wCUJbsytL
 VuaUdmuaMF2g3VukiBd+6qzpCA==
X-Google-Smtp-Source: ABdhPJwHIvmhPlXQCJbGViZfe+f/A7Sr/0Eaas/lNvptfeKu4up5xTMmEUL2qtltVd10Xww5iCqgHQ==
X-Received: by 2002:a1c:488:: with SMTP id 130mr224056wme.157.1636556559768;
 Wed, 10 Nov 2021 07:02:39 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id u23sm151668wru.21.2021.11.10.07.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:02:39 -0800 (PST)
Subject: Re: [PATCH v2 14/14] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-15-zhiwei_liu@c-sky.com>
 <59e04faf-3832-bec9-52f3-d5a91d20b893@linaro.org>
 <b76662ce-7026-196a-7718-e0e825322e9d@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b290086-010b-5cb6-23e0-b7188445a546@linaro.org>
Date: Wed, 10 Nov 2021 16:02:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b76662ce-7026-196a-7718-e0e825322e9d@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 15:02:43 -0000

On 11/10/21 3:38 PM, LIU Zhiwei wrote:
>> Why do you not allow writes to SXL?
> 
> That means we still don't support the change of SXLEN.
> I didn't check the S-mode CSRs behavior when XLEN changes in this patch set.
> 
> For example, the behavior of satp when trap into M-mode from S-mode if SXLEN=32 and MXLEN=64.

Ah, good answer.


r~

