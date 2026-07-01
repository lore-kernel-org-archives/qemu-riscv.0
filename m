Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F010C43602
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:09:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welG6-0005s2-Ga; Tue, 30 Jun 2026 23:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFt-0005go-8Y
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:54 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFq-0002nc-Im
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:52 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c9d1fc053e0so77814a12.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875087; x=1783479887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyK+CTy7AHFZZvKhxQNNFWU8l3C1vqLCkOkPJFqKdno=;
 b=eMcx10feUvaW01GHjD4MJrkbFDzX+Iben4Ja+hbwM5LmaBO9xfmQ9RTb5ivh6Bgav7
 eaLbU+1ZV3MT4bbj6X3slZsQtAui+Uf7PyLFtrMdgmXLXi6GPgPEwG1hJvnATq+ors6z
 idAPYt/+DvqMmRGDShG5FOXVtXNRSa4pI5U83FxEPz3ddfqe7p2EnnX3RhAQq9silJAC
 64p2gnj3Ud48Q9pWJ3SshJPFkBQ70occYllkjjtn2taH2odB62rC7KDvZH/6lw741sME
 XboLM2TJnRNKjr5Fz8CspnIVCyCmxtNSydEX3XEMZGnN/YzBfFyqgMEWo5zevp+rPv/3
 gSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875087; x=1783479887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jyK+CTy7AHFZZvKhxQNNFWU8l3C1vqLCkOkPJFqKdno=;
 b=K3DFkBn2VZ8HRnqK2f84Uqcs/g0aCZfWAhIPlzAgljRosx2Kc8oV2HZTHFiYRPTtnD
 w8nu8LkNj64yU2AQBNqOUy9k4vDdltlplnzVrMAxyylJs1vp4WH5L3qbHh0DnF3r+g1e
 6ZGyw4iIzk0mNEEpw2rWNB/OXNYWkJhzew9/ffC6NCPTR5KHxF3VicU7/J+gdSa+p+g4
 8KdSrn4nZvtdHFRe5EWLRkV5pKBwgn1kANdTwvlGqLO246zkBC91mSbDaTHUKjptMVfQ
 Fu+7EBJkYyp5Abiw0z1J5mgCKtdK+moqb/fb8Vf0R0lVd1MOQFSUS6B5ZiWjXww5cAWK
 O0yA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRDhuRSYneD2ZM0c1JdO/5CZ9iXYpANWGXz4mEvaksURB9UIttC4TTqMYSYVu+c9DFSMD9qPApvyd/@nongnu.org
X-Gm-Message-State: AOJu0YyYgH7oSardWooPM+wCYYkk2PT+W6REcvsrAKBrmVillwd2U50T
 splIwTioJOVLABEYPkAgttQRHNOVIzvfFeFv4d+OVCCPryV0QhfCI+syDaXFTRuPPZM=
X-Gm-Gg: AfdE7cnO+n2eQmRbblRW4ojdW7qTd51vup9zl6ppG85cW02VPd8dg+5cvBQ4Bf4gv7x
 N2VOR8+ngyX0yg566lKZoiP9fgOyA6fIyiXt0OTpQUjmabWBqmNhM77YBUXLVOFbW5gnEuY9Xfl
 lWt1qqlXrbUrPgIMkHuqYkAjv9yWXgqz+zoGNXjuzbAs4tY8BhUBVXG/tv/TVTTS1bnlBvwpMko
 elDMMGTeJmVRdVvJXZ2UFLqaZpr/xP7uudv373HSWmfqXFROLwAXdznv80fQKkpviojB3uqaOv+
 /wI1b0zH0e3kzWOw6KSTtbSi1clg7Dkm3Im26AMx7pNNylJKJwTplrcf5tqreXb0LFV0uA8v3dv
 w+sFanfmVku45V9tpqGnhrEZVVahrux6CSjDUtzAMogv/Z5wUdoL+TdhU67S8H4gzj1HDZbW+iT
 T7b6Ie4RW0Vwji9lFgoWX569vxIOzyQSkhCYkWP4QupatKjGphaPLZY7+Mi+2e
X-Received: by 2002:a17:903:15cf:b0:2ba:924b:3948 with SMTP id
 d9443c01a7336-2ca2d56494cmr53298245ad.15.1782875087461; 
 Tue, 30 Jun 2026 20:04:47 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 03/17] cpu: Move cpu_breakpoint_test out of line
Date: Tue, 30 Jun 2026 20:04:29 -0700
Message-ID: <20260701030443.1382447-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Move the function to cpu-common.c, with the other
breakpoint functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 16 +---------------
 cpu-common.c          | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 59d601465b..b853824e47 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1157,21 +1157,7 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, int mask);
-
-/* Return true if PC matches an installed breakpoint.  */
-static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
-{
-    CPUBreakpoint *bp;
-
-    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-            if (bp->pc == pc && (bp->flags & mask)) {
-                return true;
-            }
-        }
-    }
-    return false;
-}
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask);
 
 /**
  * cpu_get_address_space:
diff --git a/cpu-common.c b/cpu-common.c
index 988d057d84..adb76b3a78 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -388,6 +388,21 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_cond_broadcast(&qemu_work_cond);
 }
 
+/* Return true if PC matches an installed breakpoint.  */
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
+{
+    CPUBreakpoint *bp;
+
+    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
+        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+            if (bp->pc == pc && (bp->flags & mask)) {
+                return true;
+            }
+        }
+    }
+    return false;
+}
+
 /* Add a breakpoint.  */
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint)
-- 
2.43.0


