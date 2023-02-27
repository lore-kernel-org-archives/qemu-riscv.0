Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWIe-0004o6-7B
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIM-0004LW-Gb
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:30 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIK-000505-IW
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:30 -0500
Received: by mail-pg1-x533.google.com with SMTP id 132so2822223pgh.13
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayfqorD9uX7/Vi+5yV/fsV6QKxxs5QiH623wECf/tb4=;
 b=dVxpBUlM768pnD18AqVBmiwPTby3CHGQ7bD6WZ9QbnuRlNs1V+WfpQHcEYNtGBBAoM
 XoF6lRZ0qQgrjyowHaAM5oO1OEb4/4UA5Fnf4EkEoJ0LwIDSa0kzz5nHGQ9VRrCxgByd
 gtgcAABUlf+XZvvSzyrOa2xX3Og6evcgTx50F+eqHL97b6jtG70d/lj76wXepkO19FWP
 P49nKe2+9tFNJffo56BEn4krwxlyMh+cI5WLJaoBCUTNpx+IO5Uk0gPGH0M1Ntl/lxgm
 gTi/yObaJG5w5oMErv431mh1/8jIZ51xNYGDLnESLdv0PzBRgMWzyUD2LWoLGQPD9zQQ
 SOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayfqorD9uX7/Vi+5yV/fsV6QKxxs5QiH623wECf/tb4=;
 b=8JHo8ZqGEbPxlB1ARYEr9BGDwlo760y28yOw+9MGZwj7SgexhISLF0HpcJm8vp8JGS
 OT/+9oWDgANrMZlwr4DBM4unDp5IPcZBMFIOdjh55OoI8wtujAZ/RRzLqb7jOn+Mvztm
 NNIm72Isj9Th2f/T3zjCsZsi4h/AR2yverX5RTozAt95cfcgkJWfRDHaawWln+zvUj70
 9AypIi4MzI7W2yb3X7LSuFKh22N43GnjaMMqLU1ef0cHbzOD7SKaUy+3MeI5V7aKRaJG
 XmA4W3W5hOjMEHJc3uE3bO9cGwIAZ7TRoBpCkfZJiOMy6BJIJy9ngx518tWx3pnrc4Kc
 DRaA==
X-Gm-Message-State: AO0yUKV57WcTxSKeNoFDpiHQF2UWYOroodQm/Q2k5DBdUKInY6WX6CrG
 FpFjPoibPClGhwUA3AcC49GO+g==
X-Google-Smtp-Source: AK7set+5BcWuOnayQ3zbvQQt336ztKI2i35s1OOYBp/OczESlQviKYMJ0Xqu+u8D/V/blIZQh+TSXQ==
X-Received: by 2002:a62:17ce:0:b0:5a8:abd2:2beb with SMTP id
 197-20020a6217ce000000b005a8abd22bebmr19633529pfx.30.1677476607602; 
 Sun, 26 Feb 2023 21:43:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 16/70] target/hexagon/idef-parser: Use gen_tmp for LPCFG
Date: Sun, 26 Feb 2023 19:41:39 -1000
Message-Id: <20230227054233.390271-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:30 -0000

The GET_USR_FIELD macro initializes the output, so the initial assignment
of zero is discarded.  This is the only use of get_tmp_value outside of
parser-helper.c, so make it static.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.h | 6 ------
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 target/hexagon/idef-parser/idef-parser.y    | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.h b/target/hexagon/idef-parser/parser-helpers.h
index 4c89498f5b..1239d23a6a 100644
--- a/target/hexagon/idef-parser/parser-helpers.h
+++ b/target/hexagon/idef-parser/parser-helpers.h
@@ -154,12 +154,6 @@ HexValue gen_tmp(Context *c,
                  unsigned bit_width,
                  HexSignedness signedness);
 
-HexValue gen_tmp_value(Context *c,
-                       YYLTYPE *locp,
-                       const char *value,
-                       unsigned bit_width,
-                       HexSignedness signedness);
-
 HexValue gen_imm_value(Context *c __attribute__((unused)),
                        YYLTYPE *locp,
                        int value,
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 6fb5f31cf7..be979dac86 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -305,7 +305,7 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-HexValue gen_tmp_value(Context *c,
+static HexValue gen_tmp_value(Context *c,
                        YYLTYPE *locp,
                        const char *value,
                        unsigned bit_width,
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index fae291e5f8..c784726d41 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -783,7 +783,7 @@ rvalue : FAIL
          }
        | LPCFG
          {
-             $$ = gen_tmp_value(c, &@1, "0", 32, UNSIGNED);
+             $$ = gen_tmp(c, &@1, 32, UNSIGNED);
              OUT(c, &@1, "GET_USR_FIELD(USR_LPCFG, ", &$$, ");\n");
          }
        | EXTRACT '(' rvalue ',' rvalue ')'
-- 
2.34.1


