Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRO-0001vx-SN
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRM-0001qf-OQ
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:04 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:52858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRL-0007lM-0g
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:04 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kr4so6456904pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=T2zFAscQb8E+SK8j3wK1kVNT/OC9AVAafjFqeCT4gx8=;
 b=hJHoDV5BJmvrDR+qfDIwjA7IC8JZCu41XvnnCGnUxh1W8gMX+VfgUnPj6d6/OoZ0Wt
 RobM8XqFU0s6kBET/XvxauGgrVLIlfQmn0lgJSSA7tS9ZA0UisHshi64AW0xbi4pD1TM
 wLzFpdDkV9e4BQxdhvX83pT3WiKmlcVW8NAyQ5XSObBozen7uQpOVTlCCXJiNv5ZQ4a4
 vNLP2gDgWYyw6RaMvpWulZspEgQQI7CnQ+ze3xT5jVXjeFStX7NiEcy4/5Xbd3DCEjBo
 Dh8Y1EGDWrF1UhOjpT5q0I8hrBDibUiuqW0kNKP7Msw8d/QwFNf1OaOscewcuXiR4eLi
 WtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=T2zFAscQb8E+SK8j3wK1kVNT/OC9AVAafjFqeCT4gx8=;
 b=CZbbAPn0fVhtYt5i1YH8uIW12itXMV8YW7wvc76+kT2SZDJ5YKTFtzsH2GIv7kveNj
 iYuXziTkZl/OXO5kRlRGaNPxBNZLYJiOM1kHsDkPL/xOi2rZC8vli1XNEvsCbuKAutpa
 zEnurGnCm+VD2W4eaix180alz5lxIve4BsNgSayF0GHtfzFbOlSgQkHPDIXM10Lt1Aeg
 0UGmfxms2L+GVtPePP6I148/ER3y7y21Pan+Ifem1F5XfmPhdAFEilyOmxCmnS0C6i18
 mHSJlLNTu8ur3oA6H4tZScjwXN/OKcjL77SSc+OQuuVDUewJWyBFXQ/WuEc61EUHl2qU
 f8+A==
X-Gm-Message-State: AOAM533wgEbhqDyfUb9x5AKOf4UDLATT3UYBbGFJVKDxUW1cEB4oFf2V
 ehrlAw0r6GNjRcsFzd/AZ9Ww1w==
X-Google-Smtp-Source: ABdhPJxI5ZKlWRLp1t93Q3Wn0chiLKpaBE9U7jKrPC9lSPk+jRVC+BiGZX8GstBdD8ha1BIbreplXQ==
X-Received: by 2002:a17:902:aa93:: with SMTP id
 d19mr6958337plr.272.1596710881750; 
 Thu, 06 Aug 2020 03:48:01 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 16/71] target/riscv: add fp16 nan-box check generator function
Date: Thu,  6 Aug 2020 18:46:13 +0800
Message-Id: <20200806104709.13235-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1041.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:05 -0000

From: Frank Chang <frank.chang@sifive.com>

If a 16-bit input is not properly nanboxed, then the input is replaced
with the default qnan.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/translate.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 24026f901d1..95921296a56 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -110,6 +110,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
  *
  * Here, the result is always nan-boxed, even the canonical nan.
  */
+static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+    tcg_temp_free_i64(t_max);
+    tcg_temp_free_i64(t_nan);
+}
+
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
     TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
-- 
2.17.1


