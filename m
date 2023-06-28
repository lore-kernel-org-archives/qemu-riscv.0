Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EE7EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 21:31:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEckp-0001xd-QR; Wed, 28 Jun 2023 17:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEcko-0001x3-JX
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:31:10 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEckm-000801-Pv
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:31:10 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-55e1ae72dceso277962eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 14:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687987868; x=1690579868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1eTvgMGg3jF3u/rJC15BxuzUUJnPnDKiLCiWb8Yj5U=;
 b=mkNl8OdlHivpYliNBB72Z6ccUin+GX+BSWYmIgjGW+EKU9IVtqVsM54kom15/9DAkl
 E45gPaLsBK4eQC5E3B/KuhQuyU7nNpRRMtF8Cq1XzOtSofBIcRGGdFakqstUr+5jBKMC
 4DPjOCo9F5184VvlOYCLpIqTlg7sMYl7pMt2GdBQ4VRn+2RBh6QJv3LtQ6cG/NF5fVFu
 3lnbQH2Q7qc7Fk0re/buvmKeEHlds9BMhh/7ZYhFSgp2K0PXRDD96ygiboUIevyqKStd
 0iqnaFLuzeqoLLRmipXjxjlr4uS0MaBREAWmhok9JUZxlpKHOaKBjAArMkDgQUDhS/yu
 /N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987868; x=1690579868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S1eTvgMGg3jF3u/rJC15BxuzUUJnPnDKiLCiWb8Yj5U=;
 b=mHHYXkpcST8ltFqtv4/Alw3Z3mDqGMcdu8fW5jFW7ZhrijqT0lgrcGptRXZC2u/CzG
 /m/KfUnoC8mJp/rtq03mntXcTbupXfPXkFiudVsD4q/hlUqug1oymfU85VTRCynds2i/
 UknWUAp3rDYjeZQu8BGCQAqLZf3yS79sPtsvYXVwv3ZQfqWRNI7/7coO0iSZ6EcUtEM3
 fNUcDjqJxfuXsWNhd0Z2gbVnPorCnWUSN8C7u1/bzxikW6x5xS9BwvBo4sSNh6MFpo1D
 eiAOGlkaD4X6ekxye/52jVnzKVdj+VGL25fjW+CqUVixDWb5j0z42Znz+BCNj4NrectA
 JkOA==
X-Gm-Message-State: AC+VfDy4Ld4XDvQgx0RGf8oOBKO5N6I2nAVYls/s9vgRU0d8SmSOldji
 XFZ89Qnpo9+oZTnAlWYGGl7fgQ==
X-Google-Smtp-Source: ACHHUZ4qBMupj+0E1y4uosc5NsHnDbcI+tdc5rpsAB84SIgz6fkE643FtPcBlBzzr+0//LY1O7cT8w==
X-Received: by 2002:a4a:d548:0:b0:565:bf28:ee72 with SMTP id
 q8-20020a4ad548000000b00565bf28ee72mr23466oos.0.1687987867769; 
 Wed, 28 Jun 2023 14:31:07 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a4a4511000000b0056084a91c74sm832892ooa.24.2023.06.28.14.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:31:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 04/20] target/riscv/cpu.c: restrict 'mimpid' value
Date: Wed, 28 Jun 2023 18:30:17 -0300
Message-ID: <20230628213033.170315-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628213033.170315-1-dbarboza@ventanamicro.com>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc35.google.com
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

Following the same logic used with 'mvendorid' let's also restrict
'mimpid' for named CPUs. Generic CPUs keep setting the value freely.

Note that we're getting rid of the default RISCV_CPU_MARCHID value. The
reason is that this is not a good default since it's dynamic, changing
with with every QEMU version, regardless of whether the actual
implementation of the CPU changed from one QEMU version to the other.
Named CPU should set it to a meaningful value instead and generic CPUs
can set whatever they want.

This is the error thrown for an invalid 'mimpid' value for the veyron-v1
CPU:

$ ./qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mimpid=2
qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mimpid=2:
    Unable to change veyron-v1-riscv-cpu mimpid (0x111)

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 652988db25..7ca7b7bbfa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -43,7 +43,6 @@
 #define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
                              (QEMU_VERSION_MINOR << 8)  | \
                              (QEMU_VERSION_MICRO))
-#define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
 
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
@@ -1731,7 +1730,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
-    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
@@ -1850,6 +1848,35 @@ static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
+static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint64_t prev_val = cpu->cfg.mimpid;
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s mimpid (0x%lx)",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    cpu->cfg.mimpid = value;
+}
+
+static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.mimpid;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -1884,6 +1911,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
                               cpu_set_mvendorid, NULL, NULL);
 
+    object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
+                              cpu_set_mimpid, NULL, NULL);
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.41.0


