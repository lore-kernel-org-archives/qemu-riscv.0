Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF87C48260
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 16:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rb1Di-0001MZ-Ir; Fri, 16 Feb 2024 11:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb1Df-0001Ja-VO
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:37:48 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb1DV-00044H-52
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:37:47 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so19122285e9.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708101455; x=1708706255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTAh5Ga1/WCguB9K86wBQIKOB8LucCe9FRfIk+dLcDE=;
 b=CgvQ5w2Gx4wB8CDP8vaTVBGcGz9xHay+XB97NEKqh9nOZvGpi1A9FqkMPQ3oCJFR+Q
 9/NSdWGdX1xVzgYgG5x7pDXEHNwwXlJJ6Xfo/f0IkE5/GDL4SCECLAPynNFBbmli8ETg
 egxevGdMgObJLgZoiXJi93Px5yMCye+O7Fsj9n82Mrg0D4Lf0YMlb6JaZ/c8X4MDg4HF
 veRCWX50w277km1RFTb6xrCcmqxY/hX03sLsiAM19FWLtMSyhm4bWg5nMW3V2K1vqVjR
 k1MH1BuoK8XYMmVTY4K1v84Bf/6/nWGwH7ZWJ0uG5x706v5DPWlxGtUyZqN4VsPDMMuj
 0wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101455; x=1708706255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pTAh5Ga1/WCguB9K86wBQIKOB8LucCe9FRfIk+dLcDE=;
 b=CoLsAJ3QOJN0Qp0AlpqM92b7NqpWTD/fHXT1HtHcvWvnmeq5eZ5PcbCW0L2Jc5ae0u
 DC9sSJPltVOdNk5RpMZszYYslHbgyK4Wr/zOtxEDsrkGNWTIqoBUCPyFOc5kghBrzH0q
 IRd8xLcqS3z/gUcmahWNZUG6LKVZZ76NNz2dlhuxX7iEdzBXrezJz1GZ8fOxdWhNHc2e
 i4mTPT3cQMNGf6xBKZhaU6Fpf/dTALFzcI9/11NKRHweI6L8MU0QqnGZJTDp9zQ2taNA
 Ov67BeDDWAJEC3W8SS+jKn6o0TlkM0SNufj7E76k/x9hP5+qJRwPaWdYtd2XlEoSPSn1
 F3+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKmID/Ok49UUh7tSTQl+1SyiuON08fpitSCjwH0aDeFJrtLMi447wjOABtFSL+tpV29/Qg9zx+8no2KDgavwqvevlLTps=
X-Gm-Message-State: AOJu0YwGpyDQGzClBWKT/jV2MrGXnDexiYU5sziQSyjvAA7UwPWeGey9
 D/kQ8Qn77JNpp+r7Uoe1F1hcTMIflHWkJayE8B1bBocJzFO2lbVvWm9K0NRD9oA=
X-Google-Smtp-Source: AGHT+IHcyZ2KIH/U3Vd3Q3sGq6Z3C36bbvg73d+q7RAa047FV+WE49RTLT+s8ruwPZ9+WhsDTPsE1w==
X-Received: by 2002:adf:e947:0:b0:33d:2567:995c with SMTP id
 m7-20020adfe947000000b0033d2567995cmr820513wrn.1.1708101455066; 
 Fri, 16 Feb 2024 08:37:35 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d460c000000b0033b48190e5esm2633756wrq.67.2024.02.16.08.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:37:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 06B685F9E3;
 Fri, 16 Feb 2024 16:30:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 17/23] gdbstub: expose api to find registers
Date: Fri, 16 Feb 2024 16:30:19 +0000
Message-Id: <20240216163025.424857-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216163025.424857-1-alex.bennee@linaro.org>
References: <20240216163025.424857-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Expose an internal API to QEMU to return all the registers for a vCPU.
The list containing the details required to called gdb_read_register().

Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240103173349.398526-38-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rm unused api functions left over
---
 include/exec/gdbstub.h | 28 ++++++++++++++++++++++++++++
 gdbstub/gdbstub.c      | 27 ++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index da9ddfe54c5..eb14b91139b 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -111,6 +111,34 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
  */
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
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
index a55b5e6581a..2909bc8c69f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -490,7 +490,32 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
     g_assert_not_reached();
 }
 
-static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
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


