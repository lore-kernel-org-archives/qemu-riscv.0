Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0058EC83F11
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 18:41:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qahAi-0005Kt-C5; Mon, 28 Aug 2023 14:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qahAY-0005H2-77
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:41:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qahAU-00087J-9X
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:40:57 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-56c2e882416so1618369a12.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 11:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693248052; x=1693852852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=++uvodA5NKDQhXzfndJt/8NAJXwtfk3ugys3ZqfQVdo=;
 b=IW0Gkk+DwcTP5RupLgv+GCReaWgyOac+6M5Wqy2dhZqiIo/GMS7KPOmOTZhTmeLgzR
 IqlbOoft84ft3y20gBlEuC555VgOww2a9O6re7VJu/S/I22YDkBB1oIwRCaWmv1M5DXb
 +YdnRuEQz5R6HCBSB5fYYWLdg+AEq41+EGfu7YcyvLKY+M8YWRmWJEvri3YQDbukP4GB
 eZU9Ffl2hOnIIu53CJpjxK7aOlaAGLe/hhWwlz8L9XrxUaMgY54hCfYjqDb66xw2BJJz
 9pylJGMZ9GGI2/vugl22mEaF99EJjhEqCg4RDSWMMg7Y4Lg/KPcjQrFHdF0sUyM3UOb4
 XZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693248052; x=1693852852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=++uvodA5NKDQhXzfndJt/8NAJXwtfk3ugys3ZqfQVdo=;
 b=auYcAxxrnqdb+VHuj9OXoSpyBRIgLvHknDXbv5AwK5fCYVNYwheEBYHvgecTYExuh7
 1xNDD9boICcV3IN2XGMcqdPY/svjk7te78e37mh+3HiTCyldDgWnGt4vfA5v5SM2HbKy
 NLdvUKkg32x9L7BAPTAtba4aClrbdMlKKTf0z4OpkscGy7gOW91FkOfNAC9+BLuwyAot
 0IKg5+HiJsg1Ih7Yrsd2HTUQzocgObfZMykxE9v+HP8gBzOCefBA/vbu3scAja7Nl6gH
 aGgeckXhc7V6ybvgpGl2UF+l+hs5v8OC7FIoDOVGsSp0bSOzh08Z1j6/sf3kgAh9bYbP
 /LCQ==
X-Gm-Message-State: AOJu0Yx4IAB30frzREj4WXTb0dOhufEijc7IMhSxa9nee+CrSqaWSRl8
 gia+hSN0g0xlTrM0aLVM2HTZZA==
X-Google-Smtp-Source: AGHT+IHg4pvZ6/0EzyquiNmMtfIvOPdCdcxMnpcUdQwc1muUz/uVhD100T3jzZ57MIJ+q0hNkOq1Gw==
X-Received: by 2002:a05:6a20:4308:b0:140:6fa9:7001 with SMTP id
 h8-20020a056a20430800b001406fa97001mr25644913pzk.40.1693248052557; 
 Mon, 28 Aug 2023 11:40:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 cl7-20020a056a0032c700b006887be16675sm1172898pfb.205.2023.08.28.11.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:40:52 -0700 (PDT)
Message-ID: <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
Date: Mon, 28 Aug 2023 11:40:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] target/helper: Remove unnecessary 'qemu/main-loop.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> "qemu/main-loop.h" declares functions related to QEMU's
> main loop mutex, which these files don't access. Remove
> the unused "qemu/main-loop.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/pmu.h                   | 2 --
>   target/xtensa/mmu_helper.c           | 2 --
>   target/xtensa/op_helper.c            | 2 --

At least these 3 files do two things.


r~

