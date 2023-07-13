Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F60EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 06:47:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJq5y-0001UH-RO; Thu, 13 Jul 2023 02:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qJq5w-0001TY-76; Thu, 13 Jul 2023 02:46:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qJq5u-00022g-Cn; Thu, 13 Jul 2023 02:46:31 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 166931369F;
 Thu, 13 Jul 2023 09:46:39 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6DE45147CE;
 Thu, 13 Jul 2023 09:46:25 +0300 (MSK)
Message-ID: <b0ecaf6e-4639-bc29-fdc5-60a064986352@tls.msk.ru>
Date: Thu, 13 Jul 2023 09:46:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs/system/target-riscv.rst: tidy CPU firmware section
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 qemu-trivial@nongnu.org
References: <20230712143728.383528-1-dbarboza@ventanamicro.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230712143728.383528-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.11,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

12.07.2023 17:37, Daniel Henrique Barboza wrote:
> This is how the content of the "RISC-V CPU firmware" section is
> displayed after the html is generated:
> 
> "When using the sifive_u or virt machine there are three different
> firmware boot options: 1. -bios default - This is the default behaviour
> if no -bios option is included. (...) 3. -bios <file> - Tells QEMU to
> load the specified file as the firmware."
> 
> It's all in the same paragraph, in a numbered list, and no special
> formatting for the options.
> 
> Tidy it a bit by adding line breaks between items and its description.
> Remove the numbered list. And apply formatting for the options cited in
> the middle of the text.
> 
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

I'll pick this up for trivial-patches, but since it's the only patch there
now, it's IMHO better to apply it together with other riscv changes if
there will be any for 8.1.  So let's pick it to both trees and the first
to apply wins.

Thanks,

/mjt


