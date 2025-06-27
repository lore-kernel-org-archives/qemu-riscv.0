Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDDBC7EE31
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 13:21:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uV90X-00031o-9Q; Fri, 27 Jun 2025 09:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uV90V-00031f-5y
 for qemu-riscv@nongnu.org; Fri, 27 Jun 2025 09:20:43 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uV90Q-0003Fy-PL
 for qemu-riscv@nongnu.org; Fri, 27 Jun 2025 09:20:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7490acf57b9so1631358b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 27 Jun 2025 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1751030437; x=1751635237; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7cQbTwl8/Wsv/cBZa0gH677CLKVrdhFboZMiTRyuo4=;
 b=ROvED2+0x8oi/+jH/iae3omwMBghWSmbHy8zTUxabXk9Pkgcle0tSKG3FqTrMKnE7o
 w77fsmqt2EdxlbNH4yVfNylcFoc/nM/WFJHtyZJ91UVYBDgIpbzLKTwhK9bRiUiQEjfS
 +OwrD7wSU1oK+JI6QMvATq1OTB2ATcXvGWZVycRdo1mxs+17AO5g+6I2xMmUaegvpDod
 bXGWFfqSPCtJqz+JXiIq58CwLw/JzrA6JvEHGjCypMcoicHhIb0LL+LmoIw71Mx/0Lx/
 i9J518ajPcw25/TLu06NNUCJjqu/lw6zD8FuPnnFuIGY8PDrC7P5mVW+uLSYeZi/Q9m4
 k5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751030437; x=1751635237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7cQbTwl8/Wsv/cBZa0gH677CLKVrdhFboZMiTRyuo4=;
 b=ljxiMrAh5LSxH1H8Lk84zFJ1h82IyhV84QCXntX6q2fdJT5YDNz0oBktNPLD08PM9j
 XVD/DbkBrMJWxly35duEf2cxm9UTqwJFsrijDbrZd7nO01u6GNZoAx6i6zQFRaUPz++5
 WSd76Bw28+QuA5LljxWrvBfr0P5/VEN//QqqWY0vklo5h0W+oHkBHewrzasclFHeWCIv
 lZmEmtt8Wmh/TyL+gL/wl5QAbjvLBjyOQX/4H8lIubnEnrK7MSvyUJwiW6/ABKBtwkZC
 gScpU89HaqFzZ32mpBjRDjG26MmvASL3RyXL/t93CXxsZG4nDNtZWjKKpgz+N1UvvTmL
 eGKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXShFEoLJZA3iRNJdiWlNzGAx5NNzuE8PXVnRXE0+mJL6CJhScdUErL8GvRTsfvUGI818z2T2o3hhlx@nongnu.org
X-Gm-Message-State: AOJu0Yy4Vhb0drHoIz6jFek+SuZtDhnDjpcKzoqlA857XAoBqkUvC67g
 mvZOEau8gIvaV50PxhrrDoLst3kq4FJEhoqxAmW9UlzqwkcDz7KAsC4t9CBi/Tf6oIw=
X-Gm-Gg: ASbGncst+H2TrBPpLQbnrDNX/jRk6LRuNNgf9rJ83J5IX7nAzVneQGiIsitqK8sz3Ak
 XkbVya1/uYEN8oSUv4fzxEKbSuz2lPoE3BxLe9m2iWWSGa2a12XqjhA6dcUT3qR5MtxlsWAKwRX
 Du4L1AJJeTEd8b28xkOltpXEJmEW1tvPP7vCkm0G/+hxf+i5Kmx+8SAD0OlRyptklzi1ioTNXQR
 M+zhp04qkvOYTaWTQp/ZOm3Hk5Mbc697BTsv3Rr4+HumHNG/MrHe46ttSpik1dDoJQfN0v1Q4Dq
 LUYGktpudD4Xo+ykqJ00+nh4yOgGtSVqaokZN8y2foCa9QYp5CmjJr+iKpwoNA6l68QT0DaTBly
 Q6fF/irR2R0HWqKCUGhVDGRh1Okwesf4=
X-Google-Smtp-Source: AGHT+IHjyZzNzmUxzn7BLQtPjDYVzQrHomReev/4cXKM8lhbltSQn7HIaL/iQz72DG27uo067PWj0A==
X-Received: by 2002:a05:6a00:14c2:b0:73e:1e24:5a4e with SMTP id
 d2e1a72fcca58-74af6f7f8e2mr5177977b3a.24.1751030437245; 
 Fri, 27 Jun 2025 06:20:37 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5573e71sm2393162b3a.98.2025.06.27.06.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 06:20:37 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 1/3] target/riscv: rvv: Apply vext_check_input_eew to
 vector integer/fp compare instructions
Date: Fri, 27 Jun 2025 21:20:20 +0800
Message-ID: <20250627132022.439315-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627132022.439315-1-max.chou@sifive.com>
References: <20250627132022.439315-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x432.google.com
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

From: Anton Blanchard <antonb@tenstorrent.com>

Handle the overlap of source registers with different EEWs.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2b6077ac067..ec34d0d8c47 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -436,9 +436,10 @@ static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
            require_align(vs1, s->lmul);
 }
 
-static bool vext_check_ms(DisasContext *s, int vd, int vs)
+static bool vext_check_ms(DisasContext *s, int vd, int vs, int vm)
 {
-    bool ret = require_align(vs, s->lmul);
+    bool ret = require_align(vs, s->lmul) &&
+               vext_check_input_eew(s, vs, s->sew, -1, 0, vm);
     if (vd != vs) {
         ret &= require_noover(vd, 0, vs, s->lmul);
     }
@@ -461,9 +462,10 @@ static bool vext_check_ms(DisasContext *s, int vd, int vs)
  *      with a mask value (e.g., comparisons) or the scalar result
  *      of a reduction. (Section 5.3)
  */
-static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
+static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
-    bool ret = vext_check_ms(s, vd, vs2) &&
+    bool ret = vext_check_ms(s, vd, vs2, vm) &&
+               vext_check_input_eew(s, vs1, s->sew, vs2, s->sew, vm) &&
                require_align(vs1, s->lmul);
     if (vd != vs1) {
         ret &= require_noover(vd, 0, vs1, s->lmul);
@@ -2040,7 +2042,7 @@ static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
@@ -2076,7 +2078,7 @@ static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
@@ -2250,7 +2252,7 @@ static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
@@ -2264,7 +2266,7 @@ static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
@@ -2972,7 +2974,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2985,7 +2987,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
-- 
2.43.0


