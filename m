Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDFoO-0002fN-BM
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 19:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFoM-0002f7-6e
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFoL-0006iF-1f
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:03:18 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42089)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDFoK-0006ge-Sz
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:03:16 -0400
Received: by mail-pg1-x542.google.com with SMTP id h8so7251475pgs.9
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 16:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EYcotxQ3d9BZDFs6JiK6yD8PfS1/vt8pL2o8EJkQVuw=;
 b=FB8mhBSG4GPTQSXdAxGqC+FCidOu0I9sZ72T6AAjz4M7Dv/dWey3k30F86pQ3taU27
 affNg0KhzaDK4IJ6QQUXUfhKGFHl+KMmzWzZTadDEK3NkbIvHTcClXO/O2h27pnqp3/b
 9H/gcizLMYyXabf2WUz21QY5sZNgjVxNo+lrpyESxPFSz5wDeUMCUDY0eWBbNDoCQkwR
 A4lP1/QnL7SbXYvNx9VvQxxrh+ACv8M+mq3bzMynpIQirFusbvb6IYkQAPW0MyEXag/C
 2Oki0WDbbv8n39z0QeKLe+6PSL4+1RxGn8y4MCCD2XlDIY6zePcJwsmMk+MbLKMfgfpt
 zKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EYcotxQ3d9BZDFs6JiK6yD8PfS1/vt8pL2o8EJkQVuw=;
 b=BAhmmVzMNwTf1V9cZ5zM6xfqEOZA+qw/MYZFUn9VJbtmFaxnPPhPqROS11QwkCBZFI
 1BHlArb7tlNhJPt00Lbm7h/geeZzIwmhGyQKy7m+s7NdOwztxFPCuBsaoISFzSC13BwU
 McOl4RdLA6twtg2AAT+uf7FDie6yaxMOfARRc1P/ISc/wZvK+oG8JCVufohlFuNfIZi7
 N8FboLxjoZr5jz3V7jYiKXYxHz9cZF6gWeQg0yy3Cv+JEuOGbXeq0ciwub+pShIGtN6P
 69btc651YtdBWej2g+WsJJFb+yK7SRBltU45XfNFBegGELC2QgEJsQ4JmsaLL9wJa79K
 m7tg==
X-Gm-Message-State: ANhLgQ3fZzCheh6RZKiZKfoxpfmBKK0ZlN5GN0lLzGXEY64Rh6snmm9B
 srvDtCHpJAq3rxueU9hPP2NhQljvZyQ=
X-Google-Smtp-Source: ADFU+vs9gownYDcscT1+s8dlmQjkUHNAXO+E52gGnHu1HnQ14OFY+oxdYljT733JkqMtWP2EIBb7iA==
X-Received: by 2002:a63:798a:: with SMTP id
 u132mr20793820pgc.203.1584226995549; 
 Sat, 14 Mar 2020 16:03:15 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b24sm25081064pfi.52.2020.03.14.16.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 16:03:14 -0700 (PDT)
Subject: Re: [PATCH v5 42/60] target/riscv: widening floating-point/integer
 type-convert instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-43-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04c08bf0-5f1d-58de-0c2c-4f72da9af963@linaro.org>
Date: Sat, 14 Mar 2020 16:03:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-43-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Sat, 14 Mar 2020 23:03:19 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/*
> + * vfwcvt.f.f.v vd, vs2, vm #
> + * Convert single-width float to double-width float.
> + */
> +static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
> +{
> +    return float16_to_float32(a, true, s);
> +}
> +static uint64_t vfwcvtffv32(uint32_t a, float_status *s)
> +{
> +    return float32_to_float64(a, s);
> +}

Do you actually need this second one, as opposed to using float32_to_float64
directly?

> +RVVCALL(OPFVV1, vfwcvt_f_f_v_h, WOP_UU_H, H4, H2, vfwcvtffv16)
> +RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, vfwcvtffv32)
> +GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 2, 4, clearl)
> +GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8, clearq)
> 

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

