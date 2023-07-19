Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C52C0015E
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:42:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMAG4-0006Lb-QI; Wed, 19 Jul 2023 12:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <whitebox@nefkom.net>)
 id 1qM9sd-0007U3-Ap; Wed, 19 Jul 2023 12:18:24 -0400
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <whitebox@nefkom.net>)
 id 1qM9sb-0000TP-0C; Wed, 19 Jul 2023 12:18:23 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4R5gw94KVrz1sCHZ;
 Wed, 19 Jul 2023 18:18:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
 by mail.m-online.net (Postfix) with ESMTP id 4R5gw91zTMz1qqlS;
 Wed, 19 Jul 2023 18:18:01 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 9uxBqe09P3_b; Wed, 19 Jul 2023 18:17:59 +0200 (CEST)
X-Auth-Info: 80s0+RDoDFASNyRBgeq78EsUkABNQKkKW29OAR3M2BknY+YUmuelfbb/hE+z/Owb
Received: from igel.home (aftr-62-216-205-166.dynamic.mnet-online.de
 [62.216.205.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 19 Jul 2023 18:17:59 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 5052A2C1C03; Wed, 19 Jul 2023 18:17:59 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <anup@brainfault.org>,  Alistair Francis
 <alistair23@gmail.com>,  Atish Patra <atishp@atishpatra.org>,  Anup Patel
 <apatel@ventanamicro.com>,  Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor@kernel.org>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org,  alistair.francis@wdc.com,  bmeng@tinylab.org,
 liweiwei@iscas.ac.cn,  zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com,  opensbi@lists.infradead.org
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
In-Reply-To: <CAEUhbmVoYnOMEi_Hqi7iX0__jTjbEnaxrHjCJHuMVaUAcMiACA@mail.gmail.com>
 (Bin Meng's message of "Wed, 19 Jul 2023 23:45:40 +0800")
References: <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <CAAhSdy3J5HUoVP21jo11FBuAFSPSxHNKtuL7amn-5t7n_smoSg@mail.gmail.com>
 <20230714-reoccur-confined-4b37494b1201@spud>
 <20230714-hash-handwrite-339817b93ba1@spud>
 <CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
 <CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
 <CAAhSdy1+wRpqoTFmBRNF7uFnc_fFCyCnt5ctoMu7zhTiu2GcTg@mail.gmail.com>
 <CAKmqyKOTik3tUa1MyHAyc5jOWcPDY=seHuR-VurHbSKaCKQFpw@mail.gmail.com>
 <CAAhSdy1vkk6xj7HSyPHKN0d0qgYrq_rn-+iw_rxkdDBKqpC2yw@mail.gmail.com>
 <CAEUhbmVoYnOMEi_Hqi7iX0__jTjbEnaxrHjCJHuMVaUAcMiACA@mail.gmail.com>
X-Yow: If you STAY in China, I'll give you 4,000 BUSHELS of "ATOMIC MOUSE"
 pencil sharpeners!!
Date: Wed, 19 Jul 2023 18:17:59 +0200
Message-ID: <87zg3rvps8.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:a60:0:28:0:1:25:1;
 envelope-from=whitebox@nefkom.net; helo=mail-out.m-online.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Jul 2023 12:42:36 -0400
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

On Jul 19 2023, Bin Meng wrote:

>> Please check
>> https://github.com/riscv-software-src/opensbi/releases/tag/v1.3.1
>>
>> I hope this helps.
>
> Hi Alistair,
>
> Do we need to update QEMU's opensbi binaries to v1.3.1?
>
> Hi Anup,
>
> Somehow I cannot see the 'tag' v1.3.1 being populated in the opensbi
> git repo. Am I missing anything?

You need to run git fetch --tags, because the tag is not part of any
branch, thus not fetched automatically.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

