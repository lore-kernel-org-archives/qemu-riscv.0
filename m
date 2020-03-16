Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDiRj-0002mn-7m
	for mharc-qemu-riscv@gnu.org; Mon, 16 Mar 2020 01:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDiRg-0002ld-6r
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 01:37:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDiRf-0001xO-7B
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 01:37:48 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42589)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDiRf-0001r6-05
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 01:37:47 -0400
Received: by mail-pl1-x642.google.com with SMTP id t3so7463574plz.9
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 22:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wHQbRCcrZooGQjPfZvSuW/YlzcO/8aET315u1MTxBDc=;
 b=D/xuOeXO1ajklzFyOR4shshZnSSvI+DOghB5YKneKN7bjxdgCnail309bRGcTqUn8/
 h5zxKjPy45Lq3OFUBGwEa4iflllTayJ/FZKH/1AmnOCCsHTZCtJyRvZVkEcEC6LR1QpO
 9EX3eDO2S28HqD9PTg0rS+97LB1EFNp+bOjYzRiiwRTQluib235jtHrkFV+3MWvIW/49
 UYf5DAWcE/jERomr3ODCkXHw9WW9NEUbZCNMdxq/L6trGVAzSs94jcZ1kFmjZ+1Lf7Ad
 kVoKW1z+WrwDNh/Ew3gpavEuXOhDs3BmR42GGXOD9aCBlucREWRrSU1AnwRtP4kiBuqN
 WMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wHQbRCcrZooGQjPfZvSuW/YlzcO/8aET315u1MTxBDc=;
 b=hk1VqlK9F4UrSg3k5K0Vq7rRGt+wGt8k+viwBzzLGl2MK96VfyCQ0X+Gu5ruZa8OlR
 f+Xgd7IlkZsNri45pit57bj+IOIfQ+VM3ieSM6SP5+XyXv0BQMF3pxYuOynrn+ZK2l43
 qWQ7QiU4UTeFm0HTpdcc4CXxirr2rNKQ3dQhW/BOI39Nr/CMO7TG89ENQBrmwWo8QmrQ
 AZdiM684TD6yyrIEcUHFTnaJkKy7sJvSLMHW2svz/kxwjuOrZrYrXGCnWeTwmDXfPktX
 tNjshSEw7Il3bv0JOsT54uH5TWtFdkvFe7K3b3PSUshhofVUpAkuNf0B+/gNntmYDi/h
 Ex1g==
X-Gm-Message-State: ANhLgQ3hZyJsaSv8Oce3q/OtB71h0w/OHtTrVqo7M5AKJtncpqxshL+Y
 OOvXMG5CnTwQ++DCrwtET9Vyj8hl0VI=
X-Google-Smtp-Source: ADFU+vtQYgdfmGMkYCnurc7CviycWGomp4PCxdMDmHac0nA9jQ1jlR3w6YNvqhj2HTcks5Z3Zu/HLw==
X-Received: by 2002:a17:90a:bd0e:: with SMTP id
 y14mr24085257pjr.11.1584337065399; 
 Sun, 15 Mar 2020 22:37:45 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 o128sm32222890pfg.5.2020.03.15.22.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 22:37:44 -0700 (PDT)
Subject: Re: [PATCH v5 40/60] target/riscv: vector floating-point merge
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-41-zhiwei_liu@c-sky.com>
 <37215373-eead-9185-faf9-f2ebc0cb4193@linaro.org>
 <ef0a9b7e-65c4-93e7-61b6-b288afa1c13a@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9658fd30-c8fb-0ca2-4bd1-75b849269179@linaro.org>
Date: Sun, 15 Mar 2020 22:37:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ef0a9b7e-65c4-93e7-61b6-b288afa1c13a@c-sky.com>
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
X-List-Received-Date: Mon, 16 Mar 2020 05:37:49 -0000

On 3/15/20 8:41 PM, LIU Zhiwei wrote:
> 
> 
> On 2020/3/15 6:47, Richard Henderson wrote:
>> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>>> +
>>> +/* Vector Floating-Point Merge Instruction */
>>> +static bool opfvf_vfmerge_check(DisasContext *s, arg_rmrr *a)
>>> +{
>>> +    return (vext_check_isa_ill(s, RVV) &&
>>> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
>>> +            vext_check_reg(s, a->rd, false) &&
>>> +            vext_check_reg(s, a->rs2, false) &&
>>> +            ((a->vm == 0) || (a->rs2 == 0)) &&
>>> +            (s->sew != 0));
>>> +}
>>> +GEN_OPFVF_TRANS(vfmerge_vfm, opfvf_vfmerge_check)
>> Similar comments as for integer merge, using tcg_gen_gvec_dup_i64 for
>> unpredicated merges.
>>
>> In fact, there's no reason at all to define a helper function for this one.  I
>> would expect you do be able to use the exact same helpers as for the integer
>> merges.
> 
> Do you mean that I should expands TCGv to TCGv_i64 for vmv.v.x in translation?
> So that I can reuse it.
> 
> void gen_helper_vmv_v_x(TCG_ptr, TCGv_i64, TCGv_env, TCGv_i32);

Oh, I see, yes currently the integer helper is TCGv.
Yes, it might be easiest to extend to TCGv_i64.


r~

