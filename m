Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22810C5DF74
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 13:36:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwJyp-0006o8-Mp; Tue, 18 Aug 2026 09:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wwJyl-0006jz-U3
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 09:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wwJyk-0000dJ-Cp
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 09:35:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787060145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ehqD/PDGKvvrUvq4xzQ/yZJoPOu9bHBHzLO+Hsg0fY=;
 b=TNR8yxDgEQsjTot3+q0ZA0ei6RITzhGzz4qEQN/1hxkaG3a6QaXY4rf1y9XxUcbxBttY3j
 Xz5dVuiHtT9zDVMjstlqkrzgxG3gmTQbTlMelVcd1AXYpDkdUGCjHYlGLz4DzXZbQbPeNi
 PcmwWsXkkX9/JTzaUava2VooICF1who=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-xt9Ilbt3NDKT4UA1mPJdoQ-1; Tue,
 18 Aug 2026 09:35:40 -0400
X-MC-Unique: xt9Ilbt3NDKT4UA1mPJdoQ-1
X-Mimecast-MFC-AGG-ID: xt9Ilbt3NDKT4UA1mPJdoQ_1787060137
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7090C18009D0; Tue, 18 Aug 2026 13:35:37 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 48289423; Tue, 18 Aug 2026 13:35:29 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 18 Aug 2026 17:29:31 +0400
Subject: [PATCH v3 65/74] target/riscv: convert PropertyInfo definitions to
 use qapi_type
