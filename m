Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA1BC5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:22:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r66q5-0002Nl-Bn; Thu, 23 Nov 2023 05:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r66q4-0002NZ-Hp
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 05:21:40 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r66q1-00022y-Co
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 05:21:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-332e3664665so236204f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 02:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700734896; x=1701339696; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kUQC8xhTq5RfOEMvOZ0M18fUGG+Lr230MwcRRy8FYgc=;
 b=dh5xRXrFxufbj8eYauvxZ0VA3Y87cB0YL3b2cqdRmKyT84+JE6UfPrx6XIoCs953RK
 juizEYdHcQJ1yuXJSS5p6uds2vDUqNPPuMxKMiKWIjxc/Y2LBXYoB2Qy9n2rMTsFDfoS
 M6JRFY89zk01eQgShLuV2ZhwKpKORbZkHcbJ0fy5NndMr06iuB7F+2rhxJHEfb9fOlTO
 S76MAZPWRXZkOjCnSS/a+9DVVng4wwQybS8qPH5fmuiIr6mwC52rY/aNB7jy/xkEn2cm
 C7/iMFGtJHbXoD2QrJRxpubBrrhececCBL4MGR20evVC3tf/CNWWVRuO9YKl065PcOI3
 ustg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700734896; x=1701339696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kUQC8xhTq5RfOEMvOZ0M18fUGG+Lr230MwcRRy8FYgc=;
 b=J5LZC5GWjQQlkc+hObxe1xXDgWCBcse3Rploe+3X+dRNlKIYAMF7TjmfgiehDAM+/Z
 jIMbJ1FMkVJZwDNHuqX/l/UcxRvoFKTfIDzxmFPcgv71fjfQ3ioTfdxAhaTlC5e5Ldo5
 mvTe1hwQ5iWecys8evJgVm+1KHoG13dNx7JeTK6kv9B68/Fb2uH9VQgIKGNrFNUi0J4V
 B9nPjYRsodWg6se2CKAx2GSLGjmFPHzKV9odCdZIphwucXVkHiCAe0g+P7gAZ/Tvam0s
 hGdlsVGcHoCvQUmHVe+pteN7RIaEfeNifBq6w3RGm4WMPv1ga83V7C+us7+7GzYKXKpT
 MWQQ==
X-Gm-Message-State: AOJu0YzLc0Vf+vuIyKW+yGGeiXBtSBmFmEU7S6GMAu3F630aG05oyp1B
 HBbYteqfnqsQZet6uQSn5odq2g==
X-Google-Smtp-Source: AGHT+IG5PMoyBXYTKHCwhRUVvWLhAEG9Wv+F69BSvt5i9a4xLaZoAng6G6JmO8RwBFk4nGo79TypTg==
X-Received: by 2002:a5d:6da7:0:b0:332:c3e1:763b with SMTP id
 u7-20020a5d6da7000000b00332c3e1763bmr4140699wrs.45.1700734895784; 
 Thu, 23 Nov 2023 02:21:35 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 dm16-20020a0560000bd000b00332cb4697ebsm1266453wrb.55.2023.11.23.02.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 02:21:35 -0800 (PST)
Message-ID: <50795130-6a02-4611-8da7-c06158fc9cff@linaro.org>
Date: Thu, 23 Nov 2023 11:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Increase max vlen to 4096
Content-Language: en-US
To: Patrick O'Neill <patrick@rivosinc.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20231123001709.64934-1-patrick@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123001709.64934-1-patrick@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi Patrick,

On 23/11/23 01:17, Patrick O'Neill wrote:
> QEMU currently limits the max vlenb to 1024. GCC sets the upper bound
> to 4096 [1]. There doesn't seem to be an upper bound set by the spec [2]
> so this patch just changes QEMU to match GCC's upper bound.
> 
> [1] https://github.com/gcc-mirror/gcc/blob/5d2a360f0a541646abb11efdbabc33c6a04de7ee/gcc/testsuite/gcc.target/riscv/rvv/base/zvl-unimplemented-2.c#L4
> [2] https://github.com/riscv/riscv-v-spec/issues/204
> 
> Signed-off-by: Patrick O'Neill <patrick@rivosinc.com>
> ---
> Tested by applying to QEMU v8.1.2 and running the GCC testsuite in QEMU
> user mode with rv64gcv_zvl4096b. Failures are somewhat reasonable and on
> first inspection appear to be in the same ballpark as failures for
> rv64gcv_zvl1024b. Since I used tip-of-tree GCC I'm expecting those
> failures to be GCC-caused & from skimming the debug log they appear to
> be.
> ---
>   target/riscv/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6ea22e0eea..2ff3a72fc0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -97,7 +97,7 @@ typedef enum {
>   #include "debug.h"
>   #endif
> 
> -#define RV_VLEN_MAX 1024
> +#define RV_VLEN_MAX 4096

This seems to break the "cpu/vector" field migration. Maybe we don't
care, but this should be clarified in the commit description.

Regards,

Phil.


