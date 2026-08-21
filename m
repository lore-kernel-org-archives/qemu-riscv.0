Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC315C5DF97
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 17:33:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxT6r-0005U0-ID; Fri, 21 Aug 2026 13:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxT6o-0005TQ-9D
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 13:32:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxT6m-0004PM-BQ
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 13:32:49 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-cbedd5aece4so1696546a12.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787333565; x=1787938365; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AziSiQyaswun75qWBZdrTtRtHkm/3fH7WtNiAoSsvxw=;
 b=zKgOnhVh2FQJCJLUr0LkyWXUFe6TO+O5nKTczW3vod3FzqzuKbqnHpzNfN2hWa3qKY
 XjOCs3kECsY+fxDcttM9/DvLGqfXBx/UIzstSfhCitg+veXEpIciVPTwf9/TKdVpocJW
 tdIMpaiKheRrentkf5yqMyl0B8bVAM94xwSef+aTiI+eg0nQEi0Y6P+7divwH8YWIIlp
 F/BJCGDbz5EV3Fz3ThsMKo5KYY5oKFbqwBRAR0UUWpcQBCgPtSwcIBdYKoDrSGbd7YTL
 zGygzESoZqa0djpkI0Ugjl0Rqn52etREFn7Joh0xgY5kr6N8EBq3T/29cHg9npNxFFNb
 LfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787333565; x=1787938365;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AziSiQyaswun75qWBZdrTtRtHkm/3fH7WtNiAoSsvxw=;
 b=XCWNYAbMXIIcrW7gGRy8bbKIaUJAFkKqyqmUQGiQ2t9fbj8uYrbOHchSoDooJZGGhc
 RVLGB0xihLeBreAcleO/Hug7TPn6OVO8LhFVUwwFOSq0MMudvpaJzFmQaRRluZz3yDxg
 n26fL26lWdN+eX8K7u/pw0AI7DKdd/3jqahWcveJbCs9sNcn0rcDoEp3bHhqLmMPsojt
 PSY+2lIeLIBBOtJ3vtYruw/UPk4vLu17EPGsLOfdNpAx9hfizDV8JkYPer+dS1yhonRj
 caqc7SDVqi6L5D2V+0xLFJbCRbPEgF/CaLmLUDbbc77WDSGe62W8cGaThkxyx1jkQXu9
 JZ8A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrwvxYknlih27cjn1PIq3j2Pn0xlJuPSCO8c6N2Pgohzqol7pOzv52YlRAA0KQG7D2ZPQIixBRczCs2@nongnu.org
X-Gm-Message-State: AFuF++krJnMZjPT+UzI28Ya3vdpucqpnTPgrtpUEg+mjApd5TKC4KOrG
 hGAcJ8qlAh79gpcHGXki0zsSShJuc3W3UFasiyY6hkuExdQpgWTsv2PDdIboY2wtJac=
X-Gm-Gg: AR+sD10jqB89zFd1vaPGzPDOJEClbfARHvHmGRyOTdMi0e0JcDxyeEU8nJaAYNubaFb
 uFhXVmAWOpS8L/z4ZW2zVfhyS8AxISBFDdRJPHxKm3syGeS1EqFS4ZLQ6Kq7f4dRpkrDHw0qwlA
 v7qTyYZ1SMD7I/2riAEz+aAlje813WJ7FbeqK7CCgOHSUNsh6apfVrruqlrZKIrpqg+HguWc3Hv
 wpgKsnFsnYOmfktlOEixba6baopj1SDMe0JWQf+WO1gU4IQZzllkQY8Hzak+E3nMkM4DWUNsGST
 XYxIXkTq2sWCQTTHLBpf/9BVwh8OVwxq4U6f8XPlyhbbrGGwhwuCjdr2HPqcN4sf4T1YzPo2cPJ
 MqEhF+kQwEYp+GZKwcJr3tI3o3YGhfIBo7Ysnke2C1AARL8+y5qcTxgaDy+FGToKZWB3+FFCfUm
 NE2ESyBo7xQSppti6TnfwC/bSb2pehfzI6wEwxFV9bseuYbovFk3QqnA1/A41htrYmDaAQzt5cv
 ne/XLo6dA==
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id
 98e67ed59e1d1-395c4c98f17mr7683255a91.4.1787333565091; 
 Fri, 21 Aug 2026 10:32:45 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4b47ae8sm4014181a91.13.2026.08.21.10.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 10:32:44 -0700 (PDT)
Message-ID: <bad5c8b3-668f-4893-974f-9dbca8dc6893@linaro.org>
Date: Fri, 21 Aug 2026 10:32:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio: Add aligned ld/st accessors for vring
To: Peter Maydell <peter.maydell@linaro.org>,
 BillXiang <xiangwencheng@lanxincomputing.com>
Cc: mst@redhat.com, pbonzini@redhat.com, peterx@redhat.com, philmd@mailo.com, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20260821100856.1794011-1-xiangwencheng@lanxincomputing.com>
 <CAFEAcA_kLpaz0UQi3Q315kLVqvDtxKh77kU2meN9G1_evfKBeQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_kLpaz0UQi3Q315kLVqvDtxKh77kU2meN9G1_evfKBeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 8/21/26 03:25, Peter Maydell wrote:
> I'm tempted to suggest some kind of "if pointer is aligned take
> aligned path, otherwise take slow path" either here or actually
> in lduw_le_p(), but maybe that's a bad idea. Richard ?
> 
> (I have a suspicion that other places than this one will assume
> that an aligned ldl_he_p() is not going to tear.)
I agree -- I expect most everything assumes ldl_he_p won't tear for aligned accesses.

This kinda begs the question of what atomicity the caller expects.  It's not implausible 
that an x86 path expects even unaligned accesses not crossing a cacheline to be atomic, 
since that's been a thing since 1995.  I expect both IBM architectures similarly expect 
atomicity by alignment, since that's been a thing for s390 since yonks and Power has the 
same language.

We have a bunch of code in accel/tcg/ldst_atomicity.c.inc that can handle this, we'd just 
need to provide it with the correct inputs.  And I assume we'd still like to inline the 
single access on appropriate hosts.


r~

