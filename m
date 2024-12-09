Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A32E7717D
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 20:20:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tKkFE-00026f-T6; Mon, 09 Dec 2024 15:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tKkFD-00026N-ON
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2024 15:20:39 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tKkF9-0001Qv-HK
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2024 15:20:39 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-725c86bbae7so2582439b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Dec 2024 12:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733775633; x=1734380433; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rAQeQybcjmL2LhmKY9LXFhXODI3/drzMo4MDl5jvGjk=;
 b=bzMQODJbjd9v8e89NTnPwew7BLXpjQwYY5JvXxWoFQt6bv6KUte5IRYqwmXx3ZwwP+
 Lao8lwEIZNcjjUcnj0vpon65N7X5vylUZC7rrrHpLTI3bnpCrC9SXd+kJp9ye97Sqgzc
 i8hXJtPzKWbrs1ktM7NUKWbIiPdrQ6zt6MuYrYG9j32TAh9P8NUFrkh/VNt50LfKQvul
 poc5lTp2bGXlKMS/j7yz8rz53eSOdzl5Gixg0rUJXIhjh9LRQk3SEw0xmIrBIoMfPGHo
 rY4Bpxusyb7JQu7zHgxFwXJzlOwfu1rGRqHWwxN40vjCJdMGVkRI+yLDQxmphKXJorMc
 iMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733775633; x=1734380433;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rAQeQybcjmL2LhmKY9LXFhXODI3/drzMo4MDl5jvGjk=;
 b=QHJyJO/Lm6mHZ4+RLxiMPKkH3Sxol6pXG+1RKX/3e5FRzRieYDe+TRGfIL7eg8kYPi
 vITsJU95U9vowdtY6M+gJEeWEf/OPutAWoXqmadiJ71b2j3jSkm+EJxL2cM+XEvNYgZN
 LS/D9tPa95psuY5QUVzUZiqJm0JI7UPCg/JoXe+pALQMApBKGn/qqtA/2TIja858mBLh
 2lw8NgE75hyVXWw55JcTXYe4yqpR2XHTza88/RY4sFd2eM9CUO9eQagVFMO8JcS2gSq4
 r7kDgQWe7hA2o1N/lJiK21fPSoe97Md2AGIBjoHPP1s85ZOuYtOWzYB1lQP/I9dCkmZZ
 jHPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX83LT/Lltl/eQ8+Y0Of5G44P+Gjq7+TDSh9h43dZL1/3ymt3RoR8wc6irL7Lxa4Kz2BoYmFfd+v5bf@nongnu.org
X-Gm-Message-State: AOJu0YyXt3msJ208qONGXTHKX8E47SToGjnecrZz++Hd/mEnAi2xTgfz
 yYh5vEblbGsBHgTFy8TT1L9IbZu+/3BT+4YDjmNnO6ihGOQV9xj28wNWZQOzI+k=
X-Gm-Gg: ASbGncvDi7jjFC8ckAv2AEHSS4q0zjG60qT2b4F8C8dw5+aBMsa248Vg1X/XZecykmy
 Lp57mg/M8g65aEo2Zn9wfmN++SVV0VPl6ijqnn3KgafW1GYrFWzn4Ya6zbeCcFxqDtS0FlRmnN+
 1hCXJl7XlXxxx0c/SIwnC0HU9cXSuvz3CmSbRwQVtqpxSzBG9IWuK1AWQuLxCpHtpsUcJyaXcXd
 GQy7o96f8GIxkQWTDIKcz3NhECrnkjepwgO7Pyn6Yhbnf4gW/rZ1auekw188j/FrrB/PWd2GGCG
 r7qqKbrSwo07zl4CkH8NRoGYVfQ=
