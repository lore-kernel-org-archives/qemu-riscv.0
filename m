Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CD8606A6BB
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aro5Af0Y
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW6Lp-0003rS-B4; Wed, 25 Nov 2026 01:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xW6Lk-0003rA-Gs
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 01:19:24 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xW6Ld-00052m-V0
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 01:19:20 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-cc751eddf25so3509216a12.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795587556; x=1796192356; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=lxP1NTfR25wlqRFvVkERExiqiUDV7C7lVRFPguJ00QI=;
 b=aro5Af0YHHzWX6cnRQv3oHV125AK1SWq8uL6sfpPPIdqAM3ueZ3Ucmi3wdRGK/b1Vu
 4i/XusG7E42iCdVAKCX1TUqEe0MNZIpCfQE3nfMtZok7Q5M8plsyzzGTyUaIrHZQ2qGX
 8Uxf+i4AMvULigl9On8S3NsJebXZfPDFsMyrlRYhdPWc8Szdk2exk0vQCbeozuhZxUCL
 +PhvJuyY/LveuvCBEfvVIaXi9oV/PXWcYNIL/jc/9YCsV4B1sKLLl/HxuWixHpRNR8lz
 435mERuDgd04XgKWOxF1uaxfqeZvJa3jackEW6jwf0dwnmnrgQUOpTIoorJZZpvkz1LO
 60wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795587556; x=1796192356;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=lxP1NTfR25wlqRFvVkERExiqiUDV7C7lVRFPguJ00QI=;
 b=J5/n4+FcPxr+6NurkQIrFSFDKp1MFSk9MnDIS7ArO7k8ErFCCdLzH2y1mUsUsnlQM/
 93s0eaO2EbHeovZdm86fVEjLk49Q5HwRVRDvfd0aheE8mSRyiPtOSCTrJCOUlssiExRd
 5YYBOtSwAcUZ0wWwBfzjniW7aEXL1IaZlW4HohKLgijDEOgrZETlAwxTd5GD9DJenZFo
 S8s+HoaT2nPXufGMNMIfKbbaiglSZmSJVg8IU4QapLoR4UKKX4fHNks7c4KjVm4iXO1W
 483bvUBwq5s1f2Yr1i1PqZV46SqI74P4hb5rmEBLYQMPPJb03R6nv21YPqY6kTq4byGB
 FA8w==
X-Forwarded-Encrypted: i=1;
 AL+hErFvbGN4IIQKNrEPpo2tPcsZw8J2wYI+/9RCM8D6GqFlkthJ1NBce5KhUWyGI4Z46F6kqP9/EGC1uXqB@nongnu.org
X-Gm-Message-State: APuU4Z8LBVlGglIqn/dgPc/zaUwuGyybP9EaN5YtmSUxV1ozCGIRfmaz
 LfAT9VVs6GQKXcT7JGGRhsvPZ1YwMLsXBClslGR46AON8NuuEkFPQzYB
X-Gm-Gg: AZFdTZf2jbUOck7oH2OcvxGGZjrQ4rL0QtLaz+zzpUmU0GIJknstOzR4uHczvDN9Z63
 iZtVmWE2fr+NsZyjjHX262AojleW36DwtY0jEyP8GISh0Lw6i1bQlgY5WB8EQjbT6Pejzd4MGMU
 gJEx64lB3Yaq/kFC2QnRL4fNJTIK1AxrZDAZMIQrZs0SCH2ciZVPkIHCXJ5yjMqB1qfhzduHzRJ
 NgM/SvEm83UM5uORs37PY5APFIRkcPEkwwF9+hbmnCeFTI5zqS8+yGiZbSZoZ3Y3LpoQke+s1pt
 oXU77Bc/Xq02iwWj4urJ2cVcWkPY3IDu98nTubCORxKqi4G8uClXSnfCUk5lzaZMympxbixkC0+
 QjmT/59bOSeYs2phrgULT/JlLINePz2PtUAW+nEVkKeFZoIyATar13S6c/izax4RuNR1cZ52KyI
 jAqKfhdrc0CLv/oDxo5VhkNc0LtdP2aQGh5z3b2SkL+7N7yHG2QRaW/0ttdbhwf4Ql10CFShmQs
 GDgBmFIb2rdmW/7Ut7G0lt/Y5QhJI9yT296TcWCRIcr+nyjKpuZKWkbR442PrRNI8bCuDROOpOu
 iswNmvkTXHAxUHhGa5XmS6oM+R/F
