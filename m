Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD28a-0000sj-4e
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD28Y-0000sU-7S
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD28W-0007Pk-U5
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:27:14 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD28W-0007Oo-Ox
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:27:12 -0400
Received: by mail-pg1-x544.google.com with SMTP id b22so436103pgb.6
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ofI65jt8EpvfGgFPbqGu+r2iOExM/ICFwlma49Vh2d4=;
 b=xOggvFNORlE9IE5EfjqjnY6QrXdZUW49rbV/E6nq//Z91KwFQjdn8/kuvH1mZGgGa4
 5SbnAlQ2/mxURxFKTHdYUZ9tujY59BpRtBloGHYwGGQvXApvTYcRfiSl8AXvosm5AOe0
 FbncWeiSWOZPSBjb9Lls+r4xzXTgZPrJUi0Ek6cds4/nGERhk/2dTcccxMkY41XGhUYx
 7PlpFjT1scVe1gD8QxNPNfyc3vMOreFGXihMcb8Z/6FDxT6hQt6G4b58JVkWqDomOEke
 c/pq4V8EFszHYcIPxvX/ownlHayz0N7w5hxFJb/f0eT9+uiEHKqYmON93sorbI4BZyNk
 dKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ofI65jt8EpvfGgFPbqGu+r2iOExM/ICFwlma49Vh2d4=;
 b=Ab3ZPW6uRn7Hc4q0y++6nNISTFg/P1nXHs1UlVtNqwwDmwocy/M74fKkEmHTnD5JEO
 ocSTcfzi6W5qPSGjSos8QSZxGRGtysQiNjwE1UNe7sR3GP2WN+klrUSbeUXfOs1aewXE
 zzdRAwvoBmAKcbTWtC72F2DL15vqF1VXtYMD11ymO9z6AAIJZc6FYxACtYNZvYTvRpx0
 PIWbmu+V68OzsxjizDYrENcoBVHhPWkqLay8IVyoP+wxI4uGVrNJDukM7EuoL7RzvR6C
 rvB/p5wP7MK3i12a4TZ+nmwl11wbvJuxsNZJ9HVs6tALDuTa0dZXv/MqwSFkNzsRaKMX
 jMHw==
X-Gm-Message-State: ANhLgQ1PUWEGhlt2fuZepimVhIjKjZonX3mRkSE3ZoEzfQFYDHDHp/MO
 OhOayqvitmk7eSNxfZtQY9aYBuTRQ8w=
X-Google-Smtp-Source: ADFU+vs+NLoS1mGh5ADNuVYmtyw/GfrtsYyIaMuMvdJKpU1Ht29Y1ODqrgNjeUjl0K0HKvOzcYAMQg==
X-Received: by 2002:aa7:9a95:: with SMTP id w21mr3141451pfi.57.1584174431456; 
 Sat, 14 Mar 2020 01:27:11 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y4sm31457233pfe.31.2020.03.14.01.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:27:10 -0700 (PDT)
Subject: Re: [PATCH v5 25/60] target/riscv: vector single-width fractional
 multiply with rounding and saturation
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-26-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a32b5bbb-f6c5-fc3c-1ddb-32290a2cd830@linaro.org>
Date: Sat, 14 Mar 2020 01:27:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-26-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 08:27:15 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/* Vector Single-Width Fractional Multiply with Rounding and Saturation */
> +static inline int8_t vsmul8(CPURISCVState *env, int8_t a, int8_t b)
> +{
> +    uint8_t round;
> +    int16_t res;
> +
> +    res = (int16_t)a * (int16_t)b;
> +    round = get_round(env, res, 7);
> +    res   = (res >> 7) + round;
> +
> +    if (res > INT8_MAX) {
> +        env->vxsat = 0x1;
> +        return INT8_MAX;
> +    } else if (res < INT8_MIN) {
> +        env->vxsat = 0x1;
> +        return INT8_MIN;
> +    } else {
> +        return res;
> +    }
> +}
> +static int16_t vsmul16(CPURISCVState *env, int16_t a, int16_t b)

With the same caveat for vxrm as before.  Oh, and watch the spacing between
these functions.  I noticed before but didn't mention.


r~

