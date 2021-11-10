Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkkh5-0007S2-01
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 05:19:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkh3-0007OW-4g
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 05:19:01 -0500
Received: from [2a00:1450:4864:20::332] (port=33617
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkh0-0004An-V7
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 05:19:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso3292771wmh.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 02:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s9L95GC+sQ97RM6iP3+cTQRWNeOxAm2i2hF+cRSAy1I=;
 b=PL6pCHSEDiax81DuDkktkxHSq6kvgihm9ti8XVshdIoFTncE4KHm4VpndfhOBMDyYe
 iUjaVVVhJizVxNgl8yLzqSBIlHUTy0qY0YK5zVrDkNXdp3T/jGgXMfuPQnV18WY5ktiT
 dJPwbTqXdB5BW/VdKjOrll77Xv17a8wTx00wEK6JNLDMkfelM6S3znWDrewrK1gi+qET
 lv+LxDmb1Pj9ItCFazwNdwC1y8SLQxN0kf6kkgeBpTLBsQWGot2rlP/vy7plNg/goX5F
 zFanrNcebEIc2GTqasNqsFIwq6HtZqqkNK8TvzVg711tuzvNpoL7JvRCq6F997Pr8ph7
 oltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s9L95GC+sQ97RM6iP3+cTQRWNeOxAm2i2hF+cRSAy1I=;
 b=O1b/xiybUacIIneKD/+yp97nfsmefBsNl29seUGmySDF9F9ufDzPAZNySgfgPpMM5h
 ndNzuy2bsSZ/f7qRKmWqejL2ZaWmqsDLh/V3IzJ8FhY04lMedd8LNkg0yvLut3RL+O9Z
 dqf5Vxgtw7lJId7FGVY+MwSkhrX6zTaQPN1NRUvnZL+IQQbEfBO6HGGkqZKtYHAW1sqb
 VvxG5T05OCCbmY8kuVMUxCLQ/xj87HKn9IMYbO99rdnRPAdkcpLr/E2JX6VriXuxNXGJ
 gAAf6P+F9gNlvPZexAsULpbVJHRfKTTf2ux/9PSRXLYmyjV0whL9+RRG10jozwRnTbkx
 DnxQ==
X-Gm-Message-State: AOAM530HgVWP8hzNpykrUiLTxPyrw5X/45LxLmezNMILqNKLc1QgsmoE
 NXNV6U1TPosIxkb0TvTC47kRKg==
X-Google-Smtp-Source: ABdhPJzcbkhyOAi54nwZOyJ7K0V+DQRdhu+o8VXwdofcRY00EN7ZTIHAuOTNsbKDl7zIszzvYD9ZGA==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr15258617wmp.4.1636539536972; 
 Wed, 10 Nov 2021 02:18:56 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id a1sm26370437wri.89.2021.11.10.02.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 02:18:56 -0800 (PST)
Subject: Re: [PATCH v2 01/14] target/riscv: Sign extend pc for different XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62d2206d-664b-156b-b23a-74d9d13664f8@linaro.org>
Date: Wed, 10 Nov 2021 11:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Wed, 10 Nov 2021 10:19:01 -0000

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> When pc is written, it is sign-extended to fill the widest supported XLEN.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/translate.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

