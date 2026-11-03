Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161C606A328
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CiIQz1cA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOIPY-0003mU-K1; Tue, 03 Nov 2026 12:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xOIPU-0003m9-Ak
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 12:35:00 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xOIPR-0006zV-2Q
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 12:34:59 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3ac77270fbfso2247049a91.2
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 09:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793727295; x=1794332095; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=QQO1Xf2j9XcVjlks5fKh5jx3ufcS3ux+RAnPnyK5/Rg=;
 b=CiIQz1cAj2NB43ldswNEr8uFN0UbB+n7+/nid8fAwuLZMQ0j+VuCD2eLVmFV7cUYvo
 XTiZ9PfZIL+hEbLZ9xqGgjm9oqKKIrEe9JF577PwooINZLq1SnMRTr1Eq9Yj4aCDTcWP
 8F8AxOQQsauQ48tPqGOh8EKWVq2jkMqOqY8GNk74MzeAzaxmRvX6zEJMFt+9Jl/1qf/l
 CIaDij2syXRL6FC4bi80E5SKWUe8EkaiVQG1L9Ui9DE5IvXzUlZU7Q/9E8+pJW+Zx/uZ
 B56ui43GpWZJc0NmRK6J4qYF70xvhZHUfN8URvchIEo7DrYJmD3ph1Wqtbk7bSPo2zN2
 EUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793727295; x=1794332095;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=QQO1Xf2j9XcVjlks5fKh5jx3ufcS3ux+RAnPnyK5/Rg=;
 b=LWx+AgAxL9wVKMLpVax3HeCjlk2iorEkgbVDjyHadPVWMQ5SW1DbdO+IiteE4sEEl5
 mnUPsd3PhGhTtQssZ/HUub/oUi1wm5rzZ1aFMrIORr/ehrSb4pXftQXMJnlzBbMcYw9Z
 jMG6ST3kLaYnAigv9uPxo+6g+uissodUcIqZeMcUIxP5npBBUMcFOfta5OpzPcEZN5rX
 tRAxQuYPkc7FOckYsDM4lQTUU+AbH7o/jTA1RtvoQYyigL5EJ+2lFFQb8XGKGmCPS0xW
 Vja/zTiWUE1IvMWuHX3aYu5ze8xLb7QL786QjMhfMFgPXzaemeJGaleOFjBHRH4jJuxC
 0AXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1NpFiENwjgmfhbrSGqhOuGd/2b03+QvG2R+KOZSiR9Yz82789WAIoBHFRTKSuufb4TYJqIvI1nAbR@nongnu.org
X-Gm-Message-State: APuU4Z84bOGAvZ2CXAjqf3XnN0PGVTw6ZdPYFoJcD03+aC/9062g6lSR
 ZJb/7opm+ceD3QB2nXcgseqreGxT166+7oBW5P0pUiu9sfys5eNRq3V9
X-Gm-Gg: AYBFou3NG3xzhT8R6br+szwHSpFZ4L7YhkUhgxdh5ptrL5Kyw7NpbRvtVjM/3/4e0ne
 vp0ArBv9ujWYdtf8yWpXgtpeFcX6YyceeTbdlM+omRvu5V/ZSqYeqvvO1wjGlBaO8hVgXm2mIzK
 ZH2QMsJvHafD/sLQw3Wx214sI3zhwSue/AVKbnOHDNFSIqY6ToVvym2pkvxmIgwntXYtTaFRBkW
 XT4/fwrzrZm5qsmSygp1EChVUps7CkqWtw2PN8HGpFHVjTa5vHVQ8+qzKf9QDnB0Wjmbrwwuj/I
 UCNx5m51zzO26pSt0Z7qiY2xccGNoblH9Jg+cHVVNdV7aP34d4arhtuksL/maLl8DLlHNb2xBje
 kW2IQpXREPzf30KzTQF7Nr2oJ0DVyNonuUzyGcx3rBnPBnL134DqqvzG4y4dTjdrQ9XKNaCG3Sz
 PLBWGukpwfH4uI8Kw/dBeu+uW1j5V9p+mo08+YR2rEQa9mXZT5p/4DUzwqmDbFhUtfWjIC66cS3
 9sbLBMUF1jzmpaE1fDPh/e/B6HETlfYd13wjOT+MzSujnlFZvM/iHdguR6c3Aqw4a4vOUXRe57A
 yVZu6vxYTL31k/xDEwXcC7t/iI1L7JBupaf6V1gi3uwfxINUATQIh/cTcLjKFDIqhkNFB86XleI
 OUzsMXmXVLIC9DnWpbpzURwffub+Q2VwQ
