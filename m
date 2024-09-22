Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B76ECF9C64
	for <qemu-riscv@archiver.kernel.org>; Sun, 22 Sep 2024 11:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ssLB6-0004fu-ML; Sun, 22 Sep 2024 07:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ssLB0-0004eR-Vz
 for qemu-riscv@nongnu.org; Sun, 22 Sep 2024 07:54:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ssLAz-0001S5-95
 for qemu-riscv@nongnu.org; Sun, 22 Sep 2024 07:54:54 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so475974466b.3
 for <qemu-riscv@nongnu.org>; Sun, 22 Sep 2024 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727006092; x=1727610892; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cQPPKjoskTOTK3LYERWWhHFjw+QNYmzQnQN/w7onA7g=;
 b=KTYxJ/w+xqqVBVb0d6fjFf5oX0UgipPV463nwSe6u6WLbQTSim2X7C2e0sHZtxdBhc
 iYNtakx4ZTQsNrd9FDdxib0FFwB9aTcwPchyUMKgzqSb7YZq/neQZhtSGnU2GWkWjYCk
 H2eKUDljJ2jtynxnUCb0uX1QhNu0QKHdTUy2tTnTLhITb+UhUlsOH6bM3tPsRzwPs3/z
 gjJ2W1V3rAKJVR2ErprRtoItsWq/hLwZGm1VLtD/sfAh84rtUJ0r8ywLED6x/twd9rVy
 sJfXY4wI4ehi14C9wil3AzGeP1tl766ewMBnKyEdU0XDsalGu2TwB6FwEG/K0iTB0GHY
 ZiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727006092; x=1727610892;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cQPPKjoskTOTK3LYERWWhHFjw+QNYmzQnQN/w7onA7g=;
 b=lhbw6Ojnf1VwCkik65Hs1SU9ZHsWGSn6VxLlLIGlRsOh7+UpGgxJyYwonmXb9Ivaa/
 agZgJN2I3NDoDuDwArKvI1dsV3CoRHJH/5ALCKX+kB9S98Ht8ZGuqJ3DGekJs4pKlfnh
 3KsJcNtP+1IHssITarHKRRPpLUz3xlGoM61KiD4tJIv5WCxXInLl/IQsjrUf/EDKny0H
 71Jtnq53ZQKC8Q0oFrKi85EbxlcS28TlkT63tUJXq8Ywiigahp4uQO61VgSk4JL34ncN
 GaJspgT1FTG4LOm50/Q1VD3P19HwdziyLp7lcyGtDtAFv8an+FJU3J2mlTzsUP9C9OSP
 G+Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTsf+H4QbBgIdwcpCCdWgsTGvAnwHnYbqwILkl7sgu/tc0dt5NpdBhnisxhCX+bxeNr24ZB9YhXcmN@nongnu.org
X-Gm-Message-State: AOJu0YxujWekBqNqi7/Bri8LxGDqOvsTxpAZ7hmFg/qBybBgMcUmO4ID
 bT8fuTZQsn7PGZqgsyJwAAGB+JCiMPonrB7lQ31D8fvBL9acjP1rWns3KDy2vk8=
X-Google-Smtp-Source: AGHT+IEPPbcvduJ/L7SbHbEr+GnxZMzQSrFSfZBpkaeTnwCn/ugikpN9vrlUBXMqYGzPCNVGJHu+kw==
X-Received: by 2002:a17:907:96ab:b0:a86:7ba9:b061 with SMTP id
 a640c23a62f3a-a90d5167108mr834922766b.64.1727006091658; 
 Sun, 22 Sep 2024 04:54:51 -0700 (PDT)
