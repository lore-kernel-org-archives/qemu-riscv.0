Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD2ACD8CA9
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 16:49:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqFum-0002Si-Bv; Tue, 10 Oct 2023 12:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qqFuk-0002S0-CP
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 12:48:58 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qqFuh-0004mY-0r
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 12:48:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so37546945ad.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696956533; x=1697561333; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TuYqLaIKIhucI88JlrhEjY0cytVk7nf2wWm13ybe4pY=;
 b=ymR095Rgbfd1Nv5BD/+W0YDqZ4kBHUCbXUIyjxkx8zFYPLKPooTNC0XxPPXRurJACp
 mIF6PSK0YE2+5nj1qe6+HdHhYP0PTscOCotPvJVNEP0TYA8Q5hqdwwU5SDVXvtoaVfnc
 BKhUgrFBsHQ9LR53CFMeGzmw8ED6XEyZ/9BYaU/ghPgt+X5Pf/mGEjG0eJ/vWJKk35a6
 BeKXbJ3klnFAxMKBod6mAZLzwXm0YbJwB795f/It7fmj6+sIma+lEOP1AVGThWdMAEcO
 NB0ChVFhxH1liRtoM7m7sEhyXrsoMZLdFFawOECORi0kDatFZqpUxO4zVH3a0i+/uvO1
 CAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696956533; x=1697561333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TuYqLaIKIhucI88JlrhEjY0cytVk7nf2wWm13ybe4pY=;
 b=nR7YdzvkWGYcjwzzWxkHfXXfXNJzfrk5f3c750oSw7Vf5OVWpfVfklK0vflKqYbIrZ
 D1ok9VQ4r7Asyeh7g0fZ+LQfjp/rTIe6ma1cfmnvSNzQ/WrvFV46gmaz0HgvWM7gxNdO
 Y9W5tlSLm8C3PG72owgy2ggCigOJFBt76GN2bn4tp7gRUFOiKOIHNS3f7sFE1+2eY8kl
 ovVPHryKEzMHU9kCEr3J++wdSLaFIjXP4MhBSDb21vV27P/zK5bx/AaBJT63FPQInDrT
 5a+BhJZhNxsn4ilifZhugvV0gsQimiStAZggnF2qJI+fw8GFqrF3ARj9zIy7j/Hdob1X
 nKRQ==
X-Gm-Message-State: AOJu0Yy1Xqt7SJWsD5ArASj8GqfDLD15DI5wXoUuaRMGBsdojY2DB6Nq
 J8dkII0NTWnhh5O8W7xKFOOz2A==
X-Google-Smtp-Source: AGHT+IG9c0F1jz3X+OZWLAtQUIedsi61kYyzn+hNoqOTOL7CozFTlrwMFOE0zybDv0bH6sX2T/CrLA==
X-Received: by 2002:a17:903:11c7:b0:1c7:36ff:1ffd with SMTP id
 q7-20020a17090311c700b001c736ff1ffdmr19119161plh.61.1696956533158; 
 Tue, 10 Oct 2023 09:48:53 -0700 (PDT)
Received: from ?IPV6:2607:fb90:b763:d52:6ee3:1cf3:f2d2:e12d?
 ([2607:fb90:b763:d52:6ee3:1cf3:f2d2:e12d])
 by smtp.gmail.com with ESMTPSA id
 jk17-20020a170903331100b001c9bc811d59sm1532862plb.307.2023.10.10.09.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 09:48:52 -0700 (PDT)
Message-ID: <a2e69691-d3e7-4bdb-b2a3-c3f4b07f731c@linaro.org>
Date: Tue, 10 Oct 2023 09:48:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/riscv: Use env_archcpu for better performance
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, pbonzini@redhat.com, philmd@linaro.org
References: <20231009124859.3373696-1-rjones@redhat.com>
 <20231009124859.3373696-2-rjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231009124859.3373696-2-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 10/9/23 05:48, Richard W.M. Jones wrote:
> RISCV_CPU(cs) uses a checked cast.  When QOM cast debugging is enabled
> this adds about 5% total overhead when emulating RV64 on x86-64 host.
> 
> Using a RISC-V guest with 16 vCPUs, 16 GB of guest RAM, virtio-blk
> disk.  The guest has a copy of the qemu source tree.  The test
> involves compiling the qemu source tree with 'make clean; time make -j16'.
> 
> Before making this change the compile step took 449 & 447 seconds over
> two consecutive runs.
> 
> After making this change: 428 & 421 seconds.
> 
> The saving is over 5%.
> 
> Thanks: Paolo Bonzini
> Thanks: Philippe Mathieu-Daudé
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>   target/riscv/cpu_helper.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

