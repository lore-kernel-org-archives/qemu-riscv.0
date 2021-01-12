Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBZ-00042E-5t
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBD-0003o1-6u
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:35 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGB7-0007XW-92
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:34 -0500
Received: by mail-pf1-x42f.google.com with SMTP id x126so1057795pfc.7
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OkWyu7jgRsijV5fFMniw8pFrS3ecE4JJYXTrjaYW2Tk=;
 b=WuSBYJmZ5zRiAJyKcZajvhHo7HB0a3WKplkatw6ztoNhJ415Q7txM0H4ZtNcQQpsB5
 26CM92NLCoQpHEqx/kXsyKAS69MFfYv6m+h1ZtyfXB4jGi+1Kpo9N4HMJku0TOMiPPaE
 dbXSHbLtLaass4fBx9VBXQ9mumJQZ1aGPauHWyvebSYhXbcSqB/9Gz616zZwc+bGvut2
 e5Q5PcsrfcpvaqLfS3/XtYtjxUJSUu/Vi8AJTasVT3yK3nNjqxvR/Njk4apytt3R35Yz
 gfl/WGo5FHP03oARO7lT7osIMVMdKF/DzLSgUYurFbsbezsuE3GAqnCIKzGhVsgid4Wr
 b1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OkWyu7jgRsijV5fFMniw8pFrS3ecE4JJYXTrjaYW2Tk=;
 b=m9QZ/4sRFwg5FcbV+cy6LLUU4sXtC+3uqaH6O10pLauDLMISkIV0ROvHaD8U6F7AXi
 oAAE6ocNK0guIiNFStLRwx1S4imUJ05utslY/vavcSC0apPVkmfayV0bjRRNp7I4Uphd
 C8g7eOwx4YytW+rZ6aq4d5Jsx67iJ367eJhSZgbqD/v440Xbb0QUOwJCuvLUPQ4c+Gsc
 zpvt7DOMsYDY5pjiHa3O1XhrI+yMp9Tvb7CmCObYJYVtOqm2JSCP42liDI2prozOtaTq
 n2u0yXlganUd4Uyp0TZJCeTRgwKbS4obv8q7xIddl4MyA27q+kf31kKDWhvdg6uvddal
 J35g==
X-Gm-Message-State: AOAM531QbiMBV6GJ1OLcajUWCPVujO1iPO1y73xigfMFE/a6N5UYu/p4
 mdK77z09kPVVigWKNqyev3h73Q==
X-Google-Smtp-Source: ABdhPJwigGl8Y1wnINyCjprDDI31ZMFUIHj3e4ejP94DnNi4bUu5HaVbGXKdKal2U5uwbRTgAZO3pQ==
X-Received: by 2002:a63:405:: with SMTP id 5mr3943273pge.44.1610444487916;
 Tue, 12 Jan 2021 01:41:27 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:27 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 22/72] target/riscv: rvv-1.0: amo operations
Date: Tue, 12 Jan 2021 17:38:56 +0800
Message-Id: <20210112093950.17530-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:41:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 100 +++++++---
 target/riscv/insn32-64.decode           |  18 +-
 target/riscv/insn32.decode              |  36 +++-
 target/riscv/insn_trans/trans_rvv.c.inc | 229 +++++++++++++++--------
 target/riscv/vector_helper.c            | 232 ++++++++++++++++--------
 5 files changed, 414 insertions(+), 201 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5eb2404a75a..b3fa28d4354 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -140,36 +140,80 @@ DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
 
