Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3C3C41513
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:14:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8Ia-0001Ra-30; Thu, 10 Aug 2023 12:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8IY-0001Ln-HZ
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:14:06 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8IW-0002mO-Co
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:14:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52256241c50so1390335a12.3
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684042; x=1692288842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qcwjnntdq+oCHbw85MH3Rd8X3dAD2VZvQP7llfyzOGY=;
 b=ywfI3COdx5ZmqO76CtTXeuza33jC7LwNYI0M3VRwcMIWpuPF/wI5lEGh67TZmmvow+
 TrY2nhdaBCfyWR/6jx7yb6uvqN41RVBBx8vMEM+9oUOuKa2oAfo5AWp38Q59puY24jpq
 bfDVqL4CWg7wlcPx2iN9PXmMUbF4V+2l8efcmCS0AfX2NObreKzkhCHhqZVD+iiTxgDy
 B6O9S8ASOfXDCipgcUcCjt6xZXotQ++PHuA/VkjBv05lK3zS8B0Efy9Fbr7a6NNLBO08
 h4YBFYpk39fhMmRzQn/kzrv4I+a2Ht1ompymZo5efK3GKr7fTdhXdJ+qCvit7l8HxpXR
 N38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684042; x=1692288842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qcwjnntdq+oCHbw85MH3Rd8X3dAD2VZvQP7llfyzOGY=;
 b=R58uOVaP+h4ENkRG2zxGtZR46/TSw/IZlksZn/x/G0MXS6HYmOGb2IGV+0MZ5p7S7L
 iFYE9Wy0dU/p9CYMzcW9JjryPfdHKz6s/XJeH2zoJKB5mWheiF4d02QdJmVpja6CmdJK
 v9dSKdPiok8HZwYgKJpiQwenFHLT/MGw43Kg3/K/FAv5abwm+9w+rw8t7Sn5TH2PF1gf
 eklW8nTcRP1c6uPtAP2vtbv9NrxmGBeu2+0DlcjYl/hW7rDGWY9gGJdeH48MedQ+GojJ
 +UTibyimboo32bKVRs6bnlWS5yN0EG8XzdfnpaK9/2ksmBjc9aW/UURL7PQCXJL7kiZi
 MQlQ==
X-Gm-Message-State: AOJu0Yxb5MdbfThunCxGbznFgbsD/AYqFdVhO9DspiB3n52UAG1/ov29
 mc9ZJp1tE0oVKs2iw1l3IEk/Mi9kzLtDjvohfZjOFQ==
X-Google-Smtp-Source: AGHT+IH5ioyEMJZMPaKUvwMSGlFqDqRZRrPZ8FJPXzXvtScySod1JBTBp90gk+mm9tZdpiDya0QteF3I/lUxQc+/yF0=
X-Received: by 2002:a05:6402:12ce:b0:523:35ce:bf50 with SMTP id
 k14-20020a05640212ce00b0052335cebf50mr2594758edx.23.1691684042523; Thu, 10
 Aug 2023 09:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-3-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:13:51 +0100
Message-ID: <CAFEAcA-r6hZykFQo_5KFp-kfUy+Ytsrd5TufuG7JH0TYhgcbYg@mail.gmail.com>
Subject: Re: [PATCH 02/24] tcg: Use tcg_gen_negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

