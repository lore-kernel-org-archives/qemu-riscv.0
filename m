Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyI0i-0003gO-Li
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI0h-0003do-6l
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:54:27 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI0f-0001r6-Kj
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:54:26 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t15so1702114pjq.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+EumrwK7YBGBbZdkjnVM4S0JFvanV+cOWSYvSZBs/hQ=;
 b=WBdPIRHuiiGYt48BYgfTO/ZYa7ppJF2dBGZPcxt7RrPUWdnOEfPgEMp+2mb0xVkM1k
 mwi0usqCT4Xp/6j36r911PBgAZc8ZVaeinTQGQrhKPVc3ttg8bHWnhIX1wSHBDby7bT6
 MOhAfpmWahu9lxnFttbgS2cV6OZXMB8Wzb6uH3BK005kGQHoMmOFvdhpL56SnM/ILsgu
 hie6vVm9bvxP7c7D4dIle70duPiHQ1NPjyYDBzb2sXbo+D4DdPdsRuDztLNVx6BFx0TB
 utDNH8YXBtQjzlqE4GvDpQiKv5ODfXn/PdcixcVwyeCpfptuhF2JN5vN0h4t6BTuVYA7
 XHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+EumrwK7YBGBbZdkjnVM4S0JFvanV+cOWSYvSZBs/hQ=;
 b=DqDppR7hjIoV+OC8UVkQFQX78vLdhv+WDsG8Ny5SMg10xunvtAcdKRILB0CNElFkLP
 PXZ14PdClibWp5Offv3LSGpAfZCEyjEYxb3kwkJsAh2dwzVFoCyqiS8G4Y9/ij9DVl06
 GYyDogqfpoGzppYErzdnk+6jWwicmld1XP25mPq58SMKa09gq93zPcM2HXCERn2ZYbEY
 SAbt+0j8RBlUdpoUgwF8EYcwp3pxiFmzHerI+EJ0DuqSi4E3oIsYDr4UZT15fOTQAxmx
 qaWo0iRzFKEzcujXV+mYPVVUl6UOhUkOaoDONgtXngI2HoxvuaKTEnLvUgt2KEdJrZKl
 6sEA==
X-Gm-Message-State: AOAM530ZG9sYM0CFR56IrlZpUhbnKkOJBF5IRlY7dUQ2mCG35c1t+5hH
 1T+J6xwG55v0+HQvYtw+NvsmEw==
X-Google-Smtp-Source: ABdhPJxzOSgIjCSeGfsgHOyCtcCEwHKPwDBeLHQF7q/r8Acu+jJMFGOCGE1mxhNRaj/AQ3OiLTKTuQ==
X-Received: by 2002:a17:90a:e50c:: with SMTP id
 t12mr268081pjy.209.1595436864269; 
 Wed, 22 Jul 2020 09:54:24 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 v197sm149651pfc.35.2020.07.22.09.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:54:23 -0700 (PDT)
Subject: Re: [RFC v2 11/76] target/riscv: rvv-0.9: remove vxrm and vxsat
 fields from fcsr register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2caadb83-0a78-e8f4-6363-67c7ebfa5bc1@linaro.org>
Date: Wed, 22 Jul 2020 09:54:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 22 Jul 2020 16:54:27 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Remove VXRM and VXSAT fields from FCSR register
> as they are only presented in VCSR register.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 8 --------
>  1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


