Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FA606A321
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbIsIGDP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQhvS-00047N-AM; Tue, 10 Nov 2026 04:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xQhvM-00046X-VU
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 04:13:54 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xQhvJ-0008K0-F6
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 04:13:52 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cc4aa0246b7so668775a12.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 01:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794302027; x=1794906827; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=9V3y/+qVTapnRGEjm99h+R27j9eW6YJO+vhAzP8xrXo=;
 b=CbIsIGDPD2ZDZWodU4a7LRZjQYU55W6QLhceODQBt69E51XnxMqdIglnLm32LbDdyB
 WTEUWRHDvQsw+hXs7kZwnhAteytq4owTy4BYbd5zEUegKUKETfrfnJG+bYq1+rQ11wsC
 VINZMGW2OPCErSDUo1ImDZsu5EP8QhmYzvtfs3R99J2mSpQkJ0Y4a7OVOJ4g9I9Te0mW
 GUaXXhClryRJAzt2tT2WaHStBf+rGhzgk07J5KD2bDRHV97z8QWX0N1qu70r5f5C78F4
 r31Zn0+2IKg29hE8OwMtYbsA8sCsmjliLuLgY0Ow+uA3QfAbGUDUgKsmmMshuUvj2FTl
 jVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794302027; x=1794906827;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=9V3y/+qVTapnRGEjm99h+R27j9eW6YJO+vhAzP8xrXo=;
 b=MG+4BHKOW3Tf25BT5Oen/0gnXIbXmN6fomCQzakVEDo0g54f6ft6+FcZjtYOsGvV+a
 KcjsAKy9Clw4GWA6aT+nGkCqkmsvFytkBfYntRbyP7rD5HYttAMDobGHGGdSPpC+vFtS
 VRexONNeWanjq//TAoKkggN8jge3gZ30R6GYq9kvAJjbKrfBF0iLVDM2vxpAc0fdo4VH
 HCOC1xQstAoAcTTu/xMf2ULHfNXhXbYNc0JBbhdWUWqG5vtoF63Nsb7btWjNE0GEsnTc
 qBe19Fo9+yUTIvn2ZQDAvZanIjrXe0O0k3ldEgt2ZCTaFFI21jwkiBf7F0EP0jaWc4ji
 aV9Q==
X-Gm-Message-State: APuU4Z8NQEKu56655BZvMI9oUlr05rKFmMW6pLpxDSPGrNjdlR0SpLgl
 GZZlGjS16XRay+qeguXMxSSrVK1QvqeAGF2xl/IaVAFbaGZLM1ljuC6q
X-Gm-Gg: AYBFou0HdYUFXmmx70eFP2R0vVaHpi/zIg2zndjBCBpaf5XDOjILgtfcBD7926M4FaE
 nAZ1m+u37JDBEqLRrhAaClyauhGQYBnig8RxcRMYIpgwiUimMLC4xVbJM1M1HC0RZk5z+VAhRfX
 Aq+RM08g8c8D85xyc5I6Dyg6qSeMC4/BKwjyLgSoz+g+Evia11IugATixq10tlPV+rC7+Q1taj8
 DUX0o6Z5qhfmf131N+BS5w4t7D/wBNPUTZF6u7OoToZhIUTb/PjrzlaxOGEWgKuvWNDYMyVoHds
 fPjBX9ve2xu8l4nx4TrzECqZFNqQBB0iLUNvFsZWE1Lg2w+sZ2Ykv8aMDKlcaEpHYcVRItGCWwE
 lzKyWws3nKRWnmicJDrPY8kp+gPPWRJZgd2JMzSUyy/G3NVHEYtIkkAED0sIsy5NjBea/RIiHFM
 9DY+p/A2J100ZoBrurdaIKe/FQnGIDuDb4EfujF6tjIAKXlimt0EV/Djl/QI8NXn4jKCIE/PHZT
 tOb4ge/JARrytnfrP9FKYzGJF2BYKt/Bca8APPfI2G3kPyQBAf7R+3eFT3W3gmHk7fKb2f4UAtX
 Py8pisHvB9EpuPoDC6AWJ0BZD3B4XT0iie6Q/tpAMp022Nvwa8qApNgSUZbPpT5qxedyzSIFDaH
 aoOfmCmM9QfxdGGacGmEx5CtmagAJyg5WVK1rWxQ=
X-Received: by 2002:a17:90b:1fc6:b0:3a4:9dd7:296f with SMTP id
 98e67ed59e1d1-3b166d03802mr2052009a91.40.1794302027321; 
 Tue, 10 Nov 2026 01:13:47 -0800 (PST)
Received: from [127.0.1.1]
 (ec2-47-130-156-151.ap-southeast-1.compute.amazonaws.com. [47.130.156.151])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdd8d7a5680sm559132a12.21.2026.11.10.01.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 01:13:46 -0800 (PST)
