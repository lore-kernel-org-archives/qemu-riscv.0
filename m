Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24099C47077
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:48:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5DO-0007d3-IA; Wed, 03 Jan 2024 12:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL5D9-0006Tg-8I
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:39:23 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL5Cx-0000fd-LM
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:39:22 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3374d309eebso632452f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303550; x=1704908350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7b3xpykHeaHl4suIRJtcydNJ+7RVLNIDOZxUbbJygc=;
 b=YzclKS91ROCiEUliPREbJ5vhRAlB73+Wjwf5IUCj09NEb4igPTjVwdzZtGqYJyNB0j
 pKngCV8XMGc+JaptJLXYKK5bfZ9EcjbIiza2IvHSZILsb9t8PUjGDnYYGfoWDntAQwy8
 leW35p4ZsWi+18Ui7IF7BaxMSF18azdmtbT2FhYyjGNLTq9dXRBwKxH8eRrYWuREFdgt
 iTfKDQ6sxNCEIfvqPLaxXZztRpUBafpsmJXIhi3PjaqApHPscXEvhGfNOEcmTVWYvwCN
 5WY2qMZX+NwIxFpC3l43/WT+S0zQUES/hc/kteddsPrrrTkVdG80dZrg6wlnf692WfyC
 1Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303550; x=1704908350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7b3xpykHeaHl4suIRJtcydNJ+7RVLNIDOZxUbbJygc=;
 b=ZwAHUVR+LsQwfcC2L9AXn4y2th+aVNw2Av/W6oWlWeNGJ3zd/GHBSIjhcYwXgeJOiz
 3RvCkCStaLJefxZ4nj7Wm9RPwIWePQ/99f4Tm5cY+zablW423VH0gGaUUVts6E0FMRPv
 EhOoukYP88cpixcZ/CPwPN7cOXMe64LdlqNn73FrgvUOBhym9KG+ws0lqfmdqzlsd7wQ
 tBB6WAegf+woZlNP+s5pHiwGWTosf17pLvLikZeWv8X2PWSwRWikekiUY32MAvx8WtoC
 0deFxApBRTfsjxGxcB/Qf9eKXnik6ZRkStRmU2SWaYBoFXrmp6mbAJSwS5UVZDLtQF4E
 Ysrg==
X-Gm-Message-State: AOJu0YxIYEBefvYiJy6WPOdvf8edCFJjXEuojr8ihnk1dvvpY1mbXRt+
 jakCdHm78SAsd6x+YKGkvGCW0x+RqF+1/Q==
X-Google-Smtp-Source: AGHT+IFhVN5CUKKwTQpPFIkvofPSf4XwbYH6uuKyBdKo+vTtyQ3x8fc2E3p+z7+XbMrRJtLtJWYynA==
X-Received: by 2002:a05:6000:1845:b0:337:39ee:2b85 with SMTP id
 c5-20020a056000184500b0033739ee2b85mr3828333wri.104.1704303550198; 
 Wed, 03 Jan 2024 09:39:10 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d5652000000b00336ca349bdesm21896679wrw.47.2024.01.03.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:39:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1FA005F9D3;
 Wed,  3 Jan 2024 17:33:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 37/43] gdbstub: expose api to find registers
Date: Wed,  3 Jan 2024 17:33:43 +0000
Message-Id: <20240103173349.398526-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Expose an internal API to QEMU to return all the registers for a vCPU.
The list containing the details required to called gdb_read_register().

Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - just make gdb_get_register_list return everything for a vCPU

vAJB:

This principle difference is the find registers is a single call which
can return a) multiple registers and b) is agnostic to the gdb
feature. This is because I haven't so far found any duplicate
registers in the system so I thing the regname by itself should be
enough. However I do expose the gdb feature name in case the caller
wants to do some additional filtering.
---
 include/exec/gdbstub.h | 47 +++++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c      | 56 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index da9ddfe54c5..7bddea8259e 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -111,6 +111,53 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
  */
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
+/**
+ * gdb_find_feature() - Find a feature associated with a CPU.
+ * @cpu: The CPU associated with the feature.
+ * @name: The feature's name.
+ *
+ * Return: The feature's number.
+ */
+int gdb_find_feature(CPUState *cpu, const char *name);
+
+/**
+ * gdb_find_feature_register() - Find a register associated with a CPU.
+ * @cpu: The CPU associated with the register.
+ * @feature: The feature's number returned by gdb_find_feature().
+ * @name: The register's name.
+ *
+ * Return: The register's number.
+ */
+int gdb_find_feature_register(CPUState *cpu, int feature, const char *name);
+
+/**
+ * gdb_read_register() - Read a register associated with a CPU.
+ * @cpu: The CPU associated with the register.
+ * @buf: The buffer that the read register will be appended to.
+ * @reg: The register's number returned by gdb_find_feature_register().
+ *
+ * Return: The number of read bytes.
+ */
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
+
+/**
+ * typedef GDBRegDesc - a register description from gdbstub
+ */
+typedef struct {
+    int gdb_reg;
+    const char *name;
+    const char *feature_name;
+} GDBRegDesc;
+
+/**
+ * gdb_get_register_list() - Return list of all registers for CPU
+ * @cpu: The CPU being searched
+ *
+ * Returns a GArray of GDBRegDesc, caller frees array but not the
+ * const strings.
+ */
+GArray *gdb_get_register_list(CPUState *cpu);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 420ab2a3766..b0230138246 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -490,7 +490,61 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
     g_assert_not_reached();
 }
 
-static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
+int gdb_find_feature(CPUState *cpu, const char *name)
+{
+    GDBRegisterState *r;
+
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+        if (!strcmp(name, r->feature->name)) {
+            return i;
+        }
+    }
+
+    return -1;
+}
+
+int gdb_find_feature_register(CPUState *cpu, int feature, const char *name)
+{
+    GDBRegisterState *r;
+
+    r = &g_array_index(cpu->gdb_regs, GDBRegisterState, feature);
+
+    for (int i = 0; i < r->feature->num_regs; i++) {
+        if (r->feature->regs[i] && !strcmp(name, r->feature->regs[i])) {
+            return r->base_reg + i;
+        }
+    }
+
+    return -1;
+}
+
+GArray *gdb_get_register_list(CPUState *cpu)
+{
+    GArray *results = g_array_new(true, true, sizeof(GDBRegDesc));
+
+    /* registers are only available once the CPU is initialised */
+    if (!cpu->gdb_regs) {
+        return results;
+    }
+
+    for (int f = 0; f < cpu->gdb_regs->len; f++) {
+        GDBRegisterState *r = &g_array_index(cpu->gdb_regs, GDBRegisterState, f);
+        for (int i = 0; i < r->feature->num_regs; i++) {
+            const char *name = r->feature->regs[i];
+            GDBRegDesc desc = {
+                r->base_reg + i,
+                name,
+                r->feature->name
+            };
+            g_array_append_val(results, desc);
+        }
+    }
+
+    return results;
+}
+
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GDBRegisterState *r;
-- 
2.39.2


