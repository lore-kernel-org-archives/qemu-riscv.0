Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2Ft-0005ez-RA
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2Fp-0005el-1u
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2Fo-0006c4-70
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:34:44 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52157)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2Fo-0006ZK-26
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:34:44 -0400
Received: by mail-pj1-x1044.google.com with SMTP id hg10so1425210pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FkWKQ9CpMl5K5wDP2JsVelM6iwtzu/v8rvKosfZ1mHQ=;
 b=UCsox29KS74WfiuuC5H/V8fY3cajcjNHfR4h4kIq5rDEeQSefX8WrDvONXR75lRCb9
 42KtLP19++ZeY/L6hbj+r/wywLXU+QpSygXU687NU+CFUUV74bo/eo2MEvR9Cace6NWJ
 GwQ6HfN0c/mvst1cLJWLCkdYhbfBTrJQG7W7RcTRkkb3jH/0I07Gt0v16SZhwuG63CmJ
 ECleZshiAm3uC5KseFlCRI3AZwk4R7kZtmUsJQuDaynsx14k1v2kspRuUCsU+jNM9+ko
 8LsFPcKwFMTvqktAJIEHEnTEMQki81QRS/OV9ddxqOHWiQx3iuyx/40i/4bLnMUC9Q2W
 FOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FkWKQ9CpMl5K5wDP2JsVelM6iwtzu/v8rvKosfZ1mHQ=;
 b=rp4asmAG/wIzWQmJEtRuKjerBHI2MJRceaz8Abig4SApOSCHS+bJgnfz01aCP9D9Cf
 EZGgU77FC5vcIK2Z7wd/HdEzgsjpT7vwyifgQysNex6LJoMsah76hGQdavtGDPhf0Fy2
 BlbBqSvu9YWXhK20r8fTp1tq3RxBjDHWbOddbeWZV+PJ0QqBCQ3p5gT/c/DJxRoO5cAe
 dhDw8UBlzZrspMp9c6TszTL907bBcGrv1aN+Xgwn4uPvHTVRHlvb3EvpyE9pEyvMP2BM
 iiB0CQoC9fONqjHPt7gJGFtVXr9qncbiHTp5nIQbw/Hfn44CZJPov39oU3G+ShKs2uMY
 pX0w==
X-Gm-Message-State: ANhLgQ1sbp7scaWek4llwF+/o9Bj/b61aJBRh9wRUug844vfdUHxWVYG
 J01DzWzrnTi7c3WDMfwyacQfNYnNnG4=
X-Google-Smtp-Source: ADFU+vtbJWo8a9OuHM5Ur/MwPbb/XYr+ACsbCsWhOW/KHGAJLwWUgiRHKTIdybMFeBM9AZ3NmUJQLQ==
X-Received: by 2002:a17:90a:a48b:: with SMTP id
 z11mr14337450pjp.1.1584174882848; 
 Sat, 14 Mar 2020 01:34:42 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f4sm25343087pfn.116.2020.03.14.01.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:34:42 -0700 (PDT)
Subject: Re: [PATCH v5 27/60] target/riscv: vector single-width scaling shift
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-28-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7fb46386-5804-2a52-a682-56fdac2c8641@linaro.org>
Date: Sat, 14 Mar 2020 01:34:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-28-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 08:34:49 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static uint8_t vssrl8(CPURISCVState *env, uint8_t a, uint8_t b)
> +{
> +    uint8_t round, shift = b & 0x7;
> +    uint8_t res;
> +
> +    round = get_round(env, a, shift);
> +    res   = (a >> shift)  + round;
> +    return res;
> +}
> +static uint16_t vssrl16(CPURISCVState *env, uint16_t a, uint16_t b)

Likewise.


r~