X-Received: by 2002:a17:90b:3887:b0:3ac:97e3:73a3 with SMTP id
 98e67ed59e1d1-3ae89574e10mr9417536a91.6.1793727294725; 
 Tue, 03 Nov 2026 09:34:54 -0800 (PST)
Received: from [127.0.1.1]
 (ec2-47-130-4-255.ap-southeast-1.compute.amazonaws.com. [47.130.4.255])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae85f662basm9829139a91.1.2026.11.03.09.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 09:34:54 -0800 (PST)
From: WX Chen <wxchen0913@gmail.com>
Date: Wed, 04 Nov 2026 01:34:44 +0800
Subject: [PATCH] target/riscv: Use gen_goto_tb() for vsetivli exits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-research-vsetivli-direct-chain-20261103-v1-1-ace12cf5280a@gmail.com>
X-B4-Tracking: v=1; b=H4sIADMb6moC/y2NQQrCMBAAv1L27ELSaIp+RXpI0q1Z0Ci7IQilf
 zeKx4FhZgMlYVK4DBsINVZ+lg72MEDKodwIeekMoxm9teaIQkpBUsamVLndGRcWShW7zgX/nkN
 /Pjm/mimSm6DXXkIrv3+n69w5BiWMEkrK3/4jaCWBff8AtheKeZIAAAA=
X-Change-ID: 20261104-research-vsetivli-direct-chain-20261103-69536f07be37
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 WX Chen <wxchen0913@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793727288; l=2695;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=wAVMFhGmPaGtZ+CzZ/XRpadW7vJEAcquvP323qo+hE4=;
 b=FKYtHd2DE0BYqYqEFzp0SmUMFmoGR2hB0JTU5m7c5+Qip0se4Wzu8zqZfTgCUBFbuB7Awp1xI
 WRTJqP0n7oUBFYHMdcvKz+nok/j3R29rc04c0RsIiMvIhbJDqt7Xwy6
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=wxchen0913@gmail.com; helo=mail-pj1-x102a.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This change adjusts the translation exit of `vsetivli`. While preserving
the existing helper, state update flow, and TB boundaries, it uses the
generic `gen_goto_tb()` path to reduce the overhead of repeated successor-TB
lookups.

`vsetivli` is used to set the vector length and type, and both its AVL and
vtype encodings are provided by immediates. Given the CPU configuration and
the source TB execution context, after this instruction completes normally,
the vector state changes relevant to subsequent translation are
deterministic. Therefore, this exit is eligible for direct TB linking.

Measured on an AMD Ryzen AI 9 H 365 (x86-64) host, using qemu-riscv64
with -cpu rv64,v=true,vlen=128,elen=64. A RISC-V GCC 14.2.0 cc1 built for
rv64gcv compiles the packages with -O2 -g0 -march=rv64gcv -mabi=lp64d.
Only cc1 runs under emulation; make, the compiler driver, assembler and
linker run on the host.

Each variant is warmed up once, followed by three paired clean builds in
AB/BA/AB order, using -j1 and fixed host CPU affinity (CPU 7). Median build
wall times are:

                  Before (s)    After (s)    Wall time reduction
  LZ4 1.10.0         125.017      123.060                  1.57%
  zlib 1.3.1          71.062       70.310                  1.06%

In a separate untimed test, a loop executes two vsetivli instructions per
iteration for 37 iterations. Host-side GDB entry breakpoints show that
helper_lookup_tb_ptr() entries at the two successor PCs fall from 74 to 0.
The guest still executes 74 vsetivli instructions. Initial TB dispatch and
link establishment still occur through the normal dispatcher.

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index a22e2cae6ce8e5a055c106fb76c305c92ac53d3c..b299c82d7a29057433e280b49b5220e6ad71498f 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -234,8 +234,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
     gen_helper_vsetvl(dst, tcg_env, s1, s2, tcg_constant_tl(0));
     gen_set_gpr(s, rd, dst);
     finalize_rvv_inst(s);
-    gen_update_pc(s, s->cur_insn_len);
-    lookup_and_goto_ptr(s);
+    gen_goto_tb(s, 0, s->cur_insn_len);
     s->base.is_jmp = DISAS_NORETURN;
 
     return true;

---
base-commit: d73149283205645625bfa9fe029cfb68e4c4a9ae
change-id: 20261104-research-vsetivli-direct-chain-20261103-69536f07be37

Best regards,
-- 
WX Chen <wxchen0913@gmail.com>