X-Received: by 2002:a17:90a:da87:b0:3b0:9a2e:b494 with SMTP id
 98e67ed59e1d1-3b41c95b089mr14351521a91.54.1795587556210; 
 Tue, 24 Nov 2026 22:19:16 -0800 (PST)
Received: from [127.0.1.1] ([183.6.125.102]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b405d96bd3sm29138804a91.12.2026.11.24.22.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 22:19:15 -0800 (PST)
From: WX Chen <wxchen0913@gmail.com>
Date: Wed, 25 Nov 2026 14:19:06 +0800
Subject: [PATCH v2] target/riscv: weaker memory ordering for guest FENCE
 instructions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-fix-riscv-fence-20261119-v2-1-89c8558ae091@gmail.com>
X-B4-Tracking: v=1; b=H4sIANl9BmsC/42OQQ6CMBBFr2K6dkynBdq68h6GxbQO0ETAtIZoC
 He36AVcvsz8l7eKzClyFufDKhIvMcd5KqCOBxEGmnqGeCsslFQNopLQxRekmMMCHU+B4XdAByi
 pUrU3tjFalPkjcfn9qq9tYU+ZwSeawrALpeWbM0HroC1a7mokE2ytdGVIWXZd01hpfL2rhpifc
 3p/IxfchX/0LAgIxN55whLm7KUfKd5PYR5Fu23bB8rmyGX7AAAA
X-Change-ID: 20261120-fix-riscv-fence-20261119-10a425b78673
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Tao Tang <tangtao1634@phytium.com.cn>, WX Chen <wxchen0913@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587551; l=2390;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=0SIg6f8OnpZMyq4OW2XcYT50xW3wD0CdzCOR46bjWpk=;
 b=QxAuKlAsW+h7ImWIfJq0AXAMl9CB76ySw7okdBI+P0s03zVSQ5U9cMFBjWnk7y2CUdAw18BVw
 OrA/t1PnpMVCtw/j3xcLSEAdDEfwESBq0qot9tZU6rFxzv5B7zHFqSx
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=wxchen0913@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, they are implemented as full memory barriers, which may
introduce stronger host barriers than the guest actually requires.

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
Changes in v2:
- Place the var declaration in the beginning of the function.
- Fix the commit title.
- Link to v1: https://lore.kernel.org/qemu-devel/20261120-fix-riscv-fence-20261119-v1-1-aeb9ba142598@gmail.com
---
 target/riscv/tcg/insn_trans/trans_rvi.c.inc | 36 +++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
index 4784ea1607e74eb5b0076425a732b5d3817b3482..a096da48cb95c69f56d12fd6f4f19061b74a1620 100644
--- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
@@ -968,8 +968,40 @@ static bool trans_pause(DisasContext *ctx, arg_pause *a)
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
-    /* FENCE is a full memory barrier. */
-    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    TCGBar ordering = 0;
+    /*
+     * FENCE.TSO orders all R/W pairs except W -> R.
+     * For TSO, the pred and succ should all be RW,
+     * otherwise it should be treated as normal FENCE.
+     */
+    if ((ctx->opcode & 0xf0000000) == 0x80000000 &&
+        a->pred == 3 && a->succ == 3) {
+        tcg_gen_mb(TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST | TCG_BAR_SC);
+        return true;
+    }
+
+    /* Reserved case, choose the strongest ordering.  */
+    if (ctx->opcode & 0xf0000000) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+        return true;
+    }
+
+    /* Normal FENCE. I/R for BIT 3/BIT 1, O/W for BIT 2/BIT 0 */
+    if ((a->pred & 0xa) && (a->succ & 0xa)) {
+        ordering |= TCG_MO_LD_LD;
+    }
+    if ((a->pred & 0xa) && (a->succ & 0x5)) {
+        ordering |= TCG_MO_LD_ST;
+    }
+    if ((a->pred & 0x5) && (a->succ & 0xa)) {
+        ordering |= TCG_MO_ST_LD;
+    }
+    if ((a->pred & 0x5) && (a->succ & 0x5)) {
+        ordering |= TCG_MO_ST_ST;
+    }
+    if (ordering) {
+        tcg_gen_mb(ordering | TCG_BAR_SC);
+    }
     return true;
 }
 

---
base-commit: 08ed97c33c3818ef51a7c852347a28e9f66807b5
change-id: 20261120-fix-riscv-fence-20261119-10a425b78673

Best regards,
-- 
WX Chen <wxchen0913@gmail.com>


