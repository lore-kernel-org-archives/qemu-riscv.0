Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHz04-0001Yk-KQ
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 20:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHz02-0001YV-0z
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:06:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHz01-0004WI-0a
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:06:53 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHz00-0004VQ-PV
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:06:52 -0400
Received: by mail-pf1-x444.google.com with SMTP id c20so2744786pfi.7
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 17:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nyxUatUmri+viMWm0r2f0sQPHURgC/4b9MqoNbg8y0s=;
 b=aHDj5P/3jNH/z06nDrj7W5nM8MEF8+x4VHsSN+yqirKHuawfr67Uc3yTB6D8MDnvdv
 sAYhQWrMGF8bAq7uTULdwdMOG4Ags7JNg5CtTRXTx9HoY2bJ2JroL/JcM1sBtjbxCIQu
 7pYATaSXUPopSLq8hZFHo8ZPDYZ0LEEtQ+++UTCLS3LxZM/smhlVq+PCsahlRqYqL1DS
 ipd1Gghwdv21oK+s/lAa0WWe2PFgvEyN9NI38XgeOsd/mw4icoFpI95AKlAm7O2+gAPO
 bSdBInHKpMZo9h8kTtJiMBJqY8MAssEWHMkrGNs79m2LEPKq743XEKggs/DTe++RORND
 T0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nyxUatUmri+viMWm0r2f0sQPHURgC/4b9MqoNbg8y0s=;
 b=gZKwUJCb4W8TZ6HD5UP2/2AGRqU8a3hBVToGjCUX7+Q1G+ZnjVvoVIz2cTTscRHWAe
 BSU5k3YZyEu6/nbH7Gn6QXLD7teI0u4rDzY2YQzCese3/DyjL4pRB/Bli59v+ClohmFb
 WQQHuafPstfT7vycpdtmmc4oiAV1nXUJKQ6qooEHD1J0yPjdA9i9hDnprDXUyLi0X/J1
 ZWRk3bnqlSBQXY3vK32xF0+gakpJnpRYgX9KNdDwgk586vTHTmHiQtSU0BSkdj5y2Yf8
 MJBcZTdHjx6e+KmIJcqloNtnuIURCQnm/z2Y2+s7Z1G3D0vJWfdcvuRkermGRLA9Yz2t
 /EwQ==
X-Gm-Message-State: ANhLgQ1ShXO+ZI61/Q/fMObMBNBXeMffeqGlVXztwWY3dB+3bZlDmyPi
 qt3ffP0XaXq+F20png3N81o6fh95EhQ=
X-Google-Smtp-Source: ADFU+vuhDh3MmhzFUhejTCYPiCxmLH/MDJG0IX1PD+8nAOkfCX2qVpWSMwvPYd01U7oaatNOUR0gIg==
X-Received: by 2002:a63:2b8d:: with SMTP id r135mr1820426pgr.329.1585354011295; 
 Fri, 27 Mar 2020 17:06:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id e26sm4991373pfj.61.2020.03.27.17.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 17:06:50 -0700 (PDT)
Subject: Re: [PATCH v6 18/61] target/riscv: vector single-width integer
 multiply instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-19-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a5900d9-dc26-04f2-74b2-0bada246a0e7@linaro.org>
Date: Fri, 27 Mar 2020 17:06:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-19-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Sat, 28 Mar 2020 00:06:55 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> +static int64_t do_mulhsu_d(int64_t s2, uint64_t s1)
> +{
> +    uint64_t hi_64, lo_64, abs_s2 = s2;
> +
> +    if (s2 < 0) {
> +        abs_s2 = -s2;
> +    }
> +    mulu64(&lo_64, &hi_64, abs_s2, s1);
> +    if (s2 < 0) {
> +        lo_64 = ~lo_64;
> +        hi_64 = ~hi_64;
> +        if (lo_64 == UINT64_MAX) {
> +            lo_64 = 0;
> +            hi_64 += 1;
> +        } else {
> +            lo_64 += 1;
> +        }
> +    }
> +
> +    return hi_64;
> +}

Missed the improvement here.  See tcg_gen_mulsu2_i64.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


