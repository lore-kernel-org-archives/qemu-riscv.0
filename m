Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5793CAC598
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 12:19:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uyUe2-0002Q1-N2; Tue, 16 Sep 2025 08:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyUdR-0002MH-Q2
 for qemu-riscv@nongnu.org; Tue, 16 Sep 2025 08:18:16 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyUdN-0007op-2M
 for qemu-riscv@nongnu.org; Tue, 16 Sep 2025 08:18:11 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e970acf352fso3455008276.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Sep 2025 05:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758025083; x=1758629883; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UTDtJEvR6NjQKi2r1wnxsnhhmQxrPbHge+HLrt7fbZk=;
 b=FPJzfXhslm3Ue+n5d4BBPUrVQw8Kj3UiP6Xf6ld9hFgb9VpxBhPF29bkVC7EiU0Uxl
 qgXLWMvIhLCLFYi4IuyDzaB9A71RBx5UCbqYIy8n/EZYGWvDB+oyrFPeYh04yEQmMLhn
 GjTx/bJLjLRmtC9up6XZ/Vm/rhvwg+13/LZNb/v8wYmAOSlu0NSqJ4qKqi2BCuJa3azQ
 FABvZdG0n8Uxjyar9tmx2bGCRHEOJltpms6Y3kOK/vT/ZtXZriQOWYul1kfv983/RQy6
 N1/eE4r1RPRADROmEMO+MtOXDAOTnRsppMGlOQyUZ1ZqbRijOEwJilC+c6sEfue1B2EV
 mIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758025083; x=1758629883;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UTDtJEvR6NjQKi2r1wnxsnhhmQxrPbHge+HLrt7fbZk=;
 b=CoJkVpk3rqp0oQdOz52jgPpGdXdRP0bznJG2bcKUIJVucFYnDj6Z3BEDgUGWIXlIV+
 Om8+n6gCNQmLQ5qIFIduvnuGNAEpCOa9UXTldk+VuSPtHcTlk6ic76Y9KYH4BcDYTYs/
 JVt6cDo6hIkMy7gaklBPrCnymxc6V+QNWqvzZ/Ydc8J6HS67ywqFQVJycNH54EGyughf
 3pIl0LpHxt2w0YwKWsYL6BEtbBa3D9pjYCclgyf7b3JzU12QKBsl3HJOJudP/Rjclhud
 gC8xlWoGeQWfsq7hu0/qwvxaywJkOJDC86Kp7r7Xa2eFHXcOJnuViExU8Ozw9mki9+up
 VQhw==
X-Gm-Message-State: AOJu0YwO6nhztHK8YyEwLErV0LcZpyhsDNw83L4zz0MqkvoFc2RHKprV
 wnQAcp5uhxpL9yYHgxBYznuc0u1Mmwp/vMk3U1PoYx+OWcnw26O4RYz86Y51F+4fwXE=
X-Gm-Gg: ASbGncvscNpoB7f9+B0Wh+iQfEA9l6MS73M2PLpamn/CVrpP5yjt/NKul6rhSNVPle/
 NhmI1m6UqCTnZpZz4/IhyhQ0Dl/Mua+w/YS+yd3pApDBvKI1tJ50IL/djoeeqUGWa90+0fKIcR9
 eBQOJzNi/Sn3glokqzEHvcYIOrA1CM1VQCXyt0qIuz3CNc8TAFnYbfjAuSRz/A8+hY6+yW4RmQJ
 +YkZ38N+Cim/9prAyAIeQLm7X3sagE1oWlnTc8LbI5SGHPdR84yW+zfIZi4rwoPG+MuegBUlvUS
 1ivBJNitw6QdYkyPb8XLZ9GuV3d3sxd7lHVu7vYq63pprPXCamjc0whrtKb9NHdRmxU8xwD6cjY
 CFMKJHJrdZIbyeYsaPFouwe/21zcundkGQ+/VgEISzAn08Ll3
