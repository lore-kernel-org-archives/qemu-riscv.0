Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A00C0015E
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 09:22:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVqFw-0002Q3-Fu; Tue, 15 Aug 2023 05:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qVqFu-0002PY-7M
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 05:22:26 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qVqFr-0001L1-7r
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 05:22:25 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a78a29bca3so4117674b6e.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692091340; x=1692696140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fm6/O5y3HgT0Ea888HEJq+k+zOfc+AWGyhnZtTQK4ao=;
 b=GzX2tHOpqTP2BEUxBIPw4hgmczldqPe4sLyQO2OUyVVs7GC9RMBJGTNFP3FZN/eir4
 G/lx/WCCq2b6zLSmQVMSIQ2OLsqU7pQSwJt6D97cFih79iV1NcBeFghxRMnD549DTYJz
 d/bQ+yyJ6ob+tWh9W5BukXHI/8E6+6cxsMjZA9kZuxvhvO3enYPPc2GwAAyjVlZoBg/W
 g4mE6rnnuQkMVYwpWZpZQqU9YsOudkMSDWfLyhAPvPslg8viivhDMZ+yeP5YgyaExWGj
 a0eCXFLUd7lDIWCXp3wFAboozQzdZqDJUshMBgAOELFcMGGssaSq/nsKg8hv4eGbHKO5
 mDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692091340; x=1692696140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fm6/O5y3HgT0Ea888HEJq+k+zOfc+AWGyhnZtTQK4ao=;
 b=kiEAMUafpuxITG6T8xDkpbo+AVNYLxOIzhPdzyE/97xzcixf8+jd1Pkk9MIohsBruX
 AIZNQH7IbGKM9W+Aht4M7q8jZX+CQOp8MoIr5IShX2+DDLnVMDu0uuyeD8w2pmIkMOJV
 zg8rYPATHyBj1EWVOv3ZL+ZeXybEHTug7DPUrei8eEJJf3E4bdqze/uDDE1q5LbUfxTs
 QnnwodH2MY43Nmd0l5CNch3s0gtkuwkgFHfEb8Hj0xYjJbg186q71vJrCEJzKQ4SkFgG
 ofCq4c3hRwEFzcUyCjNnzHmkzP42Rn3LtvjAnP3OJ3YTMeoSJWH98aUFckj4bp1bVi9t
 /YJg==
X-Gm-Message-State: AOJu0YxYMSbM0eLe4ESgvvAM/pils+BDGhzFBTbRqXQ1h/ErphMK3WlD
 RApB45ROKtZ0OhA5Ori469o+gQ==
X-Google-Smtp-Source: AGHT+IFT+sSuUjkcnmtJrDnxLolu0Ofv0TzYvQMD5Sa/375x4PoM8B30Qap+H/TOsdgoMFhVMDJzKQ==
X-Received: by 2002:a05:6808:2188:b0:3a7:c13:c8d1 with SMTP id
 be8-20020a056808218800b003a70c13c8d1mr15655816oib.17.1692091340559; 
 Tue, 15 Aug 2023 02:22:20 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 a24-20020a05680804d800b003a5b027ccb2sm5320636oie.38.2023.08.15.02.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 02:22:20 -0700 (PDT)
Message-ID: <ef194137-0843-78fb-4b99-4b52fd84a444@ventanamicro.com>
Date: Tue, 15 Aug 2023 06:22:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: qemu-system-riscv64 -cpu host uses wrong privilege spec version
To: Andreas Schwab <schwab@suse.de>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <mvmmsytdc1i.fsf@suse.de>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <mvmmsytdc1i.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.265,
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



On 8/14/23 09:49, Andreas Schwab wrote:
> When running a KVM enabled qemu inside a qemu instance, I get these warnings:
> 
> $ qemu-system-riscv64 -cpu host -machine virt,accel=kvm
> qemu-system-riscv64: warning: disabling h extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zicbom extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zicboz extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zawrs extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zba extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zbb extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zbc extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zbs extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling sstc extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling svadu extension for hart 0x0000000000000000 because privilege spec version does not match
> 
> The qemu instance is running openSUSE Tumbleweed with -cpu rv64,h=on,sv48=on.
> 

This was fixed in 8.1 by eddabb6b88 ("target/riscv: skip features setup for KVM CPUs").
Which QEMU version/branch are you using?


Thanks,

Daniel

