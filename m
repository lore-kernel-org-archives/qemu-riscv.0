Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1Ypl-0000Jd-1i
	for mharc-qemu-riscv@gnu.org; Tue, 11 Feb 2020 11:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Yph-0000EJ-OK
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 11:56:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Ypf-0001Bi-Q8
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 11:56:21 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1Ypd-00019j-R9
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 11:56:17 -0500
Received: by mail-pl1-x642.google.com with SMTP id y1so4489513plp.7
 for <qemu-riscv@nongnu.org>; Tue, 11 Feb 2020 08:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T7byQEFxk6g6vGuiKIqMAt4ogqiEkEp0yqp3zDMrrYo=;
 b=CgCHkCceCAORMdXzvKHGH6UatUgg716Wwv+sjfEwVxQVpYZVTTXtgrvTtFGlQxy+lz
 wtJbVv2evhjoxtZ0p8adpuIVKJUGBM+oW+Fs5eU1py/XUbfJxzEYpdR1c4oIBK7hx60g
 uZG2z1SbWkXtmtCRBOTjnLG7e9PSjIKCpGb9wORk0ybEihYyrnZ3X9FMomZrd6PCbHVu
 a+W9DvRB7v+uEf/cHgPy79G6kEvt0Uy2RL7gICRYhXVxsWpRcWNbtklLg15wIb8kkPGa
 703WaKh2oNVv4wtCvmx7NNBSwDBEowGYq6fhabWWCqv6IAgX6VcvKRpWp161eImvp13m
 RavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7byQEFxk6g6vGuiKIqMAt4ogqiEkEp0yqp3zDMrrYo=;
 b=fJ+OfI0gGaBHjGIfhMk9paShlqUW2GjwNe+v7Jau9ylB6hJ8Eftv/stDDAHGdUSIzZ
 QqH1HKbLmCpEvf8Puqa76wtY73V+qxaKb0m/4x3JETiPhiumzmctGNwrbMK5ptrMHYhj
 FR+h3Nr+7fjlsyLHKFoQdbg/3smhthMlkIAECLerlk5Zt0uM5psuSOUomWN+1fXnoWbB
 FMgO58wtyYb8pickm70BQNXGJ8Iz5Ugc6idL/GYRIUEqZmSfi1yhPNkBbCIhGsFJgCAR
 +sLUmPXi6ML6UR6XJc9dsNsxcjNDanySWo7/vrRQkEvGXy7FFQkI5Na2tY2Ne3OcMVuR
 WBAg==
X-Gm-Message-State: APjAAAXRlpbA1pfhsRTzr2G4B5p5wo5wbrP46HFiwAcaaaPiyTjYF2qP
 1rCXFGGSBb5DjbQRg2Z1ZEtO/P2Sg1I=
X-Google-Smtp-Source: APXvYqx5IWgRfl9XXcSGr8mZ0b3r5+O8ApEzBuS+sLXOPpcKeBuy2voiMKGetpwmRF6BNxIE7u1HbA==
X-Received: by 2002:a17:902:7244:: with SMTP id
 c4mr3962158pll.49.1581440176422; 
 Tue, 11 Feb 2020 08:56:16 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 gc1sm3868883pjb.20.2020.02.11.08.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 08:56:15 -0800 (PST)
Subject: Re: [PATCH v4 4/4] target/riscv: add vector configure instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
 <20200210081240.11481-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <053777e2-7180-5584-cf7f-7876800d9dc8@linaro.org>
Date: Tue, 11 Feb 2020 08:56:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210081240.11481-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Tue, 11 Feb 2020 16:56:22 -0000

On 2/10/20 8:12 AM, LIU Zhiwei wrote:
>  static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, uint32_t *flags)
> +                                        target_ulong *cs_base, uint32_t *pflags)
>  {
> +    uint32_t flags = 0;
> +    uint32_t vlmax;
> +    uint8_t vl_eq_vlmax;

bool.

> +
>      *pc = env->pc;
>      *cs_base = 0;
> +
> +    if (env->misa & RVV) {
> +        vlmax = vext_get_vlmax(env_archcpu(env), env->vext.vtype);
> +        vl_eq_vlmax = (env->vext.vstart == 0) && (vlmax == env->vext.vl);

You might as well move the variable declarations inside this block.

> +target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
> +     target_ulong s2)

Indentation.

> +{
> +    int vlmax, vl;
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint16_t sew = 1 << FIELD_EX64(s2, VTYPE, SEW);
> +
> +    if (sew > cpu->cfg.elen) { /* only set vill bit. */
> +        env->vext.vtype = FIELD_DP64(0, VTYPE, VILL, 1);
> +        env->vext.vl = 0;
> +        env->vext.vstart = 0;
> +        return 0;
> +    }

You're missing checks against EDIV, VILL and the RESERVED field == 0.

> +
> +    vlmax = vext_get_vlmax(cpu, s2);
> +    if (s1 <= vlmax) {
> +        vl = s1;
> +    } else {
> +        vl = vlmax;
> +    }
> +    env->vext.vl = vl;
> +    env->vext.vtype = s2;
> +    env->vext.vstart = 0;
> +    return vl;
> +}
> 


r~

