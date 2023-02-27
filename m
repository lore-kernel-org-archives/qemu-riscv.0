Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWCX-0002br-Fn
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCV-0002LO-2y
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:27 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCS-0002YZ-4u
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:26 -0500
Received: by mail-pj1-x1032.google.com with SMTP id oj5so909332pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XU8chpWpCvoR0LbgkNVM0m0xLd7d7yoa5DmO6k+5Uys=;
 b=jGR7UdKMY/UbA5lgVk7nCTF7YagWYPZsq3IB/OyPg75G5Iks5qjF26nYjASzUTvW3Z
 HW9W3eNtoisAl3ao2DLpvh1QZ/O7lEyVbHoeZHeiE74oBxW69xV7zqvHjTiaGR2GlR2d
 M5j17PG0OZ2W/S4q92AoxxPunwUmozd3VL8LdKut0nmx+Tk0QXep1mLf0uAKHfMapa2d
 FOu8jiYFGAC3U7dO3UiJyL0mZS1SnLsTGzs9jkUwzxiQ6Yvk27WQ8ZwTwFIfvLZ5/WzR
 8FUMYYXZzPEJeUV+XS1OXyB0Nt+3WVqHkOROj4WJXoN7px8HlZ3K1iXZLYBxvbwl1hBl
 aBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XU8chpWpCvoR0LbgkNVM0m0xLd7d7yoa5DmO6k+5Uys=;
 b=hC74723adkGGrosTbl9lr2NfsWp9WtGvNpo+d6OLJIDsiN2v4xe9nk6j+lKKGRyGne
 VaBzQNAXL/cBGXp+M310YBfw1FTAXPyQtzk48NEskbkUjSnV4mGvKHfhUmgMzwgzVbOX
 EgDXPSdD5epbyEDu0clMkVi8OFsUiHfH+BVkNTecp4/xawl7Ec9oUcc4zqtoJcevYXHl
 VEkzmFcpaF4gDTRmXeryAVmUBD6/9NtjuV71gxfI2TKIoug9zmYPEw1utfC/uCfBHQbH
 M+ruD5OGWQo0tYZ+PbdIGTRqZhM6XPdixkdJYRn7u5+AGwJ5dXdgY8nQap1Iai5tSAXO
 PW7Q==
X-Gm-Message-State: AO0yUKVDkADGnhWPx7h29kmyOIKKWKn2WC7qmBT+dXOftDd+2NZdWFoK
 zgcRGbtIqWQ+RujBFRejzX6n1w==
X-Google-Smtp-Source: AK7set/zfjscwDuGYzZMIbEI/EKUD7R49MaabrWJq3sfdtD/qcIfKXYjraOr2QNTxJ3SG/td2Et5DQ==
X-Received: by 2002:a05:6a20:6a1d:b0:be:e0c3:5012 with SMTP id
 p29-20020a056a206a1d00b000bee0c35012mr7245340pzk.1.1677476242617; 
 Sun, 26 Feb 2023 21:37:22 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 06/31] tcg: Use noinline for major tcg_gen_code subroutines
Date: Sun, 26 Feb 2023 19:36:36 -1000
Message-Id: <20230227053701.368744-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:27 -0000

This makes it easier to assign blame with perf.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bf2af8b0fe..7ee935701a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2636,7 +2636,8 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 }
 
 /* Reachable analysis : remove unreachable code.  */
-static void reachable_code_pass(TCGContext *s)
+static void __attribute__((noinline))
+reachable_code_pass(TCGContext *s)
 {
     TCGOp *op, *op_next, *op_prev;
     bool dead = false;
@@ -2860,7 +2861,8 @@ static void la_cross_call(TCGContext *s, int nt)
 /* Liveness analysis : update the opc_arg_life array to tell if a
    given input arguments is dead. Instructions updating dead
    temporaries are removed. */
-static void liveness_pass_1(TCGContext *s)
+static void __attribute__((noinline))
+liveness_pass_1(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps = s->nb_temps;
@@ -3200,7 +3202,8 @@ static void liveness_pass_1(TCGContext *s)
 }
 
 /* Liveness analysis: Convert indirect regs to direct temporaries.  */
-static bool liveness_pass_2(TCGContext *s)
+static bool __attribute__((noinline))
+liveness_pass_2(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps, i;
-- 
2.34.1


