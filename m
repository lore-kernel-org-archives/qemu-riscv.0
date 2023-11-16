Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF872C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:28:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3ZbP-0007sB-SR; Thu, 16 Nov 2023 05:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZbN-0007pN-M5
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:28:01 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZbL-0005Dl-Pr
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:28:01 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c6efcef4eeso8273471fa.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 02:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700130478; x=1700735278; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JveVE4p5jS0nvLMubZk7bqzjVrxYYUswNQaT3Q44FiI=;
 b=wu0VFkkgGJoB4JL0o3YgeHjf6IeAUlyNreLxiDD1wA2lMUlbhF9W1hQPNgFAZzr+bl
 pzHu1sZ1gbx9eu+83BLQN6lF3VdN29zKdv/w55pyxGP1kRZfSv/tqEcMFbZbMeBtgLT5
 tUlFDLyOYKlK4JlTRGSbSjmUIjAZCiMxU5BAfVdFhJyKG7UxN9U6vb9xqLxNdJzZm9U3
 /ALrbZfVC0YofObxOnqDlyhL9O2f9lP3HcZGfJkCttAnTqKd3bOsiDWZ307Xcik3dVi+
 Y6ASi2VkoEXosc1AWWwVXJpMtqDWUQG+Lf/o7Gs9twXapll4EBUU3Z4hRM46RR2yBLKV
 P2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130478; x=1700735278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JveVE4p5jS0nvLMubZk7bqzjVrxYYUswNQaT3Q44FiI=;
 b=MICBet8pHuwiKiwqIVkFEXbD5UNsBzQjYBFxUKoTrVohDaLLDVONJecUwhd+bHKc2J
 sa0TReIdA3yclKeQgMzApmAaOW3EGrcQAI1tN96K2Wdmm2c35ECTCLpCjnlCzQ3gsRdK
 9c/X+Te5IeHq5tmg9W20Bqer9GupcQ2vb0Wo/VoRcbgyv1buSowXA/qVupZPQ2waH8ZH
 ipM0bzc1LQQFRLg239FbzXPw5+Eqz+LSYI+lMA+MNyRbVpSsB5j8p1EGlXKJtZRvjo+L
 LNTtwbUVCjIjKCSVAUFztIZmeic8iO7rikNeYFx1nUYQW0sNI1mJ9pkI5J3xo510DeU2
 MowQ==
X-Gm-Message-State: AOJu0YxIBz9j0/UkKrWrez7450gn047pFwcNO/3NI2MGqPBXm6zr2NVi
 2y20xsYwC8dpdEze9gVuC/oS7A==
X-Google-Smtp-Source: AGHT+IFexTX6zOyELCQ3jKIEktN3RyuWKhykHjp5J+rVJOqXrvEh7PNoWMgpfZwb8r1ddrcJN1nAbQ==
X-Received: by 2002:a2e:bc28:0:b0:2c6:eccb:344d with SMTP id
 b40-20020a2ebc28000000b002c6eccb344dmr8657052ljf.40.1700130478019; 
 Thu, 16 Nov 2023 02:27:58 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm3001006wmf.45.2023.11.16.02.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:27:57 -0800 (PST)
Message-ID: <dc0498ee-6ec2-4636-9325-71b8d8ef99cd@linaro.org>
Date: Thu, 16 Nov 2023 11:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/31] target/m68k: Use generic cpu_list()
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
 <20231114235628.534334-15-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-15-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
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

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
> cfv4e
> m5206
> m5208
> m68000
> m68010
> m68020
> m68030
> m68040
> m68060
> any
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
> Available CPUs:
>    any
>    cfv4e
>    m5206
>    m5208
>    m68000
>    m68010
>    m68020
>    m68030
>    m68040
>    m68060
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/m68k/cpu.h    |  4 ----
>   target/m68k/helper.c | 40 ----------------------------------------
>   2 files changed, 44 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


