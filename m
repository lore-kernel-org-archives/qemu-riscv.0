Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3F1C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:13:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwto-0006Zl-9F; Mon, 22 Jan 2024 11:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtm-0006ZG-Ow
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:46 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtl-0005Lq-8O
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:46 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5cf765355ecso1478153a12.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939904; x=1706544704; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dK9b8ai3GFFn6k72ZVd2T7sFWyCWDsdKiydPds9NK4c=;
 b=Pqq86eIW1fl1RPFCz8pzxofPFNVn0sZZm4halfsIsR6fPmUXKpd/CU6xHh1nveH+ei
 I/wWXIL7xlu/6G+9hlICuD21Y0YGrgpYZ+8e6FjCrZoP0YItwGOyhXIWUqDVAkkQRFXp
 GoAqvHHWnwy3G4EeJj9xTH24V3u4Jy352PlPmBt1GW5htbzZVvNtcJjW2ytlvPyNQ/Bs
 OQjF5IVUbFGWYp+rs3xFiRMAwa07reVabeT7AqnpXIH2t8bs8IaPAns4rKhK0lnhPtla
 9Xb5ek0JRyGzZ1JCN3WO1hIfKK/wMejtQffNUvKVwcoeQoT8Cs4ZBA4K9tpVoTt1pAyZ
 iM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939904; x=1706544704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dK9b8ai3GFFn6k72ZVd2T7sFWyCWDsdKiydPds9NK4c=;
 b=G811WQjz8kA1Nd5TYoZZGyI3zIZ4Xx/cmdZ/ZTTz4Ewc2iM7bxnX/0y5pXr1SwFPyz
 CO8pDafobnzrR9C0McuLXOqqXtL1XOaEBIKG+O90PHmlXTNOpIwL4850qseqiRUDfiQC
 U8mR+k1dHN+uaamKbUefur8mJ6qM3tW2RFQzXeJgxb5bULQPSDZmghf/pErps0ZqAE2G
 iSVmYks/oMp63D60XFHfnO6cvoqGz+wgTRrEr1I1+4Dq2qV43V6lwQRlI0vWSYLeH8XX
 Y6k44DaeDql42akpz2/Cvaad0z2W2foL+1LScRy2GvK6fV1q8JYOvZ4bDTSErfZCSlc9
 aaig==
X-Gm-Message-State: AOJu0YzYQl1jUVxbh8eIOEXw/HRGMA7AeCvka5Sw3TSMpcnScIKEJAc2
 7ot3FhESuPFJIeHUmk4Hc+fDPhuepzf1rufa/EtWPxtf0unXYuC5W83N91roHZM=
X-Google-Smtp-Source: AGHT+IG16VkHO7QxONHbiXbG/4zAA7oaZ+b6IrUr3+dlfXp4U4jmWFSYyE3qrFqAybYX1NDcyV/iKw==
X-Received: by 2002:a17:90b:3105:b0:28f:fbdb:5229 with SMTP id
 gc5-20020a17090b310500b0028ffbdb5229mr1569235pjb.66.1705939903876; 
 Mon, 22 Jan 2024 08:11:43 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 09/13] target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb'
 in MAXSZ()
Date: Mon, 22 Jan 2024 13:11:03 -0300
Message-ID: <20240122161107.26737-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Calculate the maximum vector size possible, 'max_sz', which is the size
in bytes 'vlenb' multiplied by the max value of LMUL (LMUL = 8, when
s->lmul = 3).

'max_sz' is then shifted right by 'scale', expressed as '3 - s->lmul',
which is clearer than doing 'scale = lmul - 3' and then using '-scale'
in the shift right.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d743675262..b4663b6e1f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1160,12 +1160,12 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, 1, true)
 /*
  * MAXSZ returns the maximum vector size can be operated in bytes,
  * which is used in GVEC IR when vl_eq_vlmax flag is set to true
- * to accerlate vector operation.
+ * to accelerate vector operation.
  */
 static inline uint32_t MAXSZ(DisasContext *s)
 {
-    int scale = s->lmul - 3;
-    return s->cfg_ptr->vlen >> -scale;
+    int max_sz = s->cfg_ptr->vlenb * 8;
+    return max_sz >> (3 - s->lmul);
 }
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
-- 
2.43.0


