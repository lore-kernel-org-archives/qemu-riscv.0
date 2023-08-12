Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFEBC0015E
	for <qemu-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 17:22:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUsJ3-0002b2-AB; Sat, 12 Aug 2023 13:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUsJ2-0002ad-0f
 for qemu-riscv@nongnu.org; Sat, 12 Aug 2023 13:21:40 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUsJ0-0005s3-Iv
 for qemu-riscv@nongnu.org; Sat, 12 Aug 2023 13:21:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bc7b25c699so19158685ad.1
 for <qemu-riscv@nongnu.org>; Sat, 12 Aug 2023 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691860897; x=1692465697;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qgGV57KQZlsGuw7nOMq3rUWdVKpJCr3aEv1Ya80Jna4=;
 b=og5s3SpllX6zV8B7cxgLlmiVR8Hp7F5rw+jKBo720yUPawYj17boLjt95XFLW7ivxD
 VfSxABq5TyKrMZSfKTuvMAW+8MZeeH6s6GcAjJdvmBITj5b1C5nkBRk3NzhxrwgrkYFV
 z+YheJKmRY3RvVRKW9KLd6tikdY3Xv6UKRps7TSNuRsPQu6eyIMpJsFwlUQHSLnTGUtQ
 gs7/iUthPWiHj6mjoJLHDkJe0y+InlOREvCpunn9Bc7o9rbSJcFkg+il558QY4tdE+py
 HRMNJ/cqtRl49a4YOX/9TaCyuX57DAE+J5N4/LLS1M8jjt8nAxwFwv01LGbMCxRzKgBW
 JPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691860897; x=1692465697;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgGV57KQZlsGuw7nOMq3rUWdVKpJCr3aEv1Ya80Jna4=;
 b=eBLuCsCPKGWR901Cix4AmA+b29kmGTF9Uo0qZuB0tHBoa9dEQ4KYtwF0zOfldtI1Jc
 lsUp0mT/WkmM46ECl6WuPNPoyGPmEATZV80rCLbzue5qDLBHuauJGQbDfQOVEPlsmNXP
 2qlFNUxP/31ghDc/UwboBg+44oMN30L1EBXWn4JM6M1OVAPdNILK3421PezxUXbjT9L2
 KOXDgo1wxd6auFfluf1c3iGolgHfStyioSPFiCTinERrkGOVaPLC0IFltvttMLKcoDkE
 HhKZwt8Hj/4oM4a5/dVjQMzohpGBVq/Vce9LqKStZNkgfnTDSPJ6ZKcp1uOlEypvXzZY
 SKNA==
X-Gm-Message-State: AOJu0YxKLq96Sy4c95Xru99J/AHRdXrvS65A9iNr4kR+sCsZ9yt4iNC+
 t9fsmYmzlnK07+d8JTR0iFXjfg==
X-Google-Smtp-Source: AGHT+IF/ka1nn6iWasDDqklnimtouNg1lxrdjhHY+9XPk4JgAWc306PEILwwouZMoI2iJ6vI6a6WoQ==
X-Received: by 2002:a17:902:d352:b0:1b8:a812:7bc2 with SMTP id
 l18-20020a170902d35200b001b8a8127bc2mr4457207plk.8.1691860896715; 
 Sat, 12 Aug 2023 10:21:36 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:a229:715e:62f0:756f?
 ([2602:47:d483:7301:a229:715e:62f0:756f])
 by smtp.gmail.com with ESMTPSA id
 jh3-20020a170903328300b001b866472e8dsm6145738plb.241.2023.08.12.10.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Aug 2023 10:21:36 -0700 (PDT)
Message-ID: <3264dbe3-0c33-742c-5c5c-beedb57f5e84@linaro.org>
Date: Sat, 12 Aug 2023 10:21:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
 <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
 <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
 <6a116d10-5e01-30f8-fbd6-30c062fcccc5@linaro.org>
Content-Language: en-US
In-Reply-To: <6a116d10-5e01-30f8-fbd6-30c062fcccc5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.972,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/11/23 08:06, Richard Henderson wrote:
> Basically, test sets SZ flags, where cmp sets SZCO.  I want to add an optimizaton using C, 
> so "cmp 0,x" should not be silently replaced by "test x,x".

This patch can be dropped entirely.

TEST clears C (which cmp vs 0 would also do).  I was mis-remembering INC/DEC which leave C 
unchanged and thus uninitialized wrt the current operation.


r~


