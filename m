Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C21606A325
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg9wDT9e
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQK5R-0006Jb-OG; Mon, 09 Nov 2026 02:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1xQK5P-0006Ia-SC
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 02:46:39 -0500
Received: from mail-dl2-x05.google.com ([2607:f8b0:4864:38::5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1xQK5O-0002BD-3U
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 02:46:39 -0500
Received: by mail-dl2-x05.google.com with SMTP id
 a92af1059eb24-1ac216daf7dso349207c88.1
 for <qemu-riscv@nongnu.org>; Sun, 08 Nov 2026 23:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794210396; x=1794815196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j7pq3oFVitV/j8rb8dSvVqow8VZ/BdDLrwNb0ix4g7U=;
 b=vg9wDT9eurNJkqu3Dqkg2qREGdtXTGGdrqN9xIyXTrLQ9mS/KUkOgrYAmoliEXR9YV
 LkiXDya967laltZEX+XChCtI8+ysEZDO3Rsxo46nIstYgpsQdrxuw/KV43aBxhwapb7d
 frtXdm2bPCnYO5kW+D14jIpZtrOG06AlFBzxVStJgYUcAqXrZ2wqxnVTgnKPmBW9MQyg
 yztS6dfeKTiZNtjp+pboJs0LRcTfcUhNWhkSevgU3tX0NgSwseyAgtSIhXZ3R6p/WSJ+
 p6icfN4+JuYvdPYyeeHYIx6fYSwFv+ouCF79gXlLKCBGGhujxCsRY33TFVYjb/XZEBZ6
 /GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794210396; x=1794815196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j7pq3oFVitV/j8rb8dSvVqow8VZ/BdDLrwNb0ix4g7U=;
 b=x6VE06Dg1p5Q1zzBj7WJkUpIfRo62zeCjuqqJ/WNJXDjiXodHaUbFPFE0uJWEOQDM0
 sPzcmZu/vhJKb9yTNUd55TedZ4tkfIh7qBFdDmFjOVA/RjxBlGDXJAf0Q6BZtScs65Aa
 eJpRcAG9eHdm8zYNQoNN0h1IvbTr5iu3deJQY+o8CoxUX0MrWOj7o/MGwXgs4gCrjg3i
 hcJrQ0X7ulNgGtmC2m6hl7c1E8HA2KpcJIWD3IsPKc4V9+gp1/NxMvbYxgcqtcL1NRCA
 rZukgcYK+MRHRNG6YePzpC8SJqc9BjY1YfR/H23jeQ3e5ZuBAjp3MJ1v2OnF8tZFuUDY
 7+Zg==
X-Forwarded-Encrypted: i=1;
 AL+hErGY58GTBw8sOHpgagLFhEaB/V4ijC54FAgS+WxADj8v/qsyXVpclyF39L5JExtunLbljlZH4Lp52+5b@nongnu.org
X-Gm-Message-State: APuU4Z+7OYGG29z+NM5oEfIKg5YrEOrLh0PBGno4Urqa1i/4K68yZ150
 EYEGoFxkwfmJ5XWSafDIXlklB1kA0Gtb39XGW4GdB0muhEJSoVI/8pSQ
X-Gm-Gg: AYBFou28ehbL6fB/JYSQRPhEKIsih6DJzk4DTiQjIB4vWbljmM06Ioarx6S1yPu1wEG
 pHV7i5KZf8wRfiwk0kA1D/E/paQ+hkbWY2Miy8s0ifSs6/cjUq3XVAJ1oylspjxiRz72OAiHii8
 oHfxdcw8N/z+Fp6VbeVA/zKufrOADmiHqxeVWNfKmcicmveiftGYXocJG5SXQeLylJP4QUbY43G
 QTFm5zqDAQcVC4P59d4zqg0zncYwq6J/DvAeXpA1uMqo586oulJrY9FO7QghznZnjkYZLMlIkyh
 ak1Pd/xvU+O7uygC2gXtRYUohcGWiNtnnjMA3awB8amQZjBWBc16d1Ke9Ok+UtD70FGL5sotXQT
 D79DLmMc7IN5Y2g8MQIl4/cGeo04aHDsoYrlcBNS/HjfBxP0TJL/DIfAtmy/YBLIrLxBnmzNT6h
 BWpMukoOrSyYcKPm8/EHCd0ShjITHfRK9/08+L4W6HhIzCT/lHSggKQhwYe13Oq5jZ//EWBHjNf
 wrlnlfzoNcyuTG5CpRB+gzjSlcolCGOLtFh1gwnramJQq3XaQmrrfHG0p6z3Ux2DJ+Bpd7WbF4y
 nm23oqUn9yzucJBrvcaCJsDhyy5Z+vJzWM1tuhcH62YLypxXzD/r9qI=
X-Received: by 2002:a05:7022:1505:b0:1b2:cb38:5412 with SMTP id
 a92af1059eb24-1b39fed4847mr6202526c88.42.1794210395505; 
 Sun, 08 Nov 2026 23:46:35 -0800 (PST)
Received: from Dell-WorkStation.localdomain ([138.2.118.134])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3771f0e0fsm15460069c88.20.2026.11.08.23.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 23:46:34 -0800 (PST)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org,
 Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH] target/riscv/kvm: Handle SBI console backend failures
Date: Mon,  9 Nov 2026 15:46:07 +0800
Message-ID: <20261109074608.34915-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::5;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-dl2-x05.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The serial backend is optional, for example when QEMU is started with
-serial none. The legacy SBI console and DBCN handlers nevertheless
dereference serial_hd(0)->fe without checking whether the chardev or
its frontend exists, causing QEMU to crash on a guest console call.
DBCN also terminates QEMU when an existing backend reports an I/O error.

Resolve the frontend once per SBI exit and check it before use. Discard
legacy output and return -1 for legacy input when no console is available.
Explicitly return zero from legacy console putchar as required by SBI.

For DBCN, return SBI_ERR_DENIED with a zero value when the frontend is
missing, before allocating a buffer or accessing guest memory. Convert
backend I/O errors to SBI_ERR_FAILED instead of exiting QEMU, and do not
copy a failed read into guest memory. Treat an incomplete single-byte
write as a failure too, since that call must write the specified byte.

Preserve successful zero-length reads and writes, partial bulk transfers,
and the unsupported-function response.

Fixes: 4eb471258bd0 ("target/riscv: Handle KVM_EXIT_RISCV_SBI exit")
Fixes: a6b53378f537 ("target/riscv/kvm: implement SBI debug console (DBCN) calls")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4430
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/kvm/kvm-cpu.c | 53 ++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5beb602..0ebade6 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1686,7 +1686,8 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
     return true;
 }
 
