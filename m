Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXnDm-0001pY-Ka
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 11:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXnDh-0001lv-Hd
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:18:41 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXnDf-0006IV-5s
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:18:37 -0400
Received: by mail-pl1-x641.google.com with SMTP id 1so2630293ple.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2020 08:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hmt0eMVnOApsZe864FbdLsRBKwDMNvLVNFCzZm8tFlk=;
 b=ZkB+ARPxAgfYzNE07EeqhjYYaxwfWsql0e/r/VGnNtZfLnQXhO+G3o2dtPZiYLx8WH
 p2kBInRvcOh97fbrU6qhc40+7596JHx9P3yABICwMK/tRvj5m78vgiAGjmzD49SIx+jE
 Pp8LMon5QF7U9ZLotazGPTArhUTbN/gV6JPhC+jmZZGN7zGFy7UoEAewIWDNhUOJwzxK
 xFy1U4MJ+9jeawI97/fivLgGhcj/GcIQBpIpwYOYctedBWkQMYwGHsJRYc1gZ7cvWShy
 lXWGEgrfop9hXWrfCyxLxX6ryDvBI6PjVmaPYLQCYl5UJtSAHEG1eNFwFJciZkPNp4xu
 bzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hmt0eMVnOApsZe864FbdLsRBKwDMNvLVNFCzZm8tFlk=;
 b=g7CphQoWHWTgwqRXAHL9C2yynJdbTjXwhzop37ye+4u/TwoMA0FFcWkdWKkoY3vhEB
 MTBD2kUZYBcHgiX8390g86bumEhH30zrmTmIjPWUcE6IIR+0YQDaPaIx6vuT0Wb8n3AZ
 2xF9Y7rq6SZVqrU4TBcP0spr9LJo4ntF2Bp8K59KEvdl/oLljKPrz/gsEwMc5B4G58Vg
 /tLsYy9Is46Lzy0ESsgm2qHU2W1am1FAxLp6eknu6HbhCqHkqWCmXKpd10+uP6vltBCs
 POm6i1y52Rh+BtwndLNoyK2IVb6EDQwICLjprqnEbT9pFK6pCXWWQ5Aex+Kcn/rxsKrT
 pVPQ==
X-Gm-Message-State: AOAM531G0v7f5n5PrsgVtp3S3vAmkIc8bumLOKExhSHyLyE4xgpxXvUS
 bFSSUkpZZ3CYu29HKXRG+ASsLw==
X-Google-Smtp-Source: ABdhPJzImGz/Gl+Thm5KsKY/TQA34pjDzoxjBhETLRyrwDYLbQFl+1bQ1SuwzYEhBrnccDh/yObrfw==
X-Received: by 2002:a17:902:7c14:b029:d4:d894:7eed with SMTP id
 x20-20020a1709027c14b02900d4d8947eedmr8150255pll.81.1603898311102; 
 Wed, 28 Oct 2020 08:18:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h4sm5745057pgc.13.2020.10.28.08.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 08:18:29 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] target/riscv: Remove the hyp load and store
 functions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1603896075.git.alistair.francis@wdc.com>
 <5ead43dea141994823a113a2e7f1494df12d32dd.1603896076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8706b460-7a44-2b89-d736-c0e0274f77c1@linaro.org>
Date: Wed, 28 Oct 2020 08:18:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5ead43dea141994823a113a2e7f1494df12d32dd.1603896076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
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
X-List-Received-Date: Wed, 28 Oct 2020 15:18:41 -0000

On 10/28/20 7:42 AM, Alistair Francis wrote:
> +void helper_hyp_access_check(CPURISCVState *env)
>  {
>      if (env->priv == PRV_M ||
>          (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
>          (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
>              get_field(env->hstatus, HSTATUS_HU))) {
>          return;
>      }

While this works, I think it would be better to compute this into one bit of
TBFLAGS.  Then you can test it during translate and do not need an external
helper at all for the data accesses.

It also means that patch 5 can be simplified...


r~

