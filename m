Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11312C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 19:55:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x185Y-0004Ca-Eh; Mon, 31 Aug 2026 15:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1x17EW-0001QG-OP
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 14:59:52 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1x17EU-0000Cm-Cr
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 14:59:52 -0400
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-90e8372bba7so945196d6.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1788202789; x=1788807589; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q22FbeHXDtMxaPsftwhFKOpil5kY+8aobAw9NdBwCdw=;
 b=pIGVrVxa3zbleq3QyUAc1j/cl+k1NyuK127IKZL++qUpgLBHL25DFYL8brITH0U1E2
 IesFAmhly/hhA6E2YnQPlZ8COh6Kt0d1EuMNrA0rfSOjIleZrGqDP35+/TpWuN4ATzgZ
 2co9Q6i9/fQGvVpDSs8B5KXcdmahTxWw8ZxEBrLykBS+N/s/k+OQTpMonmOvc5/1JLl8
 4QYDeuNq76GwjklxrZEku3YCuFFvbs9Z6uRg+2c9CNnmd0G01W43Wnc3gT3rBI0C0xbd
 JstwTR2ajIP95KTYQzenS4EXytIYFrc6tP6AZgDw/bwMalMZJ8Df9y9qF25/Ub2CBk1T
 nMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788202789; x=1788807589;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Q22FbeHXDtMxaPsftwhFKOpil5kY+8aobAw9NdBwCdw=;
 b=Hzhm2luTeFVHkdytQctv8otQi3PCY38q8Pj68k9cQFpkHmih1ya3onjrYBou5U9h5Z
 9KMG1FmjFr9wxJxoUYJ2wJtjayP69mJx/s2PPjvohJoqsXTwQ7yy3CKDNSZIjZD7Yccj
 4zwuFY89a+1PpEGQ6bO1gUVXLNXOD3yvj3Xeb2YT/PuYpj0Dnkz9rJBzEWUelP5w2hs1
 z4nM5Xb3DIwX6NtR8KreEGJ6ysMUbLbxqk0rrtNUC3+pT/DCKAgyP333kFHYs54EhPM9
 9LEXYImjviJDq3bmXw9XkYUvujrOjGLdSGT/YFl5USP1lJgca/3yTemquM2Ik0CM8Hwh
 nUgw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxoSqsf1fc2KBh6bJxeFtMw9O2k8LutZz4bb2RJAowroikAa4Zhs2vCUcufF17h6dS/C9uXROntz/wG@nongnu.org
X-Gm-Message-State: AFuF++n0NcnDpO1bRJ6ASvsXYxn7Lkr69Goa38co92XNEFj5yKxrqX8N
 lGhbmWRc598woYQk9SsgbeKxAR5eBQjvaDsLvpJWgsOrLfPq0z4GlTdiAxLFsKFH7YXjc6aXMW6
 3AVZw/OU=
X-Gm-Gg: AYBFou3IkegAd6E7zA1wW4E0RVTWht+sbgX8A/s+KnsEFAOZbBYZzfeCCOBHpUmiRvp
 sHYs+3sqYYVVLMh+jZNpQz2SFTfrw0/yf5aT/xQFTJWGQOCuS5zTPFJY4RbftJKUxB887D0M4/Q
 ppzl0pVy6Sr5K9wIxxl24qlCTf9fhgYQUB+rBlkBEIpUBcVqcT3USL3OLHVDmBZRPO0Qa8Oe6Id
 tHmWhjrxyPWvBnGmZ0I3eOwhxJb2M7gYpJZw1gFxP7ygsdQ3fKH+LxfbA7CzIM08kehIKOzVzG+
 19O2ijtC9Q0pbkPPG9ZmegZcmVYeew2H/0EjjOtp9xs4Xf2CA+zceJH5Lv8nhCGZduFtM5f7fr9
 2zhbTYPTu6lYClyVhhM6BbcZt/7FPb+8PQFQlsvA0Z4E6qKbweJIhrJyEW6Pk54t7QEhX/eOCIl
 2Sd9tV1wiUzSNshHgnH+ql+2MHoIONcOfrVVizPK39WfTWEW4bcvdvE21RSVxrsmv4XQkdayrM9
 aLW4+TkZqs=
X-Received: by 2002:a05:6214:4902:b0:8f3:13e4:739d with SMTP id
 6a1803df08f44-90ce0e55d6cmr399378866d6.7.1788202787128; 
 Mon, 31 Aug 2026 11:59:47 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90ce44f5695sm90952986d6.26.2026.08.31.11.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 11:59:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 31 Aug 2026 14:59:40 -0400
Subject: [PATCH 2/3] target/riscv: add helper_tlb_flush_page()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-riscv_tlb_page_flush-v1-2-4fc6af95673a@baylibre.com>
References: <20260831-riscv_tlb_page_flush-v1-0-4fc6af95673a@baylibre.com>
In-Reply-To: <20260831-riscv_tlb_page_flush-v1-0-4fc6af95673a@baylibre.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=tgamblin@baylibre.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 Aug 2026 15:54:34 -0400
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

Add a page-level counterpart to helper_tlb_flush(), and condition its
internal call to tlb_flush_page() on return value from the new
sfence_vma_allowed() function.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 target/riscv/helper.h        | 1 +
 target/riscv/tcg/op_helper.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4fc2d3a155..652f85a5c7 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -137,6 +137,7 @@ DEF_HELPER_1(ctr_clear, void, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(wrs_nto, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
+DEF_HELPER_2(tlb_flush_page, void, env, tl)
 DEF_HELPER_1(tlb_flush_all, void, env)
 DEF_HELPER_4(ctr_add_entry, void, env, tl, tl, tl)
 /* Native Debug */
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 8039df2b48..723a45d181 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -610,6 +610,13 @@ void helper_tlb_flush(CPURISCVState *env)
     }
 }
 
+void helper_tlb_flush_page(CPURISCVState *env, target_ulong addr)
+{
+    if (sfence_vma_allowed(env, GETPC())) {
+        tlb_flush_page(env_cpu(env), addr);
+    }
+}
+
 void helper_tlb_flush_all(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);

-- 
2.55.0


