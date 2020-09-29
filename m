Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzy-0008N9-Df
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzx-0008MA-HP
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:09:13 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzv-0002XD-MJ
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:09:13 -0400
Received: by mail-pj1-x1035.google.com with SMTP id t7so3188659pjd.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J86lKGoDu1PcC00L+Bxg4r6til8/6L+deYlUXajDyyY=;
 b=Ei6YoEtaaRAAy3CJTP4k7lCflNlnc2VgHw5r64bfKZBQEDxWsPjEzNyui8EDYT3Vga
 WQXug7aTWuAV/dfcyQ5VYco2F/jA1Zviq0pN8kff7vPy5L6rUmq+d1J7UcBAvXQFRWQP
 4bm76VmDdo5rVUE573mpZAvMldKRtG7ZoMsg8jcqFkeOPXvMUD3TbpQP/cL7FcvzufaA
 S4RNCc3/5WVnIwij9GqhfBi6DW5Re8g0YfzyOBlTVCBtltLkzoUfB+pbNxb0CaPVxwRm
 8vZYaZFVSz+vDvUYKwTzo2Br4QMdrgYzgJrwdeh0MHSrQrdcq2mQQzJngUOLluvn+Gqq
 paxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J86lKGoDu1PcC00L+Bxg4r6til8/6L+deYlUXajDyyY=;
 b=C6OheyB9D5GTFCRwZtc/As6YfkV7CelcVpYdqSkgMcv6mRZL6BdC/gNEKoq3lr1ZXA
 IN65yqxn0xk2TWZQEW4MGHmbvV5Hryz85vZ8GAnh8JeWaRJMGU7cY/hZlKqhMTH8nxLN
 FztXJ3xRaV+KUNYHekEFygQkUOJ0QF9UnhvqpY4WBGSQJ3DtLozFa/DG4oC4RnKnlDUt
 zkJ0DUIKqO2K+PMGhqH0mj+c6hHnDLiJg5lfnDulk+nWBuA7RrFRh0QVRCCDkz2pD1sc
 MpkA7lPFL+g6CvRPPNEnDMw4T/b31uIYb7huyWojGG4cGJXx3XVJXzSym0/RgxFBKyAK
 ayFA==
X-Gm-Message-State: AOAM532mfSU3Z8L8kbEiqS5eIkuABZ/OXGxoMnp6a8bSv7i6E7FnVURd
 bgg0IzI/VNW6TOyX/bYqs6ECmQ==
X-Google-Smtp-Source: ABdhPJy1QbJvt7Acbn1fpAFi0DDTgN/ykU54FqFzGuPYqowLdxrv1cBbsuWnQl4EnUl8ul9RODZo/A==
X-Received: by 2002:a17:90a:d990:: with SMTP id
 d16mr3731393pjv.226.1601406550517; 
 Tue, 29 Sep 2020 12:09:10 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:09:10 -0700 (PDT)
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
Subject: [RFC v5 65/68] target/riscv: gdb: modify gdb csr xml file to align
 with csr register map
Date: Wed, 30 Sep 2020 03:04:40 +0800
Message-Id: <20200929190448.31116-66-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 29 Sep 2020 19:09:13 -0000

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
index da1bf19e2f..3d2031da7d 100644
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
index 6aa4bed9f5..9039456293 100644
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
index eba12a86f2..f7c5212e27 100644
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


