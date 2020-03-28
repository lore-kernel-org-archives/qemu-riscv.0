Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jI24N-0000iL-Lm
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 23:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI24L-0000he-AY
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:23:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI24J-0001kA-Vl
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:23:32 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI24J-0001ju-PP
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:23:31 -0400
Received: by mail-pl1-x641.google.com with SMTP id g2so4235253plo.3
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 20:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xqS5xXKI/hCKceagn++9iVyTAvEWIV2FzcPrX6crXZo=;
 b=qMGJ3Cv4+l1ohNI0g+56NAffWvN+SZo7+8Jq3i2zmntS52fH80xXHD8gLY+OEdbwLi
 P6JwYNOyY+63C1yTJ/lhG0CLXaiilvpvkjkzqMEBS22Jwf9YIw1NAWpsNqPDspw/8ewA
 4lBLgcU0+bxFQEc5ZJ0Jd2NI77fFNjMfm4mDZCRTCsaPANaA8TlJUXFZfM4XsxZiaJWY
 /EVODTuVFNPBXpePJ1/S53nJkZ/9Ti+CLUvY9OB5tO5GAulwM4+kfaoHV1GhoMH0PGck
 uCOxtdh54TJ46omrAAiEPXSYDxDrLPYsETCW6fI/ugJxYe7w9oL1yk+47fYdJdmYpcdE
 NgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xqS5xXKI/hCKceagn++9iVyTAvEWIV2FzcPrX6crXZo=;
 b=m9tfopEAQGGMYD2E+ji/F9xM1NBLi790VVHp8Tg+hzZejYWYbGljTppj584JshMLqg
 YqWf3uR8kmOQvBlHI0ZTiUcUwgoFqSSgKLsJsZXsOL2cV6iO6Nahun06CyH1BX9Ja9LL
 XXtHKWBHSPctkKzhETq4a92K0irDgIt5fXQx0SRnKoef/5Ot9e3aYnSLoaiU0fpDlF6u
 WMoydQMGIKGpnutaQ0rBqZpoz70KMqDig2Hd1KN92CRNqw3v6+UZ5nIXPqsTDG/rIRiI
 WcWo2YOoqUTZbhrnOKimbPtUXWEVAIN5Gl53RkrywOVqhUCqTWv7Ia2BApWlUwDLRovu
 lF/g==
X-Gm-Message-State: ANhLgQ2wZBZKgy5KEA6ftwVYtR0+lsytUhra5hSIhZbq9+shTyB7wfr1
 MNF8BNCHK7Xeq86W8A/gfBCWOY4cu3U=
X-Google-Smtp-Source: ADFU+vsdIuiwW0hYzxehjnj8SEonUninEKuYDCkFn2VAMLAxJ/OcegFgWionZAu38qk44yrN2X0R4g==
X-Received: by 2002:a17:90a:5205:: with SMTP id v5mr2840210pjh.0.1585365810319; 
 Fri, 27 Mar 2020 20:23:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id d26sm5174511pfo.37.2020.03.27.20.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 20:23:29 -0700 (PDT)
Subject: Re: [PATCH v6 41/61] target/riscv: vector floating-point merge
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-42-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0d4678b-1a24-3e90-768a-efd0f0311b68@linaro.org>
Date: Fri, 27 Mar 2020 20:23:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-42-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Sat, 28 Mar 2020 03:23:34 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> +    for (i = 0; i < vl; i++) {                            \
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
> +            ETYPE s2 = *((ETYPE *)vs2 + H(i));            \
> +            *((ETYPE *)vd + H1(i)) = s2;                  \

H1 should be H.

> +        } else {                                          \
> +            *((ETYPE *)vd + H(i)) = (ETYPE)s1;            \
> +        }                                                 \

You can also hoist the s2 dereference out of the IF, and let the assignment be
unconditional.

  *((ETYPE *)vd + H(i))
    = (!vm && !vext_elem_mask(v0, mlen, i) ? s2 : s1);


r~

