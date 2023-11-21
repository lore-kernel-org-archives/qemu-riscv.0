Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65074C54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 07:18:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5L1Y-0007JZ-1k; Tue, 21 Nov 2023 02:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r5L1V-0007Hb-0X; Tue, 21 Nov 2023 02:18:17 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r5L1N-0003ip-Rz; Tue, 21 Nov 2023 02:18:16 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com A6C58C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1700551085;
 bh=WURz5IEE6WV+FL9frjqYm6GeHJgvsSTBg+sERX8EFAk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=eGAZBoN/WreI0orMS1BzrQjILNFae2c9tVpolxKDiFRdEjbvIB0l9EfNCr2UuK6cI
 8JZABGW7oMGZXi0wP+hIoNtQKoliHXRs/3KTYKLpDln/KWJkD45D6ghcdn8R6m22CN
 jLSJFArKQFNS7QlDZ1z9fxdgChCv0ZvR45RJCGCehrmeWJzIeQsVqjE5PNnWQzxYHJ
 y4gX7WF1fJQZVUIinKoegaTJjuhL8Gsa79GLObZAPmkbrzTNPS1yhkCbKee1xBdHo1
 CZoNAG30dLfJAo3xGC3SZXKN36DqFm1RqLc/HlXXc52REuYLpX+gALGbMq3QmlR9EW
 VWe5OC/vYE7/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1700551085;
 bh=WURz5IEE6WV+FL9frjqYm6GeHJgvsSTBg+sERX8EFAk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=dOkZ/MIPzuEf9Q0GBYOwah52eTlwO9/YtJwTJwUqYXkrNmh9rf+wdD+KvvVwPWIYN
 bSwe3UgUYvciiHdcRoxuQJ42zGZuXuHxSj014KKA+TTulTkTdV2mEDgIzjdKIjRe//
 PYgr4Q8WZ6UkspEn0YhzHPcBOEPI54rUN2cwRbv+mgo1t77m+k68ZAn4rU0y5odoFN
 3FjBnV2MwfE8vqC+/RwzZWbkGat3PGrJmf8Xnisc40lswalRFUsvcdza/cbtbryR9r
 BlgYv5ciwvVm9zUEqR2gutKz6xQFTGDnhUpVxSthKiMXyjgCc7QwEBA2B2vJ51G5Xt
 FypGhGORh9frw==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH v2 0/2] Fix mmu translation with H extension
Date: Tue, 21 Nov 2023 10:17:55 +0300
Message-ID: <20231121071757.7178-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=ivan.klokov@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

A series of patches that correct the conversion of virtual addresses 
to physical ones. Correct exception for mbare mode and fix MXR bit 
behavior with MPV\MPRV bits.
---
v2:
   - Fix typo, specify the fixed commits
---

Ivan Klokov (2):
  target/riscv/cpu_helper.c: Invalid exception on MMU translation stage
  target/riscv/cpu_helper.c: Fix mxr bit behavior

 target/riscv/cpu_helper.c | 54 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.34.1


