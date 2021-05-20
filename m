Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljraP-0004qd-HQ
	for mharc-qemu-riscv@gnu.org; Thu, 20 May 2021 18:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=767f8a997=alistair.francis@wdc.com>)
 id 1ljraL-0004mD-Ft; Thu, 20 May 2021 18:56:10 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:8231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=767f8a997=alistair.francis@wdc.com>)
 id 1ljraD-0004zS-Qh; Thu, 20 May 2021 18:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621551359; x=1653087359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=acliKGG3l829OIT5BBImeLeUsVa419f4dlzLIRV3Vqc=;
 b=P6Bnm9kRyJqvaWJOvscdFyc+aiYZ4UICGbSL1wEkQj/Ah+SB00o374R8
 DHS5GW3P2En0KEuo6bYDEa8yhe7mRaNyZRBGpha2O2OHnpfavlriK6e2g
 L9PGrj4ZbS3jy5CSeanJthWoB0xeBJPMrYuAAi3C78avW1sUbam/spk6f
 ez08Ip5q5wihR1sv+y7jqAaFh/EFKKXfsF1jwX2Gh4xONmHvqFe8rZ4pi
 frcYhrZdtbc5oHiy56vMfahf6w7gVqp27WdpcnoEL/aUhOeaGEJNGU1tm
 MtGXidb8QzDMj9KR1BLsy6uOsG3UVKjD9iJY3nEfJ0SAhuJQ8qTuSG+IA Q==;
IronPort-SDR: AfLoFDgrhjUrd9Nr71ZxXH6BthmnJ+6Anhb0JJ7r2qLj+58lDqWJTI5QtcNeCKiHc4uxE4+Qfi
 PPqVPxd1gso2DFu8j2ZwZXjdec6+4vPCT9tWg63QdAmULxojvLCtJYeTXNoBaTQDMf32nDgHjj
 x21RB5lp7XZYyp7zjAc3hZ75dHVIFBojnP5ahUCEyF8Z4okrd8SipfJjVhusHhpBYL4YYXga6k
 Rn4b9ql2WQRAX/vU3UUfxdsdfU39iHo2mZYy5jNPdnUNtkqOleCiFHMhwcPF9FpWYJyNE4nS2w
 b5I=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="168919101"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 May 2021 06:55:57 +0800
IronPort-SDR: g1IhWAnj35X01ZGrmM8EXhHXMn7AluKQqysJVp8pUhnMrkgoqpHe27i1sTpRFypaAUayRUN5ha
 FoDcyzfs5/HhD9w+gUbQuJiJJ/fRvdqju0hZxdd3urZ4sgfkNZE/EQK3di1W6DR4/OpbxTG0cs
 04T7onmHrIkAdxB5iksimhraXNJ8zql0rbjcy9Fg0yhh22l6JMnPYZ6wBMzWy07Xzs2MByl7QT
 MYLXQfqZbLkKvs7Qr1PlkKE6vHkDmcDv0v5sEW+vGX2rdUNxL8MhJTymQF0eR0i7pvCBKFOdBf
 C9i1lwOmAuEItORFudXlkrLf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 15:34:21 -0700
IronPort-SDR: yuSxlp54yNBmuoUdsyq/k9KVcA/tLZ4k33+RCr4JwJfuUc5kbb3KwPB5WAfH0QjPVPhegZUqSr
 FfcWSdmmWvmQAK0wOTZ1Ej6b+KiRAsVzoObo0bdbpi0BqJYCewVVgNaIq/tZ+nDZFK3/0B35cl
 DPYqCv7K/OR3p4wvnFNSPmUNrvAWYhOVceEJFZl0LNA+UShPiwJHmzEFh0jnode4cMKdG5uEXk
 sunWmPhMP3/BsP0BBqQp7KXsCsczee+nEOzXfLbPP4jx/XqWeZ1tzzC8PFgXTVO48riaaFadPd
 T+8=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.61])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 May 2021 15:55:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] target/riscv/pmp: Add assert for ePMP operations
Date: Fri, 21 May 2021 06:55:53 +0800
Message-Id: <ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=767f8a997=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Thu, 20 May 2021 22:56:10 -0000

Although we construct epmp_operation in such a way that it can only be
between 0 and 15 Coverity complains that we don't handle the other
possible cases. To fix Coverity and make it easier for humans to read
add a default case to the switch statement that calls
g_assert_not_reached().

Fixes: CID 1453108
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 78203291de..82ed020b10 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -402,6 +402,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                     case 15:
                         *allowed_privs = PMP_READ;
                         break;
+                    default:
+                        g_assert_not_reached();
                     }
                 } else {
                     switch (epmp_operation) {
@@ -433,6 +435,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                     case 7:
                         *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
                         break;
+                    default:
+                        g_assert_not_reached();
                     }
                 }
             }
-- 
2.31.1


