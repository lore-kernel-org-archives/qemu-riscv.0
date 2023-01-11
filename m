Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFlaV-0007iW-HQ
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 19:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaT-0007am-8r
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 19:36:57 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaQ-0001lz-Uy
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 19:36:56 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so3984069pjl.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 16:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nwuYdBYbacb9IWlfEKWZ+6Ak12b3r2mxv1nKNS0ptTY=;
 b=JtvqOCMYzrzn6oTn2ep9CgKQhHe40kl/2mKYyMkXNhZIKwVNrfTGwTCOMzptoDImx0
 x0oXQ9Usvhjrs8fqHN3QaQDzGmvGK7ucdfd1F1Y0smxlkolyWebozjshUZWaPOUenkF3
 jApaX7doudMH1tvsBsaz0UnujSxwizd9BLnX4bFH9i30VxGMKbmtZBayTj/L9WcLhzED
 4SMg/gD58uyZI0ACUPGvP3+uwe6eqJ84Ke4AR7BfTa1foZ0Ep5dlfw8tI/bkqKYsbSNI
 vcU/hQdorB0fUBtNxyyEhYK3fgKgXgF1r5+wbWBiGfxomwIdDyhBw2Yc3cCZJ5x9xqin
 gP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwuYdBYbacb9IWlfEKWZ+6Ak12b3r2mxv1nKNS0ptTY=;
 b=tFsNFoPBRVW5rILuESU/lu05jJA4RsgPXqMW35eyDoua1TS05Ejr8paj3degbIYr1X
 ZOo4BxXZjxbNYPKd772SfA2vH30EOrfS6ZB58IumLhOXRb1pN8gpAEvAvfSgWBdz14OJ
 LigoyGufH42e2X4eNz1HfIIHN3sfl9QNum/fWOZOykE4bg91CSn9Gl1JY+ys/W74pG+x
 p6/T84V+dAHMOoAM5Nix7I1CqFkm91etGlUIBLWdD29+IQj7fAJPbIIWKMAdOWhxOptL
 /WVLAD4av4sGAyLgcO8a3DVeH5RAmTAytdAzyiW/YVKkNnTOEDiPiIGzmlN8QD3uKR65
 Oaqw==
X-Gm-Message-State: AFqh2kqhbCwpd1FO900sEmxn7sdP9ZJM5wGCtBOPPrvdsu4xoUe4R6sT
 jo6iIg4TmaAhCG5V5ofikMov+Q==
X-Google-Smtp-Source: AMrXdXvyY+3jSWw9f8vVzeUnmyUPbsbfJJMtVdgPU8mB68cIzDlO6YOL89teKNCCPIvW8eK1jFko8A==
X-Received: by 2002:a17:902:a5c1:b0:189:62fd:140e with SMTP id
 t1-20020a170902a5c100b0018962fd140emr73199788plq.29.1673483813705; 
 Wed, 11 Jan 2023 16:36:53 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k7-20020a170902760700b00192bf7eaf28sm10716395pll.286.2023.01.11.16.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:53 -0800 (PST)
Message-ID: <6da2fab1-4318-f466-bdec-0c4296711bf9@linaro.org>
Date: Wed, 11 Jan 2023 09:48:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/4] bulk: Coding style fixes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111083909.42624-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 00:36:57 -0000

On 1/11/23 00:39, Philippe Mathieu-Daudé wrote:
> Fix the following checkpatch.pl violation on lines using the
> TARGET_FMT_plx definition to avoid:
> 
>    WARNING: line over 80 characters
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/block/pflash_cfi01.c       |  5 +++--
>   hw/char/digic-uart.c          |  8 ++++----
>   hw/core/sysbus.c              |  3 ++-
>   hw/dma/pl330.c                | 16 +++++++++-------
>   hw/i386/multiboot.c           |  3 ++-
>   hw/i386/xen/xen-hvm.c         |  3 ++-
>   hw/i386/xen/xen-mapcache.c    | 13 ++++++++-----
>   hw/intc/exynos4210_combiner.c | 20 ++++++++++----------
>   hw/misc/auxbus.c              |  3 ++-
>   hw/net/allwinner_emac.c       |  8 ++++----
>   hw/timer/digic-timer.c        |  8 ++++----
>   hw/timer/etraxfs_timer.c      |  3 +--
>   softmmu/memory.c              |  3 ++-
>   target/ppc/mmu-hash32.c       | 10 ++++++----
>   target/ppc/mmu_common.c       |  8 +++++---
>   target/sparc/mmu_helper.c     |  5 +++--
>   16 files changed, 67 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

