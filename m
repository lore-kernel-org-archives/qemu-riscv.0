Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW91L-0007IY-Rg
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW91J-0007ET-QE; Mon, 12 Apr 2021 22:43:17 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:62364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW91H-00005a-Vy; Mon, 12 Apr 2021 22:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281795; x=1649817795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xa/AfaCnaXGcqbPu6T/WSIkls/DVmFNgca5PZOzM57o=;
 b=TAQSNdFAXx36WTtDjw1Z7BjxYod5UrKe8xgwkW4/QzBQbjuR9m0rk6LF
 6zQiIrWj3H/ddibl20tDNf0O8CNECP7P5qH5951TwUd8QbzxsHQXq+2p3
 jdTs5i8ZFX9NUwVvN8MU1r4RGasin4OmjmyeW38zwzLxje4GoXziODHN0
 kt4j08AD/dN4vThXczktUry8AGUtLlDiUyO4leuEkOEy8Iap8rZptIJDI
 M6qw1pMhenxTtGimNlWqz1+HP0tJeAEeucIysWfAZaCdHxfzqg4+vMoqj
 LndjV8ldp04HlnAy7xMTsLdhJf1CU7sA8yvKUxLlgugPu7hpFAPsrDdph Q==;
IronPort-SDR: gQfPWEWAOfhpBSGY3BgNMo1Tbc1GD5qTMG96AH3jZHHgGSHZEiEPut8p2ZgonugF3g/DI4SgVM
 adB6Y9jVkt4n1xjbKpSMO/AOxGPAdXfK/6D26p+lRvCClqNW2gYrWT9wXlwt8rHhYOuTu1r+pX
 ao9JBYWchdCeOqmQgATYojR5TnPolYWwfxInjrUWflhTeSnrHEnzV6w23grA/J9LlNO6EXTGfz
 q4JJYCn+mXZC8ozy8plEHswQAfKPTSK1n23qjoDgZqgISMh9AadP2ZDjsC0mVy5wBadbx4//SQ
 OEg=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="164190777"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:43:08 +0800
IronPort-SDR: tJjUTFUaZtvsDsSzUXaSi5+/47g6MaBKMOwxyEmf0j/hiYx1aPLW6wlIN7QZM3nOQRU7KoFv7w
 RdchI4XMJGbieuYiy7+Yvb90w8E3SjY+C8E+eM3tzJA+D53OmpeiZl1SYTkf3GRCn396SMYg55
 AVpxU9bB011DlbGkIptIZKAjlom+DC1wRQcXDDjAcA8NS/Z+xFgGTlJw1JmC+vpA5HByvGLQgM
 RRrrfehSlUchjBJt9DzroK919lPO6clLaPa1pHLuYkgFuSLSBKFrMXP5zNULdqDoP7MMcQfOB6
 KumDNez4FsI5h3nI0pUNyTOL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:24:10 -0700
IronPort-SDR: o+THx8Iihq1UAAr+Pe9D5Jc6oIclxKQSq+0Ls47/qofz/5xDbRgO/S9wv/f3om7LY7VxpEfLVn
 rPly1ExR+k2qJiH+cnPs6wJOUt80c639in6lX/dvueUY6ouIQXsHt/zssY39oz0v7u6nTieibA
 pYWGgmlRmoyjviOL6wrPkj6hc+PPkq190VjrSck6IEJIsjE7G8XQFS3B2A40x41FCP/Ca0TfpP
 jl0e/08rra4GlgLloeLJmusIt1TX9Qqm/h5PbfGO2vaLg4cOQW5AfYn7Vl3Z6ztALTcsCJWJt0
 DFE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:43:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 7/8] target/riscv/pmp: Remove outdated comment
Date: Tue, 13 Apr 2021 12:42:57 +1000
Message-Id: <433d23e16bd941b209d433263aa8020b9efbf669.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618281655.git.alistair.francis@wdc.com>
References: <cover.1618281655.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Apr 2021 02:43:18 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/pmp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 00f91d074f..68be893e16 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -19,10 +19,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * PMP (Physical Memory Protection) is as-of-yet unused and needs testing.
- */
-
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-- 
2.31.1


