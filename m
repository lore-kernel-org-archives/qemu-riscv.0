Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAtx-0000IE-Vf
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtw-0000DN-3y
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:00 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtu-0005W0-CH
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:59 -0400
Received: by mail-pg1-x541.google.com with SMTP id t6so883459pgq.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6l7ajT+KNolo0CGKboLF/OzzmhcDECUMbbw6mVvJ14o=;
 b=KOZSJwebz0Y7RyEt60irDwlHYeE/gcbbE7SXN5eHqWuXCJSNftu/iNDsi736pLa5f4
 tA9ui0lpHBgYTt0GayuT8uCGaSHhhTPLxMmVC71dJx5Y7DylYc5AR1SHLryYbxXd4gVY
 aSELJivstDPO65LBIg79Un4YuL465Cv0lNSsbzKpjVfae1wCFAuUnEbKWHgC0eZj8kl+
 yb/203ksDEwuXgbGIY0KJBwUSeMQdbyITB8TFu+Y0oomau3CcFtymifFzzoNHOzphkP6
 PzWhmGiATCjnFSwmVQg4dya0dRwnVotJvp4VAP50Wfyqj3Jzd4oNzclO8GbhhDP55AXi
 5gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6l7ajT+KNolo0CGKboLF/OzzmhcDECUMbbw6mVvJ14o=;
 b=n+LzfFbEP21pcQ0MjfIM9poqcCXFiIXKokBSkt/hp0igRZ6N26dQn5F00rd9tGVNZp
 h4zx3CR20VVuB1SCEPX5DUDB4lFQnQQusXcY8X5YnJjJcYDzzLCIiIiQsk1qdRZdctuZ
 5eaYkir3u8e9uAHZbsTl7wozUVlmac6cQ/cip97Ij2aNZ6ZG1Wh4943ujn5JQCMK6Fd5
 0BJM69gebA6RYtaS4UFS5ikRJtSO3vsZg052b7I0C1HwgetHO8adYhx0pmXR6Y3fMR76
 vv5eA33kvkK8h3HCvhXtg1rC28V+5BaxZVXaJiTeEb/CgckQnrw8ThVuNliEdjHlHZP8
 /K/Q==
X-Gm-Message-State: AOAM533pwnaL7WasHrYpTxms6Y1WcZDQJeuayDam64lUQO11r232ea6T
 naSdaOaw2y35oLbKfAhCUdV4Wwx/YUw=
X-Google-Smtp-Source: ABdhPJyOhIcggfbs5DsF5MgqfWnXsbLbJibleSVTqSJRw3v+NVRiIQFp5l6QX4Sg7QOR+48mHaObQg==
X-Received: by 2002:a62:1782:: with SMTP id 124mr26899231pfx.204.1595409537051; 
 Wed, 22 Jul 2020 02:18:57 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:18:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 20/76] target/riscv: rvv-0.9: apply narrower nanbox helper in
 opfvf_trans
Date: Wed, 22 Jul 2020 17:15:43 +0800
Message-Id: <20200722091641.8834-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x541.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:00 -0000

From: Frank Chang <frank.chang@sifive.com>

If SEW < FLEN, call narrower_nanbox_fpr helper to generate the
correspond NaN-boxed value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 22b4e11a20..85738ba4f7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2196,7 +2196,18 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    if ((s->sew < MO_64 && has_ext(s, RVD)) ||
+        (s->sew < MO_32)) {
+        /* SEW < FLEN */
+        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i32 sew = tcg_const_i32(1 << (s->sew + 3));
+        gen_helper_narrower_nanbox_fpr(t1, cpu_fpr[rs1], sew, cpu_env);
+        fn(dest, mask, t1, src2, cpu_env, desc);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free_i32(sew);
+    } else {
+        fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    }
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
-- 
2.17.1


