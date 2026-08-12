Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B32C5B572
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 15:15:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuAeL-0003qr-V0; Wed, 12 Aug 2026 11:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuAe8-0003Pk-2L
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 11:13:36 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuAe6-0006Z5-8D
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 11:13:35 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-84e84a6c4bfso1151119b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 08:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786547612; x=1787152412; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WZgfMBS2gc4uR2iYOICvH1C3kGfwanSdyD0m1/rVEZk=;
 b=DgDz2412Nvdg/ou2DP8HnChrr+BEm4gtaqDAV7kLbCKqhQwVuSPmmzA9MJiYa354K+
 C+R9XC2jBKzu2+GbYZAK37FngKYLccLVV/q7Yxyvbv3ah+8gcuO25laEvOOA0iqTG1Yh
 UIPltRPif6bTR1fuPxpZa21qfExqLDyQCWx+CoGN0e34gwiAtCouL+2hdX/NScwAxIMN
 ZKAAy2/zeYWAwurQ12aXfmIF/q2ad1EB3jTj91QTaGDX2ETr3mXAT65B/Soe+8QYiQR6
 ILH7x1xTUgzTu7wNlACH0hVxnGMUG6Cb/9FEnTiimle5O+koBZP//hp+F6MfIzV/FgMQ
 QPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786547612; x=1787152412;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WZgfMBS2gc4uR2iYOICvH1C3kGfwanSdyD0m1/rVEZk=;
 b=CdD0pnpq1CTKV27hJtLRea0Tyh8t3hStRX/aLCCAfMp/FLoRudhXusYwr01UmwdA0S
 6DEaPHgKsYRzbtvjGw2DhxuNBr1PxDISoMBhR1XdGNX7ibZ3ytLwG98BzFeLxwNNnrvO
 sQ48yW46RkDSqDpAtfhnifodeWjIg+LC6FnSOsTDqpgh/Xb2JzAm6kfUcxujuJcEKD3A
 XfPElPawKnjh+Og3SNvjnNOBUs7ZEZrBOy9p6Q4RfRJICUzSU97flhnR+kVySwh44zfI
 JbarEukHhBsBny3WyF+FCSHwTAwhmf+TDGX4jxsUaSWTc2sYUuw10mMfvYQFrLD+VzvP
 1SBA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrI1krZY23mftm6L1VRQJC2c62GZB78A/VoYr3Au7m2IZ/lz36pNd5DczNeg+6+qUzghmPzg0wTnAYc@nongnu.org
X-Gm-Message-State: AOJu0Yz0qek6WyL1tEwkAZ3ig89W1gc6iCEZ6cj1GZOJnuoA6CVQ9/Xc
 xtFALMFYIRhvPet0a459rZiTD/8asz1hgS59ytHQo54nbr8FfFsTBlhY1WeY5cYJX2wNU26kRyB
 mVFledyg=
X-Gm-Gg: AR+sD12Uegk11SBtaaqUFj+2KWnPZM7uD3uPF0hla18m22M5NSZj1XTyw/rlK4g6d0J
 5Gw2leWYyHXEj+O4Tihv6VeR0fkKXu3QbnrsH7uiGil2NvAmpKdL5hCPL4IyynRl6phP3Caa1Zd
 tb7+Amd8bC+3TzOZKXePtdKjJ+DhqWnOzSG1HaBax0009XxxCE9v7OcEnMPSNf6Qh5HSLzeGEHj
 TQgHDpvCZ5r6OtCYvK5PBxfR7j/EoF/NzcioT8RdLo4rQbu8g7lg/NYgTe7eJlA/M2zQMN9MrbD
 YhpBYZ3EA2c6/elmDbBSAkn7PaiiNGleqrPSKM/LN19AbeKm8ZHfXedcUIDwe24Q4Ae6T7kF4x+
 bU7rDhMGtU9q2uFie7YTz4IYh9oNDbFYvd/1DCl0olqVCNATGvWrVJ5k11KvZWeGGmN0SJA/ga3
 pEjNviP6mW715l04fPQ3fwbEnm5Zr801eG+KXOFuzuyyxg8wc771+asij4KbusiV4nIo3jDfOzD
 HQVJ3tpJMUynMStQlv9qVP7cENaTecLZI8=
X-Received: by 2002:a05:6a00:987:b0:845:3033:6cbb with SMTP id
 d2e1a72fcca58-84fafae81e3mr8762256b3a.11.1786547612164; 
 Wed, 12 Aug 2026 08:13:32 -0700 (PDT)
Received: from sifive.com ([136.226.240.165]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fb1f71ee5sm1197674b3a.57.2026.08.12.08.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 08:13:31 -0700 (PDT)
Date: Wed, 12 Aug 2026 23:13:27 +0800
From: Max Chou <max.chou@sifive.com>
To: Zephyr Li <fritchleybohrer@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
Subject: Re: [PATCH v3] target/riscv: preserve vl on element-zero fault
Message-ID: <anyNHaPM7jwM-a1w@sifive.com>
References: <20260811025516.337888-1-fritchleybohrer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811025516.337888-1-fritchleybohrer@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x430.google.com
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

On 2026-08-11 10:55, Zephyr Li wrote:
> A unit-stride fault-only-first load must leave vl unchanged when element
> zero raises a synchronous exception. Keep the shortened value in a local
> bound until all loads complete, and only then update the architectural vl.
> 

The failing case is a corner case. When the element-0 faulting probe in
vext_ldff() faults, it longjmps out of the helper, ProbeSuccess is never
reached and env->vl is never touched -- that path was already correct.

The broken path is element 0 in a mapped MMIO page: probe_access()
succeeds there, but QEMU cannot know a device transaction will fail
without issuing it that broken the assumption of the pre probe_access()
checking.

> --- /dev/null
> +++ b/tests/tcg/riscv64/test-vle32ff.S
...
> +     vsetvli t2, t1, e32, m1, ta, ma
> +     li      t0, 0x18000000  /* Unmapped gap in the virt memory map.
> */

Actually it is not unmapped -- it is mapped as unassigned MMIO, and that
is exactly why the bug reproduces: an unmapped address would make the
element-0 probe fault and the test would pass even with the bug present.


I think the fixed vext_ldff implementation is valid according to the
RISC-V specification, considering the VL reduction rule and the
non-idempotent constraint. Only the test case wording and the root
cause explanation may need to be updated.

As for the patch:
Reviewed-by: Max Chou <max.chou@sifive.com>

