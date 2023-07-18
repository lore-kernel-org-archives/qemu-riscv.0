Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6A1C001DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 18:45:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLpgr-0007Sk-Fu; Tue, 18 Jul 2023 14:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLpgq-0007LO-4O
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 14:44:52 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLpgn-0001UE-6g
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 14:44:51 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1b0138963ffso4736176fac.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689705886; x=1692297886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vX0mLXVfbXrw4mu9HYg9tTPKPDVynlEoMRO9xi/5nGo=;
 b=SPaQiMA0kQgsKCfXy49uGUsuCWadXQELUsjol3SZ6y68zbCpTUC8FPT4SrunQTOO3I
 maRTIujVnkVM1PinHTpRilcXzFpkkgxY9szsxzLigwfr6JOk80IT1PLNs+2BeWuIB9/M
 5jluvPXy8Q/gLUzPLnvjSLhiuVix+2D9LfDleUU0/d9L+jpbvR7B8ibpLW+5Z4PAGVx+
 Rub0y4uZTppm2zA6TTM5WcnugBGUnvM+HgdbSfNrkWHcGwJfI5XizDteJESN4SzuFw0J
 Q3PYue0xTI0mtdHS3Cnq1YFQFvwXJYgXs3B8uyOYjxOFDtHv5yeiYatI1VwbqgQHU+6v
 u1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689705886; x=1692297886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vX0mLXVfbXrw4mu9HYg9tTPKPDVynlEoMRO9xi/5nGo=;
 b=aoWfNcn3FeoJfQn9Lz+RUUKyarMFMFB/qPGUtoIeVChIblb0ZYIHVL951/epq6jjAV
 kl5hseFMXZvgXRN9Jt379GqKs79WJ2qKlZXLrS+vnUlcZtvvJA3iC1HZF4ZLJ2pc96wU
 0kh4WtDQZ3BR5VvM+ZcClcYmAfUaZqjf2X7KhUNfZuPoh6Wtfn4RJwY1f0j7znLLkLpg
 RYxfnzWr0Sk8L47OO36Vkn35sltvcZ1YT/VT7WmmVZn/5wtpvkhQ9W+7ncADyL8GOLRP
 RH2I9sfKxMWzlATTtiwbsUnW/p9jUP4j6ou+PzSaSt/C2v1DANEspq1sYIyD6XXGFxld
 qoAA==
X-Gm-Message-State: ABy/qLb0JcpQJMNH9pDvXKpbe4dzR8I9nrb/ClA33MSC6yFRVMknZiKl
 wcdbevxYcBeUbwL3bhjfbDbGIQ==
X-Google-Smtp-Source: APBJJlFz0ikme/YSZFqySJcHNvlZ5WtoxsCD/B9xI1EHkLBafm51Bm6At6H65fzFBMbPcm3gGY2oHA==
X-Received: by 2002:a05:6870:b4a4:b0:1b7:5ede:b7c3 with SMTP id
 y36-20020a056870b4a400b001b75edeb7c3mr16796224oap.39.1689705886381; 
 Tue, 18 Jul 2023 11:44:46 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 z36-20020a056870c22400b001a697e75260sm1184301oae.58.2023.07.18.11.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 11:44:46 -0700 (PDT)
Message-ID: <50e47339-5a52-0764-8d39-11724694bc79@ventanamicro.com>
Date: Tue, 18 Jul 2023 15:44:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.2 v3 0/8] target/riscv: add 'max' CPU, deprecate
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230714174311.672359-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

Alistair,

I'm doing some overly complicated stuff here w.r.t to KVM specific code
that are biting me back in further cleanups I'm working on.

I'll do some changes in this series and re-send. Thanks,


Daniel

On 7/14/23 14:43, Daniel Henrique Barboza wrote:
> Hi,
> 
> This version has changes suggested in v2. The most significant change is
> the deprecation of the 'any' CPU in patch 8.
> 
> The reasoning behind it is that Alistair mentioned that the 'any' CPU
> intended to work like the newly added 'max' CPU, so we're better of
> removing the 'any' CPU since it'll be out of place. We can't just
> remove the CPU out of the gate so we'll have to make it do with
> deprecation first.
> 
> Patches missing review: 5,6,7,8
> 
> Changes from v2:
> - patches 1, 3, 4:
>    - remove "DEFINE_PROP_END_OF_LIST()" at the end of each prop array;
>    - use ARRAY_SIZE() in the for loop
> - patch 5:
>    - remove the trailing '/' in the last line of the macro
>    - wrap the macro in "do {} while (0)"
> - patch 8 (new):
>    - deprecate the 'any' CPU
> - v2 link: https://lore.kernel.org/qemu-riscv/20230712205748.446931-1-dbarboza@ventanamicro.com/
> 
> Daniel Henrique Barboza (8):
>    target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
>    target/riscv/cpu.c: skip 'bool' check when filtering KVM props
>    target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
>    target/riscv/cpu.c: split non-ratified exts from
>      riscv_cpu_extensions[]
>    target/riscv/cpu.c: add a ADD_CPU_PROPERTIES_ARRAY() macro
>    target/riscv: add 'max' CPU type
>    avocado, risc-v: add opensbi tests for 'max' CPU
>    target/riscv: deprecate the 'any' CPU type
> 
>   docs/about/deprecated.rst      |  12 ++++
>   target/riscv/cpu-qom.h         |   1 +
>   target/riscv/cpu.c             | 114 ++++++++++++++++++++++++++-------
>   tests/avocado/riscv_opensbi.py |  16 +++++
>   4 files changed, 121 insertions(+), 22 deletions(-)
> 

