Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB54CA1014
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 04:17:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu1Oo-0007Ul-Cq; Thu, 04 Sep 2025 00:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uu1Ol-0007Tn-LJ
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 00:16:35 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uu1Oh-0004EO-LJ
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 00:16:35 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so101389666b.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 21:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756959388; x=1757564188; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gt9mkf1NpEjMQenTbi8kXaqUvXiyFIuizNiEJ7lRJb4=;
 b=ps5DzX/Ul3qVn0a0vu6Q58b9/bqqgia4+lqouvmrURS/+saeA8cRXq8q0e90aOSCDW
 wA+jVuWUyJoaCPe2ucBuzlJl4jezan4CJE4amCyCuviQGJJ6pTboQtIPazW0QGcuhum2
 P9U1wylVskGVvvl0O+pU4JWdblJlA40VfVaPNgx5QW3vKJ+dszXA5CWqPtD8UZOV0kZO
 8GwqBPL0bPC9ldvPlOMI/oEC2G+nzfwM8Owt7JLggSN8ck19b+aQ9WJqSPp5TmNbnp/W
 hxbHun6r62Ldqf41waFm77Ekyi4KSID7G15D20ymtQb/UvYLffOGZBxUJQuEhN2Gs8QG
 z2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756959388; x=1757564188;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gt9mkf1NpEjMQenTbi8kXaqUvXiyFIuizNiEJ7lRJb4=;
 b=dOJsgzI8kT7E55yqcLTiyeL3LmIVX1a1Bv2FQSvD696X/6JpVo0iWSv02zTk+ctjW1
 JS37YmqtEDkD4sFX1YAp5a64mGhQJukaZW2HEQtaHUuvEedhA3t16RdcvYuYgAf6e9yv
 s20KxIgaI07+InZxDonHEv08UClgi7rrhU8tdmpdLMjQL9rvpsGrKg9x4TEpJ2S1INQK
 v1wbK+yuJpLpC/dDMsP4IogjIlDkwntXVVhdUTFYHSS9WVh4y38xJAlDkWZMxvdt2yuH
 KRCQ/7BDFD1rLfN0aRBxDjqLe0pf9OG5uT0OS3maXEu2loWpt1WcNSo6BO75/s0g9cel
 +V3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyieRnoC6UGs9vKIoE2recsUKTDdv7A6X58AY3JAwlQE48jpCnKGI/G1n92nKQc7z4Ow96uA+QebE0@nongnu.org
X-Gm-Message-State: AOJu0YzcbpWFZmaHQCIY8Iw2A1fCamn3p9KovqEszQoWbYNStBIvic05
 wwwFimVIF9dmfYTOmD6it1gEMTUffFfrnjjJLxULxcbYYK8Qt4XB5QCVah3aA9Lurrc=
X-Gm-Gg: ASbGncsO4RFOxKqXvki4bjuK8JuDjcpTvXh3AwM+MZ18nCZn6v+rgVPqCfeLJ5tRrWV
 Qi4jC49/cXu8u2qW/vckRNNH+aZHte6I+grp2YGOtWSxCYS0TAMM1K9jfhbypn2sdepLfvvpPIn
 VfMXh/JOavNsQLFhkA+aBhkWUl9A039sD4evUKZKmezlmBk8doRXkGgw/izuDzGLWb9zw75Ze6m
 73s3Ymkpq/grVIoFLIbeA1WbTVc67N0ArviNZ+QZdylLS/+4hU7tGFEzlT4iBqTmMoQG24BFTrU
 RccModQuLQAV6BjMr9I+MxgR8rubScx6r9zgn1iJuO9BQ55LYHKnFOFZuyLaAXC4I60SdzABTGo
 BBxNntWCCj2CmqcsO/55wSsc/j9Ks6Hp43v5sd045nacReewNVfsm3L92dtBzQXNeuCx0o/OUXG
 +AGS0GBw==
X-Google-Smtp-Source: AGHT+IEczdrf9XAgNWScyppaJFJ8OgaN9kz4GGsu6OZ3PBBPxlyVOGDBYPHv59CcpJird0YeaESj+A==
X-Received: by 2002:a17:907:94c9:b0:b04:2f81:5c35 with SMTP id
 a640c23a62f3a-b042f817f8cmr1260264566b.34.1756959388220; 
 Wed, 03 Sep 2025 21:16:28 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046e6c630fsm259765566b.55.2025.09.03.21.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 21:16:27 -0700 (PDT)
Message-ID: <487e743d-9028-4909-83d3-dc30a2afa0bf@linaro.org>
Date: Thu, 4 Sep 2025 06:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] target/riscv: rvv: Add Zvqdotq support
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250903140308.1705751-1-max.chou@sifive.com>
 <20250903140308.1705751-3-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903140308.1705751-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62c.google.com
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

On 9/3/25 16:03, Max Chou wrote:
> Support instructions for vector dot-product extension (Zvqdotq)
> - vqdot.[vv,vx]
> - vqdotu.[vv,vx]
> - vqdotsu.[vv,vx]
> - vqdotus.vx
> 
> Signed-off-by: Max Chou<max.chou@sifive.com>
> ---
>   target/riscv/helper.h                         | 10 +++
>   target/riscv/insn32.decode                    |  9 +++
>   target/riscv/insn_trans/trans_rvzvqdotq.c.inc | 61 +++++++++++++++++++
>   target/riscv/translate.c                      |  1 +
>   target/riscv/vector_helper.c                  | 57 +++++++++++++++++
>   5 files changed, 138 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rvzvqdotq.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

