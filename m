Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgwpS-0006TA-9a
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 16:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwpR-0006SD-F8
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:51:09 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:47063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwpO-0002kK-Vn
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:51:08 -0400
Received: by mail-pg1-x541.google.com with SMTP id p21so4018405pgm.13
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2020 13:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Jv2e+9OR5TwDYOCjqWEzvy2SpW3+u9+2WGfvD4KNFU=;
 b=ondBgnxeWcgKdT9dv8Ly8SZFjLGa57UvU302nMihV2hBAmDm+jr/46wk6mknxbFFTU
 43/4FGLhWwm7f/V0Qt43RkH5BEMlVySUuZ/NPfmX8p9WjFLFphMs1xMAebVuuMbeJCB7
 hNGhHAfMeYJPFD5teH1vR+1kI22q6Vpr0FmvLxuMzJZ0ZwW17PJ8hjMHpOlhLXctIKx5
 FLnjOGLysCiz/4V04mSKdPy5ulaGei7ULilrpfAbrYvCbGUN3xIqdd17HznR9w+EvnAd
 8bVtCLCJ6dAAh0zBm0te6jvGizBy51iLXvcH0babavyvm2pOr64mv0goNirZpEaerer3
 +IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Jv2e+9OR5TwDYOCjqWEzvy2SpW3+u9+2WGfvD4KNFU=;
 b=gHnTD8MyiSs6wckVkvlwyLZR7fJneaxWleG2XuhSuBW+CZJb1YiAatIyHbVx9l9Tq7
 nmQHBNYYNkFpbsZDOM/f/H47vZvrtmBZHhp6uvsj3kTlKObMmJ8Uk+oOYnl2gTsVqPDR
 TTY4N1XZWIfj6s6Q1JyeloTwjZJ+Ta3gF6//UhIei9DQfsOjIkh/z77fPNIdZXxF2Imu
 aMS3+qPOL+kn+e8IvDxAsixdzfs0mIhj1H11h8iJAXdZ32RE747JEBDlubI5AV5ScK/a
 ZaIiyQM6gZK8IrkupycQnVUW8lQSRhH6AjXRmbzv95XXTNNvCeqKq7lGEF7qfgcnViaR
 caAw==
X-Gm-Message-State: AOAM533nmuNjdIFgqP26ojA30O4LGPHYk+n9Tqgsj1RIcCjQAJzLtK/E
 GBO1F4TDbTnxTPQ1ZkNVNlTNQg==
X-Google-Smtp-Source: ABdhPJyXIeQHblxak5vXVqAsgfu4ChRutjKKbhLoOO2nr7TvS5257Ci/aup1Dc9LaHB5KEKTPDvIGA==
X-Received: by 2002:a63:9558:: with SMTP id t24mr6372829pgn.48.1591303864983; 
 Thu, 04 Jun 2020 13:51:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d22sm4603909pgh.64.2020.06.04.13.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:51:04 -0700 (PDT)
Subject: Re: [PATCH v8 40/62] target/riscv: vector floating-point compare
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-41-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae22d15e-9899-e2e7-ee91-9ea445e7a40f@linaro.org>
Date: Thu, 4 Jun 2020 13:51:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-41-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 04 Jun 2020 20:51:09 -0000

On 5/21/20 2:43 AM, LIU Zhiwei wrote:
> +static uint8_t float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)

Return bool, better than uint8_t.

> +{
> +    int compare = float16_compare_quiet(a, b, s);

New since your last revision is that compare should be type FloatRelation.

And similarly for the other 13 comparison helpers.

> +        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, (ETYPE)s1,        \
> +                           &env->fp_status));                       \

Indentation is off.  env->fp_status should align with DO_OP.

With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

