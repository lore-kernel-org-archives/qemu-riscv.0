Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzkz7-0004Bp-GY
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 13:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzkz6-00049v-KE
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 13:35:08 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzkz3-0005LA-94
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 13:35:08 -0500
Received: by mail-pj1-x1034.google.com with SMTP id p12so1662224pju.5
 for <qemu-riscv@nongnu.org>; Wed, 13 Jan 2021 10:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYTnyLNc9BDdch+CYT/M8NXtPx1Qcjw9nfMbl+C0AfM=;
 b=Ch4kCmbWWv4489uaGsdeEhwG8p/5HGqaNIKfbipKDu2xnEBt0EVAp7UcU9GEZf3iyO
 7eQHIfLLtqjRRJy4xacVLV2dbX5DSQ6elH7tPzF01SJdsxC4Tu3/ynpUE6ddDApoR+rD
 rfTjxelItBzJpyTER8X8LjSui8YKL3xVRFNJu9of6AJlYkA8JpT4QmGArpIgAuYtbICn
 25vv0mudvmNz/LSoNMyc5NkTIFeatMRao0cc878X58McX/TMpeyyhtglZDMyl5ZLbE9i
 67SHezA0i59TTDETRa+VKx01m0uRG1Y49d/MvdQlSVcb7WTl1XaeMwDuxX4x1/oq4+u5
 12lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYTnyLNc9BDdch+CYT/M8NXtPx1Qcjw9nfMbl+C0AfM=;
 b=AgvSN+Z10rznE7Mc3ZOmwDJ1yeUNumuJpUFvV17pYIduLPtzMgC4BwnH+UN+FzTA0N
 bYghIu/W6zSQfRz1eKbUh4ieAZVOLvl4xLKFQmcXwXqtjsPPLiqYdnJlZoHoTUOFWchN
 LmubyhTpmBsp1pJoLoDGS20wugd7m5Kh2b2k3+bG4OaoR++s2O/q64b1BxZY4ktHJ7s0
 +SohTrwmUmjMMtyDk8mRhaYnEVR+1LTJQn/ONcF8r0ZpX6FedY1BBxrrTsAH4tttdQtL
 mNXGwrX+ZXRmePBRxwxFs6NLWFhuf6NpsNjZHjXKv8P2voHViyvaYc7SrEMKK4nQR0Fm
 azUQ==
X-Gm-Message-State: AOAM531EmkEEvDENNv/m6Zd5E4pm5FQwx76GW5g1hG9me+SaooQlRW0B
 ZfbvxoXo1wRclBf4vZvfziuHAA==
X-Google-Smtp-Source: ABdhPJzhDJr2MfZOkiekrrdV15GgBARtyUwlrdrzdNSNxYAlVSDYg8uG+wt55Oh7z5q2tZsv+QhKFg==
X-Received: by 2002:a17:90a:bb8c:: with SMTP id
 v12mr578106pjr.227.1610562902984; 
 Wed, 13 Jan 2021 10:35:02 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a31sm3024994pgb.93.2021.01.13.10.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 10:35:02 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <43f360be-af44-27ce-619b-7a2ad169aa2f@linaro.org>
 <e157e0ab-1d96-040c-5329-8ebb8064c7c2@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ba66bdc-c464-26c5-ef35-fdd6f2b538c9@linaro.org>
Date: Wed, 13 Jan 2021 08:34:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e157e0ab-1d96-040c-5329-8ebb8064c7c2@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2021 18:35:09 -0000

On 1/13/21 5:07 AM, Philippe Mathieu-Daudé wrote:
> On 1/11/21 6:22 PM, Richard Henderson wrote:
>> On 1/11/21 5:01 AM, Philippe Mathieu-Daudé wrote:
>>> Attempt to fix the warning reported by Miroslav using GCC 10:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html
>>>
>>> Philippe Mathieu-Daudé (5):
>>>   tcg/arm: Hoist common argument loads in tcg_out_op()
>>>   tcg/ppc: Hoist common argument loads in tcg_out_op()
>>>   tcg/s390: Hoist common argument loads in tcg_out_op()
>>>   tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
>>>   tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements
>>
>> I've been trying to figure out a cleaner way to handle these, but this is
>> certainly ok for now, and avoids the Werror.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Will queue to tcg-next.
> 
> Please hold on, Miroslav found a regression in the PPC patch.
> 

I had found the trivial s390 one during regression and fixed it.  But I'll
dequeue for the ppc one and let you re-post.


r~

