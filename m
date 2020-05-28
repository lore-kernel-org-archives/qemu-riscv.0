Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jeQvy-0003Ua-MA
	for mharc-qemu-riscv@gnu.org; Thu, 28 May 2020 18:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQvw-0003Lf-1o; Thu, 28 May 2020 18:23:28 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:48497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQvu-0006IY-0T; Thu, 28 May 2020 18:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1590704607; x=1622240607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6FATJBjY3MEsYgFLnJ2w8QG6m7aF0O7YWGLLllI2F4A=;
 b=r4ss8FpTt6yUzS0zNHcA++vE+hwkIcCjijeA7ea1JYrgeKNQ8+xgIA9L
 POMoH5FYnLhgQraKXo0IC+T37YnsYs66Mx9wi/QlMUZ16UfiFNgF/IqeW
 A7H9JD0ov5x0aaSVfTLk/7zuCGTyxtIbauYK3Vf7gpoQQ6euLOZ0678MB
 ZS6owT0ioHPFdkRYexIHUvZM1BV3qDKkQhxkJvX1l08WIsb5mmjMzL0Wn
 NcTq/g6wm6Mv5d3FZscO/jwITO4IqEo+EJPbZ2Zaj5PoIh4c0GIdO0jZT
 XkTW98lI6D5qexkQDuFfDQhaL46Bu621TdECy719iRuLpIqK3VYG+SW1t w==;
IronPort-SDR: UwUDBSvsJQOg29TQbKbLDS1ZR9QiKnnDrQ22p5isPT+Uwq5iFl3xPsPYg9VCKIbgBmXVzdmk1c
 iiq0pbgS+KnrnWywZDoNonMiCv8d6stTmT0cZPeI8SEAFCXJ1DdBx4CGXAPuGnhOpRYMauW3Bw
 hzIiehEfNJ4eohgx8LyLgnsCS1lxGqx4CPF9nPutgQTj1nlOvFP6y6SwKeiHJIsjOKNz2urNUw
 6RqpWG5TLGIQywBVCQbPKIwG9P5vqmpm+PDpiQGLfCNamkFWXlnrPdttCeaW41OjF+bsTbyc3t
 tp4=
X-IronPort-AV: E=Sophos;i="5.73,446,1583164800"; d="scan'208";a="139073358"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2020 06:23:14 +0800
IronPort-SDR: KCiwM/VVW3mn7KHWN1Kovjl7nD7pkkW4WAre/CgP6mZX/mX00ywaJdvGdB63R87HkUi2msZyll
 yLCMn4q53T1jZIb72Ff5TBl/FbevT0Oj0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 15:13:01 -0700
IronPort-SDR: 0d0iMb9OJowJMvUW7MJ8E/BmF6O6JUPE4NYem3LcCqm6BG5STgBzWMTy5QUPfbF2a3PPPXgoRF
 M9g/pH5L0Arg==
WDCIronportException: Internal
Received: from 6xf7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.123])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 May 2020 15:23:12 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, alistair23@gmail.com,
 bmeng.cn@gmail.com
Subject: [PATCH v5 11/11] target/riscv: Use a smaller guess size for no-MMU PMP
Date: Thu, 28 May 2020 15:14:36 -0700
Message-Id: <f59080ded69fd3a9bf3502a7c9d28f154e57da87.1590704015.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590704015.git.alistair.francis@wdc.com>
References: <cover.1590704015.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=4104b2603=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 18:22:43
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 28 May 2020 22:23:28 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/pmp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 0e6b640fbd..9418660f1b 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -233,12 +233,16 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         return true;
     }
 
-    /*
-     * if size is unknown (0), assume that all bytes
-     * from addr to the end of the page will be accessed.
-     */
     if (size == 0) {
-        pmp_size = -(addr | TARGET_PAGE_MASK);
+        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
+            /*
+             * If size is unknown (0), assume that all bytes
+             * from addr to the end of the page will be accessed.
+             */
+            pmp_size = -(addr | TARGET_PAGE_MASK);
+        } else {
+            pmp_size = sizeof(target_ulong);
+        }
     } else {
         pmp_size = size;
     }
-- 
2.26.2


