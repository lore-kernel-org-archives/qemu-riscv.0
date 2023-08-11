Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C76C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 12:09:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUQxE-0004TM-KV; Fri, 11 Aug 2023 08:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQxD-0004Qq-DK
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:09:19 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQx9-00037H-EL
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:09:19 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe457ec6e7so3068028e87.3
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755752; x=1692360552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f519i4IzIrPT4DfUdbMMnoDh8gDWGEPx3By6NW7ZTfE=;
 b=RiQ5NBTk7I6KOk426n6c8ooaY88cB33mL83tS7nPJ5I6knRk/IHHFBqGtBqJLVBSoG
 wVGcbwJi5xJMEanS1TgDVqPsIMiMYqY4yJnBqyTXzPqEh/7V9aocOT1IyVix0gbyBmA6
 /oDEDVc6xGqAUdE+4eUsWwcsfc25RXcLmtELvg+sqQUsg2zshP2/IPWE6XugCKBx8qMn
 +LA7T5aF13B53YJuF9ZdqN3vE9002XZXPrCf21G0oB7PApl9uPf7y/r6voqn5FTso/HK
 GPPGF0LqtJwkUzEu+S3HnFQk/2E4/OEowx/p5LuNSdJvzosmmSfTvhwXqjlWyKX0mHGx
 jV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755752; x=1692360552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f519i4IzIrPT4DfUdbMMnoDh8gDWGEPx3By6NW7ZTfE=;
 b=A8UKazA4Cnmtqe5b6a5p22iFjF3aIuGifty26X62B8Y1Wvflb/qVwD1bAtLlbCSeS4
 f9ojamQhXklvfA/mfP0JmR37jycmedil4TerZtym3a3ygGG91qspmcsSk/0I7dzyx9uL
 amC6iU/fcDyTO9PJlcy/R3VXBuIU3gH+MluiP+euanQI2mLQWYmkJegpf0G/kZ2IyjZw
 uhj7SNwO4x9im5wcvm90QksssyAY5uYMRrSjiO9dPhLDbXUlSwoYPpr3goElJiRD7NdS
 hGpeUVhOKB44MJ3ZMwSWa5X341SusXgIYJHAP4uK830y1LLH/5zHpLhQ7/bPr7Y43iE8
 G1bA==
X-Gm-Message-State: AOJu0YzMUDtHgQZLVjhEFuzhBvNnqPwcdZjBUeNklV+LYnsHAjMp2Vjo
 GWqeYDw7fH0x5OLAyDPZZfmxA0RKo3Gz0VDJzP/JhA==
X-Google-Smtp-Source: AGHT+IGhFxWfle4GG6E3Tti92i2irn8GAMObTk3ein2Eova+CF3E0ZFijGQ5DPRVzavxE/T31Q5rLKgAsepdGQ/RkgY=
X-Received: by 2002:a05:6512:b84:b0:4fb:96f3:2f4 with SMTP id
 b4-20020a0565120b8400b004fb96f302f4mr1432995lfv.51.1691755752212; Fri, 11 Aug
 2023 05:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-23-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:09:01 +0100
Message-ID: <CAFEAcA_u7vtVRz3XqFULH=a+iXVGvu-XERg482jh5OhhRrf7cg@mail.gmail.com>
Subject: Re: [PATCH 22/24] tcg/i386: Clear dest first in tcg_out_setcond if
 possible
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 8 Aug 2023 at 04:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using XOR first is both smaller and more efficient,
> though cannot be applied if it clobbers an input.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

