Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6651AC79F8C
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:43:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4DtF-0008FD-1q; Wed, 09 Sep 2026 04:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtC-0008EO-T5
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:42 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtB-0003IK-94
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2d71d1cc8b2so42021335ad.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788943360; x=1789548160; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YonI5g7MMuvuxfLeG4auDPo0EnkSd0OHxLNejjnXnho=;
 b=fYr+1foXHyR1S5aVBqcpdxIsWJjyy/uLQEnacmjUXNZ8+SuD9utAifLmD6Fq+wtEpG
 OSHA8s+1dvAi5/QgiCLsuJwZmNDMJ8dOTzpoRRewSTcR9DtfJwgca1HZwtK3m9+1hGv2
 kSNnudwfGhJY+vR9L25v9lbPyhC3wzce4BKzjtMx4lvDCjOipgiZPSrm4klrbhqy7mIk
 8jaIHrHmHEMTblC7TZVNQe3DW7RkLns81WfmHj2qF7GKQt7TNB2eaRJrZ1jGyGLFqm+E
 rPGJA2GtCwZ9fCHD/GAxEOmSUuum96/hfeho4SSE+pnNfkDqdtE17GufV210ynG3nCME
 V7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788943360; x=1789548160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YonI5g7MMuvuxfLeG4auDPo0EnkSd0OHxLNejjnXnho=;
 b=eHZ6e8VpjIUyCi/WtPA469FLfkfdiYCRtuQWy4TY4wV0/ALYPyh98LdoHZkLXYJnp4
 xrPiXVvc7SjwuyimyItIwD291tay2zLmvL/3ZwvNrP5QH5L9vMuNdtjgDB0SYb/GuDFP
 E+EMcnEirG97opraJHptBuoMhT8JGLbjszXrnCJDBgXa17HMJOH+KCB7V/OwoezGWjS3
 UkLw3rh3Pgvmev4jRBby6JCZHv8SLVABgBbX/sfNO46P6DxCqzPs4uzeYqlv4gvrF5XO
 96LhHX9TbxKFu73l+w94kHXgKB5PuVjJAjMRrNbQ7KCuvORVfbzhNaD/p+xKm5f1r9F8
 /6lA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1yvh7LfAhl4jHOkvNm/o78CdGlJycaO39HnO8gl33/ot4X3hpGLhLEv7jXU6aoAYjFPq3YKthEho8@nongnu.org
X-Gm-Message-State: AFuF++mXmSJMh7sDKuE81zSxs+ZCSfakOxXsmARt2i20Oghg4aF50IA8
 vJkil9l2zXtV9sqb2PxidKCBLuLakJ9ZuV87u92JiaAmoPZlsJ4T2fEgnHi9lYcIKhY=
X-Gm-Gg: AYBFou3IdzqaCfwanKJdw4YimAo6uDWR0tFfA5yFzj/zp0af1170Iit0BM1d1FEDLgH
 88fUbYGevJabYONzpErX5LIOL/IHwhscht/gZrklJAsxStRoksjX1rmTWKW9HNzqf+WULVl57Gq
 boBhTSUl5tFettQA0iXFyFiqTQd4aPzagI5Yzr5lMMItB3N6jhAzVcf38D5FDpVzgbgQLbdGG+B
 u6vAkGQk5ZT7B3UoVb/zBWXvcQcpRHXk9YKlKJ+FK9+ZJ42/f2JKoVtwnf4WDQ22UCOs8pkELMr
 R5nKpWN6N9NIr6WUSJevST5Y3VtaDEAPkRLSwFa6Z6dXU9w9s3eNngGSTymo8CmFhdGw0bb+CXd
 ByuHAjvE+v+4yMLl/lGNOoWFYkUyqGzITENR4uZqTv3Q/CkQYqdQC7Fg+LCChzg6xsXJkiHQhYe
 Ck5ouzLUJ1175gaEaIE1xyN39ZAYydlDIq9eqw8lZUmA+TNPw6r7DOASNvfkwOOhjCPXxLJDqRU
 BqIjP0abND507VKi8IiRbsuF95X6dX2cO0qybtUh/Dq61g2WTK8b8QohS13WhN6QXf/zpFApA==
X-Received: by 2002:a17:903:2a8c:b0:2d6:f988:398f with SMTP id
 d9443c01a7336-2db1259d1edmr482824065ad.12.1788943359705; 
 Wed, 09 Sep 2026 01:42:39 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2db56c2a1f1sm38328225ad.78.2026.09.09.01.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 01:42:38 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 1/6] target/riscv: Match PMP entries lying inside the checked
 range
Date: Wed,  9 Sep 2026 16:41:48 +0800
Message-ID: <20260909084154.223529-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909084154.223529-1-max.chou@sifive.com>
References: <20260909084154.223529-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x635.google.com
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

pmp_hart_has_privs decides the permissions of a byte range by testing
only the two endpoint bytes against each PMP entry. An active entry
lying strictly between the endpoints matches neither byte and is
skipped, so a lower-priority entry silently grants an access that the
higher-priority entry must deny.

Replace the endpoint sampling with interval tests, mirroring the
predicate pmp_get_tlb_size already uses.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/tcg/pmp.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 41b55519a8e..94224920d8d 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -299,20 +299,6 @@ void pmp_update_rule_nums(CPURISCVState *env)
     }
 }
 
-static int pmp_is_in_range(CPURISCVState *env, int pmp_index, hwaddr addr)
-{
-    int result = 0;
-
-    if ((addr >= env->pmp_state.addr[pmp_index].sa) &&
-        (addr <= env->pmp_state.addr[pmp_index].ea)) {
-        result = 1;
-    } else {
-        result = 0;
-    }
-
-    return result;
-}
-
 /*
  * Check if the address has required RWX privs when no PMP entry is matched.
  */
@@ -387,8 +373,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
 {
     int i = 0;
     int pmp_size = 0;
-    hwaddr s = 0;
-    hwaddr e = 0;
+    hwaddr last = 0;
+    bool size_known = size != 0;
     uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
 
     /* Short cut if no rules */
@@ -414,12 +400,15 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
      * 1.10 draft priv spec states there is an implicit order
      * from low to high
      */
+    last = addr + pmp_size - 1;
+
     for (i = 0; i < pmp_regions; i++) {
-        s = pmp_is_in_range(env, i, addr);
-        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
+        hwaddr sa = env->pmp_state.addr[i].sa;
+        hwaddr ea = env->pmp_state.addr[i].ea;
+        bool contains = (sa <= addr) && (last <= ea);
+        bool overlaps = (addr <= ea) && (sa <= last);
 
-        /* partially inside */
-        if ((s + e) == 1) {
+        if (size_known && overlaps && !contains) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "pmp violation - access is partially inside\n");
             *allowed_privs = 0;
@@ -430,7 +419,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
         const uint8_t a_field =
             pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
 
-        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
+        if (contains && (PMP_AMATCH_OFF != a_field)) {
             /*
              * If the PMP entry is not off and the address is in range,
              * do the priv check
-- 
2.43.0


