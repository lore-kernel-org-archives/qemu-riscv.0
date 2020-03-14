Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCvZQ-0003VZ-QH
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 21:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvZO-0003VH-Cx
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvZN-0002GG-66
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:26:30 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53309)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCvZM-0002Dr-V7
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:26:29 -0400
Received: by mail-pj1-x1044.google.com with SMTP id l36so5053443pjb.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 18:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j3M4CdeK1AwG3wYfx15EhDeO/eLOhzMp4aiaEQ5mNbE=;
 b=q4NQ6wA+laRAt0j9GcFCJ3ZxAr7cmHxnop1IVenbLvCQww9dW4ZtB/skh9BWhQI4Vy
 OGuAPs27et7N2l8J5gNOzlvI4bS23xuCISmwtIx1bMRKvzyVBMk9afMs4MDIbUkfb6uE
 wrxGxxbrPu0TtRPBrTsvXhpyWF6qSWfLNXueMCzAC+CVYlzjHU1qTUaldfhdEWzlHXck
 ahofCaISA+D5IBz1BUTYD7MMpPjHPR+1ni+STwXNYZa2zVuuWrDmlZ8RYWTsIjm2XPab
 2ZyU8SF9Yrz6bJq8FL6Q5MYLc7fsSrv230VBsQAJ6VwNNJqURs4AiKyn66tqgNkWvjlb
 mGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j3M4CdeK1AwG3wYfx15EhDeO/eLOhzMp4aiaEQ5mNbE=;
 b=J9wd/3shBE1D5CDqsIqOLn09jPW3cS30gGiXCcwHAxkjTT1CPEDKRijhy46EYwfNdH
 yYgN7vdGOaQm177ieyVzZJYXfeoSPSX02YkBpmg6kdN/Va2FWg+FrFA1kMJmNVoxVdEO
 D7HgyKHi2lKWMVW27Rnq1PcWdI7RQcSc2J01ZmqRHr0HtfLhAMCWHniGOYutVVafOdvs
 dsuk2NEtieJFVAR0fH6NyMwFPR1QHNK/QcbDqyisGg7v4pjxyOwNFP6B8NS23icMQQDC
 HT7DSFKWP1T8PojavpLPOoxJCwatwZhbqek/Rkecw+OEszVoSLJG+27PZ6U9N41B7TgO
 ZbIQ==
X-Gm-Message-State: ANhLgQ0/Z7rhgqxwpxoySJQB0FSy94QWrQIr3qukJJcNIReQcyf3kyv8
 JW9E68G6fzzB/27+aBwebBfz0uInCDQ=
X-Google-Smtp-Source: ADFU+vtI3t/zOtO/YkAVluVT2EcabrtxXWemUkuiaD8A+vwuzV0op51XNazy2LvjhQnq0zIPaI4G8A==
X-Received: by 2002:a17:902:d915:: with SMTP id
 c21mr16080497plz.239.1584149187509; 
 Fri, 13 Mar 2020 18:26:27 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 13sm59083883pfi.78.2020.03.13.18.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 18:26:26 -0700 (PDT)
Subject: Re: [PATCH v5 05/60] target/riscv: add vector stride load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair Francis <alistair23@gmail.com>
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, guoren@linux.alibaba.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-6-zhiwei_liu@c-sky.com>
 <CAKmqyKOiKUqzGSDd1+TvqhCT6pjeEXEX-QVzYhcaiRa-y4D98w@mail.gmail.com>
 <445d93e8-1d2c-9877-84a3-ed62a5920d89@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <392b9e62-0ff7-de49-f5dc-793bc38ba484@linaro.org>
Date: Fri, 13 Mar 2020 18:26:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <445d93e8-1d2c-9877-84a3-ed62a5920d89@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Sat, 14 Mar 2020 01:26:31 -0000

On 3/13/20 2:32 PM, LIU Zhiwei wrote:
>>> +/* check functions */
>>> +static bool vext_check_isa_ill(DisasContext *s, target_ulong isa)
>>> +{
>>> +    return !s->vill && ((s->misa & isa) == isa);
>>> +}
>> I don't think we need a new function to check ISA.
> I don't think so.
> 
> Although there is a riscv_has_ext(env, isa) in cpu.h, it is not proper in this
> file,
> as it is in translation time and  usually DisasContext   is used here instead
> of CPURISCVState.

In translate.c we have has_ext() for this purpose.

I think you don't need to test has_ext(s, RVV) at all,
because in cpu_get_tb_cpu_state(), you already tested
RVV, and set VILL if RVV was not present.

Thus testing vill here is sufficient.  A comment here
to remind us of that fact would be appropriate.

For those few cases where you have an extension beyond
RVV, e.g. amo_check() I think you should simply use
has_ext() like so:

static bool amo_check(DisasContext *s, arg_rwdvm *a)
{
    return (!s->vill &&
            has_ext(s, RVA) &&
            ...);
}


r~

