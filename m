Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73EBC4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 20:25:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1raiIB-0006KU-T9; Thu, 15 Feb 2024 15:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1raiI4-0006J6-Pm
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 15:25:04 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1raiHn-0007Bb-T8
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 15:25:03 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6e08dd0fa0bso1113039b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 12:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708028684; x=1708633484; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Mk+v9Qj2aa+ijguuAiFycXGgTKQaEPMF5MWajMUaH8=;
 b=C+IBZhu55s8caBmlo+Com50NadeTep11ZBXGz98rEhi/VWx1OnpkJQ2vY2vqVi0LoC
 Sgpx+u1iepeD5IdiDZpb/z47G4zapD49IssVMsXlwVJy/tnqbBkBXwvcexGL6m0Np6nZ
 saZ+sMNVcueNiji3c7zfAvFXNqtpid8O2jYF13G5KB5JwWbjWs+qts3KpBIUDZTWAs2u
 c+yvtOSZsZN3TyWwJKevGO9nX03Mpa+KQFVTMZREwmreY/BDzv1Cuu9Ox7doklrfGqJr
 Zul/fQJ3ccS9ncCOWSysOyYd/0LKZ0BdXdrjUnlGayawfmA53iMtBlw402GTauylawzA
 zLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708028684; x=1708633484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Mk+v9Qj2aa+ijguuAiFycXGgTKQaEPMF5MWajMUaH8=;
 b=gmxc1SKh9FbOYSv2foDsv4GMPpEUpZznhhehgPMdou76r78Pv/oc3A9HiW3Sb+Pmej
 /TiAk2xkht9XdKmsc4eVdp6k/dENlslvhJs5oNPPbCHSDvyR80eGY+0flCCgsRZdIzOS
 3BdmfJu0azjpdYbIx3H98CHY2T+ZanKHFtwh19Gu6bBAvAVak5Z29VAxqKnXfcz3beCu
 /OdgqTfOxOAsZec3ndiSmUa9Cex5G7J9PHSJeLg7nedQjw3p0SpqJ4plmqTlS2pse05i
 C+wJABYh1sLjrui7wjMdxlgXc6efBjph6i+mqOGzhGEipF+jBkKECDQMyQ5c9FuyYckp
 GXhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWleLWa4hnVMN2LLhq1O5rGqU3zjJv1P4BIT2UHbWBWrRKi+jHoGynZ7FOOgqL9MhxZZjg5RI9xtA9so1aWcoG4MTcpgu0=
X-Gm-Message-State: AOJu0YxnxSG5o7S5ZG6t2H1I9lt7KtJbK6kKSFUj3lyZjC7JAtl1yMoF
 OTDXawoZ32dgHKoDJ99CnJMbLI18Z97jDu15IzA3Djrn0xAEHBQbOT8Zigl5Qtg=
X-Google-Smtp-Source: AGHT+IFum45Kc/FawCRCafMoiHcMyuYzMtu3MbfZVG1fxBiuF77S8TTUq2wZE4ojq0m2PWBgFaGwdQ==
X-Received: by 2002:a05:6a00:1951:b0:6e0:a2fe:5b4 with SMTP id
 s17-20020a056a00195100b006e0a2fe05b4mr8501908pfk.15.1708028683555; 
 Thu, 15 Feb 2024 12:24:43 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 ka18-20020a056a00939200b006e0fc1ed2b7sm1738724pfb.134.2024.02.15.12.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 12:24:43 -0800 (PST)
Message-ID: <82a9a26c-290d-48d0-8d77-500e79b29f7a@linaro.org>
Date: Thu, 15 Feb 2024 10:24:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Improve the performance of RISC-V vector
 unit-stride ld/st instructions
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com
References: <20240215192823.729209-1-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240215192823.729209-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2/15/24 09:28, Max Chou wrote:
> Hi all,
> 
> When glibc with RVV support [1], the memcpy benchmark will run 2x to 60x
> slower than the scalar equivalent on QEMU and it hurts developer
> productivity.
> 
>  From the performance analysis result, we can observe that the glibc
> memcpy spends most of the time in the vector unit-stride load/store
> helper functions.
> 
> Samples: 465K of event 'cycles:u', Event count (approx.): 1707645730664
>    Children      Self  Command       Shared Object            Symbol
> +   28.46%    27.85%  qemu-riscv64  qemu-riscv64             [.] vext_ldst_us
> +   26.92%     0.00%  qemu-riscv64  [unknown]                [.] 0x00000000000000ff
> +   14.41%    14.41%  qemu-riscv64  qemu-riscv64             [.] qemu_plugin_vcpu_mem_cb
> +   13.85%    13.85%  qemu-riscv64  qemu-riscv64             [.] lde_b
> +   13.64%    13.64%  qemu-riscv64  qemu-riscv64             [.] cpu_stb_mmu
> +    9.25%     9.19%  qemu-riscv64  qemu-riscv64             [.] cpu_ldb_mmu
> +    7.81%     7.81%  qemu-riscv64  qemu-riscv64             [.] cpu_mmu_lookup
> +    7.70%     7.70%  qemu-riscv64  qemu-riscv64             [.] ste_b
> +    5.53%     0.00%  qemu-riscv64  qemu-riscv64             [.] adjust_addr (inlined)
> 
> 
> So this patchset tries to improve the performance of the RVV version of
> glibc memcpy on QEMU by improving the corresponding helper function
> quality.
> 
> The overall performance improvement can achieve following numbers
> (depending on the size).
> Average: 2.86X / Smallest: 1.15X / Largest: 4.49X
> 
> PS: This RFC patchset only focuses on the vle8.v & vse8.v instructions,
> the next version or next serious will complete other vector ld/st part.

You are still not tackling the root problem, which is over-use of the full out-of-line 
load/store routines.  The reason that cpu_mmu_lookup is in that list is because you are 
performing the full virtual address resolution for each and every byte.

The only way to make a real improvement is to perform virtual address resolution *once* 
for the entire vector.  I refer to my previous advice:

https://gitlab.com/qemu-project/qemu/-/issues/2137#note_1757501369


r~

