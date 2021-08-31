Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKugY-0000y7-WB
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 23:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKugX-0000xz-9z
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 23:43:41 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKugM-0002KJ-FG
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 23:43:39 -0400
Received: by mail-pg1-x533.google.com with SMTP id g184so15415834pgc.6
 for <qemu-riscv@nongnu.org>; Mon, 30 Aug 2021 20:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ez0f/dDIOXxTXyu46vZROE6j8BjQVUVnQ9bnjdKnpkY=;
 b=qCRz6BMo+Sw6EfB8JNulIBQWqCLLBQOXXVii5REv6sr/mTvpLaNddcYL2F1duAuW/g
 tobfscEFE+Z61RSfJJnFl/mEan/4kyeKmvbDfg0aLO0iHAteRGEc2qd657SQZqcECQ9O
 sbtragJw4m7bKFNr+k9KmYH5ptyRTqpt01p88kD7xosv4tFDCLk4q88uAX4C5Go+RxaN
 Q4PUN4ffYiSKQ5FQSw+c4h+SVucfUO71ALIM64bj0cU6qi+njQV1W0mIii0D0V+PCvcs
 XQoLJlnOo8ay1D79sYYQ/xbB+acpZaDuYdoTjNJ10jc3ZY4ce67n9eM1p+Wjhx8Giyn+
 MBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ez0f/dDIOXxTXyu46vZROE6j8BjQVUVnQ9bnjdKnpkY=;
 b=pvh1gVCn26NgYe+hufch007HlF2sopZuyNzLNy8l7LbzpQoapcpu2g37WoNOAZHelF
 xFlOHqismUTIwa56tBH0MD/lmE8Wje3Zu20Pgyk4Wh8MnXJJnp32kV8l1Ejp9uYWb9+1
 RhCq42B3ev9NvgsdMURgkPSDPbWG/Z2wIsTrHjM+WgmKfoSvzfiS64gFi0xrtNCVa6yh
 QHZruhObRZ5h/CTil8JtT+ONBgg+bECOKgE0hpreGhzcIUmjGUop8PRoe+pDZhNuf0BW
 TRGesXOHcge8+/2O4S9s0B0o4mDZYyJO1WYHeKQ91svk3KsRaL/ebQEVir0+yU6BmkhV
 IXEA==
X-Gm-Message-State: AOAM532kewnKvlnn0dPUyIrGwat0s1UW+rzkc4h42YPRkr05bcdSnwvY
 agGcGvKfBFYQtxCaA9+Dhf5Hvg==
X-Google-Smtp-Source: ABdhPJyffjIggL7fHH3U8DzNzgSyPlZyLg4NOzZC81qcU0qsKNuFJ8T+1+5NVcAY8VGaaCfIFnnNbA==
X-Received: by 2002:a63:eb41:: with SMTP id b1mr25047969pgk.236.1630381401443; 
 Mon, 30 Aug 2021 20:43:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id z7sm866908pjr.42.2021.08.30.20.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 20:43:21 -0700 (PDT)
Subject: Re: [PATCH 7/8] target/riscv: 128-bit support for some csrs
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-7-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ffcc1322-362b-3496-3c56-ca29f3015e52@linaro.org>
Date: Mon, 30 Aug 2021 20:43:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-7-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
X-List-Received-Date: Tue, 31 Aug 2021 03:43:41 -0000

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
>   target/riscv/utils_128.h                | 173 ++++++++++++++++

You should extend include/qemu/int128.h as needed, rather than this.

> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4321b03b94..0d18055e08 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -26,6 +26,7 @@
>   #include "fpu/softfloat-types.h"
>   #include "qom/object.h"
>   
> +#include "utils_128.h"

And anyway, it's certainly not needed in cpu.h.

> @@ -60,19 +61,6 @@
>   #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
>   /* To be used on misah, the upper part of misa */
>   #define RV128 ((target_ulong)3 << (TARGET_LONG_BITS - 2))
> -/*
> - * Defined to force the use of tcg 128-bit arithmetic
> - * if the compiler does not have a 128-bit built-in type
> - */
> -#define SOFT_128BIT
> -/*
> - * If available and not explicitly disabled,
> - * use compiler's 128-bit integers.
> - */
> -#if defined(__SIZEOF_INT128__) && !defined(SOFT_128BIT)
> -#define HARD_128BIT
> -#endif

You shouldn't have added these earlier and remove them here.  Of course, I don't think 
they're needed at all.


r~

