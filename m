Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCvwa-0008I5-6B
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 21:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvwX-0008EQ-S5
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvwS-0005mi-RJ
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:50:25 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:51415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCvwS-0005iD-Lu
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:50:20 -0400
Received: by mail-pj1-x1042.google.com with SMTP id hg10so1134025pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 18:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UCiInjJDQYoCkQCTjf1DHVbDt9m5uWJ7EptQOdDN1F0=;
 b=hxNUKTZ6Bce6YZsEc4cH4jFU4qFu0yJushF+GyBFwX3m2L2sNu5MhJnI5NW0lHGaNN
 cW7kVbz3LudDKsSqdO9dshnV1Z1JRjH0E+Osx/U1IZLWtjOiSBKjp3bBOgyONtbUNrBo
 e79Y7q8PEHmhpni+QyP/PaBmqm5TrDUaixCjKRhkaNuMpAgzEsJedzuGGciL5VzjLmGE
 ZF72U9pIiF1yUhxmD2OAuJVPrYAzR/zzG6cE/rcrBQnoI3y45dzuDDh2nQ+8kUCVFcrh
 jVjwFuNoc52cq+iHA/vDtmHc/Ie8UUHT+lmXVcFFE+VaLMaI53mEhyZiL6Iv4uJ/f6x9
 dXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UCiInjJDQYoCkQCTjf1DHVbDt9m5uWJ7EptQOdDN1F0=;
 b=fyXECRnstrXw8LLxrD32qnC0TwInoiqItFLc9zgJjmDzpIW3Typze511aRK5QgWCf9
 CYIo5EvBu0L9R4zYWGDKd7jL51e/ILEATra/inDLkgQoVVLHUnB3dFmMRdsaYweW+DPr
 nrDE0Jf7Y/0YDLdlZfZvgoxGSRsBHW2ZwL4lJiFmRd3YPObYAkWylnnbE0EA1dZhY4dr
 JWT9KiiaWGq5rTB7BrKag3NimH43Vb+Hl3MHh6Jt0St7bRwBAn1ymKDxNC4iBURD7eDP
 MXyessJf/j2Aq+FrF/YdpTvfPpAHsfdi9oyhmO2CD2CzALriNYcvI3+PCtClWhyMbt3v
 czFA==
X-Gm-Message-State: ANhLgQ3uFwKewui3nB1PzzFpjIfmaBJobWt3/KuhnYHuZKZxL1JFR6oD
 pJIvZ6lWb3ZsX/1KOFIBGtJNpHQ+OLc=
X-Google-Smtp-Source: ADFU+vtdB+XXlUBzFIDP2WOUZrQMhfLPBo4W1KRwBKK6uEb7iXZOIFgrMi9iN/BkpToEBWho5viP/A==
X-Received: by 2002:a17:902:728d:: with SMTP id
 d13mr15918961pll.92.1584150619409; 
 Fri, 13 Mar 2020 18:50:19 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e187sm2141568pfe.143.2020.03.13.18.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 18:50:18 -0700 (PDT)
Subject: Re: [PATCH v5 07/60] target/riscv: add fault-only-first unit stride
 load
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-8-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d6ca94b-2097-678c-a890-8b413b6d69d0@linaro.org>
Date: Fri, 13 Mar 2020 18:50:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-8-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Sat, 14 Mar 2020 01:50:27 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> The unit-stride fault-only-fault load instructions are used to
> vectorize loops with data-dependent exit conditions(while loops).
> These instructions execute as a regular load except that they
> will only take a trap on element 0.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  22 +++++
>  target/riscv/insn32.decode              |   7 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  69 +++++++++++++++
>  target/riscv/vector_helper.c            | 111 ++++++++++++++++++++++++
>  4 files changed, 209 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


