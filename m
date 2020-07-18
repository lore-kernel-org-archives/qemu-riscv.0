Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jws15-0005om-GE
	for mharc-qemu-riscv@gnu.org; Sat, 18 Jul 2020 14:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jws13-0005o7-PO
 for qemu-riscv@nongnu.org; Sat, 18 Jul 2020 14:56:57 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jws11-00038d-VN
 for qemu-riscv@nongnu.org; Sat, 18 Jul 2020 14:56:57 -0400
Received: by mail-pf1-x443.google.com with SMTP id j20so7009531pfe.5
 for <qemu-riscv@nongnu.org>; Sat, 18 Jul 2020 11:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3UW2JTlOvsJcBhk76vTmowayaV7lM0qAfOoaT/ODzY0=;
 b=WHfChN9EsDYdiHEpcn4m5IpRvjaqAc/L/tMmWM74r1CRrKLqU/03udRrxM+hFU6bGI
 f3UjTVAIhswSK6KquuyfqIE2nwTNncOadajuuhfvauNsYDTp5zAwtlWfbhRW/fxlOwIv
 Yj9rvlIaiJ+O+Fg17/n5ePYaDKiSramOFqTzGiz8By1M76Ps1CtWavsWpn2YRJ6mRnIq
 UI08DVZSnmzYHQ1CNjT4VdN3sUL76rnMpyM+OBT1ieZBoXOWvtCpnW2XfmKXZuZ6iIp0
 /jghPikaRtylg3Me252ZU+JVDWgVIEvXhPnW80/CkGwC1qs9ncCKZJrv3wzPoyVhwjT5
 lsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3UW2JTlOvsJcBhk76vTmowayaV7lM0qAfOoaT/ODzY0=;
 b=aUx2YTLA/zGyqhaQjs0pNeMG5lhTUhjrRrRWAoZcdVN+tvXtuBQ66XlSsWg4zIcyTu
 bOU3NZAGtvErNkx2KSoMk2EHw5gGIvx5cuyXFY+r4UKWYX+BowmUEMxWFTcTIsrfrp/w
 2XtH5E85n49a14VQyuPAwlLxUBF6yfa1gHvrlhtt7ToZsBP40LUq/70NfJs8kTxNBwI3
 zHk429rJ+HwSskS04n8zEf0bFw1ztn3XXm1H7KMbrufqaTSPOfW4Vf+z3IXgCg2kkK2Z
 RdG7OUQb0sNsuGxjPapQVL3TwT1v9PpvYTnyNY0XNq1vzPnjTWRewAb/y32eyd2JrDFr
 UnkA==
X-Gm-Message-State: AOAM532RrNZM2B0urt5qYXKzn/JGoM5JrT+Daolc7cd4Ecz4S7c1ZKGk
 sun+sKOamMB8jx1WihRkJHgxYA==
X-Google-Smtp-Source: ABdhPJxHbi4UW41EK6uDqGq5oiS1FEY/D+YfjXYrjy97vu+RBrUQUQI+bOEq6NFklQWKEjOdmFsvCg==
X-Received: by 2002:a62:346:: with SMTP id 67mr13131712pfd.111.1595098613664; 
 Sat, 18 Jul 2020 11:56:53 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 q1sm11795651pfk.132.2020.07.18.11.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jul 2020 11:56:52 -0700 (PDT)
Subject: Re: [PATCH v2] goldfish_rtc: Fix non-atomic read behaviour of
 TIME_LOW/TIME_HIGH
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, qemu-devel@nongnu.org
References: <20200718002027.82300-1-jrtc27@jrtc27.com>
 <20200718004934.83174-1-jrtc27@jrtc27.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <181ead03-ff89-9971-a527-1ff2038c35fd@linaro.org>
Date: Sat, 18 Jul 2020 11:56:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200718004934.83174-1-jrtc27@jrtc27.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 18 Jul 2020 18:56:58 -0000

On 7/17/20 5:49 PM, Jessica Clarke wrote:
> The specification says:
> 
>    0x00  TIME_LOW   R: Get current time, then return low-order 32-bits.
>    0x04  TIME_HIGH  R: Return high 32-bits from previous TIME_LOW read.
> 
>    ...
> 
>    To read the value, the kernel must perform an IO_READ(TIME_LOW),
>    which returns an unsigned 32-bit value, before an IO_READ(TIME_HIGH),
>    which returns a signed 32-bit value, corresponding to the higher half
>    of the full value.
> 
> However, we were just returning the current time for both. If the guest
> is unlucky enough to read TIME_LOW and TIME_HIGH either side of an
> overflow of the lower half, it will see time be in the future, before
> jumping backwards on the next read, and Linux currently relies on the
> atomicity guaranteed by the spec so is affected by this. Fix this
> violation of the spec by caching the correct value for TIME_HIGH
> whenever TIME_LOW is read, and returning that value for any TIME_HIGH
> read.
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
> Changes since v1:
> 
>  * Add time_high to goldfish_rtc_vmstate and increment version.
> 
>  hw/rtc/goldfish_rtc.c         | 17 ++++++++++++++---
>  include/hw/rtc/goldfish_rtc.h |  1 +
>  2 files changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

