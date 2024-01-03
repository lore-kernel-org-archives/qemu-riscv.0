Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFAFC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 22:18:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL9Z3-0001zy-C8; Wed, 03 Jan 2024 17:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rL9Z2-0001zh-0G
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 17:18:16 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rL9Z0-00014N-FU
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 17:18:15 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-594965fbb3cso5245161eaf.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 14:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704320293; x=1704925093; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oY7A6dcazrd1HX/YecrgNeGFMezD5hHIGXl4MS6ZxdA=;
 b=T3703RyBJ4I8hIoHXkF/KEf/DB1LOqAa9eUA4IhtT3dMjHiw8BK+hGhyJdJWcpVOzf
 S+OZyAYdyWe355lwiYz5qqJq1e+cF9JXNHltNDwFhDf2RFNx6EF6OHN2u8y/C00RCg0a
 g8ZJpviyXagpHRY9Sz3nimPT/0E0yMVDhUk66G4vjMVrmKt0hwdY+/4R8u4CvBBl9/Gi
 GNJ55gcGNAfWNO0WsnPAE8pTOYBTqJENxS76biYfG7NR2nXyYhv4rtuUrUt1VMNnQRJv
 7A0zl8xnffLSv/9r91IWarnKG9X9BlN+/nxSvsEN/T6MkTbnmgk2XSHfBAUZnmL7L//U
 FYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704320293; x=1704925093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oY7A6dcazrd1HX/YecrgNeGFMezD5hHIGXl4MS6ZxdA=;
 b=AzG819VrZtxDsq/+x4zaWaxzeVJQ+CU6WdvuPgjV7PTUmbAARWHgM5x1YN87N4he/L
 yIAD4oZSDqXEjnDVErc3W2uPPKOzt64O7S46Z/DD1Pjut8l4b0sHj+v58lnfY4XEhN4j
 cLP/Z7pqtVwsXlY33piH4x+jojqwIFPR3nZWBqtiwwY7S4AO8J++m6TCqQPI7h4A3O0f
 cZTvvnCLikmuAWm894oexnqREYP2kW4FFPFepOiiF9E4J/9ZZLevZn0AeXWn7O5wf3LL
 0M0vU1gvw/51eFkt2FkFcJP8EqgUsP7drol+VCxJ4X88mL4B//GeMaLCwGaVhEiLAJZX
 bb8w==
X-Gm-Message-State: AOJu0YzSOhquCifchQG+IoHMMj6RWWMHKTt8TwLhWWKJCP1els4xfDH+
 juTfK1IpF85f/94MGlyCC4hztNT/qovfmQ==
X-Google-Smtp-Source: AGHT+IHfl63e3h8k0UBNGbukm9N6fcWtClBQsI2DHfGkuEYK4eVmhRuqADGuMXejLyJE1ZfrfNa/Wg==
X-Received: by 2002:a05:6358:6f8d:b0:170:cc82:db41 with SMTP id
 s13-20020a0563586f8d00b00170cc82db41mr24209890rwn.21.1704320292794; 
 Wed, 03 Jan 2024 14:18:12 -0800 (PST)
Received: from [192.168.50.95] (124-149-254-207.tpgi.com.au. [124.149.254.207])
 by smtp.gmail.com with ESMTPSA id
 k4-20020aa792c4000000b006ce5da5956csm23439586pfa.24.2024.01.03.14.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 14:18:12 -0800 (PST)
Message-ID: <8ee0bdd6-42b8-4b4b-9083-ea6eba08447d@linaro.org>
Date: Thu, 4 Jan 2024 09:18:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] target/riscv: Update address modify functions to
 take into account pointer masking
Content-Language: en-US
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-6-me@deliversmonkey.space>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240103185716.1790546-6-me@deliversmonkey.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 1/4/24 05:57, Alexey Baturo wrote:
> From: Alexey Baturo <baturo.alexey@gmail.com>
> 
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>   target/riscv/translate.c     | 12 ++++++++----
>   target/riscv/vector_helper.c | 12 ++++++++++++
>   2 files changed, 20 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

