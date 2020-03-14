Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2EC-00049h-Ch
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2E9-00048C-5D
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2E7-0005xT-Oo
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:33:00 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34649)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2E6-0005tN-Qn
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:32:59 -0400
Received: by mail-pj1-x1044.google.com with SMTP id 39so4474582pjo.1
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XXGzoihV+1MeGuQQIpZ/qLBWgdHTY02ZYokYFw47enc=;
 b=oEiHln3VMgzRt3HStHBVGoqEA6QrBXJp3uj9ZHCKGaQvl+11u2CB/x+dlcj2jRWyjh
 2tAsLvVb5CpST/LKIsBmkKlns2mPppP5+vJ+tGUBEt3NJBP+EBw3K2O3K9dv5W4+Xrc1
 4J/nyHF6h3wIzLS7b8P8Bd3Bat+a42v4uX36UkAmM3b9Z4lbUjzXLH+8QrOhEvMY/E/F
 p+T55SyEqyXudEwsNdnyGLRJo6kopRhU58xR/Nxy91E033aQJ9ITa2CmDMsRWANsGt9a
 vwZIibZ9f/PlDMkGEEVfcZ/HwHEh23FYMGv4wFZmENGKkgI3V3r7lfWCOL5ym0e9hWw4
 9URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XXGzoihV+1MeGuQQIpZ/qLBWgdHTY02ZYokYFw47enc=;
 b=Tkpmfsy13TUr89OhAVo83IJoJ9CMFAhIqZZ5H7iLbqQ+SpSftyjxe8xAOlupc1QORD
 W6A1eLYetKt4MuoCJ616UUFBVsuN3iZVv9VBjsVxv0G2slMyLTobpACpLett2fgZzopp
 fifCKo5DW0cq0aiZG6sVE2+0ilpSko/2mWpwwwtVG3lD6hnPoizaRI68KEdO0BxmlYGc
 Z64aH9TaIa6IExB/RodOYwWjh/WE1ucnrexnMP7mvNI3Is8WWZfwjFj1Yovi2fJfhOVZ
 u8HYJzCOPf9GbkCmSUzhvTkfHa+ID80fC/PfDRPOjuq0obDapMcE7lXpT+oY6PH279xL
 MbRg==
X-Gm-Message-State: ANhLgQ1TM4S4XIwi802Sey+yEp5W9yduMScPnU1yO6PSj7HTK0btQgIC
 LhKW09aYY9GnKvPqx8p2w0lZSAznnZs=
X-Google-Smtp-Source: ADFU+vvagwkiRTkHqLT5HhaS+G/MGRQjQGdW/7V2gCJRWHE41KQ3oOUok7GwjCWZM84Dz2DwC05RVw==
X-Received: by 2002:a17:902:9a4c:: with SMTP id
 x12mr16224078plv.297.1584174777026; 
 Sat, 14 Mar 2020 01:32:57 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s12sm31237431pgi.38.2020.03.14.01.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:32:56 -0700 (PDT)
Subject: Re: [PATCH v5 26/60] target/riscv: vector widening saturating scaled
 multiply-add
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-27-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4a7814d-b6eb-4e9f-1eeb-7dae2da57cd6@linaro.org>
Date: Sat, 14 Mar 2020 01:32:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-27-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Sat, 14 Mar 2020 08:33:02 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static uint16_t vwsmaccu8(CPURISCVState *env, uint8_t a, uint8_t b,
> +    uint16_t c)
> +{
> +    uint8_t round;
> +    uint16_t res = (uint16_t)a * (uint16_t)b;
> +
> +    round = get_round(env, res, 4);
> +    res   = (res >> 4) + round;
> +    return saddu16(env, c, res);
> +}
> +static uint32_t vwsmaccu16(CPURISCVState *env, uint16_t a, uint16_t b,

With the same caveat for vxrm as before, and the spacing.

r~

