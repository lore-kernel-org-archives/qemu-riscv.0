Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAtt-000088-NQ
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAts-00005C-1g
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtq-0005V8-5E
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id x9so658665plr.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5VzK4FfmnYHyUZyCqlp+i7B88c5pm8MmOilNV0BSO0Y=;
 b=QklJLJf2nBMImWuvTqWCq3S1nw+R2H/D7+SCjLAX2Wdd3xKsDc3KeOIhuK78NWLeZI
 wCRvvoADh/KxOlBOeuIhBRxWa+/QQHix1VWdhm9BmxYjlUcZbyacUSI/xzRUyx3SNcnC
 T5V79NHCdYKVmkGg1JTeOYoJuEouT49e6lo7XqyCpn1lGDPINPbYvwPjripr6eGPNDwC
 L3F/U5qaawDwGqfk2xJy4N3RVG0ynOm5eCOevDfCudbeqvCBNCtuCUgzJpVuJ4gbZrLY
 1ugjq7pNuePuC+TjZDkqDfBi3Lf0BQRE6uOHacvONOUJSAHw6NQHYYx69ySj294Xw9K4
 yvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5VzK4FfmnYHyUZyCqlp+i7B88c5pm8MmOilNV0BSO0Y=;
 b=uZ0yuyuO6vost1jrhBtgDO5E1lJkQtVj9iO8YnuIJQABZXbADr48tuBC1io68pC12a
 hGYW5kT+IGmQ9ewfcWhxyuqNduQbOc6QqKnJssAYkhvNG+m/nshOtMyLn20tX35NhLQB
 bxYqZbgAY96w0lxi+zZosg5BF0v4eyF7Rshh3MLTlSRapSBbdUgaAhX7OxlH2Acnh/cs
 bYih1VHWVsbmt53LXaUe8VFhMXpMgsd7qvxB47GR27wJUTb5D5Fkcv4rZwdCVQAHo9v0
 zu/lIX51uzPw7YFryDDlw1K9VKAtN1Tw94YjK6O5+gscgjEpa9nLbsj3D0dpxlARCbAA
 l5PQ==
X-Gm-Message-State: AOAM530FOtucjSvsMHIqQSlCViw3039JxDZ7ztM5TKv+8DpofaHGFIyR
 A321lXZiXMk5XbCotOJKhWb+Aw==
X-Google-Smtp-Source: ABdhPJxg/0HDfAYFILQxyLLOPKPhwzLczlhmM7Mr4Bao7uCuBTs4DtcedrTrPY6pcU/o+PSoVxVu2A==
X-Received: by 2002:a17:90b:3114:: with SMTP id
 gc20mr8471985pjb.233.1595409532898; 
 Wed, 22 Jul 2020 02:18:52 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:18:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 19/76] target/riscv: rvv-0.9: add narrower_nanbox_fpr helper
Date: Wed, 22 Jul 2020 17:15:42 +0800
Message-Id: <20200722091641.8834-20-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 09:18:56 -0000

From: Frank Chang <frank.chang@sifive.com>

For floating-point operations, the scalar can be taken from a scalar
f register. If FLEN > SEW, the value in the f registers is checked for
a valid NaN-boxed value, in which case the least-significant SEW bits
of the f register are used, else the canonical NaN value is used.

Add helper to generate the correspond NaN-boxed value or the SEW-bit
canonical NaN for floating-point operations.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h        |  2 ++
 target/riscv/vector_helper.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index acc298219d..3cbd66a887 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1150,3 +1150,5 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_3(narrower_nanbox_fpr, i64, i64, i32, env)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 83e317c500..fb689ab3f9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3207,6 +3207,38 @@ GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4, clearl)
 /*
  *** Vector Float Point Arithmetic Instructions
  */
+
+/*
+ * For SEW < FLEN,
+ * if f is not correctly NaN-boxed for SEW bits,
+ * canonical SEW-bit NaN is returned.
+ * Otherwise, original f is returned.
+ */
+static uint64_t narrower_nanbox_fpr(uint64_t f, uint32_t sew, float_status *s)
+{
+    uint64_t mask = MAKE_64BIT_MASK(sew, 64 - sew);
+    if ((f & mask) == mask) {
+        return f;
+    } else {
+        switch (sew) {
+        case 16:
+            return float16_default_nan(s);
+        case 32:
+            return float32_default_nan(s);
+        case 64:
+            return float64_default_nan(s);
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
+uint64_t HELPER(narrower_nanbox_fpr)(uint64_t f, uint32_t sew,
+                                     CPURISCVState *env)
+{
+    return narrower_nanbox_fpr(f, sew, &env->fp_status);
+}
+
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
 #define OPFVV2(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
 static void do_##NAME(void *vd, void *vs1, void *vs2, int i,   \
-- 
2.17.1


