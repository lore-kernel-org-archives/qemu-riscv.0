Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0C2CF042D
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 01:38:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1syLeX-0005PP-My; Tue, 08 Oct 2024 21:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1syLeV-0005Og-5o
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2024 21:38:11 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1syLeT-0002i0-8Q
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2024 21:38:10 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-20b6c311f62so55995625ad.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2024 18:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728437887; x=1729042687; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kx9e1ru/C4RfIorxCVdypn59eLRtvKXerUCvaGI/Hj0=;
 b=iDaqyXHq+Z/663Q+gL0J/0Q5BGW/QLYGTz6XiAPiIEAnoZkoRHTUqtLKGzxS6FMVXa
 Yzv9iy6FWRdGCKdNYwX7+YATIYo0ZQyDucIjByCawc5GRh+UHPIk4Az/d6QHoqkxasy/
 w0xwOZ9OHeYx07N88+utyNND3Clu3jWvBjBVEVRoNqsVOGuxcD2csO+JI1X4Uzb6CIkC
 K6H/f08FhPuTN3YaL4plWQmklyb+TXjMG7pMhBpmtP6dLEJ6xQLWUGG7g11FuuJiitXc
 T0MMAI3GSyEMESTRifXVU39MU3rL96S2a1PzwtJXPnuC2IP2Zve+nEK3dCxLWL/cyGm9
 aC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728437887; x=1729042687;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kx9e1ru/C4RfIorxCVdypn59eLRtvKXerUCvaGI/Hj0=;
 b=rM/FBqISDguKHWeqwAoIc5R205Ll2JZTrjuWi7bRUAuqspVr2BjbAyEMtQ8JtAQSBc
 4sUY0BzgD54jX+6n6q3ZzIsMGeBhtak7d8jnIjNaJmtsIWtZWLuVw8g8kxuPcRIP2FoH
 4DVHjiNPddxwXHsZ1uGDPCGrkAut+ChHuiN/DDTj+3evzMr07HOXpOdz6CXbAPsxnRIo
 9QHzyJouYpS5kY5w8/R1i64nU+IOa2GPv7kjhPO8sxbLBkSIblkCWW6aVRn4WXbISFtV
 FkWYVxQyLo6L1WJU31fy6W7UQ/KnYGmTHW2z/Z0Tv0DxmFE/+5Wt7hbYw25gX52P+V7t
 Q0Aw==
X-Gm-Message-State: AOJu0YyLV/44tQtCGL96K6twVab0xcb1hSfV9ve/AXSx33C03H8mFCc5
 UflFVfHUFOQsd2W0z6r0PAfmXAsq+rREUzAhG4IOk7FjCs3ekG3vdOI2Io01gHs=
X-Google-Smtp-Source: AGHT+IEtCClo7xFdWLUnxKQgzkGDPuVdeL+yI1DSE5v0NPhdjnMrbB3jm2ZykWOZfLgPo9p5NAUidg==
X-Received: by 2002:a17:902:ecce:b0:20b:8ed8:9c74 with SMTP id
 d9443c01a7336-20c63802504mr12119275ad.49.1728437887598; 
 Tue, 08 Oct 2024 18:38:07 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c139876c7sm61374425ad.249.2024.10.08.18.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 18:38:07 -0700 (PDT)
Message-ID: <9c6ed649-846b-4f1a-bcd1-b5b8a0d589f9@linaro.org>
Date: Tue, 8 Oct 2024 18:38:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] tcg/riscv: Add basic support for vector
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 Huang Shiyuan <swung0x48@outlook.com>,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20241007025700.47259-1-zhiwei_liu@linux.alibaba.com>
 <20241007025700.47259-3-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241007025700.47259-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/6/24 19:56, LIU Zhiwei wrote:
> +    }
>   
>       tcg_target_call_clobber_regs = -1u;
>       tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S0);

I believe all of the vector registers are call-clobbered?
This needs

-       tcg_target_call_clobber_regs = -1u;
+       tcg_target_call_clobber_regs = -1;

so that all 64 registers begin as call-clobbered.


r~

