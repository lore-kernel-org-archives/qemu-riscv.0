Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60A8C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 08:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaXwG-0001Zi-4G; Mon, 28 Aug 2023 04:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXvv-00016N-9r; Mon, 28 Aug 2023 04:49:18 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXvr-0000SK-LF; Mon, 28 Aug 2023 04:49:14 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R781e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0VqjBRnm_1693212543; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VqjBRnm_1693212543) by smtp.aliyun-inc.com;
 Mon, 28 Aug 2023 16:49:04 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 5/6] target/riscv: Add defalut value for string property
Date: Mon, 28 Aug 2023 16:45:35 +0800
Message-Id: <20230828084536.231-6-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Before this patch,
"""
qemu-system-riscv64 -device rv64-riscv-cpu,v=true,help

...
vext_spec=<str>
...

"""

After this patch,
"""
vext_spec=<str>        -  (default: "v1.0")
"""

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 hw/core/qdev-prop-internal.h | 2 ++
 hw/core/qdev-properties.c    | 7 +++++++
 include/hw/qdev-properties.h | 8 ++++++++
 target/riscv/cpu.c           | 2 +-
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index d7b77844fe..f0613b9757 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -13,6 +13,8 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
 void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp);
 
+void qdev_propinfo_set_default_value_string(ObjectProperty *op,
+                                            const Property *prop);
 void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
                                           const Property *prop);
 void qdev_propinfo_set_default_value_int(ObjectProperty *op,
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b8761b5..64f70a7292 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -96,6 +96,12 @@ static ObjectPropertyAccessor *field_prop_setter(const PropertyInfo *info)
     return info->set ? field_prop_set : NULL;
 }
 
+void qdev_propinfo_set_default_value_string(ObjectProperty *op,
+                                            const Property *prop)
+{
+    object_property_set_default_str(op, prop->defval.p);
+}
+
 void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
@@ -488,6 +494,7 @@ const PropertyInfo qdev_prop_string = {
     .release = release_string,
     .get   = get_string,
     .set   = set_string,
+    .set_default_value = qdev_propinfo_set_default_value_string,
 };
 
 /* --- on/off/auto --- */
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index e1df08876c..8e5651724a 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -22,6 +22,7 @@ struct Property {
     union {
         int64_t i;
         uint64_t u;
+        void *p;
     } defval;
     int          arrayoffset;
     const PropertyInfo *arrayinfo;
@@ -91,6 +92,11 @@ extern const PropertyInfo qdev_prop_link;
                 .set_default = true,                                       \
                 .defval.u  = (_type)_defval)
 
+#define DEFINE_PROP_STR(_name, _state, _field, _defval, _prop, _type)      \
+    DEFINE_PROP(_name, _state, _field, _prop, _type,                       \
+                .set_default = true,                                       \
+                .defval.p  = (_type)_defval)
+
 #define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
     DEFINE_PROP(_name, _state, _field, _prop, _type)
 
@@ -171,6 +177,8 @@ extern const PropertyInfo qdev_prop_link;
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size, uint64_t)
 #define DEFINE_PROP_STRING(_n, _s, _f)             \
     DEFINE_PROP(_n, _s, _f, qdev_prop_string, char*)
+#define DEFINE_PROP_STRING_DEF(_n, _s, _f, _d)             \
+    DEFINE_PROP_STR(_n, _s, _f, _d, qdev_prop_string, char*)
 #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
 #define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 38838cd2c0..edcd34e62b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1769,7 +1769,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+    DEFINE_PROP_STRING_DEF("vext_spec", RISCVCPU, cfg.vext_spec, "v1.0"),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
-- 
2.17.1