+DEF_HELPER_6(vamoswapei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
 #ifdef TARGET_RISCV64
-DEF_HELPER_6(vamoswapw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoswapd_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxorw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxord_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoorw_v_d,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoord_v_d,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomind_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominud_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxud_v_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei64_32_v,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorei64_64_v,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
 #endif
-DEF_HELPER_6(vamoswapw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxorw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoorw_v_w,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-
 DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 8157dee8b7c..67ddb184a47 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -58,15 +58,15 @@ amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
 amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
 
 #*** Vector AMO operations (in addition to Zvamo) ***
-vamoswapd_v     00001 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoaddd_v      00000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoxord_v      00100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoandd_v      01100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoord_v       01000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoswapei64_v  00001 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoaddei64_v   00000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoxorei64_v   00100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoandei64_v   01100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoorei64_v    01000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamominei64_v   10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomaxei64_v   10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamominuei64_v  11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomaxuei64_v  11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 
 # *** RV64F Standard Extension (in addition to RV32F) ***
 fcvt_l_s   1100000  00010 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9e4fe72560b..2047f23bd62 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -279,15 +279,33 @@ vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
 vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
 
 #*** Vector AMO operations are encoded under the standard AMO major opcode ***
-vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoaddw_v      00000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoxorw_v      00100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoandw_v      01100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoorw_v       01000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamominw_v      10000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamomaxw_v      10100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamominuw_v     11000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamomaxuw_v     11100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoswapei8_v   00001 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamoswapei16_v  00001 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamoswapei32_v  00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoaddei8_v    00000 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamoaddei16_v   00000 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamoaddei32_v   00000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoxorei8_v    00100 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamoxorei16_v   00100 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamoxorei32_v   00100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoandei8_v    01100 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamoandei16_v   01100 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamoandei32_v   01100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoorei8_v     01000 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamoorei16_v    01000 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamoorei32_v    01000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamominei8_v    10000 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamominei16_v   10000 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamominei32_v   10000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamomaxei8_v    10100 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamomaxei16_v   10100 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamomaxei32_v   10100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamominuei8_v   11000 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamominuei16_v  11000 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamominuei32_v  11000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamomaxuei8_v   11100 . . ..... ..... 000 ..... 0101111 @r_wdvm
+vamomaxuei16_v  11100 . . ..... ..... 101 ..... 0101111 @r_wdvm
+vamomaxuei32_v  11100 . . ..... ..... 110 ..... 0101111 @r_wdvm
 
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 20161b1ebe3..4c93f8a5c8e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -290,6 +290,52 @@ static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
     return ret;
 }
 
+/*
+ * Vector AMO check function.
+ *
+ * Rules to be checked here:
+ *   1. RVA must supported.
+ *   2. AMO can either operations on 64-bit (RV64 only) or 32-bit words
+ *      in memory:
+ *      For RV32: 32 <= SEW <= 32, EEW <= 32.
+ *      For RV64: 32 <= SEW <= 64, EEW <= 64.
+ *   3. Destination vector register number is multiples of LMUL.
+ *      (Section 3.3.2, 8)
+ *   4. Address vector register number is multiples of EMUL.
+ *      (Section 3.3.2, 8)
+ *   5. EMUL must within the range: 1/8 <= EMUL <= 8. (Section 7.3)
+ *   6. If wd = 1:
+ *      6.1. Destination vector register group for a masked vector
+ *           instruction cannot overlap the source mask register (v0).
+ *           (Section 5.3)
+ *      6.2. Destination vector register cannot overlap a source vector
+ *           register (vs2) group.
+ *           (Section 5.2)
+ */
+static bool vext_check_amo(DisasContext *s, int vd, int vs2,
+                           int wd, int vm, uint8_t eew)
+{
+    int8_t emul = eew - s->sew + s->lmul;
+    bool ret = has_ext(s, RVA) &&
+               (1 << s->sew >= 4) &&
+               (1 << s->sew <= sizeof(target_ulong)) &&
+               (eew <= (sizeof(target_ulong) << 3))  &&
+               require_align(vd, s->lmul) &&
+               require_align(vs2, emul) &&
+               (emul >= -3 && emul <= 3);
+    if (wd) {
+        ret &= require_vm(vm, vd);
+        if (eew > s->sew) {
+            if (vd != vs2) {
+                ret &= require_noover(vd, s->lmul, vs2, emul);
+            }
+        } else if (eew < s->sew) {
+            ret &= require_noover(vd, s->lmul, vs2, emul);
+        }
+    }
+    return ret;
+}
+
 static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 {
     return require_vm(vm, vd) &&
@@ -1007,104 +1053,129 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     return true;
 }
 
-static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
+static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t eew, uint8_t seq)
 {
     uint32_t data = 0;
     gen_helper_amo *fn;
-    static gen_helper_amo *const fnsw[9] = {
-        /* no atomic operation */
-        gen_helper_vamoswapw_v_w,
-        gen_helper_vamoaddw_v_w,
-        gen_helper_vamoxorw_v_w,
-        gen_helper_vamoandw_v_w,
-        gen_helper_vamoorw_v_w,
-        gen_helper_vamominw_v_w,
-        gen_helper_vamomaxw_v_w,
-        gen_helper_vamominuw_v_w,
-        gen_helper_vamomaxuw_v_w
-    };
+    static gen_helper_amo *const fns[36][2] = {
+        { gen_helper_vamoswapei8_32_v, gen_helper_vamoswapei8_64_v },
+        { gen_helper_vamoswapei16_32_v, gen_helper_vamoswapei16_64_v },
+        { gen_helper_vamoswapei32_32_v, gen_helper_vamoswapei32_64_v },
+        { gen_helper_vamoaddei8_32_v, gen_helper_vamoaddei8_64_v },
+        { gen_helper_vamoaddei16_32_v, gen_helper_vamoaddei16_64_v },
+        { gen_helper_vamoaddei32_32_v, gen_helper_vamoaddei32_64_v },
+        { gen_helper_vamoxorei8_32_v, gen_helper_vamoxorei8_64_v },
+        { gen_helper_vamoxorei16_32_v, gen_helper_vamoxorei16_64_v },
+        { gen_helper_vamoxorei32_32_v, gen_helper_vamoxorei32_64_v },
+        { gen_helper_vamoandei8_32_v, gen_helper_vamoandei8_64_v },
+        { gen_helper_vamoandei16_32_v, gen_helper_vamoandei16_64_v },
+        { gen_helper_vamoandei32_32_v, gen_helper_vamoandei32_64_v },
+        { gen_helper_vamoorei8_32_v, gen_helper_vamoorei8_64_v },
+        { gen_helper_vamoorei16_32_v, gen_helper_vamoorei16_64_v },
+        { gen_helper_vamoorei32_32_v, gen_helper_vamoorei32_64_v },
+        { gen_helper_vamominei8_32_v, gen_helper_vamominei8_64_v },
+        { gen_helper_vamominei16_32_v, gen_helper_vamominei16_64_v },
+        { gen_helper_vamominei32_32_v, gen_helper_vamominei32_64_v },
+        { gen_helper_vamomaxei8_32_v, gen_helper_vamomaxei8_64_v },
+        { gen_helper_vamomaxei16_32_v, gen_helper_vamomaxei16_64_v },
+        { gen_helper_vamomaxei32_32_v, gen_helper_vamomaxei32_64_v },
+        { gen_helper_vamominuei8_32_v, gen_helper_vamominuei8_64_v },
+        { gen_helper_vamominuei16_32_v, gen_helper_vamominuei16_64_v },
+        { gen_helper_vamominuei32_32_v, gen_helper_vamominuei32_64_v },
+        { gen_helper_vamomaxuei8_32_v, gen_helper_vamomaxuei8_64_v },
+        { gen_helper_vamomaxuei16_32_v, gen_helper_vamomaxuei16_64_v },
+        { gen_helper_vamomaxuei32_32_v, gen_helper_vamomaxuei32_64_v },
 #ifdef TARGET_RISCV64
-    static gen_helper_amo *const fnsd[18] = {
-        gen_helper_vamoswapw_v_d,
-        gen_helper_vamoaddw_v_d,
-        gen_helper_vamoxorw_v_d,
-        gen_helper_vamoandw_v_d,
-        gen_helper_vamoorw_v_d,
-        gen_helper_vamominw_v_d,
-        gen_helper_vamomaxw_v_d,
-        gen_helper_vamominuw_v_d,
-        gen_helper_vamomaxuw_v_d,
-        gen_helper_vamoswapd_v_d,
-        gen_helper_vamoaddd_v_d,
-        gen_helper_vamoxord_v_d,
-        gen_helper_vamoandd_v_d,
-        gen_helper_vamoord_v_d,
-        gen_helper_vamomind_v_d,
-        gen_helper_vamomaxd_v_d,
-        gen_helper_vamominud_v_d,
-        gen_helper_vamomaxud_v_d
-    };
+        { gen_helper_vamoswapei64_32_v, gen_helper_vamoswapei64_64_v },
+        { gen_helper_vamoaddei64_32_v, gen_helper_vamoaddei64_64_v },
+        { gen_helper_vamoxorei64_32_v, gen_helper_vamoxorei64_64_v },
+        { gen_helper_vamoandei64_32_v, gen_helper_vamoandei64_64_v },
+        { gen_helper_vamoorei64_32_v, gen_helper_vamoorei64_64_v },
+        { gen_helper_vamominei64_32_v, gen_helper_vamominei64_64_v },
+        { gen_helper_vamomaxei64_32_v, gen_helper_vamomaxei64_64_v },
+        { gen_helper_vamominuei64_32_v, gen_helper_vamominuei64_64_v },
+        { gen_helper_vamomaxuei64_32_v, gen_helper_vamomaxuei64_64_v }
+#else
+        { NULL, NULL }, { NULL, NULL }, { NULL, NULL }, { NULL, NULL },
+        { NULL, NULL }, { NULL, NULL }, { NULL, NULL }, { NULL, NULL },
+        { NULL, NULL }
 #endif
+    };
 
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_exit_atomic(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         return true;
-    } else {
-        if (s->sew == 3) {
-#ifdef TARGET_RISCV64
-            fn = fnsd[seq];
-#else
-            /* Check done in amo_check(). */
-            g_assert_not_reached();
-#endif
-        } else {
-            assert(seq < ARRAY_SIZE(fnsw));
-            fn = fnsw[seq];
-        }
+    }
+
+    fn = fns[seq][s->sew - 2];
+    if (fn == NULL) {
+        return false;
     }
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, WD, a->wd);
     return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
 }
