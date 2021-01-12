Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9IR-0000mD-Nm
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IQ-0000jj-L2
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:34 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IO-00025g-UM
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:34 -0500
Received: by mail-pg1-x530.google.com with SMTP id z21so421210pgj.4
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LYFX1Fk92ZBhuAVoO34Iqpx/R5IXhMUMVKbqKlhMECA=;
 b=iSmshtd/0Ug29YyGo3uB/iZo6rP32JroydKHJEMFRkuIk68Kb10kCsc/vSxNfcPseo
 +5OkLUG6U/dWBkKL3SewGeJ+qQc+/9XBicozjD/dU+3UpLCKXtgXL3ErW8cowBWWLjpu
 8r5pckwdeeTfOKRtgsoo0ipvDyiDXU+lqI6V5rSzhtYtfOQMmlHchLHBJS/5a+iWCud2
 zJb2vM3IKg42HL7z+zuLoVLxzq6+q4v3vfSpVElbF+GiUR4VIxnqWIKS+g8++bhL57p6
 ZHvMBXOQFotxnU463/YHpKyzVZleQ5M7B+VbYQDWLII3Rr/nZAGlRYhITt06ORUp4/86
 EVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LYFX1Fk92ZBhuAVoO34Iqpx/R5IXhMUMVKbqKlhMECA=;
 b=FW5mvG9qn3mownabr1D8gTvrdarBCIr2x4g9liZ7vOUVzju2/bk8FcL48mYanWEOfj
 8EKtUt7DRbA5MQ/UyjiAtb5lneTeHLZuSFGIVuXJXtAKq0L7SIIC8aGhZg/fr1fz6Lu0
 NsW1MnisEEhNfBgcRft1Kok0jvbKzg2qaRSJ8SjBYe6v28HgPExAVWFY1cpwB/vo57oh
 g/JrCGFubktJIjU/YkBfiagROlaD/td/TRsvzKxOa1sv6vt2ikJwckzNLc9Fqf7LEwy9
 lehfwJSsl1J1jrlTjtoQCgguXZd8SGzEMOSQzpAh9XoW+NwBG2y1nHPhnfLVItXfLXjm
 cUUQ==
X-Gm-Message-State: AOAM533leU5hQj7fel/zBualvJhBy0Ncvt/twS3rREhJ6dQjzY8N4zUo
 g6+0xspMtgnF05LjG0p8fzTUAcVWOoe1zJHH
X-Google-Smtp-Source: ABdhPJysnS0BQWfzFVulSdKHBRQxcjp1h6kLgIyeJW5iIs/c/2NRxA9hTIRoQwEcZeD6bLRAbbU8UA==
X-Received: by 2002:a63:4346:: with SMTP id q67mr2341844pga.223.1610418031747; 
 Mon, 11 Jan 2021 18:20:31 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:31 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 04/16] target/riscv: rvb: logic-with-negate
Date: Tue, 12 Jan 2021 10:19:45 +0800
Message-Id: <20210112022001.20521-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 02:20:34 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0e321da37f4..d0b3f109b4e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index dbbd94e1015..73c4693a263 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
     return gen_unary(ctx, a, tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_andc_tl);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_orc_tl);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


