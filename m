Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A0BC5DF66
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 15:07:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvyvq-000493-T6; Mon, 17 Aug 2026 11:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wvyvo-00048J-Rd
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 11:07:20 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wvyvm-0007JJ-RA
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 11:07:20 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8487b7b3fc8so3790696b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786979237; x=1787584037; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fCaHWbms7VaX0C/pMvmFI1FBXC/InNuvtdmBCbbe3tQ=;
 b=N+hjZ7hK5mKp0guDTB8wpks/yFH2rwZyEur0hw4mjTJYrUy8VVAssA++CuLyUEElNk
 vvV8qHhTTquvHiG9mCe/IyCQmDvcn85qQMbUBcEZVaOfoLudHCzgx135dtJPHyC7Ql7X
 JfF4La1QDwAmf3FnUVtrreI6VhS6JpxhGbsPybCALyTyUoUUlYdF0SObweNc4tOlVigu
 njVtWKBUD7eYDxCHUYL32ZZM3MVj9oQFtgfoC81oskIhINRApx/A3lWP60XIeHoCU95r
 sP835RqMxAvUhDRji9fY0MJ61gpwBt4sq3q9/BP+bUpERqJb6gzAkHcVx1Egs16R5HJ5
 baYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786979237; x=1787584037;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fCaHWbms7VaX0C/pMvmFI1FBXC/InNuvtdmBCbbe3tQ=;
 b=KwmGNCvGp9vNto9cDrRVZgnnhH+w3LM3KiMGh1hQFvxBdi4mFIEX4U9pdS7c5pd2nZ
 iusI/Ykfnq4OLWc/KRrZ5qMhGcq0/E1SZPIeO/Io91WtcQXAmf5dWRDCWQpHJm2LsgwF
 XHrIq9amEZmN6HofjJNNbkHZvjqHSINJXoUPfO/mlrHKQuHDiVq63hjiyZyoLNoXGUH5
 WWY9sCvJZtAuamBkPSXN6gTjMJ5z2B9FWkJ2dmDPvQgbj6rEqGdDxlGLdQ1F68sUhtzi
 kGBlE+xuVBlY/yOGkwVUSyh+5hmKl3WB8V/gn+2E9Hw10bLlLcCzpCbPW/WeX+isxonX
 v+cg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrDpksj2hY2GzAKGW4R5slm138U6k5DsjxAIu5Q004P57YmpOElPJqbpuXrA6oglKG8ExFL49ifHt/@nongnu.org
X-Gm-Message-State: AOJu0YxXs4FNg2Yqrzxks+h7Aec9+smBB++GOH8PS/8HwOr2HheXjYnp
 nz6q39K5v4Z+T1Mv4N4X18Us8HUBB2sIY9i4PmynuFhovUD1pPhP13bq
X-Gm-Gg: AR+sD10KTxeL4KEBe0xsJKnJHbDMrx5vzKOtZ6Hhb05pEhtEDOW5RUPfqTKIWKYMB8T
 k4QBTYhG5mKgiB6BpbiDnBzJ6Qowb+lEIAPEW/XEyNlQJObrU77B4QxZcrCzXg6dRUM88mXCEMv
 s6wWCTtL9SPkCDMJ3XMOkxDV0NmLS62c8WbyvXXDkhH8J1+BYrFOSB1yoizEPhlv55cQebQQz1W
 SPj7MO9V0eJIDF52ywBHuvFG6m+eyxfHCbIJAJzJ+tKil3TvK2e7vgVAks+6vKRjYmQRb1hoImB
 bojvV4MWRY1NbNPqjlQhyaKMXuuQnzvtNANiXR22stwRnE/mze4IxUJTcxUwP435Gvx//VyUUOa
 9DZ4ZN/jn/FUgOc+ZrF6BDTRgjaGDX3O6Uuq0YFOPGWaNyzcmGgclot83sleHvBb4izty1By2UT
 5bmOKnZZbANIXe4J7wFh7pvnQdDKg7hR3aD9Vr23rMNic=
X-Received: by 2002:a05:6a00:14cd:b0:848:5ed6:9d27 with SMTP id
 d2e1a72fcca58-851b892181emr1195013b3a.36.1786979236990; 
 Mon, 17 Aug 2026 08:07:16 -0700 (PDT)
Received: from X1 ([178.66.48.90]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc13bf05584sm900775a12.4.2026.08.17.08.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 08:07:16 -0700 (PDT)
From: Vladimir Isaev <vvisaev@gmail.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org, joel@jms.id.au,
 npiggin@gmail.com, Vladimir Isaev <vvisaev@gmail.com>
Subject: [PATCH v2 1/2] riscv: csr: do not drop C bit on misa write
Date: Mon, 17 Aug 2026 18:06:37 +0300
Message-ID: <20260817150653.40357-2-vvisaev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817150653.40357-1-vvisaev@gmail.com>
References: <20260817150653.40357-1-vvisaev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=vvisaev@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

According to spec:
> Writing misa may increase IALIGN, e.g., by disabling the "C" extension.
> If an instruction that would write misa increases IALIGN, and the
> subsequent instruction’s address is not IALIGN-bit aligned, the
> write to misa is suppressed, leaving misa unchanged.

So attempt to disable C extension if next instruction is not aligned should not
change the misa.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Vladimir Isaev <vvisaev@gmail.com>
---
 target/riscv/tcg/csr.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 36f2004bc5..dbfb3381ef 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2182,9 +2182,13 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* Suppress 'C' if next instruction is not aligned. */
-    if ((val & RVC) && (get_next_pc(env, ra) & 3) != 0) {
-        val &= ~RVC;
+    /* drop write if RVC is cleared and next instruction is not aligned */
+    if ((env->misa_ext & RVC) && !(val & RVC) &&
+         (get_next_pc(env, ra) & 3) != 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Unable to write MISA ext value "
+                      "0x%x, MISA.C disable failed\n", env->misa_ext);
+
+        return RISCV_EXCP_NONE;
     }
 
     /* Disable RVG if any of its dependencies are disabled */
-- 
2.55.0


