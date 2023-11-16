Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5690C54FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:28:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Zb1-0007Zv-Cu; Thu, 16 Nov 2023 05:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zaz-0007Xq-I9
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:27:37 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zay-00055i-14
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:27:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso5380335e9.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 02:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700130454; x=1700735254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OkM4Bw5MFHZEcuHs1O7vsROMPAxusBw9ZR7571XzPsM=;
 b=EE/kQTkzlSpEyjAKUKRifYh5jabTsSmnYWTUTzEpHay9aet3/s8e5StMbtQzvfzwNR
 iMTtOm+I68fcndrr8B/CpZpuxBD7MdRJS2Q7wZ+u5iiwBieQy2wjOtdOvMb2sp3hbcv1
 +swi+p9C7gyNjvd3Up34nvZezfPZY67VxYvwlV3+4LU2Kql9Ds9Rx/9fiHUM27BP6Fod
 vwXvrAVEDJ7N0SsH9gDv/GMLxtwERJFLHW7snyWIFEUTlDgxEw5ly3enY8VAb5cXl7Mv
 EOZGUqiVfxO+mUaBB4tWpN6cujQw/uMLv3OKSG6DvjnaemGF+z9SPBuBJlBcM+GcvEI7
 ynvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130454; x=1700735254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkM4Bw5MFHZEcuHs1O7vsROMPAxusBw9ZR7571XzPsM=;
 b=Xvvk+ZqHvXW6sEleyPwXLWkaxwFBoXJKTcN1XGRDeJTw4hL9az2UvS1O/W4FbWqjgf
 cuAhachbNWKFR3mJr3hUnT5r+v8tq9+8DSIkB08MXVK1lww0nBkeIzbGPvCVHnXnrjrC
 zGFjhA8Hn0ELJLH4vwFvuRA4ix9ZD8IPG67man861E5bulV4tjfE1O9zx9/hKiN5z3VX
 YNZMpo0kyZjBHX/k6qNVXGWvpobK4woewsL770ZuLNntEKKkg8PTtm/Ga7NGtpxKsxqm
 bA3v+Q4xtXZRztrHpNJQxO4d0hVfVRUxJG9h23cxMhqPdaIHCiE/71jOUgRQb7gCyWqM
 lQng==
X-Gm-Message-State: AOJu0YxucTuuAeEXFGUqhsOumOdj5Ygm655W5rgnnhA1FA82w3oXhb/R
 z7RivYxk51crvoo9Z9qV1vzOVA==
X-Google-Smtp-Source: AGHT+IEO1S1neAE6yc+0rR8Pk7bF9Hb7F7yrMtV+ch5Cqy2ogg8CkJePxsOxlpR2cnfOgKBwYa1sbA==
X-Received: by 2002:a05:600c:46c7:b0:409:4e8f:4b27 with SMTP id
 q7-20020a05600c46c700b004094e8f4b27mr12363511wmo.33.1700130454278; 
 Thu, 16 Nov 2023 02:27:34 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm3001006wmf.45.2023.11.16.02.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:27:33 -0800 (PST)
Message-ID: <f64fcf96-045f-4309-aeb5-b2dfa23eb1c4@linaro.org>
Date: Thu, 16 Nov 2023 11:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/31] target/loongarch: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-14-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-14-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-loongarch64 -cpu ?
> la132-loongarch-cpu
> la464-loongarch-cpu
> max-loongarch-cpu
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-loongarch64 -cpu ?
> Available CPUs:
>    la132
>    la464
>    max
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/loongarch/cpu.c | 15 ---------------
>   target/loongarch/cpu.h |  4 ----
>   2 files changed, 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


