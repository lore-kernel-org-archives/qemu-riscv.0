Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB43CDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsVg-0003jZ-3t; Fri, 20 Oct 2023 12:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVe-0003eU-Js
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:02 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVb-0002aX-Le
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:02 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso172414666b.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819877; x=1698424677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0QpJSioSzBNTf91irQMN8BpZyzwJ1kd2+nNN3fujF2w=;
 b=jD507VLv1Q3DXpYYv4XOY/iKw6lLXZelPaf6QslcZil7D12UZCuiVO8B5iBcKmcPXA
 uUgR1ATUBPeS64AbMhWzUvMVfp/PjwlDbY//xeEMixhQmzYJ5ZtNtKnq5e/fkmU3NB0r
 RWA5F7R7LlBzooUvEPScCz7b87wTNVnYId5aWb3zsuNhpi6GBkn70H4ilk7s0MYVeTBb
 NgyluahTH9RUMpuC81gJ2pD7XRfQazMl8QV6/nj0bifO/CmodxTa35x9421PvtZK/A65
 Y9+O/m90cvcq8tT8r5enqHD3s/4oS8G8VGN13ZJ6sWQ86PJupGKC7nUQGS6XwvS47jrF
 QVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819877; x=1698424677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0QpJSioSzBNTf91irQMN8BpZyzwJ1kd2+nNN3fujF2w=;
 b=IPDHKVfOr9DcjEO9Hucovgcwy7XtDnqQLxLGiWQksrVa5u3PAzdsqzcufwY1pBVOW2
 WHAO0wGXFvII9hcqkk+A5Iae8Wkbz6Rv/86T+4ARukWQtmrY3rVk9UqpTKhqxDc9xWS0
 BABPP7noVhmyjIZ7Z2BERFLejY6z1bey+xs708yf57BL1le1Wae1PPkOpWc127jHaW0r
 vZv0Zp/Nyz3SgpJ7u3cWXiPBuut08s95zS5QqVX9b5MpndsxQPKxz56K7NhMfGAEg911
 ZKZRDFbORbL6yC66kyAap+P3XavNqtzLLDAIb9zJ9ljUHp3DP1lXvIhARoPNtVaGgLYe
 fBxg==
X-Gm-Message-State: AOJu0YxQlDHLReFjOnSbEDmmt2d11pz3qB/0yLr0ulQt3pmxw09tewAk
 pNVOcGTMxKdgDnFlAOq+t9CGIA==
X-Google-Smtp-Source: AGHT+IHqqcCwQhtVKj3SGAIse1HKAYov1qgaQecpg8n6CsqYo+8qJqXaoPpYybRA/SRbJ+rMfgxwJw==
X-Received: by 2002:a17:907:988:b0:9c5:2806:72e2 with SMTP id
 bf8-20020a170907098800b009c5280672e2mr1733573ejc.34.1697819877055; 
 Fri, 20 Oct 2023 09:37:57 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 pw17-20020a17090720b100b009bd9ac83a9fsm1771713ejb.152.2023.10.20.09.37.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:37:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH 09/19] cpus: Filter for target specific CPU (x86)
Date: Fri, 20 Oct 2023 18:36:31 +0200
Message-ID: <20231020163643.86105-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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

