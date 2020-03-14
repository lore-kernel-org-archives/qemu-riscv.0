Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD1KP-0005i2-4r
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 03:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1KM-0005e3-GW
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1KL-0003eY-Dl
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:22 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34477)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD1KL-0003bE-8K
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:21 -0400
Received: by mail-pg1-x544.google.com with SMTP id t3so6387523pgn.1
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 00:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6PnIl46SHmSjcpt8xU/K11ykKRTer8M9KJmMkyuEM8=;
 b=otjGv07fDRlrVn9szVvYefGYRvNIwws85KkZguxUJKQMvvf7+3vcGu04led6/YlPUA
 mRSaDnxBbZq6BYrJCDobdQmAxu8VEV2TMh7IUutKBvbORl19hAKSrcz1eL1SGNfX1FPI
 rpUHjXyHw1Rr0OOJN6dYRorXXIqJZslJO8OzDB2EUr0O58lk5obUXNB0LS1I5FDzbVx8
 wrSBy0CljRmz/z9i+60dkYBWkD/116yOXMXXuOGlxV7TXH0JMVTvDZj6xemfRrQ+FxHg
 TbyIFXrbVpKanrk2zWt0cc6jW37JbfWd/yriHV+MgawpOMG4xp97+lP2AS2W4nqlkZ1m
 ojOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6PnIl46SHmSjcpt8xU/K11ykKRTer8M9KJmMkyuEM8=;
 b=qqrlVDw54LaMIYyMHIO5mRIhvzgUjcaFhWmvSXQgtHapYbs/1/h529CqlIyYBA4YQF
 ZFRCe7A6a8f1NZ51QLe/9D8mNx6fbiQtWHCoCopkP2TOKpdTYBFz0CV+UZXIpnNTw3FM
 aasHZK907NfFsc6Eo6m3K5WLv7uc71/a/DUQC7iAyxG/6flltiDnF4S2NT5pcrVGquUX
 SwV7Hxr40/64Ew/BLhb6bcQQcucj+kMOiLRLD5vkHiV0vzd+YUV6wo0bO0WTbq+SHK6M
 Vlge46JVsxrHW+GWXQka//ikLLh7jD1yVaPEuqkohlJWtv2RSTvHXbHGk6//aItko24H
 c3hw==
X-Gm-Message-State: ANhLgQ3lkRhufeoiIl88e52rz9yejHnQam1bYXZZrZQLFrAFVuT5JGQg
 KJUED9dER9FyM7JgyXiOxU1McHg5Hng=
X-Google-Smtp-Source: ADFU+vuKxTtEkv18LgiguhQ5qrCJM674cJA0jNL96BSm6f6hc0Wfco2oiYo3o8JW5lg6stqidtG3vA==
X-Received: by 2002:a62:194c:: with SMTP id 73mr17968393pfz.159.1584171319900; 
 Sat, 14 Mar 2020 00:35:19 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 p1sm20760144pfq.114.2020.03.14.00.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 00:35:19 -0700 (PDT)
Subject: Re: [PATCH v5 22/60] target/riscv: vector integer merge and move
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-23-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <daeefcff-c444-b289-abcf-74301b09cce9@linaro.org>
Date: Sat, 14 Mar 2020 00:27:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-23-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Sat, 14 Mar 2020 07:35:23 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/* Vector Integer Merge and Move Instructions */
> +static bool opivv_vmerge_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return (vext_check_isa_ill(s, RVV) &&
> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_reg(s, a->rs2, false) &&
> +            vext_check_reg(s, a->rs1, false) &&
> +            ((a->vm == 0) || (a->rs2 == 0)));
> +}
> +GEN_OPIVV_TRANS(vmerge_vvm, opivv_vmerge_check)
> +
> +static bool opivx_vmerge_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return (vext_check_isa_ill(s, RVV) &&
> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_reg(s, a->rs2, false) &&
> +            ((a->vm == 0) || (a->rs2 == 0)));
> +}
> +GEN_OPIVX_TRANS(vmerge_vxm, opivx_vmerge_check)
> +
> +GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vmerge_check)

I think you need to special case these.  The unmasked instructions are the
canonical move instructions: vmv.v.*.

You definitely want to use tcg_gen_gvec_mov (vv), tcg_gen_gvec_dup_i{32,64}
(vx) and tcg_gen_gvec_dup{8,16,32,64}i (vi).

> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {                   \
> +            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
> +            *((ETYPE *)vd + H1(i)) = s2;                             \
> +        } else {                                                     \
> +            ETYPE s1 = *((ETYPE *)vs1 + H(i));                       \
> +            *((ETYPE *)vd + H(i)) = s1;                              \
> +        }                                                            \

Perhaps better as

ETYPE *vt = (!vm && !vext_elem_mask(v0, mlen, i) ? vs2 : vs1);
*((ETYPE *)vd + H(i)) = *((ETYPE *)vt + H(i));

> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {                   \
> +            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
> +            *((ETYPE *)vd + H1(i)) = s2;                             \
> +        } else {                                                     \
> +            *((ETYPE *)vd + H(i)) = (ETYPE)(target_long)s1;          \
> +        }                                                            \

Perhaps better as

ETYPE s2 = *((ETYPE *)vs2 + H(i));
ETYPE d = (!vm && !vext_elem_mask(v0, mlen, i)
           ? s2 : (ETYPE)(target_long)s1);
*((ETYPE *)vd + H(i)) = d;

as most host platforms have a conditional reg-reg move, but not a conditional load.


r~

