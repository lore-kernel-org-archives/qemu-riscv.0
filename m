Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqHej-0000OU-7n
	for mharc-qemu-riscv@gnu.org; Mon, 07 Jun 2021 11:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHeh-0000KF-4o
 for qemu-riscv@nongnu.org; Mon, 07 Jun 2021 11:59:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHee-0007dB-Hy
 for qemu-riscv@nongnu.org; Mon, 07 Jun 2021 11:59:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id t9so14149592pgn.4
 for <qemu-riscv@nongnu.org>; Mon, 07 Jun 2021 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPvPX+PNLp4vUPw/DIfz/azPNEof6OiX6k/xwJ4fQs0=;
 b=hhgcqn2+ErYltMQToc34Mt6DKhLgMtbXhK/FudXw/gxgcTIpybd6yzFYUIC09UD90t
 tVutD8BQtnvW1WqQqaBKg6N7S+B+NfwWAb5JAvyhFK+84DxGJS2OwJiG7jNKJtm4NQEL
 eRXYOWqadc0suifYjOQmTpRMv0LZdTe6HEOmV1VYt06V8OjPGH159KqTPkLhoOamSWty
 HTSW32py2TFd2vhF5NIJ2Z8qOcEiWZdSR3jglWM+mT3ZhadM9tg33nm8izH+1sRzwiy0
 PFjv/TCa/Hna2OgMrQldyNTo7tVyj1MeCgXUOGx9SgjoM5pUEqFOnuyrUDBaPsO3Rtva
 ouZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPvPX+PNLp4vUPw/DIfz/azPNEof6OiX6k/xwJ4fQs0=;
 b=ZA8U6XrZBu0EBkB7Mpumm0WdRPS1AxFvl4c4T4DIUDUuFTHS4aQdzg/+757LEJVB2J
 Put0+SVDKZQ8cILihr9/KINk3a6Ic7w6XLCCgr1xvhXw1zcajobrmDVE4pJSGT8UDycR
 xVCZmQuKAzJprvCZ3ak5pco3l1D6i+aPclyVaDg2RRG6F8MNL8IIkG8vzZbAEsInxmtE
 wEBUghx+R7fRlqqZpLgK+81AZo7hQzt2ubeJxKFH/8swLPLYaLmORb4VrOVVH+Dc9gCs
 UwO47IBP7yzBIPXcDAH3CrgXR6qRcXr5GX6Ecal+XEje7A0F33bLZcNPAN8QYpMN5Md2
 klBQ==
X-Gm-Message-State: AOAM533OEAFOq8TIXSDzs3pdeTZJMOLKMy3bbYEq5Kt37MQUaTFzWT05
 gm+GCn+WHp6FDbsikLedhqxaqQ==
X-Google-Smtp-Source: ABdhPJwABFDVvp5gPCbvxpwi7gb6G1f5CyrJ+GaawR1t9YJu2ANw87SITJ2GWXtYLBfZ9sAiq9V8iQ==
X-Received: by 2002:a63:ad0f:: with SMTP id g15mr18201123pgf.415.1623081547240; 
 Mon, 07 Jun 2021 08:59:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 em15sm11521836pjb.43.2021.06.07.08.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 08:59:06 -0700 (PDT)
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair Francis <alistair23@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
 <CAKmqyKNHX0p5OxE1Y+1bwUeQ1uXu_DTwTnYgK3xxB9tu9Ax_nA@mail.gmail.com>
 <e82c9f94-4367-2ed6-7c7c-846e8a270876@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86461776-b805-42a6-6c64-bca5f1be6dd1@linaro.org>
Date: Mon, 7 Jun 2021 08:59:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e82c9f94-4367-2ed6-7c7c-846e8a270876@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 07 Jun 2021 15:59:11 -0000

On 6/7/21 2:22 AM, LIU Zhiwei wrote:
> 
> I am implementing RVP to get rid of TARGET_RISCV64. After we have recognized an 
> instruction only used by a 32-bit CPU,
> 
> 1) Should we only use the lowest 32bits of the 64bits register in RV64?
> 
> TCGv s;
> TCGv_i32 s32;
> s = tcg_new_temp();
> s32 = tcg_new_temp_i32();
> gen_get_gpr(src1, a->rs1);
> tcg_gen_trunc_tl_i32(s32, s);
> 
> Then we can use TCGv_i32 s32  to stand for rs1 register.

Changing from _tl to _i32 is wrong for most things, because you'll just have to 
convert back in order to store the result.

Most often you'll get the correct results by just using _tl as is.  One 
operation I can think of right away which probably requires extra attention is 
right-shift.  In which case just sign- or zero-extend the input first.


r~

