Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ACC4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 09:20:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qy7OV-00006t-Hg; Wed, 01 Nov 2023 05:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy7OT-00005d-QL
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:20:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy7OR-00027Y-4Q
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:20:08 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40839652b97so47589435e9.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 02:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698830405; x=1699435205; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xBjhJ5h56RysEJavvjefa4FFMqiMf0Olmr+Ynb5EgOk=;
 b=d25o8Rnbu8fjGKazQl6XmXd8sS1irglqq6Es+RrE2jpwakH9uqce1M9fq8u56D2Aty
 azNCZ+cJWPtbtjUy3J9u0vRbiZSNiP3O18gSmGsHgQhePWqUvUaEqpSNAnKE8Ne7Y9pM
 4dQsENgvZKI7R0MZ9aoUGX49Mvqf5CV8u0hxGi0r12wsnz0B/uoz5WPt8ejJP/YFo+7U
 U1eusaaFTl67PUqduRDeoyNO4eAZeFajbreDCQoWECW/XuZU9SI9oJSOSL2E5UGMIpel
 6woTNFCF5EZFol4CiQZhf7M5LDV5IKwdEN0ylTrRVhWjmQgiknB/IsF2lojVCmt0V65E
 uaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698830405; x=1699435205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xBjhJ5h56RysEJavvjefa4FFMqiMf0Olmr+Ynb5EgOk=;
 b=higS238Siu3KKavLM8cOTPXJ6X6LabXu1sC3H1LIu9no4nK9fpQsB4DsRpSqlheHCO
 BGOO8UI6Rs2MZ18yN8r7PfkW7lGTVLrYLcCZToZmi0pSluJE+RaTxXwE0BMjh2SDb0Y7
 rACnxS7meC41CayWeUyJ79230KDaLPuZq1ELMmSsA/LyIsVugL4h8hu/hM9s8bTl2N2U
 nrNp2l22ouj03uMlYxGG9DVkYa7YG1l9O7wGw3vbckuAYJ6i8LuHa8zS0QTvoY+Aeeoo
 xbqcfGvKtiriUSUSK2hagpi4Zcw6Lu7LGxfu/o+diRA/VRlDLjvljI3wnB7Unqtdee8F
 nnUg==
X-Gm-Message-State: AOJu0YxYHV12Ux2+rW6IEyh22A9tTkWBeMB1KaQN2+4/4P+p6xpLESS6
 zhQX1TN5tWXDcqq0McrEvr7J0A==
X-Google-Smtp-Source: AGHT+IG4GeJ0/INF8AFnrSQgEUfhPwgwUkZaUoccIFuT76bP5/XrDK91exdtyTU8pz5LhzwDJjfXQw==
X-Received: by 2002:a05:600c:198a:b0:406:8496:bd8b with SMTP id
 t10-20020a05600c198a00b004068496bd8bmr12993942wmq.9.1698830405650; 
 Wed, 01 Nov 2023 02:20:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c444c00b0040641a9d49bsm886889wmn.17.2023.11.01.02.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 02:20:03 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:20:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v7 02/16] target/riscv/tcg: do not use "!generic" CPU
 checks
Message-ID: <20231101-ec7856944e5893c9ce4c536b@orel>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
 <20231031203916.197332-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031203916.197332-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
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

On Tue, Oct 31, 2023 at 05:39:02PM -0300, Daniel Henrique Barboza wrote:
> Our current logic in get/setters of MISA and multi-letter extensions
> works because we have only 2 CPU types, generic and vendor, and by using
> "!generic" we're implying that we're talking about vendor CPUs. When adding
> a third CPU type this logic will break so let's handle it beforehand.
> 
> In set_misa_ext_cfg() and set_multi_ext_cfg(), check for "vendor" cpu instead
> of "not generic". The "generic CPU" checks remaining are from
> riscv_cpu_add_misa_properties() and cpu_add_multi_ext_prop() before
> applying default values for the extensions.
> 
> This leaves us with:
> 
> - vendor CPUs will not allow extension enablement, all other CPUs will;
> 
> - generic CPUs will inherit default values for extensions, all others
>   won't.
> 
> And now we can add a new, third CPU type, that will allow extensions to
> be enabled and will not inherit defaults, without changing the existing
> logic.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

