Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88C6E7849A
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:02:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnHcW-0006tt-JI; Mon, 02 Oct 2023 08:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHcJ-0006mS-CK; Mon, 02 Oct 2023 08:01:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHcH-0003VE-4b; Mon, 02 Oct 2023 08:01:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5FB6426BD7;
 Mon,  2 Oct 2023 15:02:17 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 786E92C282;
 Mon,  2 Oct 2023 15:01:34 +0300 (MSK)
Message-ID: <fced21d6-8d2e-f50d-b901-044be7c6e23e@tls.msk.ru>
Date: Mon, 2 Oct 2023 15:01:34 +0300
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
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vijai Kumar K <vijai@behindbytes.com>
References: <20230929123727.391346-1-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230929123727.391346-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -91
X-Spam_score: -9.2
X-Spam_bar: ---------
X-Spam_report: (-9.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.321,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

29.09.2023 15:37, Thomas Huth wrote:
> There are a bunch of RISC-V files that are currently not covered
> by the "get_maintainers.pl" script. Add them to the right sections
> in MAINTAINERS to fix this problem.

Applied to my trivial-patches tree, thanks!

/mjt

