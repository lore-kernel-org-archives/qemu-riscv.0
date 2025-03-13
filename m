Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA37C35FF3
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:44:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsleO-0000wO-U5; Thu, 13 Mar 2025 12:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tsldw-0000Vn-TM
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:42:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tsldr-0006yN-7U
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:42:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-224191d92e4so25669785ad.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741884162; x=1742488962; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mEeJf1jLjksxcxRMyFkwRUHHzj+nso1co+jY2XBogVQ=;
 b=h7IE25xyF079srpEyzVJxHcMLkXWdIrROVJAD/ew2DpGDoPrOb1e78NSesPsx+ba6S
 aU+z6EptVCfbMv6alnEtBjkKNZmrKCo3pgqxtJ1Ikicyc0o0k+otwFxTLrk80BYDH/fU
 RCCSNPCJI1YaJ89C0QEpDwJzwOshBcVDr+5it/LnCHwWcHn7Uk8PJ8+g82A9MOU9NLxC
 V0HCew+XF0ftP0auHUy9JQUqH22/GikipgK5xpNRHCz6bcW6/wbzeELvBuQUkIxfpSVf
 w6nY2A2Y6F/6JKUFS/E8oZAhP8gtXYdoQ1Fk2GZC6Crrn/lGSnABF7WY1NrGfzesUZv+
 avOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741884162; x=1742488962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mEeJf1jLjksxcxRMyFkwRUHHzj+nso1co+jY2XBogVQ=;
 b=K3U4ZSDTM4Gzvy12q0iERP0LCqvn89/GZFwMitefllHBpVJWcPF1wvEGCXo7fsNYC/
 WqTBGYdI4x+vgOURobmNshXEx8lVvk6JwN2Wjh4St6si9eyvjYO8CmltCzUwwHeokz4A
 O184LbceTjaIYhUskcaNDOSKOCLTgicy9EYqv14xTF1CsouqNm3SS4ixk34ubpxoiKU2
 4Sjw+/AvjY2T0XLlUWMW8PLwpoaYmudiR9+wbWMt7lg6zT9Dt1GiZPWtDRC7oCBEg/Iw
 kAUvb/f+acgPh9J5ICwsN7XSSMvAwkMknntcLKp+xDdsB23hR8A9XlR/LQrY0a6hzzLl
 VxyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi8FYbEaeBOYrKb9DyHcjLiYAas7MejGNyN47Zmv9O6KVbU6mSAMYZLQfue++Zt9F5/Mrdxtwj9wlO@nongnu.org
X-Gm-Message-State: AOJu0Yxfzu0sF3UjBrWEgAfe6DR7aT7Zs5qA8HZR8ZAsJY79oZaojKiV
 TUgi2V/OcY1vszobORPJkOPx+ySOGRRmoegbuaf+2U0S+C45flzkV74iB7o3+L4=
X-Gm-Gg: ASbGncswNMpbfnj4rmNTyxONTmtJxk3QmiHlH/WxG+4o/0bkgsuThRNnopR8xasHiT/
 XSFZA7d1uUB9M/e+0sqxm6PTY19UgOiO0oHgeax6KBqJd3kzGqtMCpQBGyce7VYe5myPy8jfYsb
 b3tqlUDf4hhK3M1nbJS/piTjvP7+qS5/EqcPX3N0clA71RZra3Bg0AkijSj6K7v+fgKXXFIyBxL
 FYnNyx6KQ5MJmOhsa71iu2+FdWShu7bs38f85Z85uly0l1kxug7+3Fhzbi/ILtIvO4vhdd1G3AU
 rsYbPwn7LODa09f793pm7HKXBcep9w8Zes41wUcBrb31FlmWwINTRJBmGQ==
X-Google-Smtp-Source: AGHT+IEscFPBgwURkivERQ63uZlHCc12XioxFkzuW02QWXVxwQASklk7TdMNVKzsKRLZFS0yvJdJJg==
X-Received: by 2002:a05:6a00:1891:b0:736:a682:deb8 with SMTP id
 d2e1a72fcca58-7371f0d35cfmr310216b3a.8.1741884161761; 
 Thu, 13 Mar 2025 09:42:41 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371169c3desm1537504b3a.155.2025.03.13.09.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:42:41 -0700 (PDT)
