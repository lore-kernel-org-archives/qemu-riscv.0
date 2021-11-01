Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhXYt-0004UB-Qs
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 09:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhXYs-0004St-5D
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 09:41:18 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhXYq-00038p-6W
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 09:41:17 -0400
Received: by mail-qk1-x735.google.com with SMTP id bp7so11260371qkb.10
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ytVacYDiCdrCtL3ustDwdulgynqknFF/M71BAuL39t0=;
 b=tcqJH2uQjRSE2vSngazv5UwPpKejyYV73h1eJOQsFrhf6vfF+0AixHU6jkx0vSFGbO
 so0J0XcvCEq8Z/l8aAlucHoEqzHXk8cIxb3WNV4h10HjNkoy3JbRFvP4MCsUApR6LjWS
 AS626Fnytf0dbSEUMEDoUBhbPhf/YkZiolhLP72p0X+uM8kQ4mdQsaSvmz0JI/WuM9DY
 0IVDYvb/8VwyWuRdsbV8iMs+iIEz5GeoG2n53HAZQEEseK7hX7u4baCoPuzIVUQkVsvX
 QGhgeDqTsgiJxUaMGQ3zHUoSzvOKWVQfErmuS8HCe9F1NumHl1fver2XqiBWSHa8V8KO
 dCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ytVacYDiCdrCtL3ustDwdulgynqknFF/M71BAuL39t0=;
 b=sUQR4wnZDe2IWUgxvB8Old7E6tJdeXThdAe3jOyZPvfmL0c79knrkUzd5P4+tUI2JM
 hfNZYPTaDHrJsT0tPb/23fVgfn6iXjKTwyylaIZ2ccnH4DuDNNRqI9mGQhhJ6S47+cIU
 USvepUWQYELOT9V2eDFpME+AOL6T+gaOcwmf0P+Il+B3FrhLwv4ZhNazTGJoC6ISn5N0
 cyptVPxfNlyDznajJ8CS+EG2fdc68jhl3GF4t4bv93/WgAMjpZ/WgST/rcOZZwfz42tz
 67h0lwfRRBDEhfxhoRRvP/jD3Y0Hb3PVi6M/iMA0xFjHXwHYNyMWeyqldNTHljhATFoq
 5O+g==
X-Gm-Message-State: AOAM533vKJCtwIafOnfYxeZCojsjKeBV6rPB0HLqCSFv/R9KVTdFjMh5
 +HDUla8TbOCCZoU2p1dZFbQI4g==
X-Google-Smtp-Source: ABdhPJwAqU2RmxEUsqiWLoADuCRd4sQCeBihX7vKCBDRKgNv9i8CRktenDTv6gLSxRtvJSg0FwBjRg==
X-Received: by 2002:ae9:e108:: with SMTP id g8mr22520058qkm.98.1635774074487; 
 Mon, 01 Nov 2021 06:41:14 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id k14sm10465025qko.120.2021.11.01.06.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 06:41:14 -0700 (PDT)
Subject: Re: [PATCH 08/13] target/riscv: Fix check range for first fault only
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-9-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c5f00da2-f022-bbb5-801d-ca69c7288927@linaro.org>
Date: Mon, 1 Nov 2021 09:41:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-9-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
X-List-Received-Date: Mon, 01 Nov 2021 13:41:18 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> Only check the range that has passed the address translation.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/vector_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -638,12 +638,12 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>                                            cpu_mmu_index(env, false));
>                   if (host) {
>   #ifdef CONFIG_USER_ONLY
> -                    if (page_check_range(addr, nf * msz, PAGE_READ) < 0) {
> +                    if (page_check_range(addr, offset, PAGE_READ) < 0) {
>                           vl = i;
>                           goto ProbeSuccess;
>                       }
>   #else
> -                    probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
> +                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
>   #endif

It looks like we could lose the ifdef here and always use probe_pages.
But that of course is a different change.


r~