+
+static bool amo_check(DisasContext *s, arg_rwdvm* a, uint8_t eew)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_amo(s, a->rd, a->rs2, a->wd, a->vm, eew);
+}
+
+#define GEN_VEXT_AMO_TRANS(NAME, EEW, SEQ, ARGTYPE, OP, CHECK) \
+static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a)   \
+{                                                              \
+    if (CHECK(s, a, EEW)) {                                    \
+        return OP(s, a, EEW, SEQ);                             \
+    }                                                          \
+    return false;                                              \
+}
+
+GEN_VEXT_AMO_TRANS(vamoswapei8_v,  MO_8,  0,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoswapei16_v, MO_16, 1,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoswapei32_v, MO_32, 2,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoaddei8_v,   MO_8,  3,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoaddei16_v,  MO_16, 4,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoaddei32_v,  MO_32, 5,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoxorei8_v,   MO_8,  6,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoxorei16_v,  MO_16, 7,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoxorei32_v,  MO_32, 8,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoandei8_v,   MO_8,  9,  rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoandei16_v,  MO_16, 10, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoandei32_v,  MO_32, 11, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoorei8_v,    MO_8,  12, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoorei16_v,   MO_16, 13, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoorei32_v,   MO_32, 14, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominei8_v,   MO_8,  15, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominei16_v,  MO_16, 16, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominei32_v,  MO_32, 17, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxei8_v,   MO_8,  18, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxei16_v,  MO_16, 19, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxei32_v,  MO_32, 20, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominuei8_v,  MO_8,  21, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominuei16_v, MO_16, 22, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominuei32_v, MO_32, 23, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxuei8_v,  MO_8,  24, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxuei16_v, MO_16, 25, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxuei32_v, MO_32, 26, rwdvm, amo_op, amo_check)
+
 /*
- * There are two rules check here.
- *
- * 1. SEW must be at least as wide as the AMO memory element size.
- *
- * 2. If SEW is greater than XLEN, an illegal instruction exception is raised.
+ * Index EEW cannot be greater than XLEN,
+ * else an illegal instruction is raised (Section 8)
  */
