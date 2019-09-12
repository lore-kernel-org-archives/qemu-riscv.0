Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8Qg5-0006WM-OW
	for mharc-qemu-riscv@gnu.org; Thu, 12 Sep 2019 11:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Qg2-0006Tl-S8
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 11:06:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Qfx-0008Tt-UK
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 11:06:30 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:37821)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8Qfx-0008TQ-OU
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 11:06:25 -0400
Received: by mail-qk1-x741.google.com with SMTP id u184so21909451qkd.4
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2019 08:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YbrEvrfE7CtApP37hPEnQbBClZnQCo5bnRS2HOfQZ3A=;
 b=oysIk/GCLuuzRLHjEZuz+FM4IXlTDoy6uRfPNuMQRkQ3/wxnrL/5f0BXVWAFkFcfZF
 r7/tDl4pKke9Yu7h7r0bgrEJsCeK65DdP0nWtzpQB+bynmJurwHoimmmRYkmZa+pnW0K
 +O3mozkzhCY6PEzc21n0MAmkGg8bsXmPvoqrgIp+qw3QSeMFxtdJhlbPt1ZvPLcXY91i
 B27umhbih6fFBG+1N2TCdcLmvgOd9Ff0YDu09PkpWMsw52wKWgBQSR5xtYYXuJyR9G5V
 UyzgK3TsAiR0H8+R49dCUZ369WBkjdinKxTh2s5dzYn0WTaLptWalSpJ7LU999ziqe1g
 mTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YbrEvrfE7CtApP37hPEnQbBClZnQCo5bnRS2HOfQZ3A=;
 b=Fm/GCeeR8TRYJdPBzRUXTTawmQ5a8gAOd0qcqOhL84jwvd31TmbTQqkTXuDM+ncOv6
 0sbRxjgPjftXoYAFjPMozeeF1nXjPPwzTlUTGcEd8L9LQmXOEb6KjZkwdSM1r7irI4+A
 DkOLZk+gOUaeCuNqvzcXdXCfGRkUk2QSsCrSo+5/kU6zCc6ZUVDbpW2YHoooJ6YOlUGx
 y9j9zFSaYtDeHfMbrN3eesO4vkE4dPHLGMcUrB2P5+wZm6Jy+uJjV8fso6gLxZR/Y74l
 GBflUVpaqKYBNm3acBtGPjCGWmGO1R6Ti6NCXHYQ1mFnbk2IvHj0L7yDaRNXj566nMCG
 UOJg==
X-Gm-Message-State: APjAAAXRs1Vu9C6A18RsCKpBPF3ZmP8+wS2EYdlhdEgkOSVD/3GmP365
 FEFWKsFzbzojejplDVAc970hpg==
X-Google-Smtp-Source: APXvYqzb7YHSKJK8BdY4ypPlmyUocztSTZxOs0Wm9Qf492Yp4c+h8i7Yd/18ciL4cTie60A80OZVbQ==
X-Received: by 2002:a05:620a:1ed:: with SMTP id
 x13mr41517974qkn.188.1568300784534; 
 Thu, 12 Sep 2019 08:06:24 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id 139sm11828278qkf.14.2019.09.12.08.06.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 08:06:23 -0700 (PDT)
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: liuzhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, wxy194768@alibaba-inc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wenmeng_zhang@c-sky.com, Alistair Francis <Alistair.Francis@wdc.com>
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
 <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
 <b9c89438-5346-e2ee-403b-3bc1fa1637bc@linaro.org>
 <CAEiOBXXsag8hfHJGcqKLVKcVkndC67iPikcp-01WACoBA4ev3Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b227759b-5a2e-6bb2-c68b-9922d484b811@linaro.org>
Date: Thu, 12 Sep 2019 11:06:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEiOBXXsag8hfHJGcqKLVKcVkndC67iPikcp-01WACoBA4ev3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 01/17] RISC-V: add vfp
 field in CPURISCVState
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
X-List-Received-Date: Thu, 12 Sep 2019 15:06:32 -0000

On 9/12/19 10:53 AM, Chih-Min Chao wrote:
> 
> 
> On Thu, Sep 12, 2019 at 6:39 AM Richard Henderson <richard.henderson@linaro.org
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 9/11/19 10:51 AM, Chih-Min Chao wrote:
>     > Could  the VLEN be configurable in cpu initialization but not fixed in
>     > compilation phase ?
>     > Take the integer element as example  and the difference should be the
>     > stride of vfp.vreg[x] isn't continuous
> 
>     Do you really want an unbounded amount of vector register storage?
> 
> 
>  Hi Richard,
> 
> VLEN is implementation-defined parameter and the only limitation on spec is
> that it must be power of 2.
> What I prefer is the value could be adjustable in runtime.

Ok, fine, I suppose.  I'll let a risc-v maintainer opine on whether there
should be some sanity check on the bounds of VLEN.  If you really do have an
unbounded vlen, you'll need to consider carefully how you want to manage migration.

>     >     uint8_t *mem = malloc(size)
>     >     for (int idx = 0; idx < 32; ++idx) {
>     >         vfp.vreg[idx].u64 = (void *)&mem[idx * elem];
>     >         vfp.vreg[idx].u32 = (void *)&mem[idx * elem];
>     >         vfp.vreg[idx].u16 = (void *)&mem[idx * elem];
>     >    }
> 
>     This isn't adjusting the stride of the elements.  And in any case this would
>     have to be re-adjusted for every vsetvl.
> 
>  Not sure about the relation with vsetvl. Could you provide an example ?

Well, I think it's merely a matter of there's no point having so many different
pointers into the block of memory that provides the backing storage.  I've
asserted elsewhere in the thread that we shouldn't have an array of 32
"registers" anyway.


r~

