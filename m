Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A51C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:07:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0R0-00040F-2E; Fri, 03 Nov 2023 16:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qt-0003fB-Uh
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qk-0006xA-CS
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso21177405e9.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041968; x=1699646768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7sLTMALisCLY6Bva5cUZONqTNhvGsWtyZ83Zemwfzds=;
 b=LYiZnNVaNCk51B4cDg7R2AfUmz9FfH5JRpilM8B86SbwVLuttC+VQvdvoxjhRy21xG
 AEZqgs0tW1qmJMBpQyWH57tV5j/lwwsZLe8Pd1+R4ksAGblXsBrCOHvRMgsPyoPCjuW7
 rs+cqPnlBY6Oy+RQdH1aw9yncyXAAomop/7RKE3qOlsyLJelm07KiLCpmOCZrDyvRNSK
 sgFlA45emwqlzetY0G3R8vNCbWRoauxuMPKsZn/kCEZtgunNgquVKoOpaptWO60QSuC0
 C4du8Wl47/Dcdtbkkoig8hpjlrCB+ESWziERPl9LBuXXEbyVpk04xUQJapYHR6jXrJ2n
 9qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041968; x=1699646768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sLTMALisCLY6Bva5cUZONqTNhvGsWtyZ83Zemwfzds=;
 b=EtG/d5ZKac6M086gGZDb1Qf0gJMU5NCLyYvbXH2GphvEvJ0mmrWjbzYq5KzT9eIlaF
 MVJk7FEejY8ErSXmGunitpuEAh+IJuT01GUBYFMw3FgoKfo/b7eij7J7RsxABUYXySfL
 9jpPS3IBkPoXfxJ+XOJshNAKF8jQ/BFHJKGxLLSr8MLaDKdluKpchpgkmRostmn0HlOZ
 1M7FNUQ5jjyzNRV0Dz45RtPg/+K2sC9segjV6zzn/pNnL+xyc5XhUMYb0Xeoabzu9RmO
 7MaNoD5BfFcThVhJshm4J2zjCZX3u5N7jNytAXMgtKJIDP+j5YBzFawbo9rnvcBCRDKs
 vYNg==
X-Gm-Message-State: AOJu0YwoHfZiv4X6nCc5QEXafBJf+VtBh6cQKZGYpddbD1UtlpJjRP30
 3RtrGuhmcMu3/C9/wZGeppkLRQ==
X-Google-Smtp-Source: AGHT+IFbDqDnelaVcNjMT1X5gP4Tmgmidil+A1mGCJMeH1dP0RkDI9bXdmdegoWZ6KCq2cO5CCt0HA==
X-Received: by 2002:a05:6000:2a9:b0:32f:7260:1220 with SMTP id
 l9-20020a05600002a900b0032f72601220mr4254287wry.17.1699041968323; 
 Fri, 03 Nov 2023 13:06:08 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 j20-20020a5d4534000000b0032dc74c093dsm1333423wra.103.2023.11.03.13.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:06:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 09F0065751;
 Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 21/29] gdbstub: expose api to find registers
Date: Fri,  3 Nov 2023 19:59:48 +0000
Message-Id: <20231103195956.1998255-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Expose an internal API to QEMU to find groups of registers. It returns
a list containing the details required to called gdb_read_register().

Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB:

This principle difference is the find registers is a single call which
can return a) multiple registers and b) is agnostic to the gdb
feature. This is because I haven't so far found any duplicate
registers in the system so I thing the regname by itself should be
enough. However I do expose the gdb feature name in case the caller
wants to do some additional filtering.
---
 include/exec/gdbstub.h | 47 +++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c      | 59 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index da9ddfe54c..b201eb4b84 100644
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
+ * gdb_find_registers() - Return list of registers matching pattern
+ * @cpu: The CPU being searched
+ * @reg_pattern: the pattern being searched for
+ *
+ * Returns a GArray of GDBRegDesc, caller frees
+ */
+GArray *gdb_find_registers(CPUState *cpu, const char *reg_pattern);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7d7d887817..45882d1a6f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -490,7 +490,64 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
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
+GArray *gdb_find_registers(CPUState *cpu, const char *reg_pattern)
+{
+    g_autoptr(GPatternSpec) pat = g_pattern_spec_new(reg_pattern);
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
+            if (name && g_pattern_match_string(pat, name)) {
+                GDBRegDesc desc = {
+                    r->base_reg + i,
+                    name,
+                    r->feature->name
+                };
+                g_array_append_val(results, desc);
+            }
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


