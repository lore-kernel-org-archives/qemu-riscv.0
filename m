Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUIwc-00066U-Mu
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 21:59:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwb-00063a-BB
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 21:59:21 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:59278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwY-0006NT-Pk
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 21:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647395959; x=1678931959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JULuWU7jjd4v+41kv9ixESO60ZWaWtvA4R2DIeLIsHk=;
 b=SAMOFDHThuJwsaWPgzpg24Kiu5zdDgbd7DDcATwsTkUONl7tRSSFeows
 vcDbL7bChJl6GeZBw/WS2r/GCp9h0pRrdowDNb3F/QtGZw0RZWd01ZI2E
 rZuAYHdQkgeKqSFrItnxgoaIyI8HKxYR4doD63EOEKtXJqDr5NG/iukJs
 g9Jp5A90I+UsEzARCLpyeo/5uU1gLyy6IPe3Jd/sf7meRnxg786rkyJfm
 YdQ9TrQ/qpbAhfG+UBOZ/++ioisUHHGsj6fFaRyFwi6H7Z9bjP63lDUrj
 2KDntz3vJMSJDlQkkDVSPI4ZtRN8a2wQhL6FLLPsTzlydTmqs8ePHePhg A==;
X-IronPort-AV: E=Sophos;i="5.90,185,1643644800"; d="scan'208";a="196396807"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2022 09:59:17 +0800
IronPort-SDR: 19NHE/8cnXEanlB7xURoQWsVlARKK7PTuae9FMKfFARcaaJVNTEslOMtVufiuAyMExoOoq6DfU
 wYLUVDFdOlC/kR6bSfyHHzzwAI7s/HpusK/Jz3olXOSelihhfUY903LB0SFGuH5XPJWqZAQHvJ
 EmpyvtttviCrAXUKNFT4iqaf81TtdYtmWmn+MTp7AB0CVWjOzHgq5v18hNjNZPgvWG7feW1Z3d
 BwcLD0CThU80+pPy3S2brTe5nVEQWnrLbVI2hxIE2zSmnRA0xQA+oTRyY5TB5O18//cllF0HfM
 OdNBpM0Sfovv63hcvU+CrHlT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:30:23 -0700
IronPort-SDR: GJz1oAelL3uo5ufb5YunQPbyYt2EFU9706uC5+BCW5NTjRVUG9iBmRILaU6xUtohp6Z3yLl4ZJ
 RbHlwAK4TlmZLMHR7P97XL8LTv9DTW9ULtRz0nt/wXRsjymxoivmPWexL+HzIhMumOT09ubRPf
 JNk2TdG3alcM1mCCy9CisxArVN9JyT6TYChhbut5dWmDLdTPxmTr4OK2riFsjhiaj8VoUdF2PG
 NJ3qwI5XWQPhd2vIDh61M4tyKi4Imr3Ty0foM/qKy5akwI28fuNFimEouAXicJCRJW+vbcdRrP
 +xw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:59:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJD3S2YHjz1SVp3
 for <qemu-riscv@nongnu.org>; Tue, 15 Mar 2022 18:59:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647395955; x=1649987956; bh=JULuWU7jjd4v+41kv9
 ixESO60ZWaWtvA4R2DIeLIsHk=; b=aW0iOks+rwYIHtq9CDbNMroI+pEl6RQR0n
 qb3k6IQgWTKK1G6+bhV9jXUhWoULhyFxS5f4UTWvTYw009mTlR3PT6hfN2QlajEV
 Vl/wkWcs5lxxjkE79BDxHkKtnjdQqZS63tUPTFRt1h6QAWYzBdZGRHrHUwOIcChU
 yaaw99ViOQ5wMw+cPhQTlAx+0SrmxXeXci7F2FFRGc2Z6sOmMG6Zm7CmFWn1YQPs
 xTayYw+3/VM0oEUAjWk8n6LfeCZ1FapkhXxRyt0auAgHPaZIMvNXUiKLBANVRrR/
 fZ3YfIPn5Jd1SsFEQidSNBHhM+tnYknksC+WSX/W+Fp0g5CFzpPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iE0lCgbpDj84 for <qemu-riscv@nongnu.org>;
 Tue, 15 Mar 2022 18:59:15 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJD3M42XYz1Rvlx;
 Tue, 15 Mar 2022 18:59:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, alistair23@gmail.com
Subject: [PATCH v2 1/2] target/riscv: cpu: Fixup indentation
Date: Wed, 16 Mar 2022 11:59:00 +1000
Message-Id: <20220316015901.3787779-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
References: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=0672150a7=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Mar 2022 01:59:21 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..41b757995d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -567,18 +567,18 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
-                       return;
-       }
+            return;
+        }
=20
         if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
             error_setg(errp,
                        "Either I or E extension must be set");
-                       return;
-       }
+            return;
+        }
=20
-       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
-                               cpu->cfg.ext_a & cpu->cfg.ext_f &
-                               cpu->cfg.ext_d)) {
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
+                                cpu->cfg.ext_a & cpu->cfg.ext_f &
+                                cpu->cfg.ext_d)) {
             warn_report("Setting G will also set IMAFD");
             cpu->cfg.ext_i =3D true;
             cpu->cfg.ext_m =3D true;
@@ -709,11 +709,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
         case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
-             if (kvm_enabled()) {
+            if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-             } else {
+            } else {
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
-             }
+            }
              break;
         default:
             g_assert_not_reached();
--=20
2.35.1


