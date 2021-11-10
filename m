Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mklhj-0004NT-EV
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 06:23:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklhi-0004Lt-5I
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:23:46 -0500
Received: from [2a00:1450:4864:20::42f] (port=38818
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklhf-0005oE-AB
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:23:45 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u18so3397278wrg.5
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 03:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3PEVz65ReO3xTGcGDsOJ3dE2df8dU/qtSolagATOL7Y=;
 b=AOCeQ4WnFfrecNgTgHVLn+6IdfLmiL83T6vB0k79ZOdX1/wZ5ETRIYIQBP799lRm1h
 hmx6axhwbWHJiCc6ddiiKgtSaIQuEPeXxkOKQpuK7luROAeV+1Pw1ep+neXCtNcaP7Hd
 Qka7QkpN4mlwoaPqX0UR+J5NIZuKiUgevW1vg9AP0IO0Pu61X9U+tOOPMH3V9/ytyM+W
 1MUGYVQkWfz2sdprXy7zHo4hYB8QEVyKJdGbUbVTAJZFgcTwEaR5Aa1qwk3Fw2Exp3IK
 5MSqCQw2PkLtmR8ewlaS+1WhfT4deiYGr/tFSQfker021PijjznbP4jUj2rQxj4ITEOT
 4bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3PEVz65ReO3xTGcGDsOJ3dE2df8dU/qtSolagATOL7Y=;
 b=1SHjXK5ticMMJ454R/m4v8uI6xzb4t8IFkc3dp2Wli3EVuhgdCh32fhwLLD/KHt8m2
 1yaj+nhNH1JxZa52MqXOZ2Vc9uqu6ZeLBp7S9yI2BruCN+9Mv6JpXSq+wXTRWyB2VptF
 Xyu9lHtuFiTrtNNYy4f70zlkyWOaWzTI6KHWOey93zZ5hV0cjqyDOprEbwl2xulTm5od
 QNMcAEM2NbGTi789UsRSrrFpV+TijjOx3R80sDiOkCM7sGHUmRMkC5nGhvDTpjC5MpRa
 bJVyacS1XCT1FPuThx+Q5UGTlq5wAjT4HRc1+68N4vNa9v0xeuMnc7Gt0UF/fYI5TtNA
 BuIQ==
X-Gm-Message-State: AOAM530336Rn5b8mXZ4xiA8/DKoxf/SxBbnFaPM9A7yPYOEhpC2INzsa
 lngO+gFaTxl4K2y5STBEJuP3aQ==
X-Google-Smtp-Source: ABdhPJy0RtLwhvcHKSNuRzseHFOtfdWR6FT9LVqfvXkDm8v7YB4H3QJ/pzKqNoKM3pUpPUJYcwAVgA==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr18081256wrm.431.1636543421602; 
 Wed, 10 Nov 2021 03:23:41 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id e12sm28350712wrq.20.2021.11.10.03.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:23:41 -0800 (PST)
Subject: Re: [PATCH v2 12/14] target/riscv: Split out the vill from vtype
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-13-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df7ad986-8430-9994-83ac-33db2ec1f2e3@linaro.org>
Date: Wed, 10 Nov 2021 12:23:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-13-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Nov 2021 11:23:46 -0000

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> We need not specially process vtype when XLEN changes.
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h           |  1 +
>   target/riscv/csr.c           | 15 ++++++++++++++-
>   target/riscv/machine.c       |  1 +
>   target/riscv/vector_helper.c |  7 ++-----
>   4 files changed, 18 insertions(+), 6 deletions(-)

This patch should come before patch 6, which is over-complicated.

> +    target_ulong vill;

This could be bool, though there's no good place to slot it that does not result in unused 
padding.  Comments should be added to show that this bit is now missing from vtype.

> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 19e982d3f0..cc4dda4b93 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -104,6 +104,7 @@ static const VMStateDescription vmstate_vector = {
>               VMSTATE_UINTTL(env.vl, RISCVCPU),
>               VMSTATE_UINTTL(env.vstart, RISCVCPU),
>               VMSTATE_UINTTL(env.vtype, RISCVCPU),
> +            VMSTATE_UINTTL(env.vill, RISCVCPU),
>               VMSTATE_END_OF_LIST()

This will need a bump to version.

> @@ -45,11 +45,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>       }
>       if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
>           /* only set vill bit. */
> -        if (xlen < TARGET_LONG_BITS) {
> -            env->vtype = FIELD_DP64(0, VTYPE, VILL_XLEN32, 1);
> -        } else {
> -            env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
> -        }
> +        env->vill = 1;
> +        env->vtype = 0;

This is fine.

You're missing the updates to cpu_get_tb_cpu_state.


r~

