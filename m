Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD0BC5B572
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 15:26:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvckC-0006VZ-Kn; Sun, 16 Aug 2026 11:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvck0-0006HY-0g
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:25:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvcjw-00067i-NY
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:25:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so3084957a91.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 08:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786893932; x=1787498732; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=m9Qpf9GXwsvzKNeURLdWIaMZeQ+RttPA1yPVizMSgJk=;
 b=Hic/QHMU3HYXspLxQ+19jdnF0OFATKpcKEq9YbNN7KDVa25FhYVthpDjmfOoR6CvUk
 n0nYYjhhj82/sQj4wBSjefgNePA7VLFLHYO4+K203G2Sbk2loUhVS0zxk2EfnexEYyN6
 MvK1NXXOm6GszFx+ZRXT4gM0mdGOf3Y26mBt7zTisDRHJHECxrIqLCZyxiOTv3lAeJJz
 Kcx8grhxfToX3iYjsE2F6kawFZSwcyi1uw+rYJvp87jm2JijleTvmkKzEwjf7nJL47jN
 F8P3hLz9cTH4jyrJPHBhEkdvEJiDukC0kJg08UC6e+qRyTvVrMAHz13SJfQRRpH8KHO6
 nonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786893932; x=1787498732;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m9Qpf9GXwsvzKNeURLdWIaMZeQ+RttPA1yPVizMSgJk=;
 b=LhLWH/BX+Rarvlo2f9MR9MVmWW/1AuLr+QvCPIMgNPYEbYvPozzAwu23te/gIpWACj
 Lq7pSqiEX91otafBi266DCkCWrZI8fqG+yiiU17UgCxg9RTb0Pj0pZ3oXqNt5V7aL5/M
 mb+HajIHMwUfcKgMxJ1r+hXGhJTbog4ehEl9mCJGcneYYuH5ThZTt1zQuxD2dRVigAPP
 HZFx3BVAvTG4FqE7lJ6x+v0kQ7Vvb1Si/na+KiUj2LlH7LLDAIkDg/hVdXHI65cHTdjd
 EOKotO4+vGRabvc38kuU0uU3aMOqTfPuGcB+uazlw2GwbGVcsIA7gJu+R9BBMcV/69BJ
 bVLg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpgYChqG4fu3K7wUIbrCHNkLcnrAeLk4Q9bd6X39SwAZLJ2+RuJhXPNdyTFk+jM4UzyC2gfw2GTIwG5@nongnu.org
X-Gm-Message-State: AOJu0YwFG2lbv57mW44TM9t9JZZtjWgONrJWrA29D+8HjtXU3LAij5UM
 adCQs9I6sbXP06eC/MLNXN20gXSKqp42D14M3sz8FQbvA2pxYpe8mT4X0yGd/DWTJtA=
X-Gm-Gg: AR+sD13Qr1o1JbYhbLKxbtT/zT/a9qDl4/huUPs53YTPzGR7AalMb4O0IU1+1uQjLy5
 koAjN/rQtSQ9xnY2SLG7AtVYrvCTXJt0EWJ881eVXI4ifRpJVE04KIquwmFJm1CCqFXRCAImGXE
 BTZNkHR0Lt/y/6b4stsVSHGZge2EmgCGvm1o7T0q33iBsnaCgROlIIc0gWutCshGdl6pbVcIzfx
 NuNdjXSZd0/S8mDGc+Uk2EZQVB8tfUGGHNkqRNd0Cqs6ikQ9iPR3pDsuEAfLw4Tv8YPpy2dHkAG
 56qejHrBrYkYG6+dU8YrhHFoXHcp7RmfqVbOLFV19TfjLB6W2F9eAB/HU1xxAiW5zgWnpGku4iy
 aG1J012yFf6D1bRw5ntBxt588OniNV9l3bfNoSnEXcKzBqueAnOrzUZfVMMtu6zQBL5/D4XzqCB
 W002/bAr/IRALfV4S5tSZpdpBKDjAZ3y+JH4gvZANQ4PRgNo+7B+E1tcb7ajkfgzH78pBOSqNv/
 FQOrSs/X5kr017cCURquiicVB4g
X-Received: by 2002:a17:90b:1651:b0:38c:a59b:5189 with SMTP id
 98e67ed59e1d1-3933e633478mr18563238a91.15.1786893931938; 
 Sun, 16 Aug 2026 08:25:31 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39531fbc08bsm1756917a91.12.2026.08.16.08.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 08:25:31 -0700 (PDT)
Message-ID: <0ca1d5b0-775a-4069-8202-a58530339e01@linaro.org>
Date: Sun, 16 Aug 2026 08:25:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/23] target/riscv: Hoist vma check out of
 vext_set_tail_elems_1s
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, max.chou@sifive.com, qemu-riscv@nongnu.org
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
 <20260815194549.1377505-3-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260815194549.1377505-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 8/15/26 12:45, Richard Henderson wrote:
> In all cases we've already extracted it in the caller.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/tcg/vector_helper.c | 35 +++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 16 deletions(-)

Bah, I'm blind: vma != vta.


r~

