Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7H7-0004S6-Bn
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7H5-0004QD-5J
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:16:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7H2-0007JG-KN
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:16:30 -0400
Received: by mail-pf1-x435.google.com with SMTP id d22so2424437pfn.5
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bCrPokc/91BVai+tc3RhUD6fQovVNYVuKlbILtdd53s=;
 b=G+9cJs310rX0yjl1QM9hUEluKgPFJdNa7MNRp0N8ZSRsaMXN005DT05BBHYAvSLyyg
 qxYctMTAtRydo7U1nh9MTsaCMyh+Mo/RuKHXmrjhArU0I66y8BmiCaVAHrxuF8l+1AS0
 NfH2PJm6bKeRoX2i8vGiHVCfnyeGKfgh1KAOa9W8/UfhsMAEm1/W3wHC52Rx3Nxj0U+P
 nGcGfbRPO6CnFF84+7zd5m1MzFWcOGsFPlVmYyxbm9hE1QECuOy3ywq9mtvTJgkjVakJ
 l7jA9ARg5O/wirtOAyqzzsLtTVpZvEPZEccRgTaWBt8RWq1Oef4XFo1qcAEzZkIL9kYm
 Kc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bCrPokc/91BVai+tc3RhUD6fQovVNYVuKlbILtdd53s=;
 b=m2Wk+uxFMoUhx1MtP1RfoPNtkJ3Cv/8UmPS/4H3+Tr6k4KjYoinefIhrLD/iN2NJxd
 AXTzSwiOQX5Edw4+K9TtRRm8Ll/ObGy3VHVVvC2z3Ge78hTKyrXhhiJmqOCDPWKfuF3Y
 x33Kvh8C409gQ4ptHTYMQmyXn4jrfqrmnFwKAqrvl9b+TBml8XGXjXdJPWu12H986qXh
 uKoNyE+qAdPJNPtw290A/0ferqkRK7uOXzKVqDywo70xabGefYx8CjLuFH+CtAnZ1Q26
 wOqsGtjuUD8DVg21HjaJAA72uBnKszaJszGdMwXoL5ckAR7r02vrdcS7ckAC4th4dEI7
 ULUg==
X-Gm-Message-State: AOAM530TuU2n9s4PlIpVX/xtquo2VTeauM2EBuZOrfU4b9NT0qtaMuCL
 RxBMJgjbGsBbKSkjDI3W6NCq7A==
X-Google-Smtp-Source: ABdhPJyNb+L6LBNJUC82D0UGEC5fT6hUUI/J6/MoxWrZ3aqe7KuWGQcklHiV91AbuS6WtkdEIEgzRQ==
X-Received: by 2002:aa7:8a50:: with SMTP id n16mr4042147pfa.81.1598732187091; 
 Sat, 29 Aug 2020 13:16:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s129sm3397364pfb.39.2020.08.29.13.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:16:26 -0700 (PDT)
Subject: Re: [RFC v4 42/70] target/riscv: rvv-1.0: integer
 add-with-carry/subtract-with-borrow
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-43-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <170d8651-afcc-b11a-6645-de6ab3e3d52d@linaro.org>
Date: Sat, 29 Aug 2020 13:16:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-43-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:16:31 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Clear tail elements only if VTA is agnostic.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              | 20 ++++++++++----------
>  target/riscv/insn_trans/trans_rvv.inc.c |  2 +-
>  target/riscv/vector_helper.c            | 14 ++++----------
>  3 files changed, 15 insertions(+), 21 deletions(-)

The patch description is wrong, but the code is correct.

One nit:

> -        uint8_t carry = vext_elem_mask(v0, i);                \
> +        uint8_t carry = !vm ? vext_elem_mask(v0, i) : 0;      \

    ETYPE carry = !vm && vext_elem_mask(v0, i);


r~