-static bool amo_check(DisasContext *s, arg_rwdvm* a)
-{
-    return (!s->vill && has_ext(s, RVA) &&
-            (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            ((1 << s->sew) <= sizeof(target_ulong)) &&
-            ((1 << s->sew) >= 4));
-}
-
-GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoaddw_v, 1, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoxorw_v, 2, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoandw_v, 3, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoorw_v, 4, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominw_v, 5, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxw_v, 6, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominuw_v, 7, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxuw_v, 8, rwdvm, amo_op, amo_check)
 #ifdef TARGET_RISCV64
-GEN_VEXT_TRANS(vamoswapd_v, 9, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoaddd_v, 10, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoxord_v, 11, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoandd_v, 12, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoord_v, 13, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomind_v, 14, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxd_v, 15, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominud_v, 16, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoswapei64_v, MO_64, 27, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoaddei64_v,  MO_64, 28, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoxorei64_v,  MO_64, 29, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoandei64_v,  MO_64, 30, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamoorei64_v,   MO_64, 31, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominei64_v,  MO_64, 32, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxei64_v,  MO_64, 33, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamominuei64_v, MO_64, 34, rwdvm, amo_op, amo_check)
+GEN_VEXT_AMO_TRANS(vamomaxuei64_v, MO_64, 35, rwdvm, amo_op, amo_check)
 #endif
 
 /*
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fd398af8550..743883449a4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -541,23 +541,22 @@ typedef void vext_amo_noatomic_fn(void *vs3, target_ulong addr,
                                   uint32_t wd, uint32_t idx, CPURISCVState *env,
                                   uintptr_t retaddr);
 
-/* no atomic opreation for vector atomic insructions */
+/* no atomic operation for vector atomic instructions */
 #define DO_SWAP(N, M) (M)
 #define DO_AND(N, M)  (N & M)
 #define DO_XOR(N, M)  (N ^ M)
 #define DO_OR(N, M)   (N | M)
 #define DO_ADD(N, M)  (N + M)
