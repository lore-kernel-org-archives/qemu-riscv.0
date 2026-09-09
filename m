Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55801C79F8C
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4DtG-0008Fa-Ou; Wed, 09 Sep 2026 04:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtF-0008FF-K1
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:45 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtD-0003Ih-VM
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:45 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2d560775ca2so39204605ad.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788943362; x=1789548162; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JmH3bJrn2KxIguqbsDJoQtnz4vzZycqSDA0K9jBnEPs=;
 b=jqwM8VKccIUmEO+aI0Mtaa2MjBY6TPzsK+HeWKmijLMY97xy8j875CTThtTBgcs4gz
 G5f6FT5ApQ0k2KDK4Z6aMfR2YGbU+xVEr7ZFLLM/6T+3w04O0hp6GcthHRngocGvSUDW
 nlO7MhpveZTJSDufMnsFizAF6JmbQh1ZaPtSoAldSKldNwTjEig38nPkFXM5dPR44CXZ
 KWQRC4IcP7oeifqM6Y2USO3aKT4NG1AFOx308v5B1XWMZUlLyJQynwyoctcjEehA5f2U
 OMyC5eMgfnZL0hWe8+9hqCSTrfqagGIbBRBTyX/wqWBx2NL2zrcu/utoFYCK+mUMfLCr
 B+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788943362; x=1789548162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JmH3bJrn2KxIguqbsDJoQtnz4vzZycqSDA0K9jBnEPs=;
 b=YCjgvKR9Kr9RGBLf/C6N4CiwEKuH7igiB3Yztft+TMIGWjSrs1bgDH+9Gqhcqoewj6
 9qHg0LofrVyR28gGB3/Ml018SBHUP9LXise2MG2mPcxgXeYwvUom3qdrqDHecV4zgzuI
 fnOb27NCb3Lf31gotnJSq0QsMRzYJ0PNEfwwV7wa4wUA9awMfZ/QJBzpg3BS3APL2XS9
 uXuBYYkiHNS5IRwzw1v0ZJOuNRnhqsDzZRevgo7YOIA2ssu374w5t3JMeuWS43BHcODe
 pD7tI2tsbw/9/VEySuxfkdvVY8Eio9kzbI18uRxJCUHYfvhQBMfisu3wwPEaSckreAMR
 VsHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHFiO2NFhHCYbBIKqED9GE+OffDkrWbS/dsZr+4uTbw5QfqI200b/etcB27sPIoF3dS6MmdRPgHTRD@nongnu.org
X-Gm-Message-State: AFuF++kyGIh7DwyGQ7b8VJ09vPuBMICivrDNx+QFj9CQFyoXYV5H6/cU
 ZXU4glzMFmuKMfSBcwNgo7YKCHJwJeroNf2OVFevGN9WvIjOJMCKjwLk286wpkjLJ2w=
X-Gm-Gg: AYBFou0VEn8WCij2f58KCWk2/zJPCWsqboJJmvLzqUN6XwwzurzJJ1HZ6I5npNpiA+Z
 8KhjTmPw696aI3DS3cOtDUYtlj22AvWYsCrY1BmgT1AzuN9MS1RmhpkXEGu+cAxjDSIo92uwjAp
 ZHiZ0uE/Fxn7vJgpcFl9zoDzk2TvhnUXqFVGleReyOsY8ODeAqNUmcdsNd5LdI2wu9bFidiX5t0
 1IZCwy5ksSKP/uNbGisCZiRf6mIRoK9tCDcVFYeVOfiWalmJO3kTe8ItnJ17xwsuOT6QDumiZt8
 yGo/wWg9Xqzc+w9QVekZ4pW3Q3OC0jToNi9I40tpu1VcZKnl4AQS3jhhIrOko2+iKWawLuL42G7
 4oF+hkckZicDhwYjBobiGse0BaDkIDycxPoXHUhPue+AKJPXnXLtZs4mSyMOiVcEOUQjQJ5w2WR
 zgfmgbodM1YJfYWdU1QklneJofhes2/lKEwsZx7UI/MbRJpYVlQ3M66T/hdGQoRsd+dxFcYAr+Q
 BnyI1eSJ9P40GUqHgABOtVd1YIAs2c63eue6VNP136Tes4MoAtwdOZUbFqfDE3PODGhcOhaZA==