X-Google-Smtp-Source: AGHT+IHaV6dqFK1hodH8pbe52ovPZjz6W9iJiE/ku+9YFwfthIoxwA5orVJfjZepCQS1WjFlkiNLmw==
X-Received: by 2002:a25:6ed6:0:b0:e97:6a:90fa with SMTP id
 3f1490d57ef6-ea3d9c3ac68mr9148304276.51.1758025083497; 
 Tue, 16 Sep 2025 05:18:03 -0700 (PDT)
Received: from [192.168.68.110] ([179.225.245.173])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-ea576bb11absm794446276.12.2025.09.16.05.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 05:18:02 -0700 (PDT)
Message-ID: <0308d67a-7675-4eed-b85f-b6e7bae553f9@ventanamicro.com>
Date: Tue, 16 Sep 2025 09:17:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] target/riscv: Implement SMSDID and SMMPT extension
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com
References: <20250909132533.32205-1-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250909132533.32205-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2b.google.com
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

Hi!

On 9/9/25 10:25 AM, LIU Zhiwei wrote:
> This patch set introduces support for the RISC-V Smmpt (Supervisor
> Domain Access Protection) extension. It only includes two sub-extensions:
> SMSDID and SMMPT.
> 
> This patch set implements the v0.3.4 version of Smmpt
> (https://github.com/riscv/riscv-smmtt/releases/tag/v0.3.4).
> 
> As there are newer SMMPT specification versions, this patch set is
> not intend for merging.

I'm not sure I understood. Do you mean this patch set isn't supposed to be
merged?


Daniel

> 
> The implementation is broken down into a series of logical steps:
> 
> Patch 1 adds the fundamental definitions for the Smmpt extension,
> including
> new CSRs (mmpt, msdcfg), their bit-field layouts, and the corresponding
> CPU
> configuration flags (ext_smmpt, ext_smsdid).
> 
> Patch 2 introduces the core logic for Memory Protection Table (MPT)
> lookups.
> It includes a new file, riscv_smmpt.c, which implements the multi-level
> table walk to determine permissions for a given physical address.
> 
> Patch 3 integrates the MPT permission checks into the main MMU and TLB
> handling pathways. This ensures that both page table walks and final
> data accesses are subject to Smmpt protection rules.
> 
> Patch 4 adds support for the new fence instructions defined by the Smmpt
> extension, specifically `mfence.spa` and `minval.spa`.
> 
> Patch 5 enables smmpt and smsdia extendion.
> 
> With this series, QEMU can now model systems that utilize the Smmpt
> extension for enhanced memory security.
> 
> LIU Zhiwei (5):
>    target/riscv: Add basic definitions and CSRs for SMMPT
>    target/riscv: Implement core SMMPT lookup logic
>    target/riscv: Integrate SMMPT checks into MMU and TLB fill
>    target/riscv: Implement SMMPT fence instructions
>    target/riscv: Enable SMMPT extension
> 
>   target/riscv/cpu.c                            |   4 +
>   target/riscv/cpu.h                            |   9 +-
>   target/riscv/cpu_bits.h                       |  27 ++
>   target/riscv/cpu_cfg_fields.h.inc             |   2 +
>   target/riscv/cpu_helper.c                     |  81 +++++-
>   target/riscv/csr.c                            |  83 ++++++
>   target/riscv/insn32.decode                    |   2 +
>   .../riscv/insn_trans/trans_privileged.c.inc   |  30 ++
>   target/riscv/meson.build                      |   1 +
>   target/riscv/pmp.h                            |   3 +
>   target/riscv/riscv_smmpt.c                    | 273 ++++++++++++++++++
>   target/riscv/riscv_smmpt.h                    |  38 +++
>   12 files changed, 548 insertions(+), 5 deletions(-)
>   create mode 100644 target/riscv/riscv_smmpt.c
>   create mode 100644 target/riscv/riscv_smmpt.h
> 


