Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83728CD343E
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:54:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slUvL-0005UE-JJ; Tue, 03 Sep 2024 10:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1slUvG-0005B1-So
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 10:54:23 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1slUvD-0006QP-Bv
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 10:54:21 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-71423704ef3so4057417b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2024 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725375258; x=1725980058; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9k5/HOvNk/2TbU1XSW1ya0E8gidJE236U4uoiUI92lM=;
 b=P5IN7Xqu0LXbcVC8nS4YmhGzic56CPlhMD5wiy/rFo0fGbkRs3uRd1UJe3OS9dLMgc
 205ylqJ0NgvyFUG+uKrtetj49p151ueqWLeAtHbbtu4L6AT+3CMnVFp9jalz5GXGHWL3
 UyDZGKlL9m14AQClPMRM1pgdzrx7kg/zBUjvSxcbjLXWb+FLJ2PHAa4ztEt+kLtxu9YO
 VeqPEHgsCMIlCrts8gkYM/HOdrMlHQ6tBPbHyQNAO3mwkQKkv8BOSGyIuYz0Jde+PpVd
 2vjpZcSandhxek3EeYUmQ2ZoZirR+hgcOTGRYhD5EQJhs1xd5NFm3y5KzBQjaYsg/IwY
 8z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725375258; x=1725980058;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9k5/HOvNk/2TbU1XSW1ya0E8gidJE236U4uoiUI92lM=;
 b=DEYW6PZP7Dp3TXQL+encLUJ1XvMROqjGM4+DmxL6FB8ZIel2iNjb82E0Qg0Q7IEsFA
 MGIMRvjMo+fvAPV8au3hncC2mQd7NiB2wFJfxzXCgg3SLDM/pb06yOfhiQWez1h0+Fxy
 Cbj2JZVN4rRzzhrTpOG1BzLXuS2GsrHk5IE0yh6PTMnh46D1OA1NOPiR2ihN/JqUtHDx
 Nt4bMhHfm1U/Hap6SebGQoTghjoqA/GC6Ar/n1KdHQ9x4hiczZCpQ03AcM3uMG9UKc+M
 TxRqwv7gdZgCuN1lWWTC3nBmyCqK/mT2JxvOQ/jTf8Ra3ablodUZM6axvTsN99QW40lb
 FOhA==
X-Gm-Message-State: AOJu0Yw+pjhHzgcvDnuUfooZepl2h5DLKuDYf5DS93nVgm8I457RoJUl
 CqHr0bp3jJMdWH/gdkdHI0Y+YnMaJtmdux0oKQlaWC3ZIw6EqMTEQ2iOyhDms18=
X-Google-Smtp-Source: AGHT+IHOpNmFPXUhIo7Eam8HYpE01pEFtzCKfC3BcQvDtzfVyFz1aHjtI8bJB3/pa2WVEIsslekICA==
X-Received: by 2002:a05:6a00:3a1f:b0:70d:2796:bce8 with SMTP id
 d2e1a72fcca58-7173b69111cmr15400940b3a.20.1725375257444; 
 Tue, 03 Sep 2024 07:54:17 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715e55a3b61sm8587921b3a.48.2024.09.03.07.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:54:17 -0700 (PDT)
Message-ID: <d268543f-3453-48ae-befa-c415b1de4a29@linaro.org>
Date: Tue, 3 Sep 2024 07:54:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] tcg/riscv: Implement vector shs/v ops
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240830061607.1940-1-zhiwei_liu@linux.alibaba.com>
 <20240830061607.1940-13-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240830061607.1940-13-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 8/29/24 23:16, LIU Zhiwei wrote:
> From: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> Reviewed-by: Liu Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target-con-set.h |  1 +
>   tcg/riscv/tcg-target.c.inc     | 44 ++++++++++++++++++++++++++++++++++
>   tcg/riscv/tcg-target.h         |  4 ++--
>   3 files changed, 47 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