X-Received: by 2002:a17:903:40c9:b0:2d6:f6ba:263d with SMTP id
 d9443c01a7336-2db124b451cmr471899745ad.7.1788943362496; 
 Wed, 09 Sep 2026 01:42:42 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2db56c2a1f1sm38328225ad.78.2026.09.09.01.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 01:42:41 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 2/6] target/riscv: rvv: Probe unit-stride accesses by the
 first element
Date: Wed,  9 Sep 2026 16:41:49 +0800
Message-ID: <20260909084154.223529-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909084154.223529-1-max.chou@sifive.com>
References: <20260909084154.223529-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Probe only the first access of the range with probe_access_full and
inspect the resulting lg_page_size: when the page is subdivided, fall
back to the per-element TLB path. Pages with uniform permissions keep
the direct host fast path.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/tcg/vector_helper.c | 45 ++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index efe10156daa..569da995482 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -406,6 +406,41 @@ static void vext_test_alignment(CPURISCVState *env, vaddr addr, uint32_t esz,
     }
 }
 
+static void *vext_probe_host_page(CPURISCVState *env, target_ulong addr,
+                                  target_ulong probe_bytes, uint32_t msize,
+                                  MMUAccessType access_type, int mmu_index,
+                                  uintptr_t ra)
+{
+#ifdef CONFIG_USER_ONLY
+    return probe_access(env, addr, probe_bytes, access_type, mmu_index, ra);
+#else
+    CPUTLBEntryFull *full;
+    void *host;
+    int flags;
+
+    flags = probe_access_full(env, addr, MIN(msize, probe_bytes),
+                              access_type, mmu_index, false, &host, &full, ra);
+    if (flags || full->lg_page_size < TARGET_PAGE_BITS) {
+        return NULL;
+    }
+
+    if (access_type == MMU_DATA_STORE) {
+        /*
+         * The permissions are uniform across the page, so probing the
+         * first access has validated the whole range. It has only
+         * marked MIN(msize, probe_bytes) bytes as dirty, though, while
+         * the caller writes probe_bytes through the returned host
+         * pointer. Probe the whole range as well, so that
+         * notdirty_write invalidates every translation block that it
+         * overlaps and the migration dirty bitmap covers all of it.
+         */
+        return probe_access(env, addr, probe_bytes, access_type,
+                            mmu_index, ra);
+    }
+    return host;
+#endif
+}
+
 static void
 vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
                     uint32_t log2_esz, uint32_t nf, uint32_t evl,
@@ -448,9 +483,9 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
     page_split = -(addr | TARGET_PAGE_MASK);
 
     /* Validate the first page is accessible. */
-    host = probe_access(env, adjust_addr(env, addr),
-                        MIN(last, last_in_page) - addr + 1,
-                        access_type, mmu_index, ra);
+    host = vext_probe_host_page(env, adjust_addr(env, addr),
+                                MIN(last, last_in_page) - addr + 1,
+                                msize, access_type, mmu_index, ra);
 
     /* Get number of complete elements in the first page. */
     elems = MIN(page_split / msize, evl - i);
@@ -490,8 +525,8 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
     /* Validate the second page is accessible. */
     assert(i < evl);
     elems = evl - i;
-    host = probe_access(env, adjust_addr(env, addr), elems * msize,
-                        access_type, mmu_index, ra);
+    host = vext_probe_host_page(env, adjust_addr(env, addr), elems * msize,
+                                msize, access_type, mmu_index, ra);
 
     if (host) {
         vext_page_ldst_us_host(vd, host, i, evl, nf, log2_esz,
-- 
2.43.0


