Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHzyC-0002bT-O8
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 21:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHzyA-0002YT-Cq
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 21:09:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHzy9-0006fo-0q
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 21:09:01 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40891)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHzy8-0006et-R8
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 21:09:00 -0400
Received: by mail-pf1-x441.google.com with SMTP id c20so2827899pfi.7
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 18:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MlrU39JFmvSLKpFknjZBRcdhWX+jJ8k81TrxhR433Vo=;
 b=jJufVgUZ4m+1ERwU2sZAiayF2IHkiQ0pKuDfRfzDBZg0UanAIps5+CLIRWG5bSHbY8
 vuw+3oKueHqPTH3wux3l53Fb9/1+iGz9V8I8GDHE4qu7gybAL8JzC2Jt4jWpWNHvZ3Uj
 gXoY6KQIR3ez0OReEr7yF2KX2RTfOPDKrLmlGXzM7YA5RUaZwc5UKCLq+IhUtW71jtVF
 uv86TUAvjnToG02K5opLAjHox53ORXwTrRHmP7UJ5rBqi29OV/tt92Li2w057vlhfgk5
 sq+5s1b4wnmIbJxMOqQU7P85TnZlBuaPPNSuCQfn9eWzTNCiGJTqGk+YOi1CkTA3lCt6
 0K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MlrU39JFmvSLKpFknjZBRcdhWX+jJ8k81TrxhR433Vo=;
 b=aXyiVYmT1+AA6xboebrzFXb+qCG5WJy8SkM1+3LeVIlTLl+pvnoi0A311PpypuFb+I
 A69U5vWcS1lyAAvFCnJmdiF1snvD6rA1ifSc3Ue3H0LlmtT80hRaQJGz/iC7ehml4ZV4
 VlK+c6tGwEUHWEJpjwCoYk8hT6R0w3Igvw8BY7I+QiU4d8ej+x0C3C463kvbETPJr4ZZ
 Mll47hVBiPPIoCllrV53tdTl59XoeiSCBC9qr+JaOPGPzs0blcUCkOsQdlbA37x7Wa6j
 UtuE98guc3oyCzDrbZIzpFGUHaL1V0jERVXgyvWPgwIxH/wCp1H+g2wK8KFRGFqtr4NQ
 9heg==
X-Gm-Message-State: ANhLgQ3AJU4sR5NQENt9G1q7Ptd2coLWV4FmleiDjU7DDVw88/uyG9o8
 2Az3wTMLuLd6/tdx55FN7wEJSJO5WRQ=
X-Google-Smtp-Source: ADFU+vuyuWpwSRlfbpe1Fvd4/bQwRfuroaLnZgiTgUoSuorAgk/1YDX6SPySe8ZQnYewX4DHAjDq+w==
X-Received: by 2002:a65:494f:: with SMTP id q15mr2045593pgs.383.1585357739038; 
 Fri, 27 Mar 2020 18:08:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id p22sm4766006pgn.73.2020.03.27.18.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 18:08:58 -0700 (PDT)
Subject: Re: [PATCH v6 26/61] target/riscv: vector single-width fractional
 multiply with rounding and saturation
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-27-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f5fd1a3-f32f-9779-6d5c-abdedc10fd2d@linaro.org>
Date: Fri, 27 Mar 2020 18:08:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-27-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Sat, 28 Mar 2020 01:09:03 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> +static int64_t vsmul64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
> +{
> +    uint8_t round;
> +    uint64_t hi_64, lo_64, Hi62;
> +    uint8_t hi62, hi63, lo63;
> +
> +    muls64(&lo_64, &hi_64, a, b);
> +    hi62 = extract64(hi_64, 62, 1);
> +    lo63 = extract64(lo_64, 63, 1);
> +    hi63 = extract64(hi_64, 63, 1);
> +    Hi62 = extract64(hi_64, 0, 62);

This seems like way more work than necessary.

> +    if (hi62 != hi63) {
> +        env->vxsat = 0x1;
> +        return INT64_MAX;
> +    }

This can only happen for a == b == INT64_MIN.
Perhaps just test exactly that and move it above the multiply?

> +    round = get_round(vxrm, lo_64, 63);
> +    if (round && (Hi62 == 0x3fffffff) && lo63) {
> +        env->vxsat = 0x1;
> +        return hi62 ? INT64_MIN : INT64_MAX;
> +    } else {
> +        if (lo63 && round) {
> +            return (hi_64 + 1) << 1;
> +        } else {
> +            return (hi_64 << 1) | lo63 | round;
> +        }
> +    }

  /* Cannot overflow, as there are always
     2 sign bits after multiply. */
  ret = (hi_64 << 1) | (lo_64 >> 63);
  if (round) {
      if (ret == INT64_MAX) {
          env->vxsat = 1;
      } else {
          ret += 1;
      }
  }
  return ret;


r~

