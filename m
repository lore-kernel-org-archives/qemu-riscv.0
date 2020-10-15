Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kT6cb-0004Tk-RL
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 13:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6cW-0004SA-2o
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 13:00:53 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6cQ-0002UA-3U
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 13:00:50 -0400
Received: by mail-pl1-x643.google.com with SMTP id o9so1926989plx.10
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2020 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WUcro0B6YtCjpSxkj0AVtOY2ca08tCL+vDTY0sH+OJM=;
 b=dThDufOYA325BNWT05DanacpRjHPAUw6+QK8IkiW38oRjIZbEJNDyFhYezbDPI6bon
 GayQbDScYCypBHEjAsbJfGD8oP+3K8q6oXikb9giIcbjH5W9iYWTH9UHkBr44fWrkBTR
 hV44GmdMNgX4vLdJD4fJact8sjfjGkDfwU/sHfqnlqirDl2oRgqazOClLDFTRSmKGfiT
 Bqxq5JPTk00r5CweWctnh3twFeIW/6WdbtA+0nHzrtKlciVzarGSO0VZR9wNuBT7uJy5
 7Kq9LE+6sOB2BlP/gud8KkmGfEQHdZkj5DGHuOGHmNG9ncjR3qUHuZtP16b7rOkHKwk8
 rSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WUcro0B6YtCjpSxkj0AVtOY2ca08tCL+vDTY0sH+OJM=;
 b=MpbmW9wew+IT7dY5G9VB55Iv4G+42oIIt3MebBg1NmegSsLIjgidIJhZl2wUglUG6m
 RsMZAhnfUQxklEcL88uio4Mrr8JfQ5AjIoQwFCFO9NO+EDiwf2gcrMde3w/mLHeWFOxE
 XQTB9/eMXl2zECJqgO6QvVHQ0dluJEfR0ayGtlZ6ptMbXu2or64j+zOz7DVR4zPhz6fL
 DpnTk6itqADhqy841LODLtAHMsmk0AKzry0e6PTcThwowxMH79bXP4cfXTYdJJ6ui6cI
 FmXss6VXqS3UydtYWBgn6DuVOixOlmHKFxtvZgiBkMWHVY9oaYih0hzgjqzdnHuoIfpz
 NZDQ==
X-Gm-Message-State: AOAM533Xt4FsJmgC8kD+Hvr8QTwCi+uwvxCLCSw2S1yB0xnZUvXng7Vl
 4J60/T+BqBqeAQIArm1c82g2kX0o+Jxh5g==
X-Google-Smtp-Source: ABdhPJwJSUUPi9DotEIeVxzBO1I3tZ8qo6jaGsctNBosFDU2K+aSr7QrGyQC40ztTPmVaap6Ypagvg==
X-Received: by 2002:a17:90a:d901:: with SMTP id
 c1mr4743891pjv.81.1602781243503; 
 Thu, 15 Oct 2020 10:00:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w205sm3847938pfc.78.2020.10.15.10.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 10:00:42 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201015152139.28903-1-space.monkey.delivers@gmail.com>
 <20201015152139.28903-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d7e10ff-b560-4f16-9f53-516dc26156a0@linaro.org>
Date: Thu, 15 Oct 2020 10:00:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015152139.28903-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 15 Oct 2020 17:00:54 -0000

On 10/15/20 8:21 AM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/insn_trans/trans_rva.c.inc |  3 +++
>  target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
>  target/riscv/translate.c                | 14 ++++++++++++++
>  5 files changed, 23 insertions(+)

Looks ok.

It does occur to me to wonder how this is intended to work with unaligned
addresses, or large memory operations such as with RVV.

Without changes in the generic tcg code, an unaligned memory op that crosses
the mask will not wrap the second half.  E.g.

  upmbase = 0
  upmmask = 0xffff
  address = 0xfffe
  size    = 8

will read [0x10005 : 0xfffe] and not
[0x0005 : 0x0000] | [0xffff : 0xfffe] as a true wrapping would lead you do believe.


r~

