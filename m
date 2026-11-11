Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C53B606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=huTpWSS4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR8aG-0004Ir-FB; Wed, 11 Nov 2026 08:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xR8aB-0004C9-52
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 08:41:48 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xR8a7-0004JW-Sc
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 08:41:45 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8b6a88e4341so1507334b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794404502; x=1795009302; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ZZrY5+RHrM0itU3qBgA9YMlVM+EgYGD8q/3ILNRM880=;
 b=huTpWSS4AFgGiGqteAEg/jFhRFTiY+N8WEyW17TccSvDZPvncYRmXjYHTFAf8Aa1X4
 beCLDy+lyX1ao1tfmtOd7o6DoabnSkFjqS4N9bBhHwLIPiz0NzWMz3jREsThZhCMjK3i
 JKyHbcPciCN9svtT2TLK1e1N4z0rR4uaCCCoYVHm8C7O6WLljlUzDpu8lJ9HTZ9S+oDY
 AM9CypSxFKPWLNG7fpo96c6hCGBBSZvY8RDa6Qv4TCKip86bCdA2yh/bcC2kU/uRI4hO
 EM+ahD8j/kHNVe3iKAd4iJa7neqdrLP9Czpct1MNxhfJ8IiuKD5yRj9vJhrTD5J0YPB8
 /LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794404502; x=1795009302;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=ZZrY5+RHrM0itU3qBgA9YMlVM+EgYGD8q/3ILNRM880=;
 b=WL/KbN2+gYV2xK8zXbT4IrTBpdAlBQ76d0oysnWVAl8e2eZiy/EF4AMS2P5C195vo2
 QQiNmpyMXsRMqOL5kM6nEi1eNpf7VqeYCIDB5DWGD6JqjuHMkFO3FwpRN0daDVr/jY5L
 TkRP/8BjrbgmqUeMCWq2O2KzVws7x47UZ6V0x3GUS/mQFpw3K6fVJCypsBJObl7NTT2s
 7eaan6pUg93E7cf8TpGCmjykT8Eu3tGe9rJb2VsACbxe3Mo5IsY205I2TUfCGWwC2qT5
 2X+TcPr6xJdna/ttukuCURkPLgsMM1yc1NWXueKEV271D1oOS1eOs7HNcweqMY1A7raf
 9sOw==
X-Gm-Message-State: APuU4Z924+LsUxrojSKkIf9nnPNLJvafKnwBmJIyA74e5Npg9fd8WNdY
 MmLo92Vmll5Z9OvGaUpcOjABlnBw/KzRm2XyDULll1tp3zv+TvJhL+kN
X-Gm-Gg: AYBFou2lC9jFdtlz+k1yl/Vx+T5fkQuSI9SfoCjb1anWc+wCNibAac7CyTWUUfQqY1q
 S1pIRCeHUCRMRxeDPCcXLK9a79fnlqSWr2J6RgJy8M9uEHi3cyKECfPyaKk4oYi53OQLKUrafvb
 +tAxD77V2y2lKdZJAcYIYpZ5nhufhueGanZrndWmY4RXYwsZJ6Rg50IRqKxf0rgEb+rTR09qAZ2
 h6RESiFgkPpwi21bbguFqeup0o41wKaerPgFTE1Ibbvbar8EswwdKLZcZ3u1PdiOwwcl1sKuVw6
 QZRAXsKbaBxfbgnE16J+LNdjlUoj2Gu5Ksna0uCc87PR2J3J1CQL3PVJwKktIB19ry+xQf8Nafw
 7zNJRu0myW0yxtyFaHh1OdysFOHqWASRcTrq/i1+PnhfU69QvZ6s/AOTkrL+ooy+oAYQH+Pg78s
 t62RTIl8vivxGaD/MELB1OAE5YGU3H/ZGySeGvJKcc7msZ6OHZrZePzq7rLVfeEpblTugR4jq/l
 1I4r41fVax53tr0mPgoGvCHZHM3ycTV83RBVt+5Rk19VGA7NKUPUpzO44MVGuCaDsJozAgy+NLx
 akpw0we1c/GF3pZrw3eJFbaBpqvLUiFCpDzFYRVPDNiu3XrKTWmI
X-Received: by 2002:a05:6a21:496:b0:3eb:b9e1:4341 with SMTP id
 adf61e73a8af0-3f2ff0d9c75mr2682288637.67.1794404501746; 
 Wed, 11 Nov 2026 05:41:41 -0800 (PST)