X-Google-Smtp-Source: AGHT+IGWUVS/GyHOG91N6Tbm/Fn1MyJb3bpBNhRzuqgbKtyxFqwzQbKc7rUoX65fDUQFAmcASWN6Dg==
X-Received: by 2002:a05:6a21:32a8:b0:1e1:9893:9a1a with SMTP id
 adf61e73a8af0-1e1b1baeb1fmr3547851637.46.1733775632934; 
 Mon, 09 Dec 2024 12:20:32 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:b984:11b:9da2:696:f7f6?
 ([2804:7f0:bcc0:b984:11b:9da2:696:f7f6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd157d2bf4sm6779715a12.74.2024.12.09.12.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 12:20:32 -0800 (PST)
Message-ID: <193da3eb-0941-490d-aa87-a12385eaca1f@ventanamicro.com>
Date: Mon, 9 Dec 2024 17:20:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/2] Add RISC-V Server Platform Reference Board
To: pbonzini@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, andrei.warkentin@intel.com,
 shaolin.xie@alibaba-inc.com, ved@rivosinc.com, sunilvl@ventanamicro.com,
 haibo1.xu@intel.com, evan.chai@intel.com, yin.wang@intel.com,
 tech-server-platform@lists.riscv.org, tech-server-soc@lists.riscv.org,
 atishp@rivosinc.com, ajones@ventanamicro.com, conor@kernel.org,
 heinrich.schuchardt@canonical.com, marcin.juszkiewicz@linaro.org,
 wu.fei9@sanechips.com.cn
References: <20240312135222.3187945-1-fei2.wu@intel.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240312135222.3187945-1-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

As some of you already noticed the Intel email from Fei Wu is no longer active. With
Andrei's help we were able to contact Fei Wu in an alternate email,
wu.fei9@sanechips.com.cn.

I talked with Fei and offered my help to keep this work going forward. We decided
that I will be sending new versions of this work, keeping Fei's authorship using
the fore-mentioned email, while keeping the original Intel signed-off-by tag.

As for the series per se, in patch 1 a dependency on RVA23 was detected. I have
RVA23 patches that are dependent on the upstreaming of the Zjpm pointer masking
series, together with the "Sha" support that is already queued. As soon as RVA23
is sent I'll post a v3 of this series. With luck we might have something later
this month, but most probably we're talking about January 2025.


Thanks,

Daniel

On 3/12/24 10:52 AM, Fei Wu wrote:
> The RISC-V Server Platform specification[1] defines a standardized set
> of hardware and software capabilities, that portable system software,
> such as OS and hypervisors can rely on being present in a RISC-V server
> platform. This patchset provides a RISC-V Server Platform (RVSP)
> reference implementation on qemu which is in compliance with the spec
> as faithful as possible.
> 
> The reference board can be running with tag edk2-stable202308 in
> upstream edk2 repo[2].
> 
> The qemu command line used:
> 
> $QEMU -nographic -m 4G -smp 2 \
>      -machine rvsp-ref,pflash0=pflash0,pflash1=pflash1 \
>      -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd \
>      -blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd \
>      -bios fw_dynamic.bin \
>      -drive file=$BRS_IMG,if=ide,format=raw
> 
> Since there is no ACPI table generated in this new machine type, a
> corresponding EDK-II platform (WIP) is needed to provide related ACPI
> tables.
> 
> For testing purposes only, we used a workaround to generate the ACPI
> tables in Qemu with a dedicated downstream patch.
> 
> [1] https://github.com/riscv-non-isa/riscv-server-platform
> [2] https://github.com/tianocore/edk2.git
> 
> 
> v2:
> - move cpu definition the 1st patch
> - replace sifive_test with power reset syscon
> - add versioning scheme to fdt
> - integrate recent changes in virt.c
>    - use g_autofree
>    - create_fdt/finalize_fdt
>    - riscv_isa_write_fdt
> - some cleanups
> 
> 
> Fei Wu (2):
>    target/riscv: Add server platform reference cpu
>    hw/riscv: Add server platform reference machine
> 
>   configs/devices/riscv64-softmmu/default.mak |    1 +
>   hw/riscv/Kconfig                            |   12 +
>   hw/riscv/meson.build                        |    1 +
>   hw/riscv/server_platform_ref.c              | 1276 +++++++++++++++++++
>   target/riscv/cpu-qom.h                      |    1 +
>   target/riscv/cpu.c                          |   61 +
>   6 files changed, 1352 insertions(+)
>   create mode 100644 hw/riscv/server_platform_ref.c
> 