Received: from [10.5.50.249] (90-181-218-29.rco.o2.cz. [90.181.218.29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df5afsm1075350166b.162.2024.09.22.04.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Sep 2024 04:54:51 -0700 (PDT)
Message-ID: <728dae74-481b-4ad7-be91-7fd52a3d7aa9@linaro.org>
Date: Sun, 22 Sep 2024 13:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] linux-user: move all remaining archs to syscalltbl
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Brian Cain <bcain@quicinc.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20240920151034.859533-1-laurent@vivier.eu>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240920151034.859533-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/20/24 17:10, Laurent Vivier wrote:
> linux v6.11 has moved all the remaining archs to syscalltbl,
> update QEMU accordingly.
> 
> Remove scripts/gensyscalls.sh that is now useless.
> 
> Update headers to v6.11
> 
> Based-on: <20240918074256.720617-1-laurent@vivier.eu>
> 
> Laurent Vivier (6):
>    linux-user,aarch64: move to syscalltbl file
>    linux-user,openrisc: move to syscalltbl file
>    linux-user,riscv: move to syscalltbl file
>    linux-user,hexagon: move to syscalltbl file
>    linux-user,loongarch: move to syscalltbl file
>    linux-user: update syscall.tbl to Linux v6.11

Queued, thanks.

r~

> 
>   configs/targets/aarch64-linux-user.mak     |   2 +
>   configs/targets/aarch64_be-linux-user.mak  |   2 +
>   configs/targets/hexagon-linux-user.mak     |   2 +
>   configs/targets/loongarch64-linux-user.mak |   2 +
>   configs/targets/or1k-linux-user.mak        |   2 +
>   configs/targets/riscv32-linux-user.mak     |   3 +
>   configs/targets/riscv64-linux-user.mak     |   3 +
>   linux-user/aarch64/meson.build             |   6 +
>   linux-user/aarch64/syscall_64.tbl          | 405 +++++++++++++++++++++
>   linux-user/aarch64/syscall_nr.h            | 331 +----------------
>   linux-user/aarch64/syscallhdr.sh           |  28 ++
>   linux-user/arm/syscall.tbl                 |   1 +
>   linux-user/hexagon/meson.build             |   6 +
>   linux-user/hexagon/syscall.tbl             | 405 +++++++++++++++++++++
>   linux-user/hexagon/syscall_nr.h            | 348 ------------------
>   linux-user/hexagon/syscallhdr.sh           |  28 ++
>   linux-user/i386/syscall_32.tbl             |   7 +-
>   linux-user/loongarch64/meson.build         |   7 +
>   linux-user/loongarch64/syscall.tbl         | 405 +++++++++++++++++++++
>   linux-user/loongarch64/syscall_nr.h        | 324 -----------------
>   linux-user/loongarch64/syscallhdr.sh       |  28 ++
>   linux-user/meson.build                     |   2 +
>   linux-user/openrisc/meson.build            |   5 +
>   linux-user/openrisc/syscall.tbl            | 405 +++++++++++++++++++++
>   linux-user/openrisc/syscall_nr.h           | 350 ------------------
>   linux-user/openrisc/syscallhdr.sh          |  28 ++
>   linux-user/riscv/cpu_loop.c                |   2 +-
>   linux-user/riscv/meson.build               |   6 +
>   linux-user/riscv/syscall.tbl               | 405 +++++++++++++++++++++
>   linux-user/riscv/syscall32_nr.h            | 325 -----------------
>   linux-user/riscv/syscall64_nr.h            | 331 -----------------
>   linux-user/riscv/syscall_nr.h              |  15 -
>   linux-user/riscv/syscallhdr.sh             |  28 ++
>   linux-user/syscall_defs.h                  |   7 +-
>   linux-user/x86_64/syscall_64.tbl           |   8 +-
>   scripts/gensyscalls.sh                     | 103 ------
>   scripts/update-syscalltbl.sh               |   5 +
>   37 files changed, 2231 insertions(+), 2139 deletions(-)
>   create mode 100644 linux-user/aarch64/syscall_64.tbl
>   create mode 100644 linux-user/aarch64/syscallhdr.sh
>   create mode 100644 linux-user/hexagon/meson.build
>   create mode 100644 linux-user/hexagon/syscall.tbl
>   delete mode 100644 linux-user/hexagon/syscall_nr.h
>   create mode 100644 linux-user/hexagon/syscallhdr.sh
>   create mode 100644 linux-user/loongarch64/syscall.tbl
>   delete mode 100644 linux-user/loongarch64/syscall_nr.h
>   create mode 100644 linux-user/loongarch64/syscallhdr.sh
>   create mode 100644 linux-user/openrisc/meson.build
>   create mode 100644 linux-user/openrisc/syscall.tbl
>   delete mode 100644 linux-user/openrisc/syscall_nr.h
>   create mode 100644 linux-user/openrisc/syscallhdr.sh
>   create mode 100644 linux-user/riscv/syscall.tbl
>   delete mode 100644 linux-user/riscv/syscall32_nr.h
>   delete mode 100644 linux-user/riscv/syscall64_nr.h
>   delete mode 100644 linux-user/riscv/syscall_nr.h
>   create mode 100644 linux-user/riscv/syscallhdr.sh
>   delete mode 100755 scripts/gensyscalls.sh
> 


