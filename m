Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1aJ3-0001K8-DG
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 17:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1o1aJ1-0001I5-DS; Wed, 15 Jun 2022 17:12:03 -0400
Received: from pb-smtp20.pobox.com ([173.228.157.52]:57458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1o1aIz-0005R1-BQ; Wed, 15 Jun 2022 17:12:03 -0400
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 1331A1A83BA;
 Wed, 15 Jun 2022 17:11:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
 X2NeBToT0LEImInR0fiKCPjXexxbY8sZgQAWrigkCVc=; b=WLacvZPmlrijWCC9
 /8/hqdH/5UfDYU3LsznH3apTp9FpfpNomI1ku1LJUF7lOpLGJO+MnLgdX448XDKP
 aj6BQjTSAbSiNnybARQ6/p4rEX9IbxtmxTj8ZUwkpLP4soXOH2PSCjsd09D7w3n6
 u+ISFEu7znRwwh3h2sqj42vRkmQ=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 0BD891A83B9;
 Wed, 15 Jun 2022 17:11:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2016-12.pbsmtp; bh=X2NeBToT0LEImInR0fiKCPjXexxbY8sZgQAWrigkCVc=;
 b=LYTCHixJ/iXzag+JzmKGpQ58tvm0Sj2lfLGB6FdbgcGYc00PgA11zYWjsvuyb3jomei0Oua2uwSdI/m5IncM42D+btfHf1rdDUlAhXPVfbeokvkdn3LS4ZVVzOZkXl6uh22r5IolddL2IVgBgbxMUHFYgnQ9ytzOAkbqOZq2gYA=
Received: from yoda.home (unknown [96.21.170.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id D7D5D1A83B7;
 Wed, 15 Jun 2022 17:11:53 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 70A862DF4B8;
 Wed, 15 Jun 2022 17:11:51 -0400 (EDT)
Date: Wed, 15 Jun 2022 17:11:51 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv/pmp: guard against PMP ranges with a negative
 size
Message-ID: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: C8088CB4-ECEF-11EC-A7B3-C85A9F429DF0-78420484!pb-smtp20.pobox.com
Received-SPF: pass client-ip=173.228.157.52; envelope-from=nico@fluxnic.net;
 helo=pb-smtp20.pobox.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_CSS=0.1 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jun 2022 21:12:03 -0000

For a TOR entry to match, the stard address must be lower than the end
address. Normally this is always the case, but correct code might still
run into the following scenario:

Initial state:

	pmpaddr3 = 0x2000	pmp3cfg = OFF
	pmpaddr4 = 0x3000	pmp4cfg = TOR

Execution:

	1. write 0x40ff to pmpaddr3
	2. write 0x32ff to pmpaddr4
	3. set pmp3cfg to NAPOT with a read-modify-write on pmpcfg0
	4. set pmp4cfg to NAPOT with a read-modify-write on pmpcfg1

When (2) is emulated, a call to pmp_update_rule() creates a negative
range for pmp4 as pmp4cfg is still set to TOR. And when (3) is emulated,
a call to tlb_flush() is performed, causing pmp_get_tlb_size() to return
a very creatively large TLB size for pmp4. This, in turn, may result in
accesses to non-existent/unitialized memory regions and a fault, so that
(4) ends up never being executed.

This is in m-mode with MPRV unset, meaning that unlocked PMP entries
should have no effect. Therefore such a behavior based on PMP content
is very unexpected.

Make sure no negative PMP range can be created, whether explicitly by
the emulated code or implicitly like the above.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 151da3fa08..ea2b67d947 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -167,6 +167,9 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
     case PMP_AMATCH_TOR:
         sa = prev_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
         ea = (this_addr << 2) - 1u;
+        if (sa > ea) {
+            sa = ea = 0u;
+        }
         break;
 
     case PMP_AMATCH_NA4:

