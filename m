Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE257CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 06:35:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt09E-0003lP-1D; Wed, 18 Oct 2023 02:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=IJBG=GA=kaod.org=clg@ozlabs.org>)
 id 1qt09C-0003Vj-7b; Wed, 18 Oct 2023 02:35:14 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=IJBG=GA=kaod.org=clg@ozlabs.org>)
 id 1qt09A-00014u-Gh; Wed, 18 Oct 2023 02:35:13 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4S9Lgd3RQnz4xPy;
 Wed, 18 Oct 2023 17:35:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9LgS5FxJz4xPM;
 Wed, 18 Oct 2023 17:35:00 +1100 (AEDT)
Message-ID: <77cbea17-f4c5-4058-9bc9-e51d14e08fca@kaod.org>
Date: Wed, 18 Oct 2023 08:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add unvalued folders in tests/tcg/ to the
 right sections
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-trivial@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20231018062401.20746-1-thuth@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231018062401.20746-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=IJBG=GA=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/18/23 08:24, Thomas Huth wrote:
> Some subfolders in tests/tcg/ are already listed in the MAINTAINERS
> file, some others aren't listed yet. Add the missing ones now to the
> MAINTAINERS file, too, to make sure that get_maintainers.pl reports
> the correct maintainer.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b3599746c4..b80124f60f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -257,6 +257,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
>   S: Maintained
>   F: target/hppa/
>   F: disas/hppa.c
> +F: tests/tcg/hppa/
>   
>   LoongArch TCG CPUs
>   M: Song Gao <gaosong@loongson.cn>
> @@ -270,6 +271,7 @@ M: Laurent Vivier <laurent@vivier.eu>
>   S: Maintained
>   F: target/m68k/
>   F: disas/m68k.c
> +F: tests/tcg/m68k/
>   
>   MicroBlaze TCG CPUs
>   M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> @@ -327,6 +329,7 @@ F: hw/ppc/trace*
>   F: configs/devices/ppc*
>   F: docs/system/ppc/embedded.rst
>   F: docs/system/target-ppc.rst
> +F: tests/tcg/ppc*/*
>   
>   RISC-V TCG CPUs
>   M: Palmer Dabbelt <palmer@dabbelt.com>
> @@ -345,6 +348,7 @@ F: hw/intc/riscv*
>   F: include/hw/riscv/
>   F: linux-user/host/riscv32/
>   F: linux-user/host/riscv64/
> +F: tests/tcg/riscv64/
>   
>   RISC-V XThead* extensions
>   M: Christoph Muellner <christoph.muellner@vrull.eu>
> @@ -386,6 +390,7 @@ F: target/sh4/
>   F: hw/sh4/
>   F: disas/sh4.c
>   F: include/hw/sh4/
> +F: tests/tcg/sh4/
>   
>   SPARC TCG CPUs
>   M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> @@ -396,6 +401,7 @@ F: hw/sparc/
>   F: hw/sparc64/
>   F: include/hw/sparc/sparc64.h
>   F: disas/sparc.c
> +F: tests/tcg/sparc64/
>   
>   X86 TCG CPUs
>   M: Paolo Bonzini <pbonzini@redhat.com>


