Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8L0-0005xm-II
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Ky-0005px-Hv
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:33:48 -0500
Received: from [2a00:1450:4864:20::436] (port=39779
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Kv-0006Bc-So
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:33:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id d27so9259487wrb.6
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MNjeZJLEsrlupKmy/abmn7RdjYiOywbGi3wvVeRJflw=;
 b=AAJMS/DfOQxUfDP4drRuUCKSBfrSsJb/jO70iVUyxmb7VUx7+rKxgWp0i0RbCFBSS2
 bQzy5nf7QeK/yg6V0Xue/UvIQ7+Yjm93VeeOvNr0lXY43CGNIkORU6D4XOAh7CiUy+fb
 Sa7bumOYIeqckgUztVnOK0n+jUzDNZ1OPW3ae5abIvKKGfwBIm+/8BJTYi644uPq1Jft
 QGQhFcigRrLGfTa6Z1M8t1v6I3UX1yRH+uxWTDv/cOe0EIzwWwtDvpRKwuFb4eDyc9j7
 ORCUEGWAqBYb7x8uz6Z2P0uMstbz5n3J1OeDVxHmxMi4KrREmZJ+CVx427zgurI8KOP2
 CHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNjeZJLEsrlupKmy/abmn7RdjYiOywbGi3wvVeRJflw=;
 b=bynbsU6m3iOaEtgdOedLG5u00eZQKzrRXpdeOOy5GlVJQEtgDEJj6E67HmrNxhQAPI
 X/RTxqZWbVlaeAm20EIUkwcmL4FwDtqIn/zjsndQMNvtqZlcOHt7/IMMrNMd4KEaf/ai
 1onX9qZivSFQSCFl1sAf4DZAcW9bCKEBVsJ03ufbeA0x//u+1VoBCy0cKqg5eO2FtYQI
 tTfoc/9I1f8OQjighNTfI9/rycAZkmehq1t2/yrgsJEEr70wDZnssr/tdevrg7glU5S8
 /D15WGYzx8/CYmTFLPWU4B6nLTXVWAkI8Z4fXDOito+k2//6mstfeWZcLbisX+4rT4dX
 2x6A==
X-Gm-Message-State: AOAM533jVs6VbypwnUcohrNfHhCMZ6cLwrnsMF5iHIP8DCbcAzbE6QdW
 i+5QuAbdABHLA8uCQelFf98TmmfYwuqzkRuJCgQ=
X-Google-Smtp-Source: ABdhPJxN9KjFDez1PYxG90APiuX8tc9W49g/EpsuuhO4drm4qgS4RpTTB65FW+iVbi8Q/vEXjIMvxA==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr7926875wrn.257.1636630424345; 
 Thu, 11 Nov 2021 03:33:44 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id h17sm8510300wmb.44.2021.11.11.03.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:33:43 -0800 (PST)
Subject: Re: [PATCH v3 13/20] target/riscv: Fix RESERVED field length in VTYPE
From: Richard Henderson <richard.henderson@linaro.org>
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-14-zhiwei_liu@c-sky.com>
 <8f43db00-bd51-cadc-4c57-0db699a96aa0@linaro.org>
Message-ID: <6b23e7f0-43ff-8782-f193-e5e6394f1ffc@linaro.org>
Date: Thu, 11 Nov 2021 12:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8f43db00-bd51-cadc-4c57-0db699a96aa0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
X-List-Received-Date: Thu, 11 Nov 2021 11:33:48 -0000

On 11/11/21 12:33 PM, Richard Henderson wrote:
> On 11/11/21 6:57 AM, LIU Zhiwei wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 52ce670cbe..b48c7c346c 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -105,7 +105,7 @@ typedef struct CPURISCVState CPURISCVState;
>>   FIELD(VTYPE, VLMUL, 0, 2)
>>   FIELD(VTYPE, VSEW, 2, 3)
>>   FIELD(VTYPE, VEDIV, 5, 2)
>> -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
>> +FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
> 
> Or better, remove it in the next patch.

Bah, nevermind.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

