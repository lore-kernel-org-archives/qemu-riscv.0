Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inW3X-0007bE-JV
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jan 2020 18:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1inW3V-0007Zk-BZ
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:08:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1inW3T-0001aG-TD
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:08:33 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34853)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1inW3S-0001WW-Eb
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:08:30 -0500
Received: by mail-pg1-x52c.google.com with SMTP id l24so24045540pgk.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jan 2020 15:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yLrjbfP/OAMALmDOrYFfxopv7TcYyyJS0FXbPxlwM0M=;
 b=QtWTl2EFn9Y2B06E+Iwc2gIWy1p4gPM1UDRxB9j3kbzL6tjAmYG+Jm7OFqppNe84gy
 AgROhF1jVw7j3PAPkvdpjaZADjVZZQO0F1Mek8hiPCthyhUTgujUQFjzC3KiTNlHMc4T
 EnvQTqX0mhAazc+JMWL0LgFMR9JA4Y5rmrTiBGus16cCpfTviL48sqDFmzhsgrKYGECp
 uyU7rKdumiBWvQ9XKAUv05tNdtRpayeH/e0XJAQSBAlwtJA9Rnye3hipQP2j0BzaM4Dj
 6q9Gmx68u0qUbEu/VA70HWsJfGciyN6VAAjL2F42l4hnufoifkHm07AGBXnms3ojxOZW
 v6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yLrjbfP/OAMALmDOrYFfxopv7TcYyyJS0FXbPxlwM0M=;
 b=UoXfWfQNxrlIbxWMfjs26lms+lVscAOhvu7aKG0P6QgmyVTPEHrKzekklywINkPN++
 XSDxYPNCKpnqEh7NxVH9h8xS2IFICsk3IEdNkUz7aPUUsFVUEpsg+mho5JyKfuYD6ez9
 VR+mM42R82wyVp7juNkqmqY97mFxoQMtvq37cg0fRxISYHJnhBwWNfAfLcARxnpKYnVM
 aepFlKOou0l5GhrmMGxikT5jH72rI6G4jJ2g8jqkD4eyHX+KPdxR2y2mPSACFYC+aWRk
 8H3YNO9F7y0bFXEaepQ8Lo+6/bFgXQT9pBUCzf69kZd4ueMWSSv5f1pj4SJ+dShpdGy/
 8ncA==
X-Gm-Message-State: APjAAAWgRaEhRL4Rgo8haTNJBemuxQ3ZuifvBlmy7SmQJiZAAv8Y+fzp
 9mli8IbKbEXQo4pfFv6PiZJcPRneu8Tg+g==
X-Google-Smtp-Source: APXvYqxXbNBH2EDvJWKZmOfxVYWT7S0AvDL/W6ph28uUXaEOmZKWzXxKXeeIkoXBqz/UQ6Wo+Do8NQ==
X-Received: by 2002:a65:578e:: with SMTP id b14mr99090332pgr.444.1578092909187; 
 Fri, 03 Jan 2020 15:08:29 -0800 (PST)
Received: from [10.103.5.8] (59-100-211-22.bri.static-ipl.aapt.com.au.
 [59.100.211.22])
 by smtp.gmail.com with ESMTPSA id e6sm68647657pfh.32.2020.01.03.15.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 15:08:28 -0800 (PST)
Subject: Re: [PATCH v3 2/4] RISC-V: configure and turn on vector extension
 from command line
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
 <20200103033347.20909-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6ca305c-0e80-f690-a299-bbf4ebdbfbca@linaro.org>
Date: Sat, 4 Jan 2020 10:08:21 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103033347.20909-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52c
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
X-List-Received-Date: Fri, 03 Jan 2020 23:08:35 -0000

On 1/3/20 2:33 PM, LIU Zhiwei wrote:
> +        if (cpu->cfg.ext_v) {
> +            target_misa |= RVV;
> +            if (!is_power_of_2(cpu->cfg.vlen)) {
> +                error_setg(errp,
> +                       "Vector extension VLEN must be power of 2");
> +                return;
> +            }
> +            if (cpu->cfg.vlen > RV_VLEN_MAX) {
> +                error_setg(errp,
> +                       "Vector extension VLEN must <= %d", RV_VLEN_MAX);
> +                return;
> +            }
> +            if (!is_power_of_2(cpu->cfg.elen)) {
> +                error_setg(errp,
> +                       "Vector extension ELEN must be power of 2");
> +                return;
> +            }

Missing maximum on elen.
Missing minimum on vlen, which, as I discussed earlier, should be 128 to avoid
asserts in tcg-op-gvec.c.


>  #define PRIV_VERSION_1_10_0 0x00011000
>  #define PRIV_VERSION_1_11_0 0x00011100
>  
> +#define VEXT_VERSION_0_07_1 0x00000071

To match the other version number formats, surely this should be 0x00000701.


r~

