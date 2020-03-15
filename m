Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDcfW-0005aN-Ek
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 19:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDcfS-0005ZU-77
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 19:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDcfR-0002EG-35
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 19:27:37 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33140)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDcfQ-0002CC-RQ
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 19:27:37 -0400
Received: by mail-pg1-x543.google.com with SMTP id m5so8640351pgg.0
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 16:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7kzRqUlLpkGjDOydIsoDKwsazMahQVbzT0T2HoBLlxQ=;
 b=IxNeug0L1ffIqU2BO8WEllFNhMJbqy54y+4HisD1mrqZu7ZvnG7H97sfceyU1W2F5U
 UsNSfc2aUJYuXLel+Ph8PjasFV8F1y1HrwepQKGK2wIhaAgiLJ10r4QdxNNpllFnq5d6
 I/u+YGy+XhD0Ukr39LYwhuWFez8OnKvrosW8kkZ8iXHwXch5XDMVbBjZ88opAZhJoOpN
 Rl/W9f/u9/k0A3Q6JHgmNe+0S5wSRLKF3SdW9pi4FaUZhrHYogAQPIqO/NFxj1EClQ26
 0Z7X5siiM+CZdcODlC+NDOYc23Aqz8rkHD0PM43QzYkscRCVg2zi+ykQlvFOg+ArPN/y
 rnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7kzRqUlLpkGjDOydIsoDKwsazMahQVbzT0T2HoBLlxQ=;
 b=sP6+cR77NR01BIJMj8p3mhTeMLAh9uGH0+v9ArXAWQx91cO9sYmbivWxLWbTuanqsH
 oLsoqdPMGntBBo+RTjhWeqAl23z9dKVdl1wlxuv7qyNl3qL1ZawhyBQDydtBb/Rj02UJ
 y6d6wBLjomo0kP7by59a+chWHmcLihrMOB3uDKsvG58mM3fIwA7Bat8DEUHsalqP2xhk
 UQVyPlXOvSVXUSTpJPa5Ic3asj6eo9apoMF685iWV9gyrNhO+zfIqk53zUFOQhcihqA+
 1XJ1TYdZkuM3JSHoeOfBF1Fj/tQPtnIiMLY7wNI6VwoT1WHUB0JDNWeVi55ScT76sxu3
 eSvw==
X-Gm-Message-State: ANhLgQ0YQKn7+Eb+DWnlTuLSkdvcaCNqCuqExBm45hs5rLDsCWvX/RWz
 aLvSCPMXewBxmClhhQhxJZ6eqBbRoC4=
X-Google-Smtp-Source: ADFU+vuExsYpZ3cHVZw6YERRgXKeYQAvx9SsZxCJrBulDM9ZhXR+zJhpimV6dFUbkprPjUGzfsDsIg==
X-Received: by 2002:aa7:9790:: with SMTP id o16mr23754567pfp.322.1584314855272; 
 Sun, 15 Mar 2020 16:27:35 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c11sm14574147pfc.216.2020.03.15.16.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 16:27:34 -0700 (PDT)
Subject: Re: [PATCH v5 24/60] target/riscv: vector single-width averaging add
 and subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-25-zhiwei_liu@c-sky.com>
 <834922de-5107-0d00-6d4d-47bd830129a5@linaro.org>
 <2db448ea-f17f-e627-055d-fb3cdf6cfddc@linaro.org>
 <d48f77ee-ad99-26fa-a597-6cdcd2d55508@c-sky.com>
 <426e31f8-1b54-7b5a-b2a9-a2742f9c74af@linaro.org>
 <e40db19f-0bf6-9ccd-3f41-855f67cf88f2@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af9227f2-eba9-eb27-d409-c95556b046e7@linaro.org>
Date: Sun, 15 Mar 2020 16:27:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e40db19f-0bf6-9ccd-3f41-855f67cf88f2@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Sun, 15 Mar 2020 23:27:40 -0000

On 3/15/20 4:23 PM, LIU Zhiwei wrote:
> Many other fixed point instructions also need vxsat besides vxsrm.

Ah yes.

> In that cases, can I just define OPIVV2_RM like this:
> 
> #define OPIVV2_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)     \
> static inline void                                                  \
> do_##NAME(void *vd, void *vs1, void *vs2, int i,                    \
>           CPURISCVState *env, int vxrm)                             \
> {                                                                   \
>     TX1 s1 = *((T1 *)vs1 + HS1(i));                                 \
>     TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
>     *((TD *)vd + HD(i)) = OP(env, vxrm, s2, s1);                    \
> }
> 
> static inline int32_t aadd32(|__attribute__((unused)) |CPURISCVState *env, 
> 			     int vxrm, int32_t a, int32_t b)

You can drop the unused.  We don't turn on warnings for unused arguments, as we
have a *lot* of them for exactly this reason -- keeping a common functional
interface.


> {
>     int64_t res = (int64_t)a + b;
>     uint8_t round = get_round(vxrm, res, 1);
> 
>     return (res >> 1) + round;
> }
> 
> 
> In this way， I can write just one OPIVV2_RM instead of (OPIVV2_RM,
> OPIVV2_RM_ENV, OPIVV2_ENV).

Yes, that's fine.


r~