MIME-Version: 1.0
Message-Id: <20260818-qom-qapi-v3-65-24b8bbbe3d86@redhat.com>
References: <20260818-qom-qapi-v3-0-24b8bbbe3d86@redhat.com>
In-Reply-To: <20260818-qom-qapi-v3-0-24b8bbbe3d86@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=5376;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=hRQ8Rl96kKWFMr1wn1Vk/W1lY/vdJO3cmW0CSkOCSEI=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqhF90kub225oYjAANcsTHorcCGmVwpDzyNVK6Q
 P22rf8f6ZqJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCaoRfdAAKCRDa6OEJdZac
 5c45EACrzNMMFBxAtiO6nQBwlMegKsza/YFd46ldyqyDCquUyR9R0CFRITxc3XTDTmksyU89W52
 aICKiuqCTCdEjDEdd/iz9rviWfnTiN4AVVWtxKrSW6bk+Ntx9g9Q7vjF4yEGwJLUQHWOhzxEFkl
 E5IjScmfsLNFQhgk+Rnl6u9WqN5mQHKh8YvtltGP4t/ZjEjSCM0qjKU73MnEKLOuNcbmxgJhM35
 XWlocd+dNV9GZ1Cu1zG1YvOou8C3dC2CABnL/j8FoD2Yf2bGjWicERXlAxeVYLIcIBCUK74eR10
 fplUo1mKgdAE/QgF3LCs91wRDHRt19F0HoBEiOa6I6vme6fmLQzkg6gcpfu5+QEBQN60cU5YkAZ
 9T91NhRcfbLiH0/hagOFAHKMPTW5IgFoHunqzygX54ESj1zS160BSJP56KdZIb3SSIhEaK9GsGS
 XY+j+3+2F/VauY4NyJR9aGQyB06PaU5E7HLbM/11OCbns7yU9yojKB9yopbrOubfyzqkwbi1kt1
 ph3NkjSZX3sdk11oDDzvizFuwJPpe9g53uZ5BvBaHQWnZyfv3QBcqhDF/zewqk9Mf2/uFsfWG8g
 S93dJjov03Lww+uLcAuW4+f9bvYIrr/zCRSPxHA4dO+ABf+/JKS4Hc+VPUYiK/q2nfH5QIEcaS9
 5hXSu3DCY241BVg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: rd95hv_6OrvOrEhOajOVbyCxPa-b7qLMCpInAw6bED8_1787060137
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Mechanical conversion of all local PropertyInfo definitions in
target/riscv/cpu.c

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0c0730f08026..b54ba400fd3c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1598,7 +1598,7 @@ static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_pmu_num = {
-    .type = "uint8",
+    .qapi_type = &uint8_type_info,
     .description = "pmu-num",
     .get = prop_pmu_num_get,
     .set = prop_pmu_num_set,
@@ -1640,7 +1640,7 @@ static void prop_pmu_mask_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_pmu_mask = {
-    .type = "uint32",
+    .qapi_type = &uint32_type_info,
     .description = "pmu-mask",
     .get = prop_pmu_mask_get,
     .set = prop_pmu_mask_set,
@@ -1672,7 +1672,7 @@ static void prop_mmu_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_mmu = {
-    .type = "bool",
+    .qapi_type = &bool_type_info,
     .description = "mmu",
     .get = prop_mmu_get,
     .set = prop_mmu_set,
@@ -1705,7 +1705,7 @@ static void prop_pmp_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_pmp = {
-    .type = "bool",
+    .qapi_type = &bool_type_info,
     .description = "pmp",
     .get = prop_pmp_get,
     .set = prop_pmp_set,
@@ -1745,7 +1745,7 @@ static void prop_num_pmp_regions_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_num_pmp_regions = {
-    .type = "uint8",
+    .qapi_type = &uint8_type_info,
     .description = "num-pmp-regions",
     .get = prop_num_pmp_regions_get,
     .set = prop_num_pmp_regions_set,
@@ -1783,7 +1783,7 @@ static void prop_pmp_granularity_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_pmp_granularity = {
-    .type = "uint32",
+    .qapi_type = &uint32_type_info,
     .description = "pmp-granularity",
     .get = prop_pmp_granularity_get,
     .set = prop_pmp_granularity_set,
@@ -1859,7 +1859,7 @@ static void prop_priv_spec_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_priv_spec = {
-    .type = "str",
+    .qapi_type = &str_type_info,
     .description = "priv_spec",
     /* FIXME enum? */
     .get = prop_priv_spec_get,
@@ -1892,7 +1892,7 @@ static void prop_vext_spec_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_vext_spec = {
-    .type = "str",
+    .qapi_type = &str_type_info,
     .description = "vext_spec",
     /* FIXME enum? */
     .get = prop_vext_spec_get,
@@ -1935,7 +1935,7 @@ static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_vlen = {
-    .type = "uint16",
+    .qapi_type = &uint16_type_info,
     .description = "vlen",
     .get = prop_vlen_get,
     .set = prop_vlen_set,
@@ -1976,7 +1976,7 @@ static void prop_elen_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_elen = {
-    .type = "uint16",
+    .qapi_type = &uint16_type_info,
     .description = "elen",
     .get = prop_elen_get,
     .set = prop_elen_set,
@@ -2012,7 +2012,7 @@ static void prop_cbom_blksize_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_cbom_blksize = {
-    .type = "uint16",
+    .qapi_type = &uint16_type_info,
     .description = "cbom_blocksize",
     .get = prop_cbom_blksize_get,
     .set = prop_cbom_blksize_set,
@@ -2048,7 +2048,7 @@ static void prop_cbop_blksize_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_cbop_blksize = {
-    .type = "uint16",
+    .qapi_type = &uint16_type_info,
     .description = "cbop_blocksize",
     .get = prop_cbop_blksize_get,
     .set = prop_cbop_blksize_set,
@@ -2084,7 +2084,7 @@ static void prop_cboz_blksize_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_cboz_blksize = {
-    .type = "uint16",
+    .qapi_type = &uint16_type_info,
     .description = "cboz_blocksize",
     .get = prop_cboz_blksize_get,
     .set = prop_cboz_blksize_set,
@@ -2120,7 +2120,7 @@ static void prop_mvendorid_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_mvendorid = {
-    .type = "uint32",
+    .qapi_type = &uint32_type_info,
     .description = "mvendorid",
     .get = prop_mvendorid_get,
     .set = prop_mvendorid_set,
@@ -2156,7 +2156,7 @@ static void prop_mimpid_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_mimpid = {
-    .type = "uint64",
+    .qapi_type = &uint64_type_info,
     .description = "mimpid",
     .get = prop_mimpid_get,
     .set = prop_mimpid_set,
@@ -2213,7 +2213,7 @@ static void prop_marchid_get(Object *obj, Visitor *v, const char *name,
 }
 
 static const PropertyInfo prop_marchid = {
-    .type = "uint64",
+    .qapi_type = &uint64_type_info,
     .description = "marchid",
     .get = prop_marchid_get,
     .set = prop_marchid_set,

-- 
2.55.0.543.g5ebe2ebe4ea8


