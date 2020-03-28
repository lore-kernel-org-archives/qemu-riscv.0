Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jIDgP-0003Og-6q
	for mharc-qemu-riscv@gnu.org; Sat, 28 Mar 2020 11:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jIDgN-0003OU-2o
 for qemu-riscv@nongnu.org; Sat, 28 Mar 2020 11:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jIDgL-0005Te-Nr
 for qemu-riscv@nongnu.org; Sat, 28 Mar 2020 11:47:34 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37846)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jIDgL-0005Sa-I9
 for qemu-riscv@nongnu.org; Sat, 28 Mar 2020 11:47:33 -0400
Received: by mail-pg1-x541.google.com with SMTP id a32so6202243pga.4
 for <qemu-riscv@nongnu.org>; Sat, 28 Mar 2020 08:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MKbwnij1Ha6LFvUE+TJiFwc9ex2AHAFEXUHvJ/Nk2/Y=;
 b=EtCKB9nUSZWH4LaiVi77fJ5e1tt/X5VQ0gFLAIlMT8agUeSyJtOvSRZ1po/S2uwpmj
 HHytkgT5hbrkN5W0aouKxeDwKYvl3ZjXMo745TXhw8+H8lqLOoVWJhaQK3wLF8/ttlgN
 m0Ka4t6+q/frvFQm2HXBO31HTzFiaLo/N1mgNmDdPcCU+OpNeGKPwWUuMmxJtM/dShMf
 qWzOGLMLPViIHoULX01dxt1MEgvaSg4wfG3JCgptCQPmhydNgQKDCVXeHvPvyaHE1Dj+
 z5CZQ6/qEGB0YEzabRaR/aWG4jsehyXcvhZyKwlIjkQkpn1+Od/pIi/ENcE9O0HB0EnN
 GjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MKbwnij1Ha6LFvUE+TJiFwc9ex2AHAFEXUHvJ/Nk2/Y=;
 b=Y5PyXV/VZar1LjwJ1dkExAOC/37uuNy5hkOp8XhMls+M9C3b8Czu8EWNbpfLlBASev
 rE6p1zC3ZeSNT4F/Xpwks8IMhUSGy+TxJrq/fNqCfQ/tO5U/CPPkhbbUfKPUX5khiDZ7
 7/BLH9A0li1H+HJJt3OS5hqcKlvUIRN4AOokgnpzHwqMeIzZ74YbthWaEcf5y7i9VFMt
 RjHqBrHf5NRJoTl6XNeG6D7r4uX1GLPzi6QfHfF6r5r/nyfc010WQECuYsUlvb7yOOWM
 BFIzbAjCe7TFaBaCEQzbvfO92QPvK4XFyj2A1GpA1OlH/y1Nj3TlOyNFxXUaQSWI23An
 /O2w==
X-Gm-Message-State: ANhLgQ2RUpLHzI6AWLtWEiMY9Jphry5loU4Q+xDyGgp6LfMerkmeTvuS
 3KuBiUMFXL0bmn4NBC0RSwjlDKfm6WE=
X-Google-Smtp-Source: ADFU+vv4P+rKlx09u8UdPUvWe42R01ortUoubS9w34kNzLyflGp33C1CKpcizn1WhKveHTvobtV1jQ==
X-Received: by 2002:aa7:8ec1:: with SMTP id b1mr4706927pfr.125.1585410452262; 
 Sat, 28 Mar 2020 08:47:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id u21sm6112769pjy.8.2020.03.28.08.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Mar 2020 08:47:31 -0700 (PDT)
Subject: Re: [PATCH v6 18/61] target/riscv: vector single-width integer
 multiply instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-19-zhiwei_liu@c-sky.com>
 <1a5900d9-dc26-04f2-74b2-0bada246a0e7@linaro.org>
 <8be612c0-4345-c1f2-3b82-73a9a1ea4133@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53209745-9b54-00b3-2b1f-1271f0843021@linaro.org>
Date: Sat, 28 Mar 2020 08:47:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8be612c0-4345-c1f2-3b82-73a9a1ea4133@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Sat, 28 Mar 2020 15:47:36 -0000

On 3/28/20 8:17 AM, LIU Zhiwei wrote:
>> Missed the improvement here.  See tcg_gen_mulsu2_i64.
> Though I have not gotten the principle, the code in tcg_gen_mulsu2_i64 is much
> tidier.

Let A = signed operand,
    B = unsigned operand
    P = unsigned product

If the sign bit A is set, then P is too large.
In that case we subtract 2**64 * B to fix that:

    HI_P -= (A < 0 ? B : 0)

where the conditional is computed as (A >> 63) & B.


r~

