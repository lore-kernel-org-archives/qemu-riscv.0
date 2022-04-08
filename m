Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncrQG-0001WL-Au
	for mharc-qemu-riscv@gnu.org; Fri, 08 Apr 2022 12:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1ncrQD-0001W0-QV; Fri, 08 Apr 2022 12:25:18 -0400
Received: from pb-smtp20.pobox.com ([173.228.157.52]:63180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1ncrQC-00007l-0H; Fri, 08 Apr 2022 12:25:17 -0400
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 68D4F18B5FD;
 Fri,  8 Apr 2022 12:25:13 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
 r3DHX++uw68MVMaaIUNgL8Ywwi1dA17a5EDRfCbG1VE=; b=LHOW/8cuHCt/sI0y
 OmXYVT26xGXrwBeqYKVvBq4p9N6oy9uPGvTEp1Ma7Bz3/S2dsbSKvTXqXfYM83T1
 z3as6UiL9TXo74pnX1WM544CpZ/Yy7RenHaErjE+n2A6vOn4cagW968Fl1f+b53t
 +/vf0KG+TrvyAPjxop5IFiZMw5I=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 5AC3118B5FB;
 Fri,  8 Apr 2022 12:25:13 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2016-12.pbsmtp; bh=r3DHX++uw68MVMaaIUNgL8Ywwi1dA17a5EDRfCbG1VE=;
 b=oaFdGxNK5e0pfwoK9X1OWVK297zTPcQ6TIx/A5KyvqDuRxCJur05p7gXmYTaUh3mtWha3KtK1VtMdivFU8Rwt9Af5k+IcVINW3mD4xVFj6E5IiC743NvePeuL/AnSTlRyE4OzRxlq9GJb2PDIqEmUWvcEZ2bhb8bG3RwQbi/DNg=
Received: from yoda.home (unknown [96.21.170.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id B280618B5F9;
 Fri,  8 Apr 2022 12:25:09 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id CAD8E123A6B;
 Fri,  8 Apr 2022 12:25:07 -0400 (EDT)
Date: Fri, 8 Apr 2022 12:25:07 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv/pmp: fix NAPOT range computation overflow
Message-ID: <rq81o86n-17ps-92no-p65o-79o88476266@syhkavp.arg>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 7578596A-B758-11EC-9263-C85A9F429DF0-78420484!pb-smtp20.pobox.com
Received-SPF: pass client-ip=173.228.157.52; envelope-from=nico@fluxnic.net;
 helo=pb-smtp20.pobox.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 08 Apr 2022 16:25:19 -0000

There is an overflow with the current code where a pmpaddr value of 
0x1fffffff is decoded as sa=0 and ea=0 whereas it should be sa=0 and 
ea=0xffffffff.

Fix that by simplifying the computation. There is in fact no need for 
ctz64() nor special case for -1 to achieve proper results.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
---

This is in fact the same patch I posted yesterday but turns out its 
scope is far more important than I initially thought.

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