Message-ID: <9cef5cb6-feea-4be7-ab08-e0b3a8caff9c@linaro.org>
Date: Thu, 13 Mar 2025 09:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] make system memory API available for common code
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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

Hi,

patch 12 (adding xen stubs, so would need someone from hw/xen) and 15 
are missing reviews.

Thanks,
Pierrick

On 3/13/25 09:38, Pierrick Bouvier wrote:
> The main goal of this series is to be able to call any memory ld/st function
> from code that is *not* target dependent. As a positive side effect, we can
> turn related system compilation units into common code.
> 
> The first 5 patches remove dependency of memory API to cpu headers and remove
> dependency to target specific code. This could be a series on its own, but it's
> great to be able to turn system memory compilation units into common code to
> make sure it can't regress, and prove it achieves the desired result.
> 
> The next patches remove more dependencies on cpu headers (exec-all,
> memory-internal, ram_addr).
> Then, we add access to a needed function from kvm, some xen stubs, and we
> finally can turn our compilation units into common code.
> 
> Every commit was tested to build correctly for all targets (on windows, linux,
> macos), and the series was fully tested by running all tests we have (linux,
> x86_64 host).
> 
> v2:
> - reorder first commits (tswap change first, so memory cached functions can use it)
> - move st/ld*_p functions to tswap instead of bswap
> - add define for target_words_bigendian when COMPILING_PER_TARGET, equals to
>    TARGET_BIG_ENDIAN (avoid overhead in target code)
> - rewrite devend_memop
> - remove useless exec-all.h in concerned patch
> - extract devend_big_endian function to reuse in system/memory.c
> - rewrite changes to system/memory.c
> 
> v3:
> - move devend functions to memory_internal.h
> - completed description for commits removing cpu.h dependency
> 
> v4:
> - rebase on top of master
>    * missing include in 'codebase: prepare to remove cpu.h from exec/exec-all.h'
>    * meson build conflict
> 
> Pierrick Bouvier (17):
>    exec/tswap: target code can use TARGET_BIG_ENDIAN instead of
>      target_words_bigendian()
>    exec/tswap: implement {ld,st}.*_p as functions instead of macros
>    exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
>    exec/memory_ldst_phys: extract memory_ldst_phys declarations from
>      cpu-all.h
>    exec/memory.h: make devend_memop "target defines" agnostic
>    codebase: prepare to remove cpu.h from exec/exec-all.h
>    exec/exec-all: remove dependency on cpu.h
>    exec/memory-internal: remove dependency on cpu.h
>    exec/ram_addr: remove dependency on cpu.h
>    system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for
>      common code
>    exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
>    hw/xen: add stubs for various functions
>    system/physmem: compilation unit is now common to all targets
>    include/exec/memory: extract devend_big_endian from devend_memop
>    include/exec/memory: move devend functions to memory-internal.h
>    system/memory: make compilation unit common
>    system/ioport: make compilation unit common
> 
>   include/exec/cpu-all.h              | 66 -----------------------
>   include/exec/exec-all.h             |  1 -
>   include/exec/memory-internal.h      | 21 +++++++-
>   include/exec/memory.h               | 30 ++++-------
>   include/exec/ram_addr.h             | 11 ++--
>   include/exec/tswap.h                | 81 +++++++++++++++++++++++++++--
>   include/system/kvm.h                |  6 +--
>   include/tcg/tcg-op.h                |  1 +
>   target/ppc/helper_regs.h            |  2 +
>   include/exec/memory_ldst.h.inc      |  4 --
>   include/exec/memory_ldst_phys.h.inc |  5 +-
>   cpu-target.c                        |  1 +
>   hw/ppc/spapr_nested.c               |  1 +
>   hw/sh4/sh7750.c                     |  1 +
>   hw/xen/xen_stubs.c                  | 56 ++++++++++++++++++++
>   page-vary-target.c                  |  2 +-
>   system/ioport.c                     |  1 -
>   system/memory.c                     | 17 ++----
>   target/ppc/tcg-excp_helper.c        |  1 +
>   target/riscv/bitmanip_helper.c      |  2 +-
>   hw/xen/meson.build                  |  3 ++
>   system/meson.build                  |  6 +--
>   22 files changed, 193 insertions(+), 126 deletions(-)
>   create mode 100644 hw/xen/xen_stubs.c
> 


