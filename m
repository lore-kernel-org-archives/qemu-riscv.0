Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfItM-0001Pr-NE
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItL-0001M1-6m
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:39 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItJ-0004o9-FH
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:38 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gi3so709851pjb.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=meE5DTx33Gz6EtRKa1WM1rUgLFRdm9EljrOhQNJYeTk=;
 b=WusaXAqeOp5F0/9Q4Bg+S3Bkf+dYvX0VNIBHqCRkJj0vP4Keu6Dphwn6PvGf0y0eh8
 yGHbqbMUHvk0VEurAtJ5i5quk4MtqtIBI8fInDGTcyTwTglALx5V5RdauZkX4Z7qlvAT
 0MDrfh9vI1jTMUT357yxa0TEg+RxvNEqf9AjDEWWl6TU0WQ6crtFTo1QMbYgx0eWxBcO
 YBncntuE1zkVzPg7/rOG5PM/82E5U0Sl2amHTesZCZcMKN2w4CPV5ZwfoYT1Rytlm8xE
 E+a4adYJcSiK4gdmQdFyt2GhAohvcEXzw7OgyHsaG/zmd3viAyT/pU5wjDAZmHzA3GlR
 qKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=meE5DTx33Gz6EtRKa1WM1rUgLFRdm9EljrOhQNJYeTk=;
 b=TW6yUxqCwAnIeR5BUJ6OOypK76uZk7+8uAT3o9VZXxOEpZ+FJNcg/gpoU8I2z4cptt
 wuUlxXwDsXkfhuiJsB9xj5KYj+7zVLo2O/z8He1JaWBonYkhtPXVmNKTA2oNw+K9i07n
 E9uz+qIg+/+zfVL/L+FB57pdG9h/0Z5/UP9xc6A/6P2h8qYackd6p9HptW3773yEiJmB
 HY8FAwSzNdLAYN9jjC1HEUzzM3yqP/+uXYVVdiEegzNfPGSeSZBzQbrNPCyaerJQfn11
 b2Xu9aXKlg7yboubSE7ZnuwKLLtbqfPbgxji9I6d1X3zSkXvj4FN1vukwWcPeKOpH9q9
 6Yiw==
X-Gm-Message-State: AOAM530kE08mPZA4wywk7Yqk/HX8fef01tZdrVjQ2ik71jDakLGNtQzA
 VJ1h2yBcgddylgsUP0/O20mu0Q==
X-Google-Smtp-Source: ABdhPJw9MtYm/fSdPVXYW48mY9fPX2e6So519WmsUpsGP6PiK2oSHf2cTQEf/D/fRX7xNa36H2XMkA==
X-Received: by 2002:a17:90a:de89:: with SMTP id
 n9mr3048147pjv.224.1605688356234; 
 Wed, 18 Nov 2020 00:32:36 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:35 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Frank Chang <frank.chang@sifive.com>
Subject: [RFC 06/15] target/riscv: rvb: min/max instructions
Date: Wed, 18 Nov 2020 16:29:44 +0800
Message-Id: <20201118083044.13992-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:39 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 79aa40f03dd..372476f1d2c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -605,3 +605,7 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9257373ae0b..b9a0e39a3e5 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
     return gen_arith(ctx, a, &gen_packh);
 }
 
+static bool trans_min(DisasContext *ctx, arg_min *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_smin_tl);
+}
+
+static bool trans_max(DisasContext *ctx, arg_max *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_smax_tl);
+}
+
+static bool trans_minu(DisasContext *ctx, arg_minu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_umin_tl);
+}
+
+static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_umax_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


