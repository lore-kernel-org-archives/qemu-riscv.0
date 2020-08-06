Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRU-00021e-EO
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRP-0001xW-D7
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:07 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRN-0007lr-Jp
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:07 -0400
Received: by mail-pf1-x443.google.com with SMTP id k18so17485258pfp.7
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c/ghpBq2kPmrmEJfQqAVTB1c6bdR+UnyFqiBk7wXJ8Q=;
 b=cP5ddzGjzkzLNJ/q3iSfNyeywN9+I8cn202Ib0AeAAjf8TKEjPyTXAK6Xy1Q+/kE6/
 U1Te7CXlGXCVILEjEPkcd6dPbOD90rSSAEnPZjXb2i9Avm1X3zMV9H4NL9y3/SMZ0n1T
 AYNk0v1tKEy7zv+Th8BemRV6wzPAj3UOcHA8/nk1T3BjnA2ou9dFED076gZTWbObjela
 kBzs4EzC+jGJgbNjFY+oRlAmeVqAqu+X6fv/TBAzsRlDJQJJzyioFYg49loTRFbggvZm
 TTo+upMslB2wP9bRxvtN7zM3rdHCffDbm4gcwCkPdFF5AHiqMQXN4dpv74hzYZ8GOsdl
 /YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c/ghpBq2kPmrmEJfQqAVTB1c6bdR+UnyFqiBk7wXJ8Q=;
 b=YoeZyKiaDSAIbh7AWKbYbSJJ0p4sV6zwuOwW2GHW6d1ly2SUyIqPQginZGc3A9tTjg
 4T/uzzzx5XTJRueMuIGo/dMaV12m9Ngx7IoEQv3DS5gn4aSJ9+D/PI+oOjszehDhLAyO
 Wtw08gdzH/6W9Hlgc4o62HZEusXUMjJiPy9fPu3X38fA3JF7vIqZ/MV1ijJ4nxq7h8Zq
 7ACxIQ3eKKBxlLRnLTfM4PeWnR61PmHoJ8ndBbpC1bV41gAUoMgfkr7qu9bn6OVuL1Fi
 vBiRt6mgJBiiBnD0Erqz3eQq7Zn82Qw8cZlctnTmkvAzDeu7vrIKxgPJXo5XkWsv3Ewc
 9JFQ==
X-Gm-Message-State: AOAM5314viFYCjq8HUw0AVr8IIZNf1CUoX+Ixfas5gLr6awDDh6ybMOX
 dIRIs3bonYz8JhAl5kDD0I0WWQ==
X-Google-Smtp-Source: ABdhPJxrxE6DfDCrQrhti72/J6vyVqaX10koT63HUsdUchRVBRFHRfU8qEBsh+TM+zt8HM3EhCExzg==
X-Received: by 2002:a62:7644:: with SMTP id r65mr7488062pfc.271.1596710884271; 
 Thu, 06 Aug 2020 03:48:04 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 17/71] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Thu,  6 Aug 2020 18:46:14 +0800
Message-Id: <20200806104709.13235-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x443.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:07 -0000

From: Frank Chang <frank.chang@sifive.com>

Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
generate the NaN-boxed floating-point values based on SEW setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 0a4dd875e96..525aff06815 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2077,6 +2077,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
 /*
  *** Vector Float Point Arithmetic Instructions
  */
+
+/*
+ * As RVF-only cpus always have values NaN-boxed to 64-bits,
+ * RVF and RVD can be treated equally.
+ * We don't have to deal with the cases of: SEW > FLEN.
+ *
+ * If SEW < FLEN, check whether input fp register is a valid
+ * NaN-boxed value, in which case the least-significant SEW bits
+ * of the f regsiter are used, else the canonical NaN value is used.
+ */
+static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
+{
+    switch (s->sew) {
+    case 1:
+        gen_check_nanbox_h(out, in);
+        break;
+    case 2:
+        gen_check_nanbox_s(out, in);
+        break;
+    case 3:
+        tcg_gen_mov_i64(out, in);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
 
 /*
-- 
2.17.1


