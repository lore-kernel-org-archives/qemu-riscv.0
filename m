Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB5FCCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:48:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DQa-0003Jp-EH; Fri, 10 Oct 2025 09:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DQO-00033l-12
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPP-0008GK-Sd
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e430494ccso12455455e9.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103819; x=1760708619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuUb8cn58HWVtKNyssgaxuYdK0xTqPivt2V1+X+pEac=;
 b=xvmIFupFujeneJyse9PGtOHV8dZ6UxYEWcD7PS5AElySDofzoxDQLhhSQn2bf4uKRe
 kb3tsDLOQ2MRftE8UyNkyrca2hRImDi91g69/TvYXLZp8diOGhwLz/QDDJvO5fQBpzgl
 pvNmHnrqKOI32tSSkjmeLpMIk7D6lKWLqmtHPgBiEjB08uktZswHtNd4Im+JueWeVPL4
 jba8hOSg1tTn6wlr8W7SBZaCuirrpycNpQYaA7ZFOrfBRQjeYYhYnefzlv1GtX/6923G
 ozyrT/KYxH3xvkX10eoCpSQImfdh/emrpZkZi0ZPMeECR9sRpSa+m5is99HoYFTvOtlV
 wWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103819; x=1760708619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EuUb8cn58HWVtKNyssgaxuYdK0xTqPivt2V1+X+pEac=;
 b=qCZQb1bn33mKKJtfXSX591bQ+RtOfB0fNB5sLSBCJ/qj+oYTK1r2CMHK0Gh8jisFcZ
 kIhxHFKCrUemGDP5SZRXgRxZxhNmWOYFve78S5QLmnV9s2EEySYHjla03STNEOJYB9zg
 pqg8QU7mi4ZL7J/yBKlTew7llRrXGMtDofKKLx9+NOcjms5fTx573dmxZjL6SeJeFjnp
 faikKvG3hfGSJ3fvpXAlC7VZ6kcXjcPSGhszZm+08pUraoRfd/SltbfMg3y9M58TNQI6
 rKIqIrB1+Ps6vrGWCma6FwCAV8YUlBwX7mHJcuihcU3PanvPgKZVkgD7AHFz0Qx3JYqe
 6gyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvunip68hsbsoeuyv/cCvHZS7EVSC+XdifVsSH5LpfCT4hnEeitdvzvT1MLRlxxeNV946mufZnOCJh@nongnu.org
X-Gm-Message-State: AOJu0Yyuk3hL1sIgRCRdS8B9UifXAwz91izBY7ii+nKITw5od6urodEI
 eIaxMav/hMFo+F6pV2XDiY6l0DdxRnawcZjJORl8OX976uPalaEUtL0h1+Sw9nGNWJY=
X-Gm-Gg: ASbGncu7/n8zXJmVzIN1tLT0fqIQcFJ0eVHiOoKu+IH+kK6iO9x1VhR4aBnKCuClr3Q
 c3lVjCyIDREGr8z1JqW7ZJOyRrANgrfw2qlLIifvdKJVP4jQZbWRUal2gUMvTSm18yYzSDkmws7
 fDH8jNLxwjchxgDg2GG9/CrwL3n6hvNq69xSpHNCPkamzADs5QC7DJiJjyMkjiz5je2kKHq1S2s
 556lR0W+m4a5PH9M6mOYFfcQW+uXpjehOcLwj8RY7ALiTNhM/enZVWORj7zcCVMb+DpcKTXiQrN
 IPnYCKpGO1l5sSbyFF0RTORoEPedmKtQQXYAKM9bJ5xid3SBtKDnw7R7V3tPxSMeUk0SrODmCv5
 +ItGX2BM+srI7L+xixVWGSrbl2S1RvtVmKYXdpJzhKCCgOQJAUhuBCLgSuqcS52IVhxi37W3SHT
 BdhJ1cR8fqmeJhRm4BIHdCEdn5OMiiuQ==
X-Google-Smtp-Source: AGHT+IG2f+UkzzWYMAjb5o1vVGqqVrZhp9VC56WJ4cu5v9kbb+AuRk8E9AXNb8UfRlWn3J5xiLsnGw==
X-Received: by 2002:a05:600c:4586:b0:46e:45d3:82fd with SMTP id
 5b1f17b1804b1-46fa9b086e1mr91925145e9.31.1760103819195; 
 Fri, 10 Oct 2025 06:43:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb4982c10sm46420565e9.5.2025.10.10.06.43.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 13/16] target/riscv: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Date: Fri, 10 Oct 2025 15:42:22 +0200
Message-ID: <20251010134226.72221-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/vector_helper.c            | 32 ++++++++++++-------------
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++-------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 41ea2231067..2de3358ee86 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -235,26 +235,26 @@ vext_continuous_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
                         void *vd, uint32_t evl, uint32_t reg_start, void *host,
                         uint32_t esz, bool is_load)
 {
-#if HOST_BIG_ENDIAN
-    for (; reg_start < evl; reg_start++, host += esz) {
-        ldst_host(vd, reg_start, host);
-    }
-#else
-    if (esz == 1) {
-        uint32_t byte_offset = reg_start * esz;
-        uint32_t size = (evl - reg_start) * esz;
-
-        if (is_load) {
-            memcpy(vd + byte_offset, host, size);
-        } else {
-            memcpy(host, vd + byte_offset, size);
-        }
-    } else {
+    if (HOST_BIG_ENDIAN) {
         for (; reg_start < evl; reg_start++, host += esz) {
             ldst_host(vd, reg_start, host);
         }
+    } else {
+        if (esz == 1) {
+            uint32_t byte_offset = reg_start * esz;
+            uint32_t size = (evl - reg_start) * esz;
+
+            if (is_load) {
+                memcpy(vd + byte_offset, host, size);
+            } else {
+                memcpy(host, vd + byte_offset, size);
+            }
+        } else {
+            for (; reg_start < evl; reg_start++, host += esz) {
+                ldst_host(vd, reg_start, host);
+            }
+        }
     }
-#endif
 }
 
 static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f4b5460340e..2a487179f63 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3351,19 +3351,19 @@ static void load_element(TCGv_i64 dest, TCGv_ptr base,
 /* offset of the idx element with base register r */
 static uint32_t endian_ofs(DisasContext *s, int r, int idx)
 {
-#if HOST_BIG_ENDIAN
-    return vreg_ofs(s, r) + ((idx ^ (7 >> s->sew)) << s->sew);
-#else
-    return vreg_ofs(s, r) + (idx << s->sew);
-#endif
+    if (HOST_BIG_ENDIAN) {
+        return vreg_ofs(s, r) + ((idx ^ (7 >> s->sew)) << s->sew);
+    } else {
+        return vreg_ofs(s, r) + (idx << s->sew);
+    }
 }
 
 /* adjust the index according to the endian */
 static void endian_adjust(TCGv_i32 ofs, int sew)
 {
-#if HOST_BIG_ENDIAN
-    tcg_gen_xori_i32(ofs, ofs, 7 >> sew);
-#endif
+    if (HOST_BIG_ENDIAN) {
+        tcg_gen_xori_i32(ofs, ofs, 7 >> sew);
+    }
 }
 
 /* Load idx >= VLMAX ? 0 : vreg[idx] */
-- 
2.51.0


