Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2526AC36010
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:15:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zbv-0000mx-9c; Sat, 05 Apr 2025 05:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zbi-0000lW-DS
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:14:31 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zbd-0007le-2C
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:14:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-72d3b48d2ffso3055387b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844460; x=1744449260; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pIj++5BKFWgo8S3pqp+BiF0puuMArL03f81m1ET7Hpk=;
 b=dVte9JOqG5ralQYwqr0+qe6lfsFi93bOPyjpJWKl2yREv+7mgctc+lIeWW184cH3mg
 osSmE8a02XIR/LZG85Ti6vnDFlNXhd37nh6tho0T/HxHxeQgy6wwt/RciUBrVjpQoMky
 fEfKrI9Mk0lrKN99fbeT6vuSDZrp0K334rKuZDRP+jtD3s4GLsvFNGjD+6uJ7Ekbfr1/
 u5RxqyeeJysNzL9gvBK2Umch7oVTTTlh8Jj6zOZqPyag9YXYhyVbSK09xrhknHIlkNOX
 nNzGOTEpsX6bSipi/qiFl0FrgBlJoH4TtTYJW+yfuiD9DsmjiBQuILYRZ3dnyS75JvtR
 Trsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844460; x=1744449260;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pIj++5BKFWgo8S3pqp+BiF0puuMArL03f81m1ET7Hpk=;
 b=cK/qdnUZNurhIKm4Ga7gK/hiwvvrk/8BirraN/o8g9Gttgc8e1NP5a5G7pUc6bdeQP
 XdUdM6dvnzlZVoO0RnjZEY0h+LjSn7YbmWFyOeWm0H1LWGwyQe2ayibugKzxZZT5Tw4Y
 pMnoPsVdN1R/MS6dc+KEaIymYA0Yzq2Pgx9adp7PyGlPqM8ZOeuEWA0yvof6PyBnYSVJ
 ELXbcyEgfQzB8J8pXZi++JflO+gCRQvECi1uhghGLTddbFAJwStbcGrV8pvSuVJi051b
 QaXUVNucxU2wAM2MEYnqmrEci317x17n8BH9w1vQbhaCM5L2gIYsVC3XEBMzbPWmLYJM
 wTEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8/vMHqKiclNLQyvdo5IZXlp+0gHQDMXAX8+kHpr/ORj0NIC8wmU4QJLsAFAivD4ko3h1/D1vYDbXn@nongnu.org
X-Gm-Message-State: AOJu0YwASLkzaOphaimJgXixCy2TFSkSs0iwPamC8lv5RtmKxUL2LHnn
 r/SBVcOYQmswH5sFYhNBZ49iGQ/TGaZcO5AmuRaobIid64UizKGBu8oqtGgVSgs=
X-Gm-Gg: ASbGnctinx/k/HRlSkpTS9zqgtR47YTxRsmX0sNW2+88LwFJuTCfPvzlosQBtndq3R3
 650c3Llj6CtAGwyhHu5J3Q83vZnf0B5x3dOUxKvz+X59lVhISUg4gR2/CP0EUl8I+iQ9DlZxKvb
 B/DmvCfDe7ykdt3HG8lO1E2C/zAAAUSr6pRBKvL+TWYnoG3hidAoHQbWG1gkN5jAh/4B0sg/ggp
 NDVmeEcAhj8NtGI6Zhz7GJOHoGDcUK+RRdXK6eSO4iElnLJElvzmRt1tjaYUMkAcJmfNUZDaUdH
 dGj1lWczsPZEyrIdkvLcgbKY6b4fXb/ZMzrjmdSuWHdDWREsTH5U6A6V942ORJfkw/anmSk=
X-Google-Smtp-Source: AGHT+IElS0KRZVLJpfEHCHus3UbXa7MyqiBAEG1EPvwroEW4bUp8Ubnnej4ROz0sfXKw2K3WS4+M5A==
X-Received: by 2002:a05:6a00:3d12:b0:736:34a2:8a20 with SMTP id
 d2e1a72fcca58-739e4c19f56mr9518059b3a.21.1743844460308; 
 Sat, 05 Apr 2025 02:14:20 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d97d1881sm4834066b3a.3.2025.04.05.02.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:14:19 -0700 (PDT)
Message-ID: <87129ffe-fa62-4e6d-b154-8e61a22ce13a@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:14:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] target/riscv: rvv: Apply vext_check_input_eew to
 vector register gather instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-5-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-5-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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



On 3/29/25 11:44 AM, Max Chou wrote:
> Handle the overlap of source registers with different EEWs.
> The vs1 EEW of vrgatherei16.vv is 16.
> 
> Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-authored-by: Max Chou <max.chou@sifive.com>

Since you're marked as Author you don't need this co-authored-by tag
in your name too.

Same thing for patches 5 to 11.

> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

With the co-authored-by tag removed:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 70c19c49ae4..4a0c9fbeff3 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3478,6 +3478,7 @@ static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> +           vext_check_input_eew(s, a->rs1, s->sew, a->rs2, s->sew, a->vm) &&
>              require_align(a->rd, s->lmul) &&
>              require_align(a->rs1, s->lmul) &&
>              require_align(a->rs2, s->lmul) &&
> @@ -3490,6 +3491,7 @@ static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
>       int8_t emul = MO_16 - s->sew + s->lmul;
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> +           vext_check_input_eew(s, a->rs1, MO_16, a->rs2, s->sew, a->vm) &&
>              (emul >= -3 && emul <= 3) &&
>              require_align(a->rd, s->lmul) &&
>              require_align(a->rs1, emul) &&
> @@ -3509,6 +3511,7 @@ static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> +           vext_check_input_eew(s, -1, MO_64, a->rs2, s->sew, a->vm) &&
>              require_align(a->rd, s->lmul) &&
>              require_align(a->rs2, s->lmul) &&
>              (a->rd != a->rs2) &&


