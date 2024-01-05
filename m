Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A891C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:48:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmOV-0001c5-9B; Fri, 05 Jan 2024 10:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNd-0000Xc-Jt
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:45:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNa-0003PM-6h
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:45:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so10389585e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469499; x=1705074299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZuAr3GGN/pOvffPY8+fLddBxJHGJfB6Dvfc17Jcg0E=;
 b=hQiB8IA1hhYuYpdQNeCxIID2eAzyigfnquvRK+W0GKHdvwtMiaE4WLwvzI58qlGIWN
 l5BeDm0XbIhRqlK3yHTMhPBVNtAGuRnd5jb4w0bi9vJS4ZJ6kQ4zftDEJzlwwv9/bUwx
 QqIiBRmLKqqXXcaytTmeWYTj5YQOelenLOqrPkKCN/F8Bv9P9Aj/0IPYdNrkHngA11Ow
 XW1ngewoFSpeB8+270VllBuriwO9XEsVZH6ZSFJ4xgwE3jyNPmIfcc5pyxEtf65EWv9k
 NMEGozYDQCbEqX9y+DYEjtJWRSY1YBAbGeh1kKvy7wi6wmZmxR7VUbUi50GJpM6Ee+r0
 /DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469499; x=1705074299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZuAr3GGN/pOvffPY8+fLddBxJHGJfB6Dvfc17Jcg0E=;
 b=gHIceOBrwvswpHKHphyqKwX6RQVl2PgfsmKdib7d6ReHrorwL0bAxDJitmYEwCeTgb
 0w43I/hl6/zbBK4KIdos7K1xXjIxw+HF/uv02XUTFYrml9wbFEe8uY+KkTMJptH256y/
 aVg4fsybbTvxZjpOxiIkaEEiykPg1fEtfilCKJACe8eYyJufA0jS7N2sNkvHp+6V00VJ
 ZU2oDjf6g31YDJQ+mWRNNleVSPbROb51qcZi71NDeViLt2c8G9THggX8h1TjUbVk7keb
 fM8oujPbvnDQyXIc7bf4Bvmtz3laePyOoS4jyqesAohOsmrhr2Djg0VBZUFKsdanMcfe
 uNkg==
X-Gm-Message-State: AOJu0YylluqqacZz+ZEv7MhycmOP04WXeWWiVA3Ryu3SQdF9FRGOI+Y8
 dWCg3bNkUkS1PcFSaOz/QVi7vtxvvcBRnA==
X-Google-Smtp-Source: AGHT+IGny8+SWTY6U144UBNwNlW/E/DP/64K/J5QwVFnNt0tgleVhyFrf3a592It1vnOgIMtqfPFDQ==
X-Received: by 2002:a05:600c:510e:b0:40d:190c:160f with SMTP id
 o14-20020a05600c510e00b0040d190c160fmr885239wms.110.1704469499779; 
 Fri, 05 Jan 2024 07:44:59 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 fl13-20020a05600c0b8d00b0040d8af75e19sm1958682wmb.24.2024.01.05.07.44.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 18/71] target/rx: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:11 +0100
Message-ID: <20240105154307.21385-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
Available CPUs:
  rx62n-rx-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
Available CPUs:
  rx62n

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-19-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.h |  3 ---
 target/rx/cpu.c | 16 ----------------
 2 files changed, 19 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index e931e77e85..65f9cd2d0a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -139,11 +139,8 @@ int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
 void rx_translate_init(void);
-void rx_cpu_list(void);
 void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);
 
-#define cpu_list rx_cpu_list
-
 #include "exec/cpu-all.h"
 
 #define CPU_INTERRUPT_SOFT CPU_INTERRUPT_TGT_INT_0
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 9cc9d9d15e..c5ffeffe32 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -89,22 +89,6 @@ static void rx_cpu_reset_hold(Object *obj)
     set_flush_inputs_to_zero(1, &env->fp_status);
 }
 
-static void rx_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-
-    qemu_printf("  %s\n", object_class_get_name(oc));
-}
-
-void rx_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_RX_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, rx_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-- 
2.41.0


