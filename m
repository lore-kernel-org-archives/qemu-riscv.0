Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2WY-00045p-6b
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WO-0003fw-Kn
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:09 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WK-0001p8-WE
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:07 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 90-20020a17090a0fe300b0023b4bcf0727so6285094pjz.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0GpvItK+0yEAr6ekV29kXe57aZTC+wazvzQvMo61ts0=;
 b=i3u0DdrS4QSJRUaWvpwmw2AM06pPEt3MHiq6AG6aPQZmV7RU2UqBcJ9cuiMq3gxzQr
 QnZS6QZ+wJwMyqSmEeGv0KsIbA6ONOi84PEQLNWlOPaBdTX6LdnqL3JVOOfpd5CuIcbj
 oFnSu1NzwjBW0wzKz0lFDcGUasZtpT84k9GRCATs/PqPazZOJ5Zj0DUBtkroReCmXFNN
 8qkAveP6Ft3f6/d7AHgU+ZdtgmJAbLrsNkkReIrWWJac/peOaIUKXzkSt5tr/8U7aQHW
 cmmmaLB60b6vV14cK7OGs6svX23O/EiuKxk8qL5OR/narotKbhDpTxbEYYNa2wNsm7gw
 UVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0GpvItK+0yEAr6ekV29kXe57aZTC+wazvzQvMo61ts0=;
 b=Gppw7aQmM4zdrt6QZ5UUZhkcdKZJqC0RuSKlXsBz+6v0Tw4/ArZl0x8su7qnMMeF2L
 0OWGUCmoW5Ic6GjyYKkRtJN/X4REO4einJ1qGpBEva4fYO5ltB/AqLsOsQ7G/9cZGk2N
 rIF9oa/gSDQ6kHOO0Wx9jQ8rZEdejJopdM2/lraulvboEWEg0iyNLgtHSUsSbjanZduE
 L0N6vdo5IYvnRpHoAJ2AmFuKgpUKsX8uuu7dm+EB+H4VThHouhJSWB7dzrz8xE800468
 AQUQEZwh2NTuV5Gp239lmIFq24q23AeCuxuBnwrhR4EtBDBSztynPVB4pDh+57hD2CCo
 qdUw==
X-Gm-Message-State: AAQBX9cIj1vN2VejMrtffkvneI+5Qxw39rsDrUuRGmTcbeFHQlagzUb8
 4QVv1Y3JQfPqG1whgu8IpgZnUw==
X-Google-Smtp-Source: AKy350YM8xuu8/3PL42u1G5/cObAUd3RBIcVPj3XjihrOojLbgA8UUKsCybfxFTQanqZh8NxocLkDg==
X-Received: by 2002:a17:902:f0cc:b0:1a0:4b9a:bae6 with SMTP id
 v12-20020a170902f0cc00b001a04b9abae6mr13109108pla.30.1681175403182; 
 Mon, 10 Apr 2023 18:10:03 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 40/54] tcg/loongarch64: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Mon, 10 Apr 2023 18:04:58 -0700
Message-Id: <20230411010512.5375-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:11 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 37 ++++++++++----------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0daefa18fc..5ecae7cef0 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -893,51 +893,36 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
     label->label_ptr[0] = label_ptr[0];
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_ld_helpers[size], false);
-
-    tcg_out_movext(s, l->type, l->datalo_reg,
-                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_A0);
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE], false);
+    tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
     return tcg_out_goto(s, l->raddr);
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I32 : TCG_TYPE_I32, TCG_REG_A2,
-                   l->type, size, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_st_helpers[size], false);
-
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
 #else
-- 
2.34.1


