Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442EEC54F51
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:43:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wozso-00039y-5X; Wed, 29 Jul 2026 04:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wozsm-000391-2U
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 04:43:20 -0400
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wozsk-000061-6E
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 04:43:19 -0400
Received: by mail-pj2-x0b.google.com with SMTP id
 98e67ed59e1d1-38de693676dso429819a91.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785314596; x=1785919396; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=a11+Cc8dmhp1fC2pGOY46Z24KBM2/GScbvitZXzd2iA=;
 b=XIHvfzpNNzBOiLd2fX85stZe4CSSemtzoeH0O3P0XGrE8ETbCUEHIe46nd5V5+Y0TI
 612797MTkQazdAdbdJknmKgRA6aS29IGbCSIoCD6G4BiAEmZtNncA2O91qdSUJ/kRA3h
 gBBZCPKcFB5pw+cquIFMElSBVz4CdStUYRY4nrYHJSghy5GLJDPabkoqrcvObiahr/5/
 ICs3jPQqqdohcKvvdsCWxrbQc4glsbfQYf3j2pq2f2is4CSgPRHkOHdzuURKTVxJKXch
 wwXqlVQYGPurSWFcN56ty+Il+iEXm8W+uE8NSaOtfn0zU2IKDPNq/fjMzLTz5FzsJcjk
 dLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785314596; x=1785919396;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a11+Cc8dmhp1fC2pGOY46Z24KBM2/GScbvitZXzd2iA=;
 b=S+SjpDwHDHXFOQCvLFfQnMN0VMhK2A6jQksZaY4dy5lGEuRbmrRq866s9apNUlWsdD
 Z3vh9342wx7vDpOzMLVHAh4ojxCxmdOBha1rZ12N2ugirG/9ulOghrocJ4h1O2WeK56h
 13xaoRPLG+WK4QlIQy1wn2rnGk+s4tjJvLD+PaAuZPpJGv+BpWg+IF64XWxXmyJ5diNW
 ySa4nVjabDhPTSBwp3u0OhylEx3hgXydgxi7IWHWrGZZVU+wXdL8Dd1dEpOE03HpEmS+
 l852AGsJRbApDUa68uHbaFlFtkwP6bj92AkUyjf6y1fkVFTEGP0w8Iz8Xj+dsp7xGa+x
 GDgA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp1WdbBKnINRYjK341yygPlGyMhaqx32wD8s2KsJqsjK8jp/xWmFjeQDKV3ICL4/DYDRxlKPhXdqb6W@nongnu.org
X-Gm-Message-State: AOJu0YyVLiiQqP20m7/y074h6XSRUIURwv/xxw3Wx2Dk/NOtIhm3CUPJ
 QK23Sl93XSAUCODc8cSDjHwklcGtbI/+Jn0Uydqm80ZK07/DTNMoOG3h
X-Gm-Gg: AR+sD11CxqlvgnEj726/PpuPiH4VmKb7FDnK0fJpgnwoKdL1c3vB3z6YXZ3vzLPwTYS
 G74x0/3f9dSCXfi2Eac4NL+GeyU73hA0Fay7nxTIWjLHTqfw5gKurs8exF4gCG1p7M4UZwrJIhD
 uBH9qiuWWzJmG1WgNLenstGZMa2uKHMr52Xl8Tos5aAN6IA8v/3F0BxYtSWGJ6ZPmvwwEQ31dHO
 lIPRor+ZujUloS3SYmmX3bxLWM8HIEr624O5vBRm6N+uBkb3FIz0kzRl9SpjUMA4hYgX8rjwrwg
 5nuw9ZVvovND1/9SEhRSUWdN0IRd2GdDa99dtM/GLutLyN4lfm6YxEtawOEfJcN6AJxlSb+Aq2a
 0Ok/U6FAy2Dhs3fMIRV3dcdzIIatMHnEXIRJRdq2sR3PoybR5g2ABnhKgcr5EftTOPd+aXzZwc8
 iKuf224nW6WVteH+37OvBZpJ218rTA6KTHAZP33tSDd8/BqJIjafQJa/YtTUHCv1bc/00Q6Dcah
 sFXtYuH2K0WHWeSHIzINrJZyM0=
X-Received: by 2002:a17:90b:5868:b0:38e:a74:dfe4 with SMTP id
 98e67ed59e1d1-38f6a422e0fmr6344902a91.25.1785314595929; 
 Wed, 29 Jul 2026 01:43:15 -0700 (PDT)
Received: from localhost ([179.255.148.148]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31504b1246dsm6884142eec.2.2026.07.29.01.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 01:43:15 -0700 (PDT)
Date: Wed, 29 Jul 2026 16:43:11 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Molly Chen <xiaoou@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/18] target/riscv: Add support for RISC-V P
Message-ID: <amm8EfJjG7VdgS8C@ChaodeMacBook-Pro.local>
References: <cover.1784280142.git.xiaoou@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784280142.git.xiaoou@iscas.ac.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:39::b;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-pj2-x0b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Molly,

