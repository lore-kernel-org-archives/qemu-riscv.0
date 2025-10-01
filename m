Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D95CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:18:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3ySN-0004Io-Fc; Wed, 01 Oct 2025 11:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3ySL-0004F7-FN
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQO-0000rL-BA
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:25 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e30ef74b0so51083595e9.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331234; x=1759936034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoPTdg5MwxI4gUrOUKUWisdEEc5+5afMb5BWjaZNRgo=;
 b=ssUBkp0QeGEDnWPL6KPrBCD9w1eJOiMDYWR9p5u3R9v6/U+eMNp7hnpFO4dVhpNLB9
 ui+r38KglthQnSA+/LQPPCwcIU7ymQq8QV3k4o8GiJmoZa5l07tl5g53z7O4YnDFWqG7
 U0DPnQPwwcrxUCOucic3Kl+pjXzgJl1X97RAght4T8G6WtKzDLbl3airma8NemJvAA9R
 UrjkXoK6vmUstXQ2zyCk17lQnwPazDW1j8xlZQjowG8kX7U5MEdKvU6PxSyFPUhvr7DA
 7qwZo7bf9+88u7437HuwQy+l3CLtiTzmM52B9JAcauidovix6Et535LxymVDAibWhOO1
 B3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331234; x=1759936034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoPTdg5MwxI4gUrOUKUWisdEEc5+5afMb5BWjaZNRgo=;
 b=E2Hj625jnZGvoBSNkqDvhAezfkk0o4bJjUdqN+shGMz5LRkTBWggh+ccqXcZXa6dEB
 Kpe0n79YPshcjnLSujGDwsso3pMhffa0wwY3THmrvsEcMDN+KQ81Ka54AGr18EqGH4Fw
 jDdEyJYckWWQRBM8VI4ngFo9nG0ZcjgDenH+H30+/6YcD0ln0rckZ+Q6TRh2fk13L72/
 wXZv0IE9jmFbopugL6sLvQ94uBP6vERIas+/QjET8C5BrKbDGZmUxDsZ1Qjc+3hGcge9
 rhpgfxAbo5BjpBwCAm63SaWvyADEpKuT1qHB635GH8L6C2woyeZRTrNshtzuhYNxGVtP
 kYEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY44jNurDQ/+4Imu6DOwORJiCQLL9E8qqaegONgMA/CogZol7kEQWTVP0Dc/RrjifKZYIhOkqmTiXZ@nongnu.org
X-Gm-Message-State: AOJu0Yz2Al0LBoxpTkxYU8pcgaukizFBwmt0CVwRHnGGHrEtmhN5jJOG
 /wip1qehjjANxjKUy81txO4Jx8L8PHN9prkgtReDmcma0FpODtO02VRY6/uYHKA2p0I=
X-Gm-Gg: ASbGncvYTrnb4dLTyrsYD3ZErVkzM0E3wDFVFBwy07x95aiAFehCNk4xpmDAlgQdZOt
 L6guKYgTirrd3ERjFaaDGTyTs/iDUVoK/3k+A48T+JcHEIY+tzLhsEkjkTegKBPgxsvaFD46wwx
 CDk+aWn8Z0EQhce6+pSaQuwuvWX0umXPGgGOE52Dwce62M7HxQqEXaW13lQ/h8xKiBTQ2LDUqJF
 Gy/CfrA6p+/U8Ee3h8Yc81oCNuRhCwOg1NOSK+/5RMnBvH2UWmsbZvEsemXB3tdRuebsp72Q/xz
 2vXM4c42CHi/yB6KML8VA8eixItMU8LNe8nGKLMyR8ixRxGAj9e/BxkIpTHTmkNJiOd3I22Ijri
 0wTQbxhJ8/2pMnNMg6B6cuvb8T8oXxzSgOzaYeoq0KC/JvFPLBx38iRo9bFdd27kpORSZUJuaY4
 Os17y2WCmQWnyEWFVsheRy
X-Google-Smtp-Source: AGHT+IG4XxMj0/+XRjkxBKqGWeT9h7Y0BLEBnyZwHWXRoLQtC3MKtNYoHlq4F6Q4cvmSoGl7zqJatA==
X-Received: by 2002:a05:600c:6094:b0:45d:d88b:cca with SMTP id
 5b1f17b1804b1-46e6125cf67mr30505065e9.1.1759331233664; 
 Wed, 01 Oct 2025 08:07:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e611970easm25177495e9.2.2025.10.01.08.07.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:07:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH 20/22] hw/core/cpu: Remove @CPUState::as field
Date: Wed,  1 Oct 2025 17:05:25 +0200
Message-ID: <20251001150529.14122-21-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

All code now get the vcpu first address space using
cpu_get_address_space(). Nothing uses the CPUState::as
field anymore: remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h |  3 ---
 hw/core/cpu-common.c  |  1 -
 system/cpus.c         |  2 +-
 system/physmem.c      | 10 ----------
 4 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c9f40c25392..0f7eda1a10d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -443,8 +443,6 @@ struct qemu_work_item;
  * @cpu_ases: Pointer to array of CPUAddressSpaces (which define the
  *            AddressSpaces this CPU has)
  * @num_ases: number of CPUAddressSpaces in @cpu_ases
- * @as: Pointer to the first AddressSpace, for the convenience of targets which
- *      only have a single AddressSpace
  * @gdb_regs: Additional GDB registers.
  * @gdb_num_regs: Number of total registers accessible to GDB.
  * @gdb_num_g_regs: Number of registers in GDB 'g' packets.
@@ -517,7 +515,6 @@ struct CPUState {
     struct CPUAddressSpace *cpu_ases;
     int cpu_ases_count;
     int num_ases;
-    AddressSpace *as;
     MemoryRegion *memory;
 
     struct CPUJumpCache *tb_jmp_cache;
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 41a339903ca..e46863d9e1d 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -307,7 +307,6 @@ static void cpu_common_initfn(Object *obj)
 
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
-    cpu->as = NULL;
     cpu->num_ases = 0;
     /* user-mode doesn't have configurable SMP topology */
     /* the default value is changed by qemu_init_vcpu() for system-mode */
diff --git a/system/cpus.c b/system/cpus.c
index aa7bfcf56e5..ecd025a611d 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -704,7 +704,7 @@ void qemu_init_vcpu(CPUState *cpu)
     cpu->stopped = true;
     cpu->random_seed = qemu_guest_random_seed_thread_part1();
 
-    if (!cpu->as) {
+    if (cpu->num_ases == 0) {
         /* If the target cpu hasn't set up any address spaces itself,
          * give it the default one.
          */
diff --git a/system/physmem.c b/system/physmem.c
index b245cd14d43..31286b3c13f 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -791,11 +791,6 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     /* Target code should have set num_ases before calling us */
     assert(asidx < cpu->num_ases);
 
-    if (asidx == 0) {
-        /* address space 0 gets the convenience alias */
-        cpu->as = as;
-    }
-
     if (!cpu->cpu_ases) {
         cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
         cpu->cpu_ases_count = cpu->num_ases;
@@ -827,11 +822,6 @@ void cpu_address_space_destroy(CPUState *cpu, int asidx)
     address_space_destroy(cpuas->as);
     g_free_rcu(cpuas->as, rcu);
 
-    if (asidx == 0) {
-        /* reset the convenience alias for address space 0 */
-        cpu->as = NULL;
-    }
-
     if (--cpu->cpu_ases_count == 0) {
         g_free(cpu->cpu_ases);
         cpu->cpu_ases = NULL;
-- 
2.51.0


