Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001D2C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 10:22:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUPHG-0008Us-I2; Fri, 11 Aug 2023 06:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPHE-0008Qb-PR
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:21:52 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPHC-0006LN-CG
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:21:52 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe2d152f62so2949166e87.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749308; x=1692354108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NmwxAMp3W2UEZSqZdCoo9QP1P3OTYhKESpa9lEB+X1w=;
 b=yacE/EQfyTKbDaTblA+ce8T+xQP40CQqYFeybiaZAeev6Agz6Xla6Eiw2HnpEbrhvA
 BtaWggjE9tTVBCJBXDZDGkm+3/eb2rBRKtUjWMaN3HHv2R6+SxwJ4MOB4Tfl5Gf/I8Ls
 NHaPPBBR93mARFLpCHtK1D2M0DXTMQb3wGmh+5+nDO7uKWHLnxth/B2rSwsb2MC4TfkM
 pR5MxXPFqjnq1LTBvZJDS/RGDyGxJqBPkGZKgkrnnyuWcLjQ4XE1l9MrDS7TfW+g2W3t
 Tg79ZqbXlHDmWBzVz0+knh+UhxId1XYT4i4+j1p1DWg4uK/YPXzFyZtmBbNy637Ymcur
 jk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749308; x=1692354108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmwxAMp3W2UEZSqZdCoo9QP1P3OTYhKESpa9lEB+X1w=;
 b=GRsSwpEXYqN8ZyTOTNYOskmCALf76O/+YBNLS3ebAHgUgqV5ejwhfxIda7PdGzok72
 giT5nBqv7MQ3uVcCW2ySrbRi0TtTgPGQ1BIowdVg4OfqHNtRgPflz/9inD11yb7ZBbvv
 YS4LZZirXuWcQge1VZOxUqKTcwp0mn/CpOubh41pvQzXzSlfJvPeJD8QWr7tZosvtgNB
 sFv4ymSNUs3zeQDguT2s0te9x9ozbbZa90qMXytJNwbtxjlFmILwrY6ZGgCjwYI5hVAj
 dRqFhYf8GB5Bb7mOf9KFRIcjfDBhJFQYZlEMsAAhM4LCAiIF5aDrnbMzh31lOuAX3iB/
 /cBg==
X-Gm-Message-State: AOJu0YxdxsWSJFtxAdc1VGZzDQIuvYiqxz2HAMnza7Dny/kjyV8NjSO/
 HI+sUWxrahqsf5AlInCayZpqpEbeiHVLHg1hcxP/wQ==
X-Google-Smtp-Source: AGHT+IF+8hDULl7awDdWSX7UT8P5W5uXh86CJOFLVql7ANnZ+i42Ayo3RDWaeVJEAWCTpo6A+agQu8rJkNhk7URfpg8=
X-Received: by 2002:a05:6512:b88:b0:4f6:1b45:e8aa with SMTP id
 b8-20020a0565120b8800b004f61b45e8aamr1368266lfv.50.1691749308620; Fri, 11 Aug
 2023 03:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-19-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:21:37 +0100
Message-ID: <CAFEAcA9A7YEvDqLZ6SoGHn-TPjNhY=NmTanm5PU0efXXziCX6w@mail.gmail.com>
Subject: Re: [PATCH 18/24] tcg/i386: Merge tcg_out_setcond{32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass a rexw parameter instead of duplicating the functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

