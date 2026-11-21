Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9119606A320
	for <qemu-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yrx5fcAM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xUgy6-0006rF-5H; Sat, 21 Nov 2026 04:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xUgy1-0006qp-Fr
 for qemu-riscv@nongnu.org; Sat, 21 Nov 2026 04:01:05 -0500
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xUgxz-0004DS-9B
 for qemu-riscv@nongnu.org; Sat, 21 Nov 2026 04:01:04 -0500
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-380c28f9e35so2621229eec.1
 for <qemu-riscv@nongnu.org>; Sat, 21 Nov 2026 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795251661; x=1795856461; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=rG6UIpHbkL//NmJGfcJECAPN+i2Amqje9llivMmzrpg=;
 b=Yrx5fcAMqn+f3xiNEPzg0qgHAClKe/XLjxahDd8ZFTw2iYgECZntIMbck86Jd4YPzp
 HuyIibVdMQA9qXiEi68jZ9ZMWbV9DC8iLUH+4w4P2xiHAOPuMJWtUmqnrMkwv+6lQFrJ
 nafi5IwcD5mhajZqcMGtH8Dr/XhkpAgMZklwHwZ0LpzWaByWpE84dcPBrwllcKt/Rj2o
 CWtcMG8A5TtyFD/strk6ktDKG4PPqzGFqWzHAa8Mp/BUazBFKNpN8R6Pj35T6OkRP+uF
 jPZTH5MjZe4j4xGKYKDwL8X3mG6ZFmcS1UauoLUqLwHasy0NozOm380uQ8iLMb7L3x8S
 KIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795251662; x=1795856462;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=rG6UIpHbkL//NmJGfcJECAPN+i2Amqje9llivMmzrpg=;
 b=kNby235HZ5XfdefRLjm1junDzkBMIhOA6Sj43fPTjQFv5vaq0hQ3jc5iBzkcRtJfyK
 k8pA0HhiIFEqmx6ffzoKcFsx28I4xmWBJixHFNAXLbrUHUW14IwMrHuLxeWlP1ArGXNo
 WlVyifnR4KxbQYKp4/8wSZ85ODNynhmVZXQZEM3pgwHtIYrlnisjHU8xgBFHMwYPGw2O
 s43Ulk8JRmbadTx8stgH9qku6ut+FH3uD7JUKE3k/E5ARIjy35iYNoZnX+7sIKXgRnY6
 YlcuS3ujWWi27l867OoWHTU1OSeleeTDx7iwavOk7daAwP0te1otRX+jILpqi8PCPYLD
 AbUg==
X-Forwarded-Encrypted: i=1;
 AL+hErFXTlOIPEl9gWoSha6JUei5/FNJ4o6KKrrzMEeLcq+3BN3oZeMxM1ZQpRKMWRM/YUKhn4vFZViUqhsL@nongnu.org
X-Gm-Message-State: APuU4Z8G22tvG5PBYQzrKiPgsCB59v/1M8Ux8RUnoqdh7W6C9RhKVxaN
 SPkeI2C2znCADpPch9waTyEsIYG7ezpHdLmF3rRDIVaZeYnY89wKuJIT
X-Gm-Gg: AZFdTZfDCP326D6BeP4ioxEUeHuhMM25ZbPzpA/7KNMXrelnTqFIUT9a7Nhd/nSZYJo
 wmDlivGbW5xtAnG6HrWbASfz8EI7HKtekgk6+4m0t5FOuwtt24wl19UDVaOwhCoc5PbmvAT0e47
 szG28DlLKjC3xlhfe4LVRmB3PLct+2eZ1ZerXMTpvufxW1fzG/kaVYb4nejQnNn5n6AaI9vxU+D
 3b2UP+WnS5w153h7npSCE35sCIe78tSmMXbGiNUNv16J9F58f4E3WTtR1k5xWc+k9KN6Cy+8JrB
 AdQEippzOrhc/Ld3LdUO7rP6mYP6/JRYo2DzHfmKzErcXPIBheKz0FM9afPRSQsG6Rn4Zu0ts5E
 mlYJ1VSBBzPqTj7WPhdTKglIR6jZQBFMyGatIq+QBdUb1NAvwf7LCAVZZlavVMp9STOq6H9j4YH
 j5m105yMwtVA4IKintizpMEsMJrGwWIfsgCR/Fx3igkDL2YlVeq3gQpJuNOeXB/baAE/Hm/gb07
 iCidRKka9QYp/ls7RjpA3SP3ucLyM0wHjxjPDSa/1OzX3MU/clIt3YHaxyrBSoESi/6bwRez1kx
 O+b9RL0KasnbtvttuhKwc9j+IpUsAD3Lg9g6nEEoB9SC+Dqp//6ihw2WqpfrmglCsNuKm6WdYpG
 Jdi5dW3Skucg=
