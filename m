Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGhuB-0007nM-NS
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 10:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oGhtz-0007jV-DX; Wed, 27 Jul 2022 10:20:45 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:60318
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oGhtw-00039t-JW; Wed, 27 Jul 2022 10:20:42 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oGhtt-0006dz-OL; Wed, 27 Jul 2022 15:20:37 +0100
Date: Wed, 27 Jul 2022 15:20:37 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: fu740 target
Message-ID: <20220727142037.rzm4o4huq22vagcp@hetzy.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 14:20:47 -0000

Is anyone working on adding a sifive-u74 core to the list of supported
CPU types? I was looking at full emulation of the Unmatched but at the
moment the best we have is sifive-u54 and I think that misses at least
two CSRs the sifive-u74 has.

Does anyone have plans to add the sifive-u74, and if not, would a plan
to add gradual support for it like adding CSRs 0x7c1 and 0x7c2 so we
can run an Unmatched U-boot SPL against it.

If not, is there a definitive U54->U74 set of public differnces around
we could use to start from? I'd like to be able to run a full Unmatched
image using qemu at some point to add to the current real-board testing
we're doing.

(I have a basic addition of the type and the two CSRs as a couple of
patches if that would help as a start)

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


