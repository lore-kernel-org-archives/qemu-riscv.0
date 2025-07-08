Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6884C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFC3-00077x-Jf; Tue, 08 Jul 2025 16:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDjq-00011W-2h
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:12:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDjh-0006Io-Fd
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:12:20 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae3ec622d2fso831964066b.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001929; x=1752606729; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OqYTuCNiZiX8zi1SLZHeCYNVHaveo99iC222kPTZLq8=;
 b=Zs1yq2qeWbxUMQRmQUVX3iQITV24DtXnUN4RkFmQmhgjOqjm92xGwzT32Wcj/ttq0g
 n1jbk1UyLbLDuV2hW6vjjxCls9p0IL4TUmeVsOrZEbgMPAKQ5ajSSZ+uWQZru14jKLHP
 LArKCESVTsfizCT900WwF/xd8NDtrJYR75gB3mZLPBmvFSMbtAmH8U/xAynAZW7pfFF4
 VMactAMCl86q4TozsLDZ/HWmjFaqlVITcmkFzA5XhvKvlfMHw/S96fIIMbytoNC0KftV
 oSEnTueV62NdKl4caa/HAzPeZ+g+8yysSO7FGWSIsH9yhoIMLFTBGDlKMd5LamCeTJ4K
 fHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001929; x=1752606729;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OqYTuCNiZiX8zi1SLZHeCYNVHaveo99iC222kPTZLq8=;
 b=tZauImiQT1D93UKXVwvHp7LRck8cY4tXhdE/KTAIIPPTUZ+uxku0V1vGivM9tR6C14
 Jh3XJL1lGJnvXeJ32hlqUkbBU9o8d2Kk/dc7PUcJPsgvjf+UMHlEG/BquGMlH6FyhKan
 1/oVF99jPh9x2P9iVcDHKyeVJv0SisMJ76NRehWDmKyDnpeXzg+rIcAoUwAV4UWDkrls
 kW6tM7Ft2Aq12obfvuernwynclKLl+GUD2eqti8QkI13R7KU84tNFWCvDlH7zWxZnBS3
 jneCLnigZzrVIdsgMVMfaG6R4mEdcHLdXCaxEWA/lZzatcD947Yj9Iq6puxg79zlMC4m
 8R5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtV+F8EQ0BdjDwjFMww8TeKDLpV31UjIdIQZfYjfMETLBSw8LY5rJ/zmSyGIQjVTTblAKs7B11Wh/+@nongnu.org
X-Gm-Message-State: AOJu0YyC6JqOF6tjFXJ8gUjXjxOzMA5YvD4nC4ayxgehHNAKSyxr9Gfb
 qMTCLJ/ZWtBMLCAiQXkRSluQrLZq172G7WlxS8+o7ClZnOPzIwIsO9iqz/4ji8L4x4wu1gviWt4
 hhMYL
X-Gm-Gg: ASbGncvRxHQSg4znHlbcrQO+gFtxWd+03nG+vuxZqWZPgfXwocEWlSWJWMW6lccsQCY
 n/V8ibWcXkmnYgKH5Q8pEkPhW35iAGxHnxUAfktTaOzqSGi7NrNcBKImYuac5IEuG9UDT9qshF1
 7tLpaZ6N3IyBobCtkMokkYas5EH/pz9om9fDVgyBnmNhgQEUa06jSAr49K82vSF3EBEnkpxbbh2
 PkDRrWzAa/jSuXHX3YHGIahLhjAX/YFqDPx9q9JTdMkc3aYw8f+zo8vvFBasiaOge/LfL1uXYYT
 ew6iV34+Vp+laIjUKQhqP4WYPNSU8irUkRcPyd+P9ZdYUvJ5avBVLuvrnhyM2BScpJseO176/ji
 thHDdb20M30auwkQ6StRl1oCke1iW9A==
X-Google-Smtp-Source: AGHT+IGwaihnAEepD74IpnE32Ml4CpQq7yS6bPmQPjzCJbQ999fIFyIc9hoif/JyG0smPFOTL0s0cg==
X-Received: by 2002:a05:6000:2583:b0:3a4:e629:6504 with SMTP id
 ffacd0b85a97d-3b49703925amr13885616f8f.49.1751994670877; 
 Tue, 08 Jul 2025 10:11:10 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdb381a6sm19420795e9.1.2025.07.08.10.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:11:10 -0700 (PDT)
Message-ID: <b56156da-c323-4eb2-9d0d-739e69769f14@linaro.org>
Date: Tue, 8 Jul 2025 19:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-10.1 v6 00/14] target-info: Add more API for
 VirtIO cleanups & introduce ARM macros
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org
References: <20250707172009.3884-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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

On 7/7/25 19:19, Philippe Mathieu-Daudé wrote:
> Rather than re-spinning the whole "single-binary: Make hw/arm/
> common" series, restrict to the API additions, but include
> examples of their usefulness (hundreds of virtio objects
> removed from default Linux build).
> Time passed since I context-switched out of this work so I'm
> not sure the DEFINE_MACHINE_WITH_INTERFACES() implementation
> is in the form Zoltan asked.
> 
> Philippe Mathieu-Daudé (14):
>    target/qmp: Use target_cpu_type()
>    qemu/target-info: Factor target_arch() out
>    qemu/target-info: Add %target_arch field to TargetInfo
>    qemu/target-info: Introduce target_base_arch()
>    qemu/target-info: Add target_endian_mode()
>    qemu: Convert target_words_bigendian() to TargetInfo API
>    gdbstub/helpers: Replace TARGET_BIG_ENDIAN -> target_big_endian()
>    qemu: Declare all load/store helpert in 'qemu/bswap.h'
>    hw/virtio: Build various files once

Sorry, I cut this branch incorrectly, I should have posted only up
to here, as the rest isn't required. I'll respin for clarity.

>    hw/core/null-machine: Define machine as generic QOM type
>    hw/arm: Register TYPE_TARGET_ARM/AARCH64_MACHINE QOM interfaces
>    hw/core: Allow ARM/Aarch64 binaries to use the 'none' machine
>    hw/boards: Introduce DEFINE_MACHINE_WITH_INTERFACES() macro
>    hw/arm: Add DEFINE_MACHINE_[ARM_]AARCH64() macros


