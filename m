Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A59C5DF87
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 23:32:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxCF7-00027Y-OO; Thu, 20 Aug 2026 19:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxCF5-000274-Ok
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 19:32:15 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxCF3-0001hE-0V
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 19:32:15 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-cbedf6a6fe8so322749a12.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 16:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787268731; x=1787873531; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kYt82G8cEeyX8CUQcRRMEnvpMwo/kIV7i+eXjCVKu6c=;
 b=P8n378HJPwMd7XCAqDQfv0Bo6P8EuMqQoLKWWEo5gvXw1vC8wEJ/X3ad+cTVTfblXK
 fcaAnRfiMIQmavTn9j/agHLYAeNKLvvQhriv1+qwlR5JFhDyxOR5QRt0A2pKFEV3z6wL
 PgC8lm80OGxn0xEzEJGj5E93RW0nB7cmQRyP7Iz7rXAfqdMzmLIOuOEblrNXPfJNgWVf
 dcWO512dC/uByT7zIYlJvN0Knh7u6nweXS25qUl5jQ5+LVn3jYdmm1iwHC5mMvZ1xiLX
 ten62vobH5voh8mSBp3Qz5ZSL9OWkU+A02QkE19LrvZQpmFiSjhYvejuC6UWLH/Au+ce
 FdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787268731; x=1787873531;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kYt82G8cEeyX8CUQcRRMEnvpMwo/kIV7i+eXjCVKu6c=;
 b=IPtU2IBccjr+gNquxd8/p8RKkYLxB58wgIPEQFSXQgot1k/5ENXiATcrda+DPABQll
 vGU50ohOgq9DQNsVlTEGXTt8LcJk/DeJkNy2pxdxBHv2T5PM7B1Neh0NOSv8s8oFwkVV
 iMnbEnl7qLWxOJCktU09Ij8Rn7q3uEtf9zCTwu4E4FIg2a6PX0Ahi7h2+sAM2bR/jIu3
 ygMd9i+K0qXtitxPDxJ82r4PdxdH2TU744TE0ukAYfxcQrLyeieFFrJ4JTjeiSxG+Puq
 4a29tAG0HVslhkfl4Wk88ccT6IU+UM/zQ8gNJbXyOBYbEtvp7mJ8+6ec31tpwbSczkTm
 zhyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqApO1WxbYgd+I3CrOK9RRG2KyKpI1QqlY3EmLNfhNlAihasvgHP6sYP4Nn2t6bgueuoyYbpxFhRvMw@nongnu.org
X-Gm-Message-State: AOJu0YyaBYm9Fg7ieHmQlpRFrPqXZdRaijBHmXinK8JeGyZqYC5+OivQ
 N2N536JidIPajYv3w2WtTdlNgF3IX1hjHOncFy/f0LlCL+/H9hOkr96r8ZYmb6LIqD0=
X-Gm-Gg: AR+sD10ZYerLGVLDPXitMCff8RgbTrh9J+BoeE2bTs0WRJuphbktUNIhufhDzvgFwhV
 u8JnVpfraDyE3+twuxnSVq1YiyGM/7k83ACMgf2zio0GxqKmurkryz75jYo70p25nMx2d4ZpjW8
 qQ+H9B4/dEoCymEiDGBen8Xz+1r5RCaodl3mhFe8nx+sUgIwUKzR/9offyLMQj79tojChsUKyiT
 vaORy5lqRLb4ja8EhjUNOUC8pAYjmLo/eJK/myxvuKnAI3k98dw5uVAb4DXWvCxYhLtGRi7GH3Z
 ToAjAyiNnxZ1XoluJq9KPRIAWMphhs4k+5T5BsdmTrpSpN25hUonLL9P8udacaMtLr2FVirU6ui
 av9YSN3HmBkrhXR57zCeOPYBbtuCFNmH59S1LQEEheYPhqE0ui2PJIajS55j6+y97hiO0nI+W3p
 A0Z9vPguCbA+0dO6NAwPtEKh5LW79nlaonsmb/uLemWn7q/Op+q4l0tHca1mRRHQYssBIE+dHvD
 2Be
X-Received: by 2002:a05:6a20:a121:b0:3b2:a809:1000 with SMTP id
 adf61e73a8af0-3cd30586d26mr3175916637.3.1787268730840; 
 Thu, 20 Aug 2026 16:32:10 -0700 (PDT)
Received: from [172.20.6.151] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc15cada6fesm1880859a12.27.2026.08.20.16.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 16:32:10 -0700 (PDT)
Message-ID: <d9971d3e-0faa-4517-b748-9737822c5c66@linaro.org>
Date: Thu, 20 Aug 2026 16:32:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tests/tcg/riscv64: Add vector load and store tests
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20260820130223.2762-1-joel@jms.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260820130223.2762-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 8/20/26 06:02, Joel Stanley wrote:
> Hi Richard, I was testing your riscv vector load/store series and
> noticed there were some regressions with page crossing loads and stores.
> We don't have any tests for that in the tree, so I wrote some.
> 
> The tests trigger assertions in linux-user for me:
> 
>    $ make -C build/tests/tcg/riscv64-linux-user run-test-rvv-ldst
>    make: Entering directory 'build/tests/tcg/riscv64-linux-user'
>      TEST    test-rvv-ldst on riscv64
>    **
>    ERROR:../accel/tcg/user-exec.c:810:probe_access: assertion failed: (-(addr | TARGET_PAGE_MASK) >= size)
>    timeout: the monitored command dumped core
>    Aborted
>    make: *** [Makefile:223: run-test-rvv-ldst] Error 134
>    make: Leaving directory 'build/tests/tcg/riscv64-linux-user'

Bah.  Off by one bug.  I'll post v2 shortly.
Thanks again.


r~