-static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
+static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run,
+                                      CharFrontend *fe)
 {
     const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     g_autofree uint8_t *buf = NULL;
@@ -1707,6 +1708,12 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
             break;
         }
 
+        if (!fe) {
+            run->riscv_sbi.ret[0] = SBI_ERR_DENIED;
+            run->riscv_sbi.ret[1] = 0;
+            break;
+        }
+
         addr = run->riscv_sbi.args[1];
 
         /*
@@ -1720,22 +1727,22 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
         buf = g_malloc0(num_bytes);
 
         if (run->riscv_sbi.function_id == SBI_EXT_DBCN_CONSOLE_READ) {
-            ret = qemu_chr_fe_read_all(serial_hd(0)->fe, buf, num_bytes);
+            ret = qemu_chr_fe_read_all(fe, buf, num_bytes);
             if (ret < 0) {
-                error_report("SBI_EXT_DBCN_CONSOLE_READ: error when "
-                             "reading chardev");
-                exit(1);
+                run->riscv_sbi.ret[0] = SBI_ERR_FAILED;
+                run->riscv_sbi.ret[1] = 0;
+                break;
             }
 
             address_space_write(cs->as, addr, attrs, buf, ret);
         } else {
             address_space_read(cs->as, addr, attrs, buf, num_bytes);
 
-            ret = qemu_chr_fe_write_all(serial_hd(0)->fe, buf, num_bytes);
+            ret = qemu_chr_fe_write_all(fe, buf, num_bytes);
             if (ret < 0) {
-                error_report("SBI_EXT_DBCN_CONSOLE_WRITE: error when "
-                             "writing chardev");
-                exit(1);
+                run->riscv_sbi.ret[0] = SBI_ERR_FAILED;
+                run->riscv_sbi.ret[1] = 0;
+                break;
             }
         }
 
@@ -1743,13 +1750,19 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
         run->riscv_sbi.ret[1] = ret;
         break;
     case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
+        if (!fe) {
+            run->riscv_sbi.ret[0] = SBI_ERR_DENIED;
+            run->riscv_sbi.ret[1] = 0;
+            break;
+        }
+
         ch = run->riscv_sbi.args[0];
-        ret = qemu_chr_fe_write_all(serial_hd(0)->fe, &ch, sizeof(ch));
+        ret = qemu_chr_fe_write_all(fe, &ch, sizeof(ch));
 
-        if (ret < 0) {
-            error_report("SBI_EXT_DBCN_CONSOLE_WRITE_BYTE: error when "
-                         "writing chardev");
-            exit(1);
+        if (ret != sizeof(ch)) {
+            run->riscv_sbi.ret[0] = SBI_ERR_FAILED;
+            run->riscv_sbi.ret[1] = 0;
+            break;
         }
 
         run->riscv_sbi.ret[0] = SBI_SUCCESS;
@@ -1762,15 +1775,21 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
 
 static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
 {
+    Chardev *chr = serial_hd(0);
+    CharFrontend *fe = chr ? chr->fe : NULL;
     int ret = 0;
     unsigned char ch;
+
     switch (run->riscv_sbi.extension_id) {
     case SBI_EXT_0_1_CONSOLE_PUTCHAR:
         ch = run->riscv_sbi.args[0];
-        qemu_chr_fe_write(serial_hd(0)->fe, &ch, sizeof(ch));
+        if (fe) {
+            qemu_chr_fe_write(fe, &ch, sizeof(ch));
+        }
+        run->riscv_sbi.ret[0] = 0;
         break;
     case SBI_EXT_0_1_CONSOLE_GETCHAR:
-        ret = qemu_chr_fe_read_all(serial_hd(0)->fe, &ch, sizeof(ch));
+        ret = fe ? qemu_chr_fe_read_all(fe, &ch, sizeof(ch)) : 0;
         if (ret == sizeof(ch)) {
             run->riscv_sbi.ret[0] = ch;
         } else {
@@ -1779,7 +1798,7 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
         ret = 0;
         break;
     case SBI_EXT_DBCN:
-        kvm_riscv_handle_sbi_dbcn(cs, run);
+        kvm_riscv_handle_sbi_dbcn(cs, run, fe);
         break;
     default:
         qemu_log_mask(LOG_UNIMP,
-- 
2.43.0


