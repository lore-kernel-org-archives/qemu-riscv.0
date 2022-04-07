Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncYik-0003BQ-BL
	for mharc-qemu-riscv@gnu.org; Thu, 07 Apr 2022 16:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1ncYYL-0000jB-Oy; Thu, 07 Apr 2022 16:16:29 -0400
Received: from pb-smtp2.pobox.com ([64.147.108.71]:54382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1ncYYK-0000Gv-0I; Thu, 07 Apr 2022 16:16:25 -0400
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 8E4DD1367E2;
 Thu,  7 Apr 2022 16:16:21 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
 Mi8yrTcNtYhVXOUEQ3zbdNJUVY/i6qYdTc8novTwvJo=; b=sfx1tbS2XHiyZLDK
 Tx35u8kOeVkv+AMbNakAywzGGjut1r/GCBdsUFZ6c+l70GIVnm+wIR/AzEvJvo36
 OKt5Uvz7fSQLndYeyDIR+4QsIs/zMsfvAoID5ltsM1PW5pAZT9v9TkhpprnKwHw4
 ypGDKrOyZR0l7y/UYTsi5eh2Rrc=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 85E111367E1;
 Thu,  7 Apr 2022 16:16:21 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2016-12.pbsmtp; bh=Mi8yrTcNtYhVXOUEQ3zbdNJUVY/i6qYdTc8novTwvJo=;
 b=OuO72Nc/E7Em6UFzFDqRxC3RKGjr7dVY6sIHOIOcn8ogXlPzJpFttBfZ4NFUiLhi7hVEUdYNHPQvVK9X9KT4Kv+p9ZJJA2vmpqgCuvkxnAkBEBMugvSGeM8v7DSR3epmy8mNJqpR5iqNl0SoIafvOfhUkkcQZ5sshQEyW8T18VY=
Received: from yoda.home (unknown [96.21.170.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 022191367E0;
 Thu,  7 Apr 2022 16:16:21 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id F2AB611EE43;
 Thu,  7 Apr 2022 16:16:19 -0400 (EDT)
Date: Thu, 7 Apr 2022 16:16:19 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv/pmp: simplify NAPOT address range computation
Message-ID: <6np1np88-4s6o-q564-r6p0-q09pr659691o@syhkavp.arg>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 96FC4230-B6AF-11EC-B6CD-CB998F0A682E-78420484!pb-smtp2.pobox.com
Received-SPF: pass client-ip=64.147.108.71; envelope-from=nico@fluxnic.net;
 helo=pb-smtp2.pobox.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Apr 2022 16:27:08 -0400
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
X-List-Received-Date: Thu, 07 Apr 2022 20:16:29 -0000


No need for ctz64() nor special case for -1.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 81b61bb65c..151da3fa08 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -141,17 +141,9 @@ static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ulong *ea)
        0111...1111   2^(XLEN+2)-byte NAPOT range
        1111...1111   Reserved
     */
-    if (a == -1) {
-        *sa = 0u;
-        *ea = -1;
-        return;
-    } else {
-        target_ulong t1 = ctz64(~a);
-        target_ulong base = (a & ~(((target_ulong)1 << t1) - 1)) << 2;
-        target_ulong range = ((target_ulong)1 << (t1 + 3)) - 1;
-        *sa = base;
-        *ea = base + range;
-    }
+    a = (a << 2) | 0x3;
+    *sa = a & (a + 1);
+    *ea = a | (a + 1);
 }
 
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)

