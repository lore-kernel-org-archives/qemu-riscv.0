Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC51H-0002Mc-Rl
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 13:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC51G-0002Jy-7i
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 13:52:02 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC51E-0007pK-Mt
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 13:52:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id mw10so981180pjb.2
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BQk2gspOzA7zjipUzoc5tLshVhifeIx1yplsJ98tnb4=;
 b=feo4+IRwwkxhSabEuF1ZeVCtxBz/LRZp2n4HowitJ29Pcmxk+TNkItoKBAO7kmjxm+
 GOk1YDB5yH+2leSCJCkdCWFQo2qjm8fUu4nF0Dxd3/mGpjXvK9XB6+czyeBNGrKQ6lR+
 d2SQvXDx7s8Nn5ypCKKM4QjO6OutMAIAv75hQUoemVstQKBest6sKiaSKZUSNIuOnqJe
 DyUMsPCLxnlHBJXlu0OpXqFL0WuWbn+BW2LceCE/4TU9pGGC9649k1en/xR6FYDDBuxB
 tOyQc7XIbJiVMWexTWAnaMnI5NtNZoKgq0/tVeGxPy/QhO+zmEaVshLq1URrlASQHA8I
 2zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BQk2gspOzA7zjipUzoc5tLshVhifeIx1yplsJ98tnb4=;
 b=f43EP9lB0doueUfcCUkq9WrrKFI6YW0adWo35sUk/AgHwBF6QT3sfqeDqLnbE7/260
 4Q+cblCW1/vRjGmT+tAfit5/q7idqzaSjBEmOrECAVrgwriaDoCHPQ1Yd99hF/AsyGu3
 jRGlibPeGRsCHd2EO0L0uoqEWKEDCFVk6aeJyAF8rWKzkMEu5HJF7502ekIYAFTQ/wcs
 M82EzEigoNX7R37J0gH6w1sf0nSz1QCruXCADOk4bCW6T7NTTodxcYMmW6NDoPivMlxq
 iM217BHEfMKAOpQAOMt60x/TtWnXX2GBqoWnSVNMLBo3GtOmd0kGvqYEjyO2mi7cb+kF
 l8WA==
X-Gm-Message-State: AOAM530AgUHkR/ACZBiRl3ovQ35B73ixI/3ZewHUA29rXZZvdNd0uFd1
 GkjpVLGLIgnSweM3+cjavPE/cw==
X-Google-Smtp-Source: ABdhPJyKI4PwDXtrMksjus4Peg1tsemT9r5tZG8cJY2XHuKmRbccYAB43zzGcl5nRDU0dHfr4XusYA==
X-Received: by 2002:a17:90a:4541:: with SMTP id
 r1mr3835691pjm.88.1598723519165; 
 Sat, 29 Aug 2020 10:51:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kb3sm2453767pjb.41.2020.08.29.10.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 10:51:58 -0700 (PDT)
Subject: Re: [RFC v4 15/70] target/riscv: introduce more imm value modes in
 translator functions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-16-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <073f361b-c58c-c938-183d-eba5cbd3d259@linaro.org>
Date: Sat, 29 Aug 2020 10:51:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-16-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 29 Aug 2020 17:52:02 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Immediate value in translator function is extended not only
> zero-extended and sign-extended but with more modes to be applicable
> with multiple formats of vector instructions.
> 
> * IMM_ZX:         Zero-extended
> * IMM_SX:         Sign-extended
> * IMM_TRUNC_SEW:  Truncate to log(SEW) bit
> * IMM_TRUNC_2SEW: Truncate to log(2*SEW) bit
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 115 ++++++++++++++----------
>  1 file changed, 66 insertions(+), 49 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