+#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
+#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
 
-#define GEN_VEXT_AMO_NOATOMIC_OP(NAME, ESZ, MSZ, H, DO_OP, SUF) \
+#define GEN_VEXT_AMO_NOATOMIC_OP(NAME, MTYPE, H, DO_OP, SUF)    \
 static void                                                     \
 vext_##NAME##_noatomic_op(void *vs3, target_ulong addr,         \
                           uint32_t wd, uint32_t idx,            \
                           CPURISCVState *env, uintptr_t retaddr)\
 {                                                               \
-    typedef int##ESZ##_t ETYPE;                                 \
-    typedef int##MSZ##_t MTYPE;                                 \
-    typedef uint##MSZ##_t UMTYPE __attribute__((unused));       \
-    ETYPE *pe3 = (ETYPE *)vs3 + H(idx);                         \
+    MTYPE *pe3 = (MTYPE *)vs3 + H(idx);                         \
     MTYPE  a = cpu_ld##SUF##_data(env, addr), b = *pe3;         \
                                                                 \
     cpu_st##SUF##_data(env, addr, DO_OP(a, b));                 \
@@ -566,42 +565,79 @@ vext_##NAME##_noatomic_op(void *vs3, target_ulong addr,         \
     }                                                           \
 }
 
-/* Signed min/max */
-#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
-#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
-
-/* Unsigned min/max */
-#define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
-#define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
-
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_w, 32, 32, H4, DO_SWAP, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_w,  32, 32, H4, DO_ADD,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_w,  32, 32, H4, DO_XOR,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_w,  32, 32, H4, DO_AND,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_w,   32, 32, H4, DO_OR,   l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_w,  32, 32, H4, DO_MIN,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_w,  32, 32, H4, DO_MAX,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_w, 32, 32, H4, DO_MINU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_w, 32, 32, H4, DO_MAXU, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei8_32_v,  uint32_t, H4, DO_SWAP, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei8_64_v,  uint64_t, H8, DO_SWAP, q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei16_32_v, uint32_t, H4, DO_SWAP, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei16_64_v, uint64_t, H8, DO_SWAP, q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei32_32_v, uint32_t, H4, DO_SWAP, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei32_64_v, uint64_t, H8, DO_SWAP, q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei8_32_v,   uint32_t, H4, DO_ADD,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei8_64_v,   uint64_t, H8, DO_ADD,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei16_32_v,  uint32_t, H4, DO_ADD,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei16_64_v,  uint64_t, H8, DO_ADD,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei32_32_v,  uint32_t, H4, DO_ADD,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei32_64_v,  uint64_t, H8, DO_ADD,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei8_32_v,   uint32_t, H4, DO_XOR,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei8_64_v,   uint64_t, H8, DO_XOR,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei16_32_v,  uint32_t, H4, DO_XOR,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei16_64_v,  uint64_t, H8, DO_XOR,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei32_32_v,  uint32_t, H4, DO_XOR,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei32_64_v,  uint64_t, H8, DO_XOR,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei8_32_v,   uint32_t, H4, DO_AND,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei8_64_v,   uint64_t, H8, DO_AND,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei16_32_v,  uint32_t, H4, DO_AND,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei16_64_v,  uint64_t, H8, DO_AND,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei32_32_v,  uint32_t, H4, DO_AND,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei32_64_v,  uint64_t, H8, DO_AND,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei8_32_v,    uint32_t, H4, DO_OR,   l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei8_64_v,    uint64_t, H8, DO_OR,   q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei16_32_v,   uint32_t, H4, DO_OR,   l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei16_64_v,   uint64_t, H8, DO_OR,   q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei32_32_v,   uint32_t, H4, DO_OR,   l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei32_64_v,   uint64_t, H8, DO_OR,   q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei8_32_v,   int32_t,  H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei8_64_v,   int64_t,  H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei16_32_v,  int32_t,  H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei16_64_v,  int64_t,  H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei32_32_v,  int32_t,  H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei32_64_v,  int64_t,  H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei8_32_v,   int32_t,  H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei8_64_v,   int64_t,  H8, DO_MAX,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei16_32_v,  int32_t,  H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei16_64_v,  int64_t,  H8, DO_MAX,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei32_32_v,  int32_t,  H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei32_64_v,  int64_t,  H8, DO_MAX,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei8_32_v,  uint32_t, H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei8_64_v,  uint64_t, H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei16_32_v, uint32_t, H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei16_64_v, uint64_t, H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei32_32_v, uint32_t, H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei32_64_v, uint64_t, H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei8_32_v,  uint32_t, H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei8_64_v,  uint64_t, H8, DO_MAX,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei16_32_v, uint32_t, H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei16_64_v, uint64_t, H8, DO_MAX,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei32_32_v, uint32_t, H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei32_64_v, uint64_t, H8, DO_MAX,  q)
 #ifdef TARGET_RISCV64
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_d, 64, 32, H8, DO_SWAP, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapd_v_d, 64, 64, H8, DO_SWAP, q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_d,  64, 32, H8, DO_ADD,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddd_v_d,  64, 64, H8, DO_ADD,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_d,  64, 32, H8, DO_XOR,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxord_v_d,  64, 64, H8, DO_XOR,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_d,  64, 32, H8, DO_AND,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandd_v_d,  64, 64, H8, DO_AND,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_d,   64, 32, H8, DO_OR,   l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoord_v_d,   64, 64, H8, DO_OR,   q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_d,  64, 32, H8, DO_MIN,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomind_v_d,  64, 64, H8, DO_MIN,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_d,  64, 32, H8, DO_MAX,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxd_v_d,  64, 64, H8, DO_MAX,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_d, 64, 32, H8, DO_MINU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominud_v_d, 64, 64, H8, DO_MINU, q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_d, 64, 32, H8, DO_MAXU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxud_v_d, 64, 64, H8, DO_MAXU, q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei64_32_v, uint32_t, H4, DO_SWAP, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapei64_64_v, uint64_t, H8, DO_SWAP, q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei64_32_v,  uint32_t, H4, DO_ADD,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddei64_64_v,  uint64_t, H8, DO_ADD,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei64_32_v,  uint32_t, H4, DO_XOR,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorei64_64_v,  uint64_t, H8, DO_XOR,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei64_32_v,  uint32_t, H4, DO_AND,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandei64_64_v,  uint64_t, H8, DO_AND,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei64_32_v,   uint32_t, H4, DO_OR,   l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorei64_64_v,   uint64_t, H8, DO_OR,   q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei64_32_v,  int32_t,  H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominei64_64_v,  int64_t,  H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei64_32_v,  int32_t,  H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxei64_64_v,  int64_t,  H8, DO_MAX,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei64_32_v, uint32_t, H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuei64_64_v, uint64_t, H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei64_32_v, uint32_t, H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuei64_64_v, uint64_t, H8, DO_MAX,  q)
 #endif
 
 static inline void