Received: from [127.0.1.1] ([2406:da18:11d0:5f00:6236:3be9:c36a:9e83])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdd8d7cf07dsm1739783a12.28.2026.11.11.05.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 05:41:40 -0800 (PST)
From: WX Chen <wxchen0913@gmail.com>
Date: Wed, 11 Nov 2026 21:40:24 +0800
Subject: [PATCH v3] target/riscv: use gen_goto_tb for vsetvli
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261111-research-vsetvli-direct-chain-20261104-v3-1-8d3a18474a68@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEdw9GoC/5XOTWrDMBAF4KsErTtFP5YUddV7lCxG0jgeSOwgG
 dEQfPfKWZQs2908eHzzHqJSYari4/AQhRpXXuYezNtBpAnnMwHnnoWW2iklByhUCUuaoFVa24U
 hc6G0Qm/zDL81LV1Mul85R9GxW6GRv5+Pvk49R6wEseCcpp1HY50NxkcTvA95IOPloMNRBjta5
 8hbGzBbs1MT13Up9+fkpnbw3+uaAgU+W2+8khK1/zxfkS/vabmKfV3TL6ySf2Z1Z4/kLGIeo0N
 8Zbdt+wFMnU13bgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794404493; l=5862;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=6JXTG6A8tOoUmdfo8B0bW4RYa0hywZ8rBhZHwWCzwpo=;
 b=ceP0XqWJOoUbd7nQSQIhdZUaoS7aBiGMT9cirdqSZ6yJ8CJqnVDU/rHP18wRMJKHf3RPuq114
 wGoNqP2SFinClRWxfH7zvkjje2DSy6NQR30tOxXR1nV+aoLQr2qeUFl
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=wxchen0913@gmail.com; helo=mail-pf1-x431.google.com
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch uses gen_goto_tb() to reduce the overhead of the
unconditional lookup_and_goto_ptr() exit currently generated
for vsetvli.

When translating vsetvli, the immediate vtype provides information
that can be used to optimize the exit generated by do_vsetvl().

For the vsetvli forms optimized by this patch, the immediate vtype and
existing state update flow determine the other relevant translation state.
Only VL_EQ_VLMAX can vary with AVL. This patch therefore uses separate
jump slots depending on whether the returned VL equals VLMAX,
enabling direct TB linking after vsetvli.

The register-vtype vsetvl instruction retains the existing lookup
path, as its vtype is not known at translation time.

The package benchmarks measure build time with the RISC-V cc1 compiler running under QEMU,
while the dedicated workload repeatedly executes two vsetvli instructions,
alternating between VL = VLMAX and VL < VLMAX.

benchmark result:
Dedicated workload:
| Workload | QEMU | Runs | Median (s) | Min–max (s) | Wall change (s) | Wall change | Wall / baseline |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| vsetvli-chain | baseline | 5 | 2.154520 | 2.145543–2.173475 | 0.000000 | 0.00% | 1.000x |
| vsetvli-chain | candidate | 5 | 0.492811 | 0.489481–0.499191 | -1.661710 | -77.13% | 0.229x |

Perf of dedicated workload:
| Workload | QEMU | Event | Samples | Symbol | Symbol samples | Overhead |
| --- | --- | --- | ---: | --- | ---: | ---: |
| vsetvli-chain | baseline | cycles:u | 2151 | `helper_lookup_tb_ptr` | 2007 | 93.58%|
| vsetvli-chain | candidate | cycles:u | 482 | `helper_lookup_tb_ptr` | 0 | 0.00% |

Package build benchmark
| Package | QEMU | Runs | Median wall (s) | Min–max (s) | Stddev (s) | Wall change | Wall / baseline |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| lz4 | candidate | 3 | 79.506 | 79.000–80.063 | 0.532 | -1.25% | 0.987x |
| zlib | candidate | 3 | 45.474 | 45.426–45.476 | 0.028 | -0.44% | 0.996x |
| sqlite | candidate | 3 | 278.771 | 278.470–278.962 | 0.248 | -1.07% | 0.989x |

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
v3:
- Expand the commit message to explain the optimization rationale,
  following feedback from Sashiko AI review.
- Add a benchmark result.
- No code changes.
v2:
The overall structure is quite the same as v1 except that v2 considers the condition that QEMU forces
`VL_EQ_VLMAX = false` when `maxsz < 8`, which reduces the number of `goto_tb` slots from two to one in
some cases.

For `vsetvli` with `rd != x0 && rs1 == x0`, v2 also uses a single
`goto_tb` slot because the successor TB lookup key is fixed for a given
source TB.

Both changes follow Chao Liu's suggestions.

v2 patch link: https://lore.kernel.org/qemu-devel/20261110-research-vsetvli-direct-chain-20261104-v2-1-8e65aadfb6aa@gmail.com/
benchmark link: https://github.com/zhenbaii/qemu-riscv-bench

To run the benchmark from the benchmark repository, pass the baseline
and patched QEMU commit IDs to the vsetvli-v2 recipe:

  ./reproduce.sh BASELINE_COMMIT PATCHED_COMMIT --recipe vsetvli-v2
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


