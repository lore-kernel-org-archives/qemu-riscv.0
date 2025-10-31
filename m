Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CF5CCF9FF
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 10:47:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEmej-0000ft-9S; Fri, 31 Oct 2025 06:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEmeh-0000f9-FB
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 06:46:51 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEmee-0001kh-2U
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 06:46:51 -0400
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-475e01db75aso13894125e9.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Oct 2025 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761907604; x=1762512404; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t7RRK2AsLEw/BDg8tEo+jJn/R/r/v0KXYOZO5g4JKm0=;
 b=glpLyI/aasPnZ4UyAsNfoKsIDlRGsG29lc3e8ELJO4qoM+iUk+f8BYDGVoSmV3ymHW
 uxQeMErkl2UK+olTXDgkbYhBBN2vsKop0fsQerwnyuWkCO6cxuZwwzxO9t5VZolpzUYz
 xTsEr8CtfEmWovVBEMeR6xc4ajPu+3GCiXWjlzEERUrmixeWYlsrU4n/qYxGaw8NRwwS
 ECOqqkJ1T5isEWjRnLonRTeklUFOyWCySaiS8UB29sCdH2Mx1mmhB8FnM4au9pSmwxnu
 P3Ebs88NWhyoQno57DJiHmGcOBROhoHyygw4i7/ZolBCsv1Mp5LUK+illIKjYuN3jRb3
 oapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907604; x=1762512404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7RRK2AsLEw/BDg8tEo+jJn/R/r/v0KXYOZO5g4JKm0=;
 b=oGgzsYHIf5jXN1p1sh9x4UPGXoXe/SPfVv+5Luqnm4WawBd6eU17fEVRtCLWJC5eJC
 MknRD36P1WUWbVwYp96gRid6iGCI9S5zzejr7foa+zdDjHNEjqo+cKX7Qx8cUSSt+atQ
 7xwG450UymhG0PZgUvLWELlcICeWIKp8LWfXrj0ylgrzeEyXs2WKBYS+Q3M1X8ONvhIA
 Pg5vFnou4LVtF4weJatPZgQQRSDCH8tKJ9KmurqTP+tyDGh6k8nVHcjiBdkzLCRWBzc8
 iZloqzcLGw7Z5/tP/FLM9tOlGXoLgRLvsMlvLyRCrYGJ60MvulcbBlxGeOZUS7N3R2/l
 ZKuw==
X-Gm-Message-State: AOJu0YzJDMLCRE64wgMPWjILa4ysAKY4iZKXbcvQRyJUM1GGLqn6My1l
 C0SgW/GmJxvilSJLN9B1sIGve+KjGdXoKRkl2XIKXqPrXGu0zFY6xZAzHx+z9aSIJ7tPaOT2oTO
 m4EA8VwdOa/8xhrI=
X-Gm-Gg: ASbGncvFkic1bNdn7kMDYNMw0qxh7iGVm4J0FbsFj+1BhFvCVq36QB3eVXtGKPin4vw
 SlC27Lnm26ohMnbfVLAyPz1/bW+48KlRytNHLVd6jenlLPAmJBR10QsFbYPmsUj1SFWsYN5wYwk
 /QPue0z5qlhtY7KCIb+SACe085jy4YAv+I5HWJnsiLptwf1vqqdax1Fr/qFqYoxeJyA0bHOotPS
 fBUXw+pREz3cy3qgT3+A260NpJZga+vSX32PeeUYC9M7tB7cbyTSPvoV0RKEc1eQnFGWWQgYOA3
 igFAoNo7nLb+xzP5k19AFiDcK5LXVkudaaxS9hwcVXo86qpCLgSoeay+uxhlXyNYhgmnfnBhf+F
 WXtRm+uH4zl4RLZ63TD2RuPgFiAGrFUToCCgje5NQKZlgn++3L65RcSKDLXr5aSzz0ufRNziIjb
 MS4Q2Zeid2FikQkOuuxrc79OKcmOmudxMN7wg7duWDG51/UadCGmFkVxaVOsFk4jBY4A==
X-Google-Smtp-Source: AGHT+IHJleT3TOztLaX77DBhcishsUHgG1hf7GaUmavljt9rzDVdBi/vsFo50UxXHXkW3qqcqIcyZg==
X-Received: by 2002:a05:600d:4350:b0:477:3543:3a51 with SMTP id
 5b1f17b1804b1-47735433daamr10599815e9.6.1761907604595; 
 Fri, 31 Oct 2025 03:46:44 -0700 (PDT)
Received: from [192.168.1.17] (adijon-656-1-155-31.w90-33.abo.wanadoo.fr.
 [90.33.190.31]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c114be36sm2969467f8f.18.2025.10.31.03.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 03:46:44 -0700 (PDT)
Message-ID: <ac37d23f-a0fe-48aa-8f17-3fee8534e71f@linaro.org>
Date: Fri, 31 Oct 2025 11:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] target/riscv: add NEORV32 RV32 CPU type and vendor
 CSR hooks
Content-Language: en-US
To: Michael Levit <michael@videogpu.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, smishash@gmail.com
References: <20251027100938.11822-1-michael@videogpu.com>
 <20251027100938.11822-2-michael@videogpu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027100938.11822-2-michael@videogpu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
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

On 27/10/25 11:09, Michael Levit wrote:
> From: Michael <michael@videogpu.com>
> 
> Introduce NEORV32 RV32 CPU type under target/riscv, wire NEORV32 vendor ID,
> and add a vendor CSR (CSR_MXISA) guarded by mvendorid match, plus meson glue.
> 
> Signed-off-by: Michael Levit <michael@videogpu.com>


> diff --git a/target/riscv/neorv32_csr.c b/target/riscv/neorv32_csr.c
> new file mode 100644
> index 0000000000..0cb8663436
> --- /dev/null
> +++ b/target/riscv/neorv32_csr.c
> @@ -0,0 +1,54 @@
> +/*
> + * Neorv32-specific CSR.
> + *
> + * Copyright (c) 2025 Michael Levit
> + *
> + * Author:
> + *   Michael Levit <michael@videogpu.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */

FYI since commit 354925d4225 we mandate SPDX-License-Identifier tags.