@@ -609,7 +645,7 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
                   void *vs2, CPURISCVState *env, uint32_t desc,
                   vext_get_index_addr get_index_addr,
                   vext_amo_noatomic_fn *noatomic_op,
-                  uint32_t esz, uint32_t msz, uintptr_t ra)
+                  uint32_t esz, uintptr_t ra)
 {
     uint32_t i;
     target_long addr;
@@ -620,8 +656,8 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_LOAD);
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_STORE);
+        probe_pages(env, get_index_addr(base, i, vs2), esz, ra, MMU_DATA_LOAD);
+        probe_pages(env, get_index_addr(base, i, vs2), esz, ra, MMU_DATA_STORE);
     }
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -632,45 +668,89 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
     }
 }
 
-#define GEN_VEXT_AMO(NAME, MTYPE, ETYPE, INDEX_FN)              \
+#define GEN_VEXT_AMO(NAME, ETYPE, INDEX_FN)                     \
 void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     vext_amo_noatomic(vs3, v0, base, vs2, env, desc,            \
                       INDEX_FN, vext_##NAME##_noatomic_op,      \
-                      sizeof(ETYPE), sizeof(MTYPE),             \
-                      GETPC());                                 \
-}
-
+                      sizeof(ETYPE), GETPC());                  \
+}
+
+GEN_VEXT_AMO(vamoswapei8_32_v,  int32_t, idx_b)
+GEN_VEXT_AMO(vamoswapei8_64_v,  int64_t, idx_b)
+GEN_VEXT_AMO(vamoswapei16_32_v, int32_t, idx_h)
+GEN_VEXT_AMO(vamoswapei16_64_v, int64_t, idx_h)
+GEN_VEXT_AMO(vamoswapei32_32_v, int32_t, idx_w)
+GEN_VEXT_AMO(vamoswapei32_64_v, int64_t, idx_w)
+GEN_VEXT_AMO(vamoaddei8_32_v,   int32_t, idx_b)
+GEN_VEXT_AMO(vamoaddei8_64_v,   int64_t, idx_b)
+GEN_VEXT_AMO(vamoaddei16_32_v,  int32_t, idx_h)
+GEN_VEXT_AMO(vamoaddei16_64_v,  int64_t, idx_h)
+GEN_VEXT_AMO(vamoaddei32_32_v,  int32_t, idx_w)
+GEN_VEXT_AMO(vamoaddei32_64_v,  int64_t, idx_w)
+GEN_VEXT_AMO(vamoxorei8_32_v,   int32_t, idx_b)
+GEN_VEXT_AMO(vamoxorei8_64_v,   int64_t, idx_b)
+GEN_VEXT_AMO(vamoxorei16_32_v,  int32_t, idx_h)
+GEN_VEXT_AMO(vamoxorei16_64_v,  int64_t, idx_h)
+GEN_VEXT_AMO(vamoxorei32_32_v,  int32_t, idx_w)
+GEN_VEXT_AMO(vamoxorei32_64_v,  int64_t, idx_w)
+GEN_VEXT_AMO(vamoandei8_32_v,   int32_t, idx_b)
+GEN_VEXT_AMO(vamoandei8_64_v,   int64_t, idx_b)
+GEN_VEXT_AMO(vamoandei16_32_v,  int32_t, idx_h)
+GEN_VEXT_AMO(vamoandei16_64_v,  int64_t, idx_h)
+GEN_VEXT_AMO(vamoandei32_32_v,  int32_t, idx_w)
+GEN_VEXT_AMO(vamoandei32_64_v,  int64_t, idx_w)
+GEN_VEXT_AMO(vamoorei8_32_v,    int32_t, idx_b)
+GEN_VEXT_AMO(vamoorei8_64_v,    int64_t, idx_b)
+GEN_VEXT_AMO(vamoorei16_32_v,   int32_t, idx_h)
+GEN_VEXT_AMO(vamoorei16_64_v,   int64_t, idx_h)
+GEN_VEXT_AMO(vamoorei32_32_v,   int32_t, idx_w)
+GEN_VEXT_AMO(vamoorei32_64_v,   int64_t, idx_w)
+GEN_VEXT_AMO(vamominei8_32_v,   int32_t, idx_b)
+GEN_VEXT_AMO(vamominei8_64_v,   int64_t, idx_b)
+GEN_VEXT_AMO(vamominei16_32_v,  int32_t, idx_h)
+GEN_VEXT_AMO(vamominei16_64_v,  int64_t, idx_h)
+GEN_VEXT_AMO(vamominei32_32_v,  int32_t, idx_w)
+GEN_VEXT_AMO(vamominei32_64_v,  int64_t, idx_w)
+GEN_VEXT_AMO(vamomaxei8_32_v,   int32_t, idx_b)
+GEN_VEXT_AMO(vamomaxei8_64_v,   int64_t, idx_b)
+GEN_VEXT_AMO(vamomaxei16_32_v,  int32_t, idx_h)
+GEN_VEXT_AMO(vamomaxei16_64_v,  int64_t, idx_h)
+GEN_VEXT_AMO(vamomaxei32_32_v,  int32_t, idx_w)
+GEN_VEXT_AMO(vamomaxei32_64_v,  int64_t, idx_w)
+GEN_VEXT_AMO(vamominuei8_32_v,  int32_t, idx_b)
+GEN_VEXT_AMO(vamominuei8_64_v,  int64_t, idx_b)
+GEN_VEXT_AMO(vamominuei16_32_v, int32_t, idx_h)
+GEN_VEXT_AMO(vamominuei16_64_v, int64_t, idx_h)
+GEN_VEXT_AMO(vamominuei32_32_v, int32_t, idx_w)
+GEN_VEXT_AMO(vamominuei32_64_v, int64_t, idx_w)
+GEN_VEXT_AMO(vamomaxuei8_32_v,  int32_t, idx_b)
+GEN_VEXT_AMO(vamomaxuei8_64_v,  int64_t, idx_b)
+GEN_VEXT_AMO(vamomaxuei16_32_v, int32_t, idx_h)
+GEN_VEXT_AMO(vamomaxuei16_64_v, int64_t, idx_h)
+GEN_VEXT_AMO(vamomaxuei32_32_v, int32_t, idx_w)
+GEN_VEXT_AMO(vamomaxuei32_64_v, int64_t, idx_w)
 #ifdef TARGET_RISCV64
