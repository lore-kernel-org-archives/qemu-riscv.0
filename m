Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jI0nR-00063Q-PV
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 22:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0nN-00060W-TZ
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 22:01:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0nM-0006e4-UH
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 22:01:57 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36539)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI0nL-0006bz-Qc
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 22:01:55 -0400
Received: by mail-pf1-x441.google.com with SMTP id i13so5427230pfe.3
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 19:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XhkrqERYM66hQXMFb4eWY0qYYAZ1ohsS01hNjUa42vA=;
 b=BtspaEU9oSw2HDKXofrU3YI4rNqAXLrRv2nKI8MYCWsun0cTg48yrpfbiAh30JHOur
 xLLAZ6hPikaDUktSzGOlOo3EeqaY+eQTEI69scq7tlYX10iB2RejjA1y9vIkKvWlvaCY
 4zxCpU1zU6KzLgqrYz30MsO2H71yibeIBuHIRjMHM9q0p+BmrCjxdQAmVKSqChGHLtMj
 fjLcxXT/kCROizUwuqyFPNADYo4qbg1C9T7nteYUHFOYS6FfYZ58XSFTF9+kpvcbGbyx
 8sNhhxBdxjOqFLAdae0VEioPsIiSNCkaDZMhpp295TuI2nMxHrbdU7oUL4Qxq8I1CpZV
 en9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XhkrqERYM66hQXMFb4eWY0qYYAZ1ohsS01hNjUa42vA=;
 b=pByb3FyxxTS2Zs7xRQRvGZeiC8PB49d8D8ohIMBLIdHvUgjd2NYJNem7jQRuQNubaP
 iD35k0U8X+l1DCnNGZgj1Sp6AWL5pCnR8fRQWNnVcwuFVvi0eR07s2cn45GVKz10nAOJ
 JwB9XtQ9BLS60rmoeyBqNDy+1qOLdtiE+7wHdDMMAPfTR6ibkgESBwwlvlHKuz/Wv8Vs
 TO8YdHPD6l+D7WQ+R/PD8e5MYf/le2H7Z16Or8dIWZAFGiAYNNJMw4CZBPk0/J+nruE+
 4WO0xi7Hx2tNmLOD/2Xe/bNmoS+p/B5GFsnX3BhZslqYDBmQjAxz3mHBKUFq1+pyU9Od
 Gd6g==
X-Gm-Message-State: ANhLgQ0ONO9YqP8L8/N0KR57AyvJSzVqpyJFGnYH38ZndGw3fIjyDN/y
 QI2ek0JP8WwEfPHVRbhTr1vRntuFgCI=
X-Google-Smtp-Source: ADFU+vuv3Gnl8kYQ67/6cGkpBrDoW9k1snyqCx04MtyJYv/nEkjwk658bQqOPIlO8BLoNFZ1mG/mWg==
X-Received: by 2002:a63:6f0c:: with SMTP id k12mr2292861pgc.142.1585360912858; 
 Fri, 27 Mar 2020 19:01:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id q12sm5140131pfs.48.2020.03.27.19.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 19:01:51 -0700 (PDT)
Subject: Re: [PATCH v6 39/61] target/riscv: vector floating-point compare
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-40-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d8cc289-db4e-875d-fd60-71d5471b0d38@linaro.org>
Date: Fri, 27 Mar 2020 19:01:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-40-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 28 Mar 2020 02:01:59 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> +static uint8_t vmfne16(uint16_t a, uint16_t b, float_status *s)
> +{
> +    int compare = float16_compare_quiet(a, b, s);
> +    return compare != float_relation_equal &&
> +           compare != float_relation_unordered;
> +}
> +
> +static uint8_t vmfne32(uint32_t a, uint32_t b, float_status *s)
> +{
> +    int compare = float32_compare_quiet(a, b, s);
> +    return compare != float_relation_equal &&
> +           compare != float_relation_unordered;
> +}
> +
> +static uint8_t vmfne64(uint64_t a, uint64_t b, float_status *s)
> +{
> +    int compare = float64_compare_quiet(a, b, s);
> +    return compare != float_relation_equal &&
> +           compare != float_relation_unordered;
> +}

This is incorrect -- the result should be true for unordered.  The text for
0.7.1 does not specify, but this is the normal interpretation of NE.  The text
for 0.8 explicitly says that the result is 1 for NaN.


r~

