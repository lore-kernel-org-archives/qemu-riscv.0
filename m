Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A835EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 07:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEm7P-0006Au-6o; Thu, 29 Jun 2023 03:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEm7H-00069z-BG
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 03:30:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEm7D-0002b4-VF
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 03:30:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso3814325e9.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 00:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688023853; x=1690615853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0lOXHXqCerDPfT/4U+yKc+jXZqERXL9Qi4vT1mrkf20=;
 b=fX5bMKEyH6ukw4oqx5qsKyFB3QPRlYy8szlnfHibo8qGLSqvj7nnBV5fDSlXD3+jNK
 tfEarFhApfZxypQg0SjO1aEPgx+/5DJfKIvxSSL6FAYBVdwogGg8KVu2cFThYiwQlnBP
 MRlHsKjLnqCtlfUvKb/y7fDyMkM6AG9emeUp52ubmbw2U0FJPW3tn+GSPcHCKpe7kV5V
 8g9syc3ekdk/oW5Nf3zgWG5lKBGEWV/ZZhdUe5SSpTKnK1ZiY6TmcSk9X4f1fOpXyodO
 ara8o4bah+P6Fe23TfCEc69gG1ddmlWLTveJ1OzHMStzmtFOP4YeHetIqblxz12JY5aK
 5r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688023853; x=1690615853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0lOXHXqCerDPfT/4U+yKc+jXZqERXL9Qi4vT1mrkf20=;
 b=dty3XNJ6At+oBHU7IdkhlwTYzX3y2eNlM+MYzY3iugOzgKW8u4RlsUfiMnw0yKg2FQ
 BvxL8J1prkhaOzkpRbnxQKc+NCISFP4bGTHOtrBirFd6rotRJR01bU8srAWdrxYHoOzF
 tpbVgur+g7BVzeQarlCvSXvjQfR6PoWF2hEPE3LSifEF7O943YyC19EwY/1Y1tiB/B5J
 MRBkv+qCFUdgdmrFJt6tJb51DL76O6NYawUmAMWVV1LMYZjVC+/dT6xXQe6FpLb2hWqw
 jFmC0i2mLrqj04VhyKQJO6rnJE295x2jsNIrrDczMtJKilXCKggIuUpSgae/MaIOhV5k
 tKOQ==
X-Gm-Message-State: AC+VfDwV8EMvwUfDNA4a5WNCjqTjGzGlz/5rqkSm36ixoT4narlp80rK
 Thle6mJjhU/BDrFjeOtWcildPg==
X-Google-Smtp-Source: ACHHUZ6fSTUXFye6zswI35ZkyDEgnRKJlkHMEmai65HlqpBbNFmtHJmvRWViolKMinLmdTSi+UDz4A==
X-Received: by 2002:a1c:7417:0:b0:3f9:b87c:10db with SMTP id
 p23-20020a1c7417000000b003f9b87c10dbmr20824700wmc.3.1688023853541; 
 Thu, 29 Jun 2023 00:30:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a7bc446000000b003fba137857esm7167331wmi.14.2023.06.29.00.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 00:30:53 -0700 (PDT)
Message-ID: <7491e886-026c-4f97-3469-d9f7abe74f1c@linaro.org>
Date: Thu, 29 Jun 2023 09:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v6 15/20] target/riscv/cpu.c: add satp_mode properties
 earlier
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-16-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230628213033.170315-16-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 28/6/23 23:30, Daniel Henrique Barboza wrote:
> riscv_cpu_add_user_properties() ended up with an excess of "#ifndef
> CONFIG_USER_ONLY" blocks after changes that added KVM properties
> handling.
> 
> KVM specific properties are required to be created earlier than their
> TCG counterparts, but the remaining props can be created at any order.
> Move riscv_add_satp_mode_properties() to the start of the function,
> inside the !CONFIG_USER_ONLY block already present there, to remove the
> last ifndef block.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