-GEN_VEXT_AMO(vamoswapw_v_d, int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoswapd_v_d, int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoaddw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoaddd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoxorw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoxord_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoandw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoandd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoorw_v_d,   int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoord_v_d,   int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamominw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomind_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomaxw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomaxd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamominuw_v_d, uint32_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamominud_v_d, uint64_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamomaxuw_v_d, uint32_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamomaxud_v_d, uint64_t, uint64_t, idx_d)
+GEN_VEXT_AMO(vamoswapei64_32_v, int32_t, idx_d)
+GEN_VEXT_AMO(vamoswapei64_64_v, int64_t, idx_d)
+GEN_VEXT_AMO(vamoaddei64_32_v,  int32_t, idx_d)
+GEN_VEXT_AMO(vamoaddei64_64_v,  int64_t, idx_d)
+GEN_VEXT_AMO(vamoxorei64_32_v,  int32_t, idx_d)
+GEN_VEXT_AMO(vamoxorei64_64_v,  int64_t, idx_d)
+GEN_VEXT_AMO(vamoandei64_32_v,  int32_t, idx_d)
+GEN_VEXT_AMO(vamoandei64_64_v,  int64_t, idx_d)
+GEN_VEXT_AMO(vamoorei64_32_v,   int32_t, idx_d)
+GEN_VEXT_AMO(vamoorei64_64_v,   int64_t, idx_d)
+GEN_VEXT_AMO(vamominei64_32_v,  int32_t, idx_d)
+GEN_VEXT_AMO(vamominei64_64_v,  int64_t, idx_d)
+GEN_VEXT_AMO(vamomaxei64_32_v,  int32_t, idx_d)
+GEN_VEXT_AMO(vamomaxei64_64_v,  int64_t, idx_d)
+GEN_VEXT_AMO(vamominuei64_32_v, int32_t, idx_d)
+GEN_VEXT_AMO(vamominuei64_64_v, int64_t, idx_d)
+GEN_VEXT_AMO(vamomaxuei64_32_v, int32_t, idx_d)
+GEN_VEXT_AMO(vamomaxuei64_64_v, int64_t, idx_d)
 #endif
-GEN_VEXT_AMO(vamoswapw_v_w, int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoaddw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoxorw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoandw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoorw_v_w,   int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamominw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamomaxw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamominuw_v_w, uint32_t, uint32_t, idx_w)
-GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w)
 
 /*
  *** Vector Integer Arithmetic Instructions
-- 
2.17.1


