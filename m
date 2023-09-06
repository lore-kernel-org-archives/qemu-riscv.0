Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EDEEB8FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 10:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdpck-00018F-EY; Wed, 06 Sep 2023 06:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdpcj-00017q-7M
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 06:19:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdpcg-0000tl-3G
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 06:18:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401ec23be82so36127345e9.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693995536; x=1694600336; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J/5qSh6ikRJ/1RS4u5w8Fe2c46FaNrABtblkUv3igfM=;
 b=mjddqdw9A4RqrrhPYWr5q+axbT1dlTQ085C4YJ3BuAV8GbJsinO3MqgMTPuJ7whPMs
 kN1yZDWV4Bgmhe/Wf1xhGI+1EzpGbGtOf4DXCKHwmfX/9okMbTS8OctJ9FdHcqpBMSLk
 OjAL1kpZ/QvdyUBbnuwZAoevwu4iGTNRoC69Y9k0FSWidUBVIdwzmCGHLM1OM0fFAy9Z
 462J1nVS+IytNV7VfqYH5vy5X4MvPJ5DeCQgt7KZq0ze41/Jxzx8z4PrT5WJWX+fNl4V
 lCsWlHQPvti9R/jH8Q39iegWpFg6r64dyubDX53bInJZhW/Vzay1s1XOSlvl2CQReA2o
 Slfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693995536; x=1694600336;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J/5qSh6ikRJ/1RS4u5w8Fe2c46FaNrABtblkUv3igfM=;
 b=ICqnCLsK1ZD25Nzz3OPVd+c2VUdIgSIoP+eBbCrzLNOy17CzEcC5MPX6OuFcw4yQNp
 6Ny3h6VSCpxitMI8uufMQKDIl+ihjKE0gzaGn4tr5yOAvMvAPRsiL3N87qffMnMFEjPq
 QHPbNSKThYCfBjjp3NIV6/L+p+Lb/hy6fOkYszRlWzjg2a80VGvjhKuXLptG/5eO1oL7
 bdWMTl7tfDpZt+sEoNfvfUPNh97t4Xo+DaFMXeKDgPJGf0Kjn2kRvnqX+kR2svWVFO3U
 b6RwMtOWneoume90Mgc+pZ/AXAQvof6I6MXrg9ACWQNRypx5TcTSXL+RoH72j0zavBpU
 qj4w==
X-Gm-Message-State: AOJu0YwpPDIeJmvHeSGoC923u5tsmiBuF4TxoFlfd5hXkiKIg5CMaEAS
 kAJlmVWwT2UIn8/DDu1ibzqObQ==
X-Google-Smtp-Source: AGHT+IFng/wn4VpWfTmKUqbosgN18Bztp9Xaar7W/PEX+IbnwJsJJkbQXn0G4CFXSpJG0USvZ68klg==
X-Received: by 2002:a7b:c3cd:0:b0:400:ce4f:f184 with SMTP id
 t13-20020a7bc3cd000000b00400ce4ff184mr1813625wmj.41.1693995536474; 
 Wed, 06 Sep 2023 03:18:56 -0700 (PDT)
Received: from [192.168.69.115] (cou50-h01-176-172-51-223.dsl.sta.abo.bbox.fr.
 [176.172.51.223]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c234b00b003fee8793911sm19238818wmq.44.2023.09.06.03.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 03:18:55 -0700 (PDT)
Message-ID: <8c046fdc-03da-fd99-76fe-6f6ef9013e8f@linaro.org>
Date: Wed, 6 Sep 2023 12:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 14/19] target/riscv/cpu.c: export set_misa()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-15-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230906091647.1667171-15-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 6/9/23 11:16, Daniel Henrique Barboza wrote:
> We'll move riscv_init_max_cpu_extensions() to tcg-cpu.c in the next
> patch and set_misa() needs to be usable from there.
> 
> Rename it to riscv_cpu_set_misa() and make it public.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 34 ++++++++++++++++++----------------
>   target/riscv/cpu.h |  1 +
>   2 files changed, 19 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


