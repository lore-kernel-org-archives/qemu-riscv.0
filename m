Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B6CC83F12
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 17:07:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb2BS-0001fO-Ox; Tue, 29 Aug 2023 13:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2BC-0001Ur-Nk
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:07:02 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2B8-0006Qq-3l
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:07:02 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso24304505ad.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328816; x=1693933616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EJC4Q2Dzht6beo+iKRy2G8JGKTP6kbfY7xvxXxJ8pEQ=;
 b=melWkinxTKChj1PD0p3TEEAy6yR6thnnhXyd9u7hob/f0SvShyT2JawUXJgKcGHCLt
 Qj8nTNxWfRyOUKIT7z/3JSeDg6Ury/n1lp6FznLVtYng2NHEy0K9ng8M68K1NxIEEXci
 bV1n2jAbL56ehq0K1JGxhWSJNDHua6ckfGiNBvvjc013c6Yc9k/BKWlxzS7JkhaPw/nn
 DkTvr6QxxAY9Z/Md9d51tT797UYysYjJu0NRq0vafmnlJtJ7eg37fvBNsDAM07cvc9sH
 SxEkzcU5mtBhZZOZ1o6alVADwuVB0gnOSGek5esSug2ybSA3x1SrzcNbEmYpy3HZMxsX
 CCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328816; x=1693933616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EJC4Q2Dzht6beo+iKRy2G8JGKTP6kbfY7xvxXxJ8pEQ=;
 b=kvnnYnBfsSc92/6geW2/ix+aTV0LiRj5hs+BKhFD/t6aTSdHOobLsg5ROxz7ZpSxr0
 MelXR/H1/Ky3/z2LUmB8sd9NVtFELPVgj8DqzmZZ3v12hHN/pO+ou91OBkcroK+Of39y
 2QRewOTZaqahSAYusL64AvRcmzPj5opdYOUhgGOxcAVhBfB1swwZFOaoSso4S5RI7GAA
 0qq7Y2g9NySaksq2UhQi/0V+6XmPEURDnkYrAb/ep79BfPairSX/v2yDIULCT77fkzDa
 qfThEy1nGep/taGF1YXny0cHvubt/Cb+UjOe3/JSQV2HA0/QMTwPXwL2AI3NUxNprTno
 zV5A==
X-Gm-Message-State: AOJu0YzwTTj/4/DgCoSGJCCnKyo6jVPoeJjKVI3QYiDc4Ets87w5WKPx
 NOModjAhKo/PzlCGndkE2I25QA==
X-Google-Smtp-Source: AGHT+IFrJ5R2pA+5h+kS9QR6oxGw9+zwuT8bwE2crRQWHDR/ZhD58cPff4hfUsFu5tJbu/Bm3csYlQ==
X-Received: by 2002:a17:902:e550:b0:1c2:5db:7f16 with SMTP id
 n16-20020a170902e55000b001c205db7f16mr1730352plf.67.1693328816674; 
 Tue, 29 Aug 2023 10:06:56 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902d38400b001c1f161949fsm3769980pld.96.2023.08.29.10.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:06:56 -0700 (PDT)
Message-ID: <b4879b28-d038-5123-87e8-52f75aa0e12b@linaro.org>
Date: Tue, 29 Aug 2023 10:06:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/11] target/xtensa: Include missing 'qemu/atomic.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> Since commit fa92bd4af7 ("target/xtensa: fix access to
> the INTERRUPT SR") these files use QEMU atomic API.
> Explicit the header inclusion instead of relying on
> implicit and indirect inclusion.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/xtensa/pic_cpu.c        | 1 +
>   target/xtensa/exc_helper.c | 1 +
>   target/xtensa/op_helper.c  | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

