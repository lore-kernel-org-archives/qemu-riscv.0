Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E5D2A541
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t19kU-0002nU-Ck; Wed, 16 Oct 2024 15:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kO-0002h2-BU
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:52 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kL-0003pj-BP
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:52 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20c714cd9c8so2153675ad.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Oct 2024 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729107108; x=1729711908; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dv6u2nNWkqx2QinOJ+QPs2qTyVh0lqH2PTx6QeDWZY8=;
 b=uSSZKaA6+KJoidJNDTv/ELK+EPe5RsWQVJwsPRivPBZRShEL390guUPWVyl5Qd95sK
 51M9pqmQI0qv2O/bNIthBy6nvDE6FSckKb6iB7sKF/5fozv2aYfa9FxnOXR+i0e+Vaqe
 nG6D3XcotDqwZOxukONEB4pJxhGDUk17R87WE9Mehehi6CRcTvN4UYOWgBeGjlGvyQpm
 T1ydfoCD+0rtbgs8dvTDHX2tLbRnMf/OkbbH72uw0GrdliIeEdmXm6By3neiZ/O/eZRd
 OtNIvS1Lq42kzgle6sHk7iSyHIQoIHQ2BtFGN7a+iguP3RXCITVG3eN/KhxIR4v/A8ze
 O7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729107108; x=1729711908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dv6u2nNWkqx2QinOJ+QPs2qTyVh0lqH2PTx6QeDWZY8=;
 b=kjMslaGMutq+xiFEcZmDFRM/rY87bXfQTL2T/F2AqdModopb1Bavv3UgDjzg1kQ2L+
 yg8NBXioI6xU3m3itR1s9jyJSstyMCpeIDNUxJvfhekOBtVW2xqV4g0pjcnB8B8cTw0f
 X7tCI3ERiyF1Pw2cT4rMY81uPVQMNt/gzgX6MOVOYB4TvBdvNEtxwOOUv1RX1tfDYHia
 q4xDq2nm/TYDe+9GAFf2haIcaqobhpy0hk5oD2pZxY2QF1HqiDN4LlR/LNywby7gJCWX
 CzzrVVwgPam+aoqpi3aShizmsoEGbhcqBCClg6CsSX/WjRk/bVbDYIufy4nbySNO+c5P
 lCbg==
X-Gm-Message-State: AOJu0Yz8LkLffVfoX5hGpSY8mnN80Uj1fUm57DgNL5EmR0vZHCn4emu7
 6d89VD8hSvG87Ke9rchmgsUuoLfT0oCj1C41o8mxoI3NapiTlJi0o5dXETVOBsQ=
X-Google-Smtp-Source: AGHT+IHaQFiBfzvUIDNvwSB2b1zGWSUyJZ1z1I26rQzi477sEDzFKVtRgQILd86PCKIvDmzkRR6Dfw==
X-Received: by 2002:a17:902:e80d:b0:20c:7d7d:7ba8 with SMTP id
 d9443c01a7336-20cbb22f1e8mr232167085ad.46.1729107107502; 
 Wed, 16 Oct 2024 12:31:47 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1804b6b1sm32323945ad.189.2024.10.16.12.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 12:31:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 zhiwei_liu@linux.alibaba.com
Subject: [PATCH v6 09/14] tcg/riscv: Accept constant first argument to sub_vec
Date: Wed, 16 Oct 2024 12:31:35 -0700
Message-ID: <20241016193140.2206352-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016193140.2206352-1-richard.henderson@linaro.org>
References: <20241016193140.2206352-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use vrsub.vi to subtract from a constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h | 1 +
 tcg/riscv/tcg-target.c.inc     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index 97e6ecdb0f..d8ce5414f5 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -25,6 +25,7 @@ C_O0_I2(v, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
 C_O1_I2(v, v, v)
+C_O1_I2(v, vK, v)
 C_O1_I2(v, v, vK)
 C_O1_I2(v, v, vL)
 C_O1_I4(v, v, vL, vK, vK)
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index ce8d6d0293..1ce2f291d3 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -2350,7 +2350,11 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sub_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv(s, OPC_VSUB_VV, a0, a1, a2);
+        if (const_args[1]) {
+            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, a1);
+        } else {
+            tcg_out_opc_vv(s, OPC_VSUB_VV, a0, a1, a2);
+        }
         break;
     case INDEX_op_and_vec:
         set_vtype_len(s, type);
@@ -2565,7 +2569,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_vec:
         return C_O1_I2(v, v, vK);
     case INDEX_op_sub_vec:
-        return C_O1_I2(v, v, v);
+        return C_O1_I2(v, vK, v);
     case INDEX_op_cmp_vec:
         return C_O1_I2(v, v, vL);
     case INDEX_op_cmpsel_vec:
-- 
2.43.0


