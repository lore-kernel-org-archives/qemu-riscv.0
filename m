Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FEDE71D32
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 13:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmDfL-0006bX-TF; Fri, 29 Sep 2023 09:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmDfL-0006bK-EI
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 09:36:23 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmDfH-000205-RO
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 09:36:23 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-692b2bdfce9so11119391b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Sep 2023 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695994577; x=1696599377; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N9XvawPIm8AAK8vn5c7WlUQobdWO8jSaTP7woZb2NPk=;
 b=FKDbJLkBNp9zD7FuqHKSSy43Gf1zGBKxC6WU/lq4aeQOrC2ZS1NEyMWWq5Nirjr/uF
 2TydN1agRjoi6fgeAGswMYqjl1OMBb9s8FCEQ8o0jD1ahS01ghhv6K19/Spb/3RDuwHw
 5yio3uyxhE8JkURLHH0dh9FZ4DxVrE7ASE9YO43j8k2l/np6Cv31monx0SmThvCzOoxa
 O5TZ8WDyPyUlzbccmpHTVCSom7qxr3fhUoMJDgrzXJj/yz2tbOXm4T759MYCF6NymZ6a
 ViY4KzdLfZjIBRBtfvl9NGZk0t8/eSNgeAByvI8DNzsU11PXpu0fHHnMuu/6sv2Mxt5T
 e5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695994577; x=1696599377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N9XvawPIm8AAK8vn5c7WlUQobdWO8jSaTP7woZb2NPk=;
 b=TXhkUuSCL689ves7ym4JbcJk1VWYYF7UlpjYqXLEwGKQNNjWAiNBWmXQU3KSMbV9Wn
 nJEIGTFTaX5WK+j4QAm5WiIIQ5+JYgMQbvH3fY+axjT2sBSl6IL08ib5Ief8OVAorXqc
 IFi7IUaPiHGUbzqZ4ivzASrrusODubGcPZHSDbzDKF+B04Swuj1DOCczkjGqq0xlKaOr
 xYvvvxMOae9RRWF3oXdzAccuQmxtb9Cs5gUerIYQ5UXD3eVbABOzDcBd4tqS9Qs42KUr
 OPMd2z7yUvEWI4dXxBwI5mNFdpS4KsxE4p8Fo9B1sp++He2cKWpiIEO6va/jpIt8KIvY
 N7RA==
X-Gm-Message-State: AOJu0YzN5t1iWTJYIwcyeLKpjMu0HUTqFw1YEE1VOfKs4MaLyeKgAPAU
 DIhVVXMf9UwNvtGiutlamwosGg==
X-Google-Smtp-Source: AGHT+IHvpO+6VDkPqizl+vuxrticEz0Nx+LOrs0JkDHPoReg8xHIwlrof4/XJXIyRnCRZz5n5tfWZQ==
X-Received: by 2002:a17:90a:7446:b0:274:4fb:360a with SMTP id
 o6-20020a17090a744600b0027404fb360amr4204129pjk.16.1695994577003; 
 Fri, 29 Sep 2023 06:36:17 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 cl1-20020a17090af68100b00277246e857esm1439250pjb.23.2023.09.29.06.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 06:36:16 -0700 (PDT)
Message-ID: <a0ea282c-1949-4706-631d-7e34df98cb87@ventanamicro.com>
Date: Fri, 29 Sep 2023 10:36:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add unowned RISC-V related files to the
 right sections
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vijai Kumar K <vijai@behindbytes.com>
References: <20230929123727.391346-1-thuth@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230929123727.391346-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.295,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 9/29/23 09:37, Thomas Huth wrote:
> There are a bunch of RISC-V files that are currently not covered
> by the "get_maintainers.pl" script. Add them to the right sections
> in MAINTAINERS to fix this problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   MAINTAINERS | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 355b1960ce..1313257180 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -317,8 +317,11 @@ R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>   R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: configs/targets/riscv*
> +F: docs/system/target-riscv.rst
>   F: target/riscv/
>   F: hw/riscv/
> +F: hw/intc/riscv*
>   F: include/hw/riscv/
>   F: linux-user/host/riscv32/
>   F: linux-user/host/riscv64/
> @@ -330,6 +333,7 @@ L: qemu-riscv@nongnu.org
>   S: Supported
>   F: target/riscv/insn_trans/trans_xthead.c.inc
>   F: target/riscv/xthead*.decode
> +F: disas/riscv-xthead*
>   
>   RISC-V XVentanaCondOps extension
>   M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> @@ -337,6 +341,7 @@ L: qemu-riscv@nongnu.org
>   S: Maintained
>   F: target/riscv/XVentanaCondOps.decode
>   F: target/riscv/insn_trans/trans_xventanacondops.c.inc
> +F: disas/riscv-xventana*
>   
>   RENESAS RX CPUs
>   R: Yoshinori Sato <ysato@users.sourceforge.jp>
> @@ -1518,6 +1523,7 @@ Microchip PolarFire SoC Icicle Kit
>   M: Bin Meng <bin.meng@windriver.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: docs/system/riscv/microchip-icicle-kit.rst
>   F: hw/riscv/microchip_pfsoc.c
>   F: hw/char/mchp_pfsoc_mmuart.c
>   F: hw/misc/mchp_pfsoc_dmc.c
> @@ -1533,6 +1539,7 @@ Shakti C class SoC
>   M: Vijai Kumar K <vijai@behindbytes.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: docs/system/riscv/shakti-c.rst
>   F: hw/riscv/shakti_c.c
>   F: hw/char/shakti_uart.c
>   F: include/hw/riscv/shakti_c.h
> @@ -1544,6 +1551,7 @@ M: Bin Meng <bin.meng@windriver.com>
>   M: Palmer Dabbelt <palmer@dabbelt.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: docs/system/riscv/sifive_u.rst
>   F: hw/*/*sifive*.c
>   F: include/hw/*/*sifive*.h
>   
> @@ -3543,7 +3551,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
>   L: qemu-riscv@nongnu.org
>   S: Maintained
>   F: tcg/riscv/
> -F: disas/riscv.c
> +F: disas/riscv.[ch]
>   
>   S390 TCG target
>   M: Richard Henderson <richard.henderson@linaro.org>