X-Received: by 2002:a05:701b:2603:b0:1b2:5ecf:9bd1 with SMTP id
 a92af1059eb24-1b55249484cmr6566615c88.7.1795251661299; 
 Sat, 21 Nov 2026 01:01:01 -0800 (PST)
Received: from [127.0.1.1]
 (ec2-18-140-66-51.ap-southeast-1.compute.amazonaws.com. [18.140.66.51])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b562a82b3fsm7397514c88.5.2026.11.21.01.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 01:01:00 -0800 (PST)
From: WX Chen <wxchen0913@gmail.com>
Date: Sat, 21 Nov 2026 17:00:48 +0800
Subject: [PATCH] target/riscv: add memory ordering required by RVTSO in
 ldst_stride_trans
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-fix-rvtso-vector-stride-v1-1-1c451042b0b5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL9dAWsC/x3MywrDIBCF4VcJs+6Ao/WSvkrowujYuEnKGEIh5
 N1ru/zgnP+ExlK5wWM4QfiorW5rB90GSEtcX4w1d4NW2hFpwlI/KMfeNjw47Ztg26VmRjOW7Io
 ytpCH/n4L9+m/PD2759gYZ4lrWn49FTiPPhmTTKDAxVL0KVht7j7qwGNxLig/W7iuL4iX51WkA
 AAA
X-Change-ID: 20261121-fix-rvtso-vector-stride-39fd6f035f17
To: qemu-devel@nongnu.org
Cc: Tao Tang <tangtao1634@phytium.com.cn>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 WX Chen <wxchen0913@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795251652; l=2866;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=s6qZvzhx6DyW00xi8ctwLQr3Vh7dJFsEyTG7tU2lmTQ=;
 b=4a65fKidnQ9PeZVDl5TF4Y06zVKhMOWQIj2B4iGc1okKqNZYo/h0dwxEVtjtXNxT2wR2o/OQv
 svmZfbxfi+2Avh6rszuw2VfUMXFW2ItkI34OM3VOICkAWr5SIWXV74V
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::132e;
 envelope-from=wxchen0913@gmail.com; helo=mail-dy1-x132e.google.com
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

RISCV ztso extension provide default memory ordering of:
    R -> R,  R -> W,  W -> W,  without W -> R,
but the current ldst_stride_trans hasn't any ordering listed above. This may
not satisfy the guest requirement on some weak memory ordering hosts.
This patch add the above ordering in ldst_stride_trans, who is in charge of
the following instructions:
vlse8.v, vlse16.v, vlse32.v, vlse64.v
vsse8.v, vsse16.v, vsse32.v, vsse64.v

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index 7e1295f33e7d4b7a2ff26cbf428f6b5d9eb682ff..de6c8ba2a397b12cf0fecbe88936a4798a49bff4 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -880,7 +880,7 @@ typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv_ptr, TCGv,
 
 static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
                               uint32_t data, gen_helper_ldst_stride *fn,
-                              DisasContext *s)
+                              DisasContext *s, bool is_store)
 {
     TCGv_ptr dest, mask;
     TCGv base, stride;
@@ -896,10 +896,18 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
 
+    if (is_store && s->ztso) {
+        tcg_gen_mb(TCG_MO_LD_ST | TCG_MO_ST_ST | TCG_BAR_STRL);
+    }
+
     mark_vs_dirty(s);
 
     fn(dest, mask, base, stride, tcg_env, desc);
 
+    if (!is_store && s->ztso) {
+        tcg_gen_mb(TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_BAR_LDAQ);
+    }
+
     finalize_rvv_inst(s);
     return true;
 }
@@ -924,7 +932,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
     data = FIELD_DP32(data, VDATA, VMA, s->vma);
-    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
 static bool ld_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
@@ -958,7 +966,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
         return false;
     }
 
-    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
 
 static bool st_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)

---
base-commit: 08ed97c33c3818ef51a7c852347a28e9f66807b5
change-id: 20261121-fix-rvtso-vector-stride-39fd6f035f17

Best regards,
-- 
WX Chen <wxchen0913@gmail.com>


