Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kLsV5-00016A-3e
	for mharc-qemu-riscv@gnu.org; Fri, 25 Sep 2020 14:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLsV0-00015d-9x
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2020 14:31:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLsUx-00076R-43
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2020 14:31:13 -0400
Received: by mail-pf1-x42c.google.com with SMTP id l126so4000059pfd.5
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2020 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lhZEn1PnlgT2KXGEnl0nEzNyvxivF4IWqU0gtYFSDig=;
 b=jdmjQFe4b9tiSs9qr/PWbPaDd7xYP/Gkj2JT2CBGVssWMJFn0d/aLKs/RPrc/EF589
 +YSG+VneMWo+GwDX/LaIlVEmAANHuaLzAftxXCEZ9/cejLu2dtpTGJJlZLP7ZrGcDct6
 SITDvShmsf2vRc79b4y+dNw+n/Sd8tZ7XerIwy9bjqbCzqWdNdr+seaHKAonK2WhGB9V
 w2frx/zIF4bD9l6WyxAYD69BBj88rHUtSeutFmDApFmO0w6/dx8tSsdEZ/kyz41+110l
 CBVyPvMzNZmzBO6pXJaA7CKpOP8U7PIeFvi4191CNn7Up4hokLyS73yqWNwAK1RFbk91
 FdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lhZEn1PnlgT2KXGEnl0nEzNyvxivF4IWqU0gtYFSDig=;
 b=PrJDFEAIKy/li+Qiqp/iZIhhu8cs1A3eOtaUP4GGUYsSk5ad5c6cw4sQSIcrxRTCUG
 zr4pRVnFDaALtNuqq4/QdZ9Z0dPAjZZk9SBxGxLmsB1xMCsT+vORv1uCC8GtyEVhJMs9
 sGOcvN3MK0mvi/dvlVwf61EEEUhiAOl0egFKEjw9QEZzLOms4qH/jnx/LPRxHRB7qqFZ
 VMShYPBChaLncDEpFDIGDAHr6gVJrIj6nSf1e1/GZi9969db3jXX3A/C8lv4mGwyVuGz
 g5Drd9pxtvIohXKabiwizDT0pIkuvI72KBWCdO0/WbhhfA+J/4KGFVAbs4roYdbGFR3w
 S72w==
X-Gm-Message-State: AOAM5329NWENUJ9TW/ojf/DJeoQLfwqqym+KzmFv1Mj+GviuAoAZykwt
 7vCJE8RWcM8UMj2PpSw42ucaZg==
X-Google-Smtp-Source: ABdhPJxKkPlkE2yQutrXS2NNLbvB2+xipHEVg9FEIS5f1O9+s4/7whSbSkulIyA8ZXh+gN9i54O+jA==
X-Received: by 2002:aa7:96bb:0:b029:142:440c:6ebc with SMTP id
 g27-20020aa796bb0000b0290142440c6ebcmr665872pfk.22.1601058669621; 
 Fri, 25 Sep 2020 11:31:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gg19sm2647920pjb.49.2020.09.25.11.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 11:31:08 -0700 (PDT)
Subject: Re: [RFC v4 53/70] target/riscv: rvv-1.0: floating-point slide
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-54-frank.chang@sifive.com>
 <96b9fa44-5a1b-2ac0-04ae-fa4d2857096e@linaro.org>
 <CAE_xrPhUXcMrBmRDwVBwmwA0m3QgaSAm56pYCs5QCJHOeK+S2Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90fabd0c-24d4-aa56-7817-fdc528d713ac@linaro.org>
Date: Fri, 25 Sep 2020 11:31:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPhUXcMrBmRDwVBwmwA0m3QgaSAm56pYCs5QCJHOeK+S2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.238,
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
X-List-Received-Date: Fri, 25 Sep 2020 18:31:14 -0000

On 9/25/20 1:21 AM, Frank Chang wrote:
> I'm happy to reuse vslide1up_vx helper functions.
> 
> However, opfvf_trans() takes helper prototype of:
> /typedef void gen_helper_opfvf(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv_ptr,
>                               TCGv_env, TCGv_i32);/
> but vslide1up_vx helper function's prototype is:
> /typedef void gen_helper_opivx(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
>                               TCGv_env, TCGv_i32);/
> 
> The third argument has different types, not sure if it's worth it to sync them
> all to TCGv_i64.

Ah, yes.

It could be useful to always widen to TCGv_i64 -- that's what gvec does in
general.  But I certainly won't insist.


r~