Enforce qemu_get_cpu() to return X86 CPUs in X86 specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_X86_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/hyperv/hyperv.c        |  2 +-
 hw/i386/kvm/xen_evtchn.c  |  8 ++++----
 target/i386/kvm/xen-emu.c | 14 +++++++-------
 target/i386/monitor.c     |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index a43f29ad8d..cdda93e14d 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -226,7 +226,7 @@ struct HvSintRoute {
 
 static CPUState *hyperv_find_vcpu(uint32_t vp_index)
 {
-    CPUState *cs = qemu_get_cpu(vp_index, NULL);
+    CPUState *cs = qemu_get_cpu(vp_index, TYPE_X86_CPU);
     assert(hyperv_vp_index(cs) == vp_index);
     return cs;
 }
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index de3650ba3b..d75b53934d 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -542,7 +542,7 @@ static void deassign_kernel_port(evtchn_port_t port)
 static int assign_kernel_port(uint16_t type, evtchn_port_t port,
                               uint32_t vcpu_id)
 {
-    CPUState *cpu = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cpu = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
     struct kvm_xen_hvm_attr ha;
 
     if (!cpu) {
@@ -589,7 +589,7 @@ static bool valid_port(evtchn_port_t port)
 
 static bool valid_vcpu(uint32_t vcpu)
 {
-    return !!qemu_get_cpu(vcpu, NULL);
+    return !!qemu_get_cpu(vcpu, TYPE_X86_CPU);
 }
 
 static void unbind_backend_ports(XenEvtchnState *s)
@@ -917,7 +917,7 @@ static int set_port_pending(XenEvtchnState *s, evtchn_port_t port)
 
     if (s->evtchn_in_kernel) {
         XenEvtchnPort *p = &s->port_table[port];
-        CPUState *cpu = qemu_get_cpu(p->vcpu, NULL);
+        CPUState *cpu = qemu_get_cpu(p->vcpu, TYPE_X86_CPU);
         struct kvm_irq_routing_xen_evtchn evt;
 
         if (!cpu) {
@@ -1779,7 +1779,7 @@ int xen_evtchn_translate_pirq_msi(struct kvm_irq_routing_entry *route,
         return -EINVAL;
     }
 
-    cpu = qemu_get_cpu(s->port_table[port].vcpu, NULL);
+    cpu = qemu_get_cpu(s->port_table[port].vcpu, TYPE_X86_CPU);
     if (!cpu) {
         return -EINVAL;
     }
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index f289af906c..0a973c0259 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -384,7 +384,7 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
 
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
 {
-    CPUState *cs = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cs = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
     if (!cs) {
         return NULL;
     }
@@ -418,7 +418,7 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)
 
 void kvm_xen_set_callback_asserted(void)
 {
-    CPUState *cs = qemu_get_cpu(0, NULL);
+    CPUState *cs = qemu_get_cpu(0, TYPE_X86_CPU);
 
     if (cs) {
         X86_CPU(cs)->env.xen_callback_asserted = true;
@@ -427,7 +427,7 @@ void kvm_xen_set_callback_asserted(void)
 
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
 {
-    CPUState *cs = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cs = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
     uint8_t vector;
 
     if (!cs) {
@@ -491,7 +491,7 @@ static void do_set_vcpu_timer_virq(CPUState *cs, run_on_cpu_data data)
 
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port)
 {
-    CPUState *cs = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cs = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
 
     if (!cs) {
         return -ENOENT;
@@ -588,7 +588,7 @@ static int xen_set_shared_info(uint64_t gfn)
     trace_kvm_xen_set_shared_info(gfn);
 
     for (i = 0; i < XEN_LEGACY_MAX_VCPUS; i++) {
-        CPUState *cpu = qemu_get_cpu(i, NULL);
+        CPUState *cpu = qemu_get_cpu(i, TYPE_X86_CPU);
         if (cpu) {
             async_run_on_cpu(cpu, do_set_vcpu_info_default_gpa,
                              RUN_ON_CPU_HOST_ULONG(gpa));
@@ -834,7 +834,7 @@ static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
         return -EINVAL;
     }
 
-    target_cs = qemu_get_cpu(up.vcpu, NULL);
+    target_cs = qemu_get_cpu(up.vcpu, TYPE_X86_CPU);
     if (!target_cs) {
         return -EINVAL;
     }
@@ -1161,7 +1161,7 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
 {
     CPUState *cs = CPU(cpu);
     CPUState *dest = cs->cpu_index == vcpu_id ? cs : qemu_get_cpu(vcpu_id,
-                                                                  NULL);
+                                                                  TYPE_X86_CPU);
     int err;
 
     if (!dest) {
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index aca7be61dd..01bfb4e3f1 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -592,7 +592,7 @@ void hmp_mce(Monitor *mon, const QDict *qdict)
     if (qdict_get_try_bool(qdict, "broadcast", false)) {
         flags |= MCE_INJECT_BROADCAST;
     }
-    cs = qemu_get_cpu(cpu_index, NULL);
+    cs = qemu_get_cpu(cpu_index, TYPE_X86_CPU);
     if (cs != NULL) {
         cpu = X86_CPU(cs);
         cpu_x86_inject_mce(mon, cpu, bank, status, mcg_status, addr, misc,
-- 
2.41.0


