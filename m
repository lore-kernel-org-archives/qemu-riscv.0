Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD1wG-0005bf-Br
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1wE-0005aq-2J
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1wC-0003W5-Qp
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:14:29 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD1wC-0003PI-Hf
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:14:28 -0400
Received: by mail-pg1-x544.google.com with SMTP id m15so6404966pgv.12
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MrM2BPYLg132De82dXiiyn0HcHm51dRgwte91H2vzmk=;
 b=xV9W/zReI/jLsgws8l2J7fdaaIwCQ954tMQDXQHpHL2ow382mxtm7Yg/x360E1Ia/S
 pcda8gZb2KeGwoKVYMcyxijetyRAD1NaGV+vh49OWCDM6K4tkZI3i3yQOjacO9ODT/g5
 yhPk5/SuQeU/ABv2ai9hgU4jE4dbwmoPaaM8ow45U9R6R3j8783+tQs2DTwZ1TVt4472
 RPwogeNKHXQdyWxRsRU5X63TGU06MLrhpU1AdX/G7+6n/+rhJQnBwYjB+iw8lLyp7T/e
 wAeaJ1J5FB/PEnBM4SN90Xf4+wlowSqXvEJmKC8XYXoM+9qCJMxlytozP3JGG826T1kE
 9Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MrM2BPYLg132De82dXiiyn0HcHm51dRgwte91H2vzmk=;
 b=SKirACcz5UjW4Tiw5p4JjUtViTlNoxFp5sPI+82dnwSaLZGzTyy0NVKtaT+3sDO17O
 +dp3t3wkRRS2MkWk8IIFbLVVzdzUk5IHWGZsHdb352YX4TtmVfSBHMpeHx0dUMjJxYAT
 zpxa/TNErVlUY5yb94w5+ihhmzx4wEA1RaVtLKUIy4Aj6mqnq1rI0xoCrBXUsbSSwQel
 eaQsMj7yCiXQNuN+J25HdDqQK1y8IUS95wpPs66wch+OwLApnW6FTRboqEyJaIHwY8pZ
 z891oXHE9wtkqY+DtwN1C9Mwusrz87+eltP2sUsQXzQpS2dpfGKIMcz6TZkIkfblWY+l
 RCOA==
X-Gm-Message-State: ANhLgQ200jdIMvZXzEO9wHNxPbzMuTn4pRqbNykKi2ta/mijO75Nquze
 2orgpp+kbKgWfNp72jxnQyMpXXy1ZAk=
X-Google-Smtp-Source: ADFU+vsRXNjyy9rGyzNBV0VNmLSalQAsMhgFi5Y8kaIReM7UXLDx1HKQjRLOz9R5xZbE65XN3CRFRg==
X-Received: by 2002:a62:e812:: with SMTP id c18mr18050744pfi.47.1584173666942; 
 Sat, 14 Mar 2020 01:14:26 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b3sm14025087pjq.38.2020.03.14.01.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:14:26 -0700 (PDT)
Subject: Re: [PATCH v5 24/60] target/riscv: vector single-width averaging add
 and subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-25-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <834922de-5107-0d00-6d4d-47bd830129a5@linaro.org>
Date: Sat, 14 Mar 2020 01:14:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-25-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Sat, 14 Mar 2020 08:14:31 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/* Vector Single-Width Averaging Add and Subtract */
> +static inline uint8_t get_round(CPURISCVState *env, uint64_t v, uint8_t shift)
> +{
> +    uint8_t d = extract64(v, shift, 1);
> +    uint8_t d1;
> +    uint64_t D1, D2;
> +    int mod = env->vxrm;
> +
> +    if (shift == 0 || shift > 64) {
> +        return 0;
> +    }
> +
> +    d1 = extract64(v, shift - 1, 1);
> +    D1 = extract64(v, 0, shift);
> +    if (mod == 0) { /* round-to-nearest-up (add +0.5 LSB) */
> +        return d1;
> +    } else if (mod == 1) { /* round-to-nearest-even */
> +        if (shift > 1) {
> +            D2 = extract64(v, 0, shift - 1);
> +            return d1 & ((D2 != 0) | d);
> +        } else {
> +            return d1 & d;
> +        }
> +    } else if (mod == 3) { /* round-to-odd (OR bits into LSB, aka "jam") */
> +        return !d & (D1 != 0);
> +    }
> +    return 0; /* round-down (truncate) */
> +}
> +
> +static inline int8_t aadd8(CPURISCVState *env, int8_t a, int8_t b)
> +{
> +    int16_t res = (int16_t)a + (int16_t)b;
> +    uint8_t round = get_round(env, res, 1);
> +    res   = (res >> 1) + round;
> +    return res;
> +}

I think this is a suboptimal way to arrange things.  It leaves the vxrm lookup
inside of the main loop, while it is obviously loop invariant.

I think you should have 4 versions of aadd8, for each of the rounding modes,

> +RVVCALL(OPIVV2_ENV, vaadd_vv_b, OP_SSS_B, H1, H1, H1, aadd8)

then use this, or something like it, to define 4 functions containing main
loops, which will get the helper above inlined.

Then use a final outermost wrapper to select one of the 4 functions based on
env->vxrm.


r~