On Fri, Jul 17, 2026 at 10:06:53AM +0800, Molly Chen wrote:
> This series adds support for the RISC-V Packed SIMD (P) extension.
> 
> The P extension defines packed-SIMD fixed-point operations intended
> for DSP-style workloads such as multimedia and signal processing.
> These instructions operate on packed subword elements within
> general-purpose registers (GPRs).
> 
> The implementation follows the current development draft of the
> specification (v0.20):
> 
>   https://github.com/riscv/riscv-p-spec/
>   or
>   https://www.jhauser.us/RISCV/ext-P/
> 
> Compared with v1, this version reduces implementation boilerplate by
> defining and reusing helper macros for common patterns in
> trans_rvp.c.inc and psimd_helper.c. It also consolidates the P
> extension prerequisite validation in riscv_cpu_validate_p().
> 
> The Zbkb dependency has been removed to align the implementation with
> the current specification. This version also implements the
> specification-defined control of vxsat, which was missing from v1.
> 
> All instructions have been functionally tested using the following
> test suite:
> 
>   https://github.com/mollybuild/qemu-riscv-test-uart
I believe we need to add some TCG test cases for the patches if
the latest compiler supports the P extension, we can add some cases
similar to your repo.


Thanks,
Chao

> 
> The implementation focuses on functional correctness and ISA
> coverage. Performance optimizations were not considered at this
> stage.
> 
> Feedback on the implementation details would be highly appreciated.
> 
> Tested with:
> 
>   - ninja -C build test
>   - make -C build check-qtest-riscv32
>   - make -C build check-qtest-riscv64
>   - Functional tests for all P extension instructions using
>     qemu-riscv-test-uart
> 
> No regressions or test failures were observed.
> 
> ---
> Changes in v2:
> 
>   - Refactored trans_rvp.c.inc and psimd_helper.c by defining and
>     reusing helper macros for common implementation patterns, reducing
>     boilerplate and overall code size.
>   - Moved the P extension prerequisite checks into
>     riscv_cpu_validate_p().
>   - Removed the Zbkb dependency to align with the current
>     specification.
>   - Added the specification-defined vxsat control mechanism, which was
>     missing from v1.
> 
> v1:
>   https://lists.nongnu.org/archive/html/qemu-riscv/2026-04/msg00301.html
> 
> Molly Chen (18):
>   target/riscv: Add packed SIMD extension state
>   target/riscv: Add packed SIMD helper framework
>   target/riscv: Add packed SIMD arithmetic instructions
>   target/riscv: Add packed SIMD averaging and rounding instructions
>   target/riscv: Add packed SIMD absolute, difference, compare and mask
>     instructions
>   target/riscv: Add packed SIMD shift instructions
>   target/riscv: Add packed SIMD exchange instructions
>   target/riscv: Add packed SIMD horizontal reduction instructions
>   target/riscv: Add packed SIMD pack, merge and count-leading
>     instructions
>   target/riscv: Add packed SIMD multiplication instructions
>   target/riscv: Add packed SIMD multiply-accumulate instructions
>   target/riscv: Add packed SIMD Q-format multiplication instructions
>   target/riscv: Add packed SIMD Q-format MAC instructions
>   target/riscv: Add packed SIMD two-way MAC instructions
>   target/riscv: Add packed SIMD four-way MAC instructions
>   target/riscv: Add packed SIMD load-replicate instructions
>   target/riscv: Add packed SIMD RV32 only instructions
>   target/riscv: Remove Zbkb dependency from P extension to align with
>     the spec
> 
>  target/riscv/cpu.c                          |    5 +-
>  target/riscv/cpu.h                          |    8 +
>  target/riscv/cpu_bits.h                     |    2 +
>  target/riscv/helper.h                       |  529 ++++
>  target/riscv/insn32.decode                  |  829 +++++
>  target/riscv/machine.c                      |   19 +
>  target/riscv/tcg/csr.c                      |   39 +-
>  target/riscv/tcg/insn_trans/trans_rvb.c.inc |    4 +-
>  target/riscv/tcg/insn_trans/trans_rvp.c.inc | 1389 ++++++++
>  target/riscv/tcg/meson.build                |    3 +-
>  target/riscv/tcg/psimd_helper.c             | 3165 +++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c                  |   46 +
>  target/riscv/tcg/translate.c                |    6 +
>  13 files changed, 6038 insertions(+), 6 deletions(-)
>  create mode 100644 target/riscv/tcg/insn_trans/trans_rvp.c.inc
>  create mode 100644 target/riscv/tcg/psimd_helper.c
> 
> 
> base-commit: 8fb307591625731060d399aca42373c02c7cb040
> -- 
> 2.34.1
> 

