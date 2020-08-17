Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7atO-0003E9-Fa
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7atM-00038W-Cf
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:20 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7atJ-0005NQ-60
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:19 -0400
Received: by mail-pl1-x632.google.com with SMTP id k13so7151364plk.13
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IIDpnVDv9+trjyRRch9JAqW8+nRxIqRgOoCbDIBNhSI=;
 b=fjx6VuYBV6Vy/VYoKzWMrxaq2FbJBzTVpOApLV13UNVkFoiPA5XUCdH0sK5TTpaZxX
 5zPRWVh+IfeFZs5ZohzuuePadpR+vrZjKf9+mJus+B7hWCcDJqKCUaqr0zR+x81OD6b/
 IMwoTBo9iDV69V3eLF5NdIydwgmrm+hikDjkAkrVVXh2LKaZkyPt25HLLk6Sw1WX5+lO
 +APHkcIqGsx9eIFC4mE7WwNmDaQ+PknUITeJltyQLRSuBZdf7UaKzGaREmRJ5Oi60fTV
 uwWo97qv4YPSG6LdIWk6fOgLbZKRRyoixIeAerNrbgGVbbd8DtdGT/gZP0NfW4ABf7a9
 ExzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IIDpnVDv9+trjyRRch9JAqW8+nRxIqRgOoCbDIBNhSI=;
 b=jJmt7khVNqhUjuSqQUEq+RV4U7QCjrgUQGGHelNI70zA/kY6/jOYhfxMuF++RbF7QG
 7FAaVtAAqnqlK9PuJY9QEKU/S5gD1jHUoygqQbZC12TBad26qAAEl+oAFtRYS5isx4mV
 GcZaOSbY2ki8Vvd+QVnv/+Ms0ZkjX3Lvq+G6XRH83VFcUVnBSvcY1SZVp3tighxNdTRJ
 zsRuXfXCaLGD/sIA8UC16PZv+t59CXVbZvOqZg/oioPRBQMM/sAq7kjvQzIrKnrefLjP
 bp1SksLdTtC8+mLMMDFGCSc0dcycPH0UxcxKenut16kct2Wp3+X6VlbKNcvbO6Iw8ulr
 fRZQ==
X-Gm-Message-State: AOAM531OUUQn78+OsRcjA75kM/FSMEI4uSYDbDqn0FQa56X70Z/VD4am
 n0EzW3iFZZX360vgVRZRVFu7Eg==
X-Google-Smtp-Source: ABdhPJw2HSlzcjR4EErxKvbwPYLs1L8eqSieIJ1nO1TTK8SgXodmT7mZBnw2VpHLOcZPODeiujC5EA==
X-Received: by 2002:a17:902:9345:: with SMTP id
 g5mr10676858plp.192.1597654395549; 
 Mon, 17 Aug 2020 01:53:15 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:53:15 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Hsiangkai Wang <kai.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 68/70] target/riscv: gdb: modify gdb csr xml file to align
 with csr register map
Date: Mon, 17 Aug 2020 16:49:53 +0800
Message-Id: <20200817084955.28793-69-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:53:20 -0000

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 gdb-xml/riscv-32bit-csr.xml | 11 ++++++-----
 gdb-xml/riscv-64bit-csr.xml | 11 ++++++-----
 target/riscv/gdbstub.c      |  4 ++--
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
index da1bf19e2f4..3d2031da7dc 100644
--- a/gdb-xml/riscv-32bit-csr.xml
+++ b/gdb-xml/riscv-32bit-csr.xml
@@ -110,6 +110,8 @@
   <reg name="mcause" bitsize="32"/>
   <reg name="mtval" bitsize="32"/>
   <reg name="mip" bitsize="32"/>
+  <reg name="mtinst" bitsize="32"/>
+  <reg name="mtval2" bitsize="32"/>
   <reg name="pmpcfg0" bitsize="32"/>
   <reg name="pmpcfg1" bitsize="32"/>
   <reg name="pmpcfg2" bitsize="32"/>
@@ -232,12 +234,11 @@
   <reg name="hedeleg" bitsize="32"/>
   <reg name="hideleg" bitsize="32"/>
   <reg name="hie" bitsize="32"/>
-  <reg name="htvec" bitsize="32"/>
-  <reg name="hscratch" bitsize="32"/>
-  <reg name="hepc" bitsize="32"/>
-  <reg name="hcause" bitsize="32"/>
-  <reg name="hbadaddr" bitsize="32"/>
+  <reg name="hcounteren" bitsize="32"/>
+  <reg name="htval" bitsize="32"/>
   <reg name="hip" bitsize="32"/>
+  <reg name="htinst" bitsize="32"/>
+  <reg name="hgatp" bitsize="32"/>
   <reg name="mbase" bitsize="32"/>
   <reg name="mbound" bitsize="32"/>
   <reg name="mibase" bitsize="32"/>
diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
index 6aa4bed9f50..90394562930 100644
--- a/gdb-xml/riscv-64bit-csr.xml
+++ b/gdb-xml/riscv-64bit-csr.xml
@@ -110,6 +110,8 @@
   <reg name="mcause" bitsize="64"/>
   <reg name="mtval" bitsize="64"/>
   <reg name="mip" bitsize="64"/>
+  <reg name="mtinst" bitsize="64"/>
+  <reg name="mtval2" bitsize="64"/>
   <reg name="pmpcfg0" bitsize="64"/>
   <reg name="pmpcfg1" bitsize="64"/>
   <reg name="pmpcfg2" bitsize="64"/>
@@ -232,12 +234,11 @@
   <reg name="hedeleg" bitsize="64"/>
   <reg name="hideleg" bitsize="64"/>
   <reg name="hie" bitsize="64"/>
-  <reg name="htvec" bitsize="64"/>
-  <reg name="hscratch" bitsize="64"/>
-  <reg name="hepc" bitsize="64"/>
-  <reg name="hcause" bitsize="64"/>
-  <reg name="hbadaddr" bitsize="64"/>
+  <reg name="hcounteren" bitsize="64"/>
+  <reg name="htval" bitsize="64"/>
   <reg name="hip" bitsize="64"/>
+  <reg name="htinst" bitsize="64"/>
+  <reg name="hgatp" bitsize="64"/>
   <reg name="mbase" bitsize="64"/>
   <reg name="mbound" bitsize="64"/>
   <reg name="mibase" bitsize="64"/>
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index eba12a86f2e..f7c5212e274 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -418,13 +418,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 #if defined(TARGET_RISCV32)
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             240, "riscv-32bit-csr.xml", 0);
+                             241, "riscv-32bit-csr.xml", 0);
 
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-32bit-virtual.xml", 0);
 #elif defined(TARGET_RISCV64)
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             240, "riscv-64bit-csr.xml", 0);
+                             241, "riscv-64bit-csr.xml", 0);
 
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-64bit-virtual.xml", 0);
-- 
2.17.1


