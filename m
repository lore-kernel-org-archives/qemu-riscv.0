Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B5C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:23:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnjF-0003qJ-4E; Mon, 11 Dec 2023 16:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnjE-0003kX-3R
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:16 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnjB-0005i2-9g
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:14 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54c77e0835bso7128778a12.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329732; x=1702934532; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pHOOtAnxrumGhcPX3MIHrVqNAKP2pZj98HD0RrLMt7c=;
 b=MdUN7UYSaPi5i6ebAVNcg8/QVHf3pNlmAcK3Mf0YhUG+MAlzGGj0IeAD4hS1aiikU3
 L0tnHefRjtYjvVsy0s/NLBuePo+kH+pc3EkfI9zp6NF6JAN6afVhOZJi+UPp3n1siWS2
 eG+l/DZ62BCb3CxxwlSI/6x62cwoRvY7yJqF1x9/XxBgEZxMm2lMdKz28M/rF0EvrXal
 jlR1ae6AvfJVkSUc0Cjzi+V34cgFQDYSqaaG+f0v8TMLahhEm/CsNOLsuETZFwbLUHGc
 zddGrjdbtZA8BngL9fIbeu4xOx/FML5H3mTz7+/qIBSwNN8uaYJN6BuWQD2MIa+st+U5
 Ks+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329732; x=1702934532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pHOOtAnxrumGhcPX3MIHrVqNAKP2pZj98HD0RrLMt7c=;
 b=Sa5NM2O2nipuWj9NI5/wLVMYNeDUbK2aRvwya68QWq1TNffk1ljLTL0w1QS3i7ZSRW
 sBcPJI5FFddZJnyDuZEx4biMz+hXJ+LtuoFWgz8gC/hhywGHYDuRsp9syDsx7QpiKmrf
 f6gkD0+jSFyy1UzAKd+MXETnVeBKj381MAHDZtE5Lsl5illdSdRROxlPzfOCt6p0X+rA
 ydJmOnZszRTeGO0iv1aTUjHKkA5HIryzDB9RhIeQcvRWTu29ilgVWMewDLQ0ZKV6qsnZ
 IeUcSqZvpr22AQahrCKEzlb+ju99wAbpsF+58Nmr6k3ySLVSiw2NNLJcE4dWjMsGhouT
 mCWQ==
X-Gm-Message-State: AOJu0YwkAiiBLK6uAL7xzWT97KMU3KRYn3wT8j2qBc6G4PM9ze0e7ZdP
 ej39tDQBBOvRIWGTh4iJEGcU9w==
X-Google-Smtp-Source: AGHT+IFfbsKA8wfC8skTB/yoF3/ySzTZdf5W7q0m1rGxxrtoSwlumHzcEZ+qPSObAal65lz1rrWhJg==
X-Received: by 2002:a17:907:9057:b0:a1f:786c:1b6a with SMTP id
 az23-20020a170907905700b00a1f786c1b6amr2301410ejc.52.1702329731750; 
 Mon, 11 Dec 2023 13:22:11 -0800 (PST)
Received: from [192.168.69.100] ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 tj7-20020a170907c24700b00a1c522990ccsm5332007ejc.85.2023.12.11.13.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 13:22:11 -0800 (PST)
Message-ID: <b977d019-52cb-47d3-88c1-b354db8b330d@linaro.org>
Date: Mon, 11 Dec 2023 22:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] exec: Rework of various headers (user focused)
Content-Language: en-US
To: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Alessandro Di Federico <ale@rev.ng>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20231211212003.21686-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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

(Forgot to Cc rev.ng folks)

On 11/12/23 22:19, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> These patches are extracted from a bigger work where
> "exec/{exec,cpu,translate}-all.h" are split in various
> specific APIs. This helped:
>    - differenciate/build:
>        . user VS system
>        . target-specific VS generic
>      which is necessary for heterogeneous build
>    - reduced header pressure
>    - clarify APIs
> 
> This series is focused on user (vs system) cleanups.
> More useful changes will come after.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (24):
>    exec: Include 'cpu.h' before validating CPUArchState placement
>    exec: Expose 'target_page.h' API to user emulation
>    target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
>    accel: Include missing 'exec/cpu_ldst.h' header
>    semihosting/uaccess: Avoid including 'cpu.h'
>    semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
>    host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
>    host/atomic128: Include missing 'qemu/atomic.h' header
>    hw/ppc/spapr_hcall: Remove unused 'exec/exec-all.h' included header
>    hw/misc/mips_itu: Remove unnecessary 'exec/exec-all.h' header
>    hw/s390x/ipl: Remove unused 'exec/exec-all.h' included header
>    target/i386: Include missing 'exec/exec-all.h' header
>    accel/tcg: Include missing 'hw/core/cpu.h' header
>    gdbstub: Include missing 'hw/core/cpu.h' header
>    exec/cpu-all: Remove unused headers
>    exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
>    target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
>    accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
>    exec/user: Do not include 'cpu.h' in 'abitypes.h'
>    exec: Declare abi_ptr type in its own 'tcg/abi_ptr.h' header
>    exec/cpu_ldst: Avoid including 'cpu.h'
>    exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
>    exec/cpu-all: Extract page-protection definitions to
>      page-prot-common.h
>    target: Restrict 'sysemu/reset.h' to system emulation