From: WX Chen <wxchen0913@gmail.com>
Date: Tue, 10 Nov 2026 17:13:24 +0800
Subject: [PATCH v2] target/riscv: use gen_goto_tb for vsetvli
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-research-vsetvli-direct-chain-20261104-v2-1-8e65aadfb6aa@gmail.com>
X-B4-Tracking: v=1; b=H4sIADPg8moC/5WOO27DMBBEr2Kwzgb8iNwwVe4RuOBnZS1gSwEpE
 DYM3d2UCvfp5gGDN/MUlQpTFd+npyjUuPIyd9AfJ5GmMF8IOHcWWmqnlBygUKVQ0gSt0tquDJk
 LpRV6m2d417R0Memeco6iy/4KjXw/hn7PnWOoBLGEOU27PhjrrDcYjUf0eSCDctD+S3o7WucIr
 fUhW7OrJq7rUh7H5aZ24b/fNQUKMFs0qKQMGn8ut8DXz7TcxHnbthfYutUVFwEAAA==
X-Change-ID: 20261104-research-vsetvli-direct-chain-20261104-206bc2104ddb
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, 
 Tao Tang <tangtao1634@phytium.com.cn>, WX Chen <wxchen0913@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794302019; l=3828;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=eyIRpP+QcTf8hAUDAw3Uw7jcrzWboVmleF/K2Pu/oIE=;
 b=B7T5mdvdU6IpTKVuDC4dd+yLF1hpcBHjeuNVafr0nb0p1e3Jd6cUBahZJixMGN8tkhRxF2rXn
 I1DgiSL8iSmBHMcIvf431FhMpRoimEwDVPub1Lk+hAkWyYoON3ImjUh
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=wxchen0913@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch uses gen_goto_tb() to reduce the lookup call for vsetvli.

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
Changes since v1:
The overall structure is quite the same as v1 except that v2 considers the condition that QEMU forces `VL_EQ_VLMAX = false` when `maxsz < 8`, which reduces the number of `goto_tb` slots from two to one in some cases.

For `vsetvli` with `rd != x0 && rs1 == x0`, v2 also uses a single
`goto_tb` slot because the successor TB lookup key is fixed for a given
source TB.

Both changes follow Chao Liu's suggestions.

v1 patch link: https://lore.kernel.org/qemu-devel/20261104-research-vsetvli-direct-chain-20261104-v1-1-7d5737100a27@gmail.com/
benchmark link: https://github.com/zhenbaii/qemu-riscv-bench

To run the benchmark from the benchmark repository, pass the baseline
and patched QEMU commit IDs to the vsetvli-v2 recipe:

  ./reproduce.sh BASELINE_COMMIT PATCHED_COMMIT --recipe vsetvli-v2

Baseline: a3565937b39779d4e3704298095f566e7559ad53
Review: https://lore.kernel.org/qemu-devel/20261105074115.99275-1-chao.liu@processmission.com/
---
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 30 ++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index 7e1295f33e7d4b7a2ff26cbf428f6b5d9eb682ff..17e8eb5ecaede655b58b5bdc9f10ff9284efc5b6 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -191,7 +191,8 @@ static bool require_noover(const int8_t dst, const int8_t dst_lmul,
     return !is_overlapped(dst, dst_size, src, src_size);
 }
 
-static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
+static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2,
+                      uint32_t vtype, bool vtype_is_imm)
 {
     TCGv s1, dst;
 
@@ -215,8 +216,27 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     gen_set_gpr(s, rd, dst);
     finalize_rvv_inst(s);
 
-    gen_update_pc(s, s->cur_insn_len);
-    lookup_and_goto_ptr(s);
+    if (!vtype_is_imm || (rd == 0 && rs1 == 0)) {
+        gen_update_pc(s, s->cur_insn_len);
+        lookup_and_goto_ptr(s);
+    } else {
+        uint32_t vsew = FIELD_EX32(vtype, VTYPE, VSEW);
+        int8_t lmul = sextract32(FIELD_EX32(vtype, VTYPE, VLMUL), 0, 3);
+        uint32_t vlmax = vext_get_vlmax(s->cfg_ptr->vlenb, vsew, lmul);
+
+        if (rs1 == 0 || (vlmax << vsew) < 8) {
+            gen_goto_tb(s, 0, s->cur_insn_len);
+        } else {
+            target_ulong pc_save = s->pc_save;
+            TCGLabel *not_vlmax = gen_new_label();
+
+            tcg_gen_brcondi_tl(TCG_COND_NE, dst, vlmax, not_vlmax);
+            gen_goto_tb(s, 0, s->cur_insn_len);
+            s->pc_save = pc_save;
+            gen_set_label(not_vlmax);
+            gen_goto_tb(s, 1, s->cur_insn_len);
+        }
+    }
     s->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -244,13 +264,13 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
 static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
 {
     TCGv s2 = get_gpr(s, a->rs2, EXT_ZERO);
-    return do_vsetvl(s, a->rd, a->rs1, s2);
+    return do_vsetvl(s, a->rd, a->rs1, s2, 0, false);
 }
 
 static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
 {
     TCGv s2 = tcg_constant_tl(a->zimm);
-    return do_vsetvl(s, a->rd, a->rs1, s2);
+    return do_vsetvl(s, a->rd, a->rs1, s2, a->zimm, true);
 }
 
 static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)

---
base-commit: a3565937b39779d4e3704298095f566e7559ad53
change-id: 20261104-research-vsetvli-direct-chain-20261104-206bc2104ddb

Best regards,
-- 
WX Chen <wxchen0913@gmail.com>


