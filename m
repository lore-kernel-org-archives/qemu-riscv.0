Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYy3Q-0001HP-9s
	for mharc-qemu-riscv@gnu.org; Tue, 20 Apr 2021 17:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lYy3P-0001HE-Dw; Tue, 20 Apr 2021 17:37:07 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lYy3M-00086r-3X; Tue, 20 Apr 2021 17:37:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id k128so21026896wmk.4;
 Tue, 20 Apr 2021 14:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiarVI2UPmohGl8NptVjaONITpylJtqWNmCvSdE+14k=;
 b=FNNBXCUNim9W65EW2v+Hps+DwmEPYfLDNJLUBfK8C/cVygQfvXUeqJ0ivNJWfUH+QC
 vvvKYZnfhQwta0tBYKs0YM8JqEuP7inrAlV8QYbUrc2Jl7mWObiNcxIO8GSwsQV9+6Cj
 1NREMuMX+yPS8TYqXHNhKEWIWjBLjT/WD6D2HBGFCCeDdGoVHektLyIEKvcbWRscfhEX
 OGquG2jwtn64mZyCPLiNgVJMHDcae+DhcHTg74xaRnzx1AIE7gdtsyQFNQCqKrOt5Uo0
 1Wkgo4YGGfU+VeAZKx2vEyP3CRD6LjAM6Jixr46MKmDtu+F74MapPcpBAAf7vlkbwTTj
 a12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiarVI2UPmohGl8NptVjaONITpylJtqWNmCvSdE+14k=;
 b=KEfsqFFO0/t5Ffzt04jYWlUmAQE2BJujOAQq3uKIr7lztdgBgldUsBZrlj/8iN4KHo
 vmg04KRJiC/SnGNHlcKpP+IgVb0mitebsRqDu7k9KQrsdZmwk7iqByfKC7dDZXYcLVk7
 ZLjm3lK8gWu2ribyqNFYYX3OOYrVMlyO77C94Wy8x1t4vRSc8fm17ik6s1b/gTnBZ+4R
 IvQYpzCyJMVUVpcAm16BdNxtF64MaEqTLG+CUo+BYfG9IBBzHKvWzuGuJ/wqF5nIZvmN
 TrMitKoYRuprvfcWzsd9lkiEK8C5euUv6Mokub2V6YzIj1mami5Pe3g9V5LfsfrL+XAK
 Ccgg==
X-Gm-Message-State: AOAM530/ueeAN+1F18SiCVIrQdNnnkSdKfZS6heqWfZTG9UiC0VHnqPQ
 mk7UNDcfhimhzWBUmzK3uuUYKfvn61D2I6Qw
X-Google-Smtp-Source: ABdhPJw3bNdPGOiyuNr1lrA2uySpPp07keEEJcyk/2SwZ+CiJCzdAiwuCrh19S4mA22R2+q2RVpQ0A==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr6385186wmk.63.1618954620237;
 Tue, 20 Apr 2021 14:37:00 -0700 (PDT)
Received: from localhost.localdomain (a89-152-76-22.cpe.netcabo.pt.
 [89.152.76.22])
 by smtp.gmail.com with ESMTPSA id o17sm329280wrv.16.2021.04.20.14.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 14:36:59 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2] target/riscv: fix wfi exception behavior
Date: Tue, 20 Apr 2021 22:36:56 +0100
Message-Id: <20210420213656.85148-1-josemartins90@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=josemartins90@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 20 Apr 2021 21:37:07 -0000

The wfi exception trigger behavior should take into account user mode,
hstatus.vtw, and the fact the an wfi might raise different types of
exceptions depending on various factors:

If supervisor mode is not present:

- an illegal instruction exception should be generated if user mode
executes and wfi instruction and mstatus.tw = 1.

If supervisor mode is present:

- when a wfi instruction is executed, an illegal exception should be triggered
if either the current mode is user or the mode is supervisor and mstatus.tw is
set.

Plus, if the hypervisor extensions are enabled:

- a virtual instruction exception should be raised when a wfi is executed from
virtual-user or virtual-supervisor and hstatus.vtw is set.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
Alistair, I hope you've agreed with my argumentis for the previous version      
of the patch. As promised, I submit this version which takes into account M/U 
only harts. It checks for the presence of the RVS extension. If it is         
not present mstatus.tw takes effect over the exection of wfi in user          
mode.                                                                         

 target/riscv/cpu_bits.h  |  1 +
 target/riscv/op_helper.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24b24c69c5..ed8b97c788 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -436,6 +436,7 @@
 #define HSTATUS_HU           0x00000200
 #define HSTATUS_VGEIN        0x0003F000
 #define HSTATUS_VTVM         0x00100000
+#define HSTATUS_VTW          0x00200000
 #define HSTATUS_VTSR         0x00400000
 #if defined(TARGET_RISCV64)
 #define HSTATUS_VSXL        0x300000000
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d55def76cf..15982a7a33 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -173,10 +173,15 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
+    bool rvs = riscv_has_ext(env, RVS);
+    bool prv_u = env->priv == PRV_U;
+    bool prv_s = env->priv == PRV_S;
 
-    if ((env->priv == PRV_S &&
-        get_field(env->mstatus, MSTATUS_TW)) ||
-        riscv_cpu_virt_enabled(env)) {
+    if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_TW)) ||
+        (rvs && prv_u && !riscv_cpu_virt_enabled(env))) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    } else if (riscv_cpu_virt_enabled(env) && (prv_u ||
+        (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         cs->halted = 1;
-- 
2.25.1


