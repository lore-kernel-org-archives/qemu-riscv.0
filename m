Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGEN-0007u5-7E
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEK-0007ni-Sj
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:48 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEF-00009t-T7
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:48 -0500
Received: by mail-pj1-x1032.google.com with SMTP id my11so584445pjb.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vvg/sXqdoHbdKT6X7Z2WhUOblNh/9Rft0yUmJgs2zCU=;
 b=ETYRf9JJAr9tzkprYqo6rnmD8lYyrGAHJdNu//gRDQJdgdkDti2FHKNIdlWulnOBKc
 qkqP/CduUKzS2e6X73Rnu9Fa+hz5UfsGcmVV04xTZfZV682VwVcohynEmz8XJiby7r0u
 ySoiKaQVwMFHkfLuuAl1rHwiQQTLgCxaOtu6qe3tfiuBoyd4uZTPUcKox7cif/J6Bq57
 nf1E2ZW2QsgiYFE6PHR/lkdrtC06/at4L9OHe1zN0MR6Eqa7h/ExRq2x3lZ1j/xo4b2z
 ovnjoZUj8ChWaMoFG+7BPFacL7X7WjU9mhLW3jDfJSU9qenMOkTq0tATrPHbeQ3Bo2bJ
 GvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vvg/sXqdoHbdKT6X7Z2WhUOblNh/9Rft0yUmJgs2zCU=;
 b=azFD8o0xYjxErRk+OF3IRyqidzbKJLldQIFQd2W9VVbgEhjKsOKPt/xDHLOQvv2DQe
 tbVt+voce6immeBWN7xNleg2Y1VYFW57DoNDSx/RhYrZ24CGeyePtTNaakyzKU6P3Rez
 HsMC8SWJjNZD+D/tnfMCzAYv1oTQRh44sAmmqWmH8L5L7/HPQMU9uo10xdHC0Og97WOJ
 axqMS7f44JXcR2DiLefyDq+qkX/9eLLvC6ChaXg/FwYDV+Rkz/ItyK23ISVIYSOyaIEA
 P0zWZ6X/GsdgHUha+d/SvqDBn/xYaYZ6ZBNEGwKUnDhg+HcOESJffHsW3PKOfabHT/j1
 x0qw==
X-Gm-Message-State: AOAM533P7OfiqT+7hcAcFugrr5ZxD1XZWh1YGRlDhHe0+Wh73U4d7hxB
 aB9ZqI0/2Yr1LoBw8UlrUOyMEg==
X-Google-Smtp-Source: ABdhPJwAXi0/+1HZyOQafAZs1aLpi5sntEjffwf108g/yd8wR48gsP+9EhKxKwrBDwcOKX355XB0mQ==
X-Received: by 2002:a17:90a:fb97:: with SMTP id
 cp23mr3748572pjb.215.1610444679128; 
 Tue, 12 Jan 2021 01:44:39 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:38 -0800 (PST)
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
Subject: [PATCH v6 68/72] target/riscv: gdb: modify gdb csr xml file to align
 with csr register map
Date: Tue, 12 Jan 2021 17:39:42 +0800
Message-Id: <20210112093950.17530-69-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:49 -0000

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
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


