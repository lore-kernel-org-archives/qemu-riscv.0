Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11438C7EE2A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 03:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5Hwx-0006Vl-L6; Fri, 02 Jun 2023 23:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5Hwr-0006NP-Po
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 23:29:02 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5Hwp-0004Dt-5T
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 23:29:00 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-39a3f26688bso2288159b6e.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 20:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685762938; x=1688354938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90OVWhSvfeuahQ1nkOs3ms+6HyMVALOqvyrfKrIdRps=;
 b=ajZBzqzzBstBCeTQb0QBEMgMNlj/D6qnb44zAnPWtRScKbGc5vD8QaY6oSqjHWhGs0
 HYMOWRgkyvYvtl4O54Oj7diqLWzQ840Z8IHgBQi503goNxtPcNzzbURe1qbyoUsMVloG
 ufsc8JQZfViinviKFe3idqcfjXOKzinCJdifqSdlq2+ZnvSOcp2+F1SA8cO/TC7sfdr3
 qmrV6ncpY8CM9pMQJLfA6whmNQPwC/0QLXv/eLZQ5VJ+s+qwvsHwkNtxjHMavKkn9bNm
 QFyF/Y8HAS6njEQDyg0D2LuTIktOrl0ia7qENA5+xNji3cbGQRdADo64sKsm08CVMtmw
 sLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685762938; x=1688354938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90OVWhSvfeuahQ1nkOs3ms+6HyMVALOqvyrfKrIdRps=;
 b=NNC79gLpgMr6dE7NRHzZ8lrGzJvl/EVoMUXi4ozhp0MZhKeTVQ8Q3ekm2HzzyrwzJ0
 SaLHSpuWOHcPGf7Mr7PGqDLBHSmLeRjNqi+CSP7SPVgRqsTHzGjvf9YbSFoyl5ieNs7x
 OwlWkhWkjXPe0EBOsoPLqNDmHY+tdRWgsJnYSIIX9V6th/ks6wrXGzx4Be1GCSGsATJj
 hZBFbKqzYzmVzaPNmqrsJ86yNoWuqU1I7CLnesYIZMZa0Px5rd8bkwnlDUzQQvbhT3Qs
 Sme05NdqeERHVXqcUZOoflAHOcvqAPPT0ZJB66dnTLscCSep5sT6Pl6VUMPyTyEhqTxW
 14mA==
X-Gm-Message-State: AC+VfDy87aD0A0YmzHRJJa8Lq4QhFRKWoMIm4FrC4tuLbkg9ttvQHE8P
 2J//xfhfoFFhp86jOEG3VUlQNw==
X-Google-Smtp-Source: ACHHUZ5DaWPwW7k0nispuP/LI5A9ErFZip+/Zq+LbXyBOQ+qFQbjBHn02tocivB8c3dn7Hu88jGIjg==
X-Received: by 2002:a05:6808:a95:b0:38d:f794:26c with SMTP id
 q21-20020a0568080a9500b0038df794026cmr1760675oij.56.1685762937936; 
 Fri, 02 Jun 2023 20:28:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170903200a00b001acad024c8asm2088353pla.40.2023.06.02.20.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 20:28:57 -0700 (PDT)
Message-ID: <f5d8ac15-2e39-b292-af0d-19ab2847dd3e@linaro.org>
Date: Fri, 2 Jun 2023 20:28:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] target/riscv: Add Zacas ISA extension support
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230602121638.36342-1-rbradford@rivosinc.com>
 <20230602121638.36342-2-rbradford@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602121638.36342-2-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 6/2/23 05:16, Rob Bradford wrote:
> +#if TARGET_LONG_BITS == 32
> +static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)

You need to eliminate all of the ifdefs, because we can switch a 64-bit cpu into 32-bit 
mode -- get_xl(ctx) shows which mode we are in.


r~

