Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8A8EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 21:33:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEcky-00022c-0I; Wed, 28 Jun 2023 17:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEckv-0001zP-OK
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:31:17 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEckt-00080v-Uf
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:31:17 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1b0627731d1so3320fac.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687987873; x=1690579873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZlIE49tLgOms+uYtj+M65YqhfVaj0XXVgLyqEoZz2D4=;
 b=nnWc9osuqDgPe/0dlRuJv2hPYbkz13WNpjdEZZGrwKYkRAN8PVaAVnvUSEbtAlqrd9
 TDCIl9I3ocIRpUAAmKN6OdFFaH7fIGcOOSzlxEfqo8dIJUPGyDNEhyFUg6UQk3GFD+L4
 C293MPcZbIZvuYxAk1Iqr5wWN5sfKHlSP3MW/xEpuVDmSXtTZXzdXV2z/4j90bIHyOxM
 Jl99GQVksJjnbas7h8SiYvpwJOHViVedpLiT/IbhblOmlWNSz/wVjfLPFA6sITdqO1Wi
 +62AvQCE8fyjdwfhokE02/suJKxYclUEGOzjgHCXp90tY11owrf+gua8SyYY5eig/vpE
 DxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987873; x=1690579873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZlIE49tLgOms+uYtj+M65YqhfVaj0XXVgLyqEoZz2D4=;
 b=WjlDYIicKThu5IpQVmVxcIKy+tcjJxx2rYUZFdBhJAFvbOL41+T3lxU1WFjif3Y2tT
 xbRDl7dMnuW3llTAphLhHTCTqeExYmHmaK9XXAkn2Mk1M6q+hH9+psS9d04A8T3CMXMd
 X5eYKDSMJOZICw0CygZ7sNGRVETLzx+56gUAM/gxWD/w3p9GmjliB/9NRTnqt+F3L9KM
 WY5ajDs+bgyvhvAcEvmOvPTIBEN+G0u9s1Dl3AkFz1UbOP9ur/COEBD43WenpsLz5L4P
 ufmyKNBNHmtV+tE4BthfZCkChQco+KS8k3YDeOuuAkxGl2LlKZtmNygESuAaZ6UlBzSR
 pIew==
X-Gm-Message-State: AC+VfDxIpHOfy4BDXxRfK937xmlrDg/YJMJvk7vurw6QhVkJpc5t/Apz
 ON6w0z7jUGX5KsrwbbunrbjtGA==
X-Google-Smtp-Source: ACHHUZ556Zs4xIkmu04zTMnJjkgRIIIGC28vfV7e+B4UpRGiJZ95NFNxlcusJwwuW1xgW43QZMDreg==
X-Received: by 2002:a05:6870:a415:b0:1b0:2b1b:197 with SMTP id
 m21-20020a056870a41500b001b02b1b0197mr11042559oal.47.1687987873511; 
 Wed, 28 Jun 2023 14:31:13 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a4a4511000000b0056084a91c74sm832892ooa.24.2023.06.28.14.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:31:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 05/20] target/riscv/cpu.c: restrict 'marchid' value
Date: Wed, 28 Jun 2023 18:30:18 -0300
Message-ID: <20230628213033.170315-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628213033.170315-1-dbarboza@ventanamicro.com>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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

'marchid' shouldn't be set to a different value as previously set for
named CPUs.

For all other CPUs it shouldn't be freely set either - the spec requires
that 'marchid' can't have the MSB (most significant bit) set and every
other bit set to zero, i.e. 0x80000000 is an invalid 'marchid' value for
32 bit CPUs.

As with 'mimpid', setting a default value based on the current QEMU
version is not a good idea because it implies that the CPU
implementation changes from one QEMU version to the other. Named CPUs
should set 'marchid' to a meaningful value instead, and generic CPUs can
set to any valid value.

For the 'veyron-v1' CPU this is the error thrown if 'marchid' is set to
a different val:

$ ./build/qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,marchid=0x80000000
qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.marchid=0x80000000:
    Unable to change veyron-v1-riscv-cpu marchid (0x8000000000010000)

And, for generics CPUs, this is the error when trying to set to an
invalid val:

$ ./build/qemu-system-riscv64 -M virt -nographic -cpu rv64,marchid=0x8000000000000000
qemu-system-riscv64: can't apply global rv64-riscv-cpu.marchid=0x8000000000000000:
    Unable to set marchid with MSB (64) bit set and the remaining bits zero

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7ca7b7bbfa..51f055b8be 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -39,11 +39,6 @@
 #include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
-
-#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
-                             (QEMU_VERSION_MINOR << 8)  | \
-                             (QEMU_VERSION_MICRO))
-
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
@@ -1729,8 +1724,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
-    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
-
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
@@ -1877,6 +1870,56 @@ static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
+static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint64_t prev_val = cpu->cfg.marchid;
+    uint64_t value, invalid_val;
+    uint32_t mxlen = 0;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s marchid (0x%lx)",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    switch (riscv_cpu_mxl(&cpu->env)) {
+    case MXL_RV32:
+        mxlen = 32;
+        break;
+    case MXL_RV64:
+    case MXL_RV128:
+        mxlen = 64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    invalid_val = 1LL << (mxlen - 1);
+
+    if (value == invalid_val) {
+        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
+                         "and the remaining bits zero", mxlen);
+        return;
+    }
+
+    cpu->cfg.marchid = value;
+}
+
+static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.marchid;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -1914,6 +1957,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
                               cpu_set_mimpid, NULL, NULL);
 
+    object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
+                              cpu_set_marchid, NULL, NULL);
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.41.0


