Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pU2uJ-0002zD-GC
	for mharc-qemu-riscv@gnu.org; Mon, 20 Feb 2023 04:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pU2uE-0002yP-3d
 for qemu-riscv@nongnu.org; Mon, 20 Feb 2023 04:56:22 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pU2uC-0006Aw-5R
 for qemu-riscv@nongnu.org; Mon, 20 Feb 2023 04:56:21 -0500
Received: by mail-ed1-x52e.google.com with SMTP id ec43so1789221edb.8
 for <qemu-riscv@nongnu.org>; Mon, 20 Feb 2023 01:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uNIXAIiCHY5tNHZQsSeZepuT/whFbyEot/ug3OODyTg=;
 b=X9uO8qcHF3OpVRLMoZg2JPIbSFntn2nSXulu05z23JNx1cTx+OyRIpCeQntMlVC6pA
 CCuZivQY266DZzpxB55yfVmOU5eXReS0ZFcEoP7GtZklr1Y+be/8V+3NNHVumWP8qH0P
 b7KM9nb+UTro5Jzs/4zMUGmvVH7iNgZ6bNY29pdff9lLUqnYGiiygj0etSzvROZrcpa9
 ooiWGs6T3lYvr2z0s2VHMuFLwjRN8nGn9R8aOvknj1y2mok0n6nDFg7aSwPglmsR+T6n
 /ZLM2PyaVMTlwS6u+WbuGvaoQiuqS/S+p7euqeTBQabzwm0sIcb9IeRo4cmQTFqI0/Tp
 mZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNIXAIiCHY5tNHZQsSeZepuT/whFbyEot/ug3OODyTg=;
 b=QW0PJsI3hFbULwnEiS9EC+RnrQAoMnbXII2QLZoRc6zlwxgr/4qEiX3a15sCW6JLeg
 +ZqpsZzVb176mrxN5ob9m84qU6mv8xf82woASrTovIZgwCRFZot0Il86KocG97xBqUXg
 67anFe2KLUn6pdr8oLzLfiLSvC7by90dkAVtpDQdm8fQHgg/synUghN1+tSr9aoflkdd
 ammBuCt+kpDsSbz+X8zOHNPk/pVk/VvoSHzedQwu+awJlqrsRyXYHNkY3WmRIM+jJpJx
 j4ZXbo86oERkxV7B5bvBvotW3X43dx93N0DwwTva4MYBXO6a6/RzMMI5waL+cnzSBFdI
 LYIw==
X-Gm-Message-State: AO0yUKU7UdAZmivkoTGtbnVS0btT0P30hWsgRqUz/VEUpH6no77vaW04
 2vWv+FbwqP08Igzm1Qekh+IuUehLC8S1qcMh
X-Google-Smtp-Source: AK7set8Kef4AJSjfQfV8dnaPq7FO4sWNJQrk7VYGViWLMugq676hNUu2NkOK+J0/uLARx24/9XQigg==
X-Received: by 2002:a17:906:f0d1:b0:888:5d34:dc79 with SMTP id
 dk17-20020a170906f0d100b008885d34dc79mr8817288ejb.40.1676886977527; 
 Mon, 20 Feb 2023 01:56:17 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 s6-20020a170906bc4600b008cfd5673f55sm1393050ejv.203.2023.02.20.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:56:16 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Manolis Tsamis <manolis.tsamis@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH] RISC-V: XTheadMemPair: Remove register restrictions for
 store-pair
Date: Mon, 20 Feb 2023 10:56:12 +0100
Message-Id: <20230220095612.1529031-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Mon, 20 Feb 2023 09:56:22 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

The XTheadMemPair does not define any restrictions for store-pair
instructions (th.sdd or th.swd). However, the current code enforces
the restrictions that are required for load-pair instructions.
Let's fix this by removing this code.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index be87c34f56..cf1731b08d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -980,10 +980,6 @@ static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
 static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
                              int shamt)
 {
-    if (a->rs == a->rd1 || a->rs == a->rd2 || a->rd1 == a->rd2) {
-        return false;
-    }
-
     TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
     TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
     TCGv addr1 = tcg_temp_new();
-- 
2.39.2


