Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1451CC54E4C
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 16:46:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rdYfE-00084H-7V; Fri, 23 Feb 2024 11:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJt-0004FH-Cl
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:41 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJS-00067Q-Kz
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4128cfb6b6fso3905055e9.0
 for <qemu-riscv@nongnu.org>; Fri, 23 Feb 2024 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708705333; x=1709310133; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9WREwsMrt85roF9DpcRAV7U4Bq5TV/wSmpsUdovSGg=;
 b=DLvvLLSZfm1Te/aHVQqMpN38lotHi4x/2nWtSqC8shoP0o8e51l8JYk+kzk3g4Q2P5
 FiddgQ6OBigHXM/VV2N0SpZhnekX92eomx4UHohWfwosZiE8Pc4Aj1kPXyt2ybYmAgpG
 1BvmU73Wa7QoUwUzk1d5cDPAmb4OCJIw6j+n8PSBox1q64R2W2TMR4wAPgOWOxRECUOt
 IhVDdCH13NdLYqpQPfRLSl6Z1dSbWMyKmtEcBY+f8ZWA1zXFE0uXzTKbH9KVOh2v/fq/
 Huven221G0aUngiKIWB1MMoNsNXYrxZmHPrbxPuoVzeMiMmbm5YzKNh82qGjKXx/WYRM
 Gq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708705333; x=1709310133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9WREwsMrt85roF9DpcRAV7U4Bq5TV/wSmpsUdovSGg=;
 b=BDTnN2ee/SVLDJxgGC0CFtkCU6F36SdUnAGVWbMm+mLGy9IVrjSFqXBBH0UJR/3tkm
 Ep04PuPlR/1rGvoUd2bKiKbqiZKZGwdFIdwRjQgSchAeIB/nWtAo7POov4VOfLFarreP
 C9JKXgB3rnL/U2L8yQBE053CriVbC2UaiWB/d3HpDuqf79q9OuKP1iOzhRDOxNXHwJxS
 /3nuw/NI/5zqoUld6nlwrkqxLJ4DpHV3wfGT/KKzy/4NoJ1PTmjCasNGO9waYRF5ABxD
 YMolRzfLxW1p1wlHbrl8lLSiPk/8eI1iBb8kTAJ2JSp1II3XEWwk8nUe1UlDXCySFBgQ
 pM3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOclXdYcug8DAcS17V+uka9W/KdZki/47iATpeoPe06M0utjIFtPmPrQuBMl0RNNSZ3qRbEDaVf4cH3syI6uye1BD8qRw=
X-Gm-Message-State: AOJu0YyP79HuO8s1j5iAIi2g8gIgYp62T8qX5yf79o7zo8qp7/LNYfMa
 JSMgtlTspmbff2zb9uCVwFdocyxCINUa0jmO6RDrN+zwq0D3W3VV+BPfcIdDK8I=
X-Google-Smtp-Source: AGHT+IGGiNZfEmYykiaaL/9nYZ88SIpYj9dYVMdHEXx0D+OEAMtsoF+oAjeI5eSB6RAVp6UETjMucA==
X-Received: by 2002:a5d:4a84:0:b0:33d:2873:92c6 with SMTP id
 o4-20020a5d4a84000000b0033d287392c6mr187186wrq.31.1708705333234; 
 Fri, 23 Feb 2024 08:22:13 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e8-20020adff348000000b0033d5f5571b4sm3237616wrp.44.2024.02.23.08.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 08:22:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E892A5F92F;
 Fri, 23 Feb 2024 16:22:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 14/27] plugins: add qemu_plugin_num_vcpus function
Date: Fri, 23 Feb 2024 16:21:49 +0000
Message-Id: <20240223162202.1936541-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We now keep track of how many vcpus were started. This way, a plugin can
easily query number of any vcpus at any point of execution, which
unifies user and system mode workflows.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213094009.150349-3-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h   | 3 +++
 plugins/plugin.h             | 4 ++++
 plugins/api.c                | 5 +++++
 plugins/core.c               | 6 ++++++
 plugins/qemu-plugins.symbols | 1 +
 5 files changed, 19 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index e45181c793c..93981f8f89f 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -645,6 +645,9 @@ QEMU_PLUGIN_API
 void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb, void *userdata);
 
+/* returns how many vcpus were started at this point */
+int qemu_plugin_num_vcpus(void);
+
 /**
  * qemu_plugin_outs() - output string via QEMU's logging system
  * @string: a string
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 90f3f324ab6..00b3509f708 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -44,6 +44,8 @@ struct qemu_plugin_state {
      * the code cache is flushed.
      */
     struct qht dyn_cb_arr_ht;
+    /* How many vcpus were started */
+    int num_vcpus;
 };
 
 
@@ -97,4 +99,6 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
 
 void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
 
+int plugin_num_vcpus(void);
+
 #endif /* PLUGIN_H */
diff --git a/plugins/api.c b/plugins/api.c
index 2926b1961a8..116b8bd603c 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -342,6 +342,11 @@ const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
 #endif
 }
 
+int qemu_plugin_num_vcpus(void)
+{
+    return plugin_num_vcpus();
+}
+
 /*
  * Plugin output
  */
diff --git a/plugins/core.c b/plugins/core.c
index ee2fa41af9e..caa66311351 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -213,6 +213,7 @@ void qemu_plugin_vcpu_init_hook(CPUState *cpu)
     bool success;
 
     qemu_rec_mutex_lock(&plugin.lock);
+    plugin.num_vcpus = MAX(plugin.num_vcpus, cpu->cpu_index + 1);
     plugin_cpu_update__locked(&cpu->cpu_index, NULL, NULL);
     success = g_hash_table_insert(plugin.cpu_ht, &cpu->cpu_index,
                                   &cpu->cpu_index);
@@ -570,3 +571,8 @@ static void __attribute__((__constructor__)) plugin_init(void)
              QHT_MODE_AUTO_RESIZE);
     atexit(qemu_plugin_atexit_cb);
 }
+
+int plugin_num_vcpus(void)
+{
+    return plugin.num_vcpus;
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index ca806000d54..adb67608598 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -16,6 +16,7 @@
   qemu_plugin_mem_is_sign_extended;
   qemu_plugin_mem_is_store;
   qemu_plugin_mem_size_shift;
+  qemu_plugin_num_vcpus;
   qemu_plugin_outs;
   qemu_plugin_path_to_binary;
   qemu_plugin_register_atexit_cb;
-- 
2.39.2


