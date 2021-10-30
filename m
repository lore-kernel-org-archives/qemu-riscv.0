Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgehH-00067l-Uf
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 23:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgehG-000647-AC; Fri, 29 Oct 2021 23:06:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgehE-0008G0-KO; Fri, 29 Oct 2021 23:06:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gt5so192039pjb.1;
 Fri, 29 Oct 2021 20:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ur+cd/ZWO6v2nMgeeV4dKfNp4+YjQPLBBGcy6MiOmjk=;
 b=N7HAWwZxFGMIXYzLVwjDdjz7zMfLyvvJw1St3xdguk1bmni1BjFdmjcoogwprusrvC
 mbnE/sntvKfe/sHrW1zAUBaso5KX1nYmH2HcwC0cDmVFP3eEW28Cw1CIkdaphiNsOOi7
 XeyXHMDm+k6UQxzirgpKuedkVYZ2e3+zW0IM57OGtsn/iWZktQN/1ZbSL5wqiEFfPdkF
 XCCpqVbAqJoixsWA92WbHLfLwly4C+rClxBr6wNsNKOEKWMyfRIwCXTz8DRFBBHa4cdd
 a5BFmWMBcrfJlHvfqkaIrGhyHQWRyuCCy6Sxc291a731YSEPYquRowAkJZ9F1pJzBr1y
 qXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ur+cd/ZWO6v2nMgeeV4dKfNp4+YjQPLBBGcy6MiOmjk=;
 b=sp0yhtFGJ8sWeyLtkmU09JSLKukyyquH/3UztqmtsBpHNjQWeb6vnzJ+y5FvxZCRjO
 n3y6bl6kLccbd5yq5fb0DaexgcfuSW/clkejYH8h+tYQEs4tsJmz7t80kfKgEkpYZcdX
 iRBYrwD/gfx1jJOp4AdcFwUE6MrS1/kLEiwshMuD6GIs1ygWlUk7kt9GOIejtesUvRGJ
 k/HLZUj0tEJ51yjJDBP2YFS0JLgNvdH4lzUIe4UcQedLF4jc9/3I8DQPwNvsVZCVZFfy
 6CsJj4/vwDLDepgiyRcyrcp8qzsuFVcIfKvptAzp2BM+LYbGZNl58VsEL5LoWssBoqmY
 57VA==
X-Gm-Message-State: AOAM5321by4G2MvYyXB2S+uaagbgjCa5ngIpZo0kCb5SJ/C9i3NDVnfY
 UafP9uPQCDhY8bj7C2CV9stNmYZQppQ=
X-Google-Smtp-Source: ABdhPJzQ4dT2LzxW5AwGBvA25TumwhXs8nWzosFqOya8wpvCXZs1ko0rxkV/0lhFu/e3ITu+ZtHkrA==
X-Received: by 2002:a17:903:11c9:b0:13f:f28f:f77 with SMTP id
 q9-20020a17090311c900b0013ff28f0f77mr13146910plh.79.1635563174946; 
 Fri, 29 Oct 2021 20:06:14 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l17sm9172071pfc.94.2021.10.29.20.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 20:06:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: machine: Sort the .subsections
Date: Sat, 30 Oct 2021 11:06:06 +0800
Message-Id: <20211030030606.32297-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 30 Oct 2021 03:06:18 -0000

From: Bin Meng <bin.meng@windriver.com>

Move the codes around so that the order of .subsections matches
the one they are referenced in vmstate_riscv_cpu.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/machine.c | 92 +++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 7b4c739564..ad8248ebfd 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -76,20 +76,50 @@ static bool hyper_needed(void *opaque)
     return riscv_has_ext(env, RVH);
 }
 
-static bool vector_needed(void *opaque)
-{
-    RISCVCPU *cpu = opaque;
-    CPURISCVState *env = &cpu->env;
+static const VMStateDescription vmstate_hyper = {
+    .name = "cpu/hyper",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = hyper_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
+        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
+        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
+        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.htval, RISCVCPU),
+        VMSTATE_UINTTL(env.htinst, RISCVCPU),
+        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
+        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
 
-    return riscv_has_ext(env, RVV);
-}
+        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
+        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
+        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
+        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
+        VMSTATE_UINTTL(env.vscause, RISCVCPU),
+        VMSTATE_UINTTL(env.vstval, RISCVCPU),
+        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
 
-static bool pointermasking_needed(void *opaque)
+        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
+        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
+
+        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
+        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool vector_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
 
-    return riscv_has_ext(env, RVJ);
+    return riscv_has_ext(env, RVV);
 }
 
 static const VMStateDescription vmstate_vector = {
@@ -108,6 +138,14 @@ static const VMStateDescription vmstate_vector = {
         }
 };
 
+static bool pointermasking_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_has_ext(env, RVJ);
+}
+
 static const VMStateDescription vmstate_pointermasking = {
     .name = "cpu/pointer_masking",
     .version_id = 1,
@@ -126,44 +164,6 @@ static const VMStateDescription vmstate_pointermasking = {
     }
 };
 
-static const VMStateDescription vmstate_hyper = {
-    .name = "cpu/hyper",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .needed = hyper_needed,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
-        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
-        VMSTATE_UINTTL(env.htval, RISCVCPU),
-        VMSTATE_UINTTL(env.htinst, RISCVCPU),
-        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
-        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
-
-        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
-        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
-        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
-        VMSTATE_UINTTL(env.vscause, RISCVCPU),
-        VMSTATE_UINTTL(env.vstval, RISCVCPU),
-        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
-
-        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
-        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
-
-        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
-        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
-
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
-- 
2.25.1


