Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMuzB-0000KW-El
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 13:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxj-0007O9-JW
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxg-0000sP-ET
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:31 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h12so15007429wrv.10
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 10:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztCilUCc1TA2sITRxRLcH39NMH4uHHWLjoD1hpEHldM=;
 b=HHdr0APGc0R2trybTu+MbqPOEm7cATaxupB+mYYCeERnN8vwG+36cLiLH3vaEUl0yo
 e+LzVKeXMKneJDO9SOVOOpPQ0LxxQatKGDbA6tEdmhZsq3BqYUzMRDhjMjYeCFyxLFZh
 qXf7m+pen559YpobL+BWv7Q9IOEo7anA3QNbbNWyI+23uPShoMJgHBC24rPk42W//5rb
 WeZtfNRZpkeD/TUgwNKat6sHYTx94ZBrUtf+b7m1W62vKmNmDU2ouWiylYKFqK5x6Vv1
 oimOknTJtXUSHzhaMFhfnpLgFp4q4LUDSXDy3OZ70aovqpEOAqzFG0uEUJxfKeNQije7
 VUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ztCilUCc1TA2sITRxRLcH39NMH4uHHWLjoD1hpEHldM=;
 b=5enfL1z+h5dWj3YtVQodO/fsHocxNyzW/FhNLsonvzf+4Pcn0fNsEUc9SPr/i4B1es
 PSkawbsAxY+vs9Lks8w1HPVR6//oIsZs2Xx1PiStyhdyumLl5i0uWxSYL3srvfk9q50m
 eqKPBd7uXSoOorW2PcOgVXUXGlzsOnrBM0u+qwZ1gEGdu3Ea3t/n4typVrG7exw/ibaD
 Xap1rNcgbp6ZDq3OabIv3AKxK7pRLocJgMsUkQxuQUYSpleUND/nJrAxLu27R/W6iHDR
 6TnP8902Pw4AxgnkEywBt2Ciju9Svvnc2LWu1Fg6jPQpwC6Nh8AKdn48xG04q5XSoXut
 pf7A==
X-Gm-Message-State: AO0yUKXf/AyReB6Foa7JQqpjoD/vWTejBOQl7pDsTFKTT/NYod0BpH3i
 zfVaQ88CTbC329YS8m5CSwU2RSkfL/ITCZuT
X-Google-Smtp-Source: AK7set90iIiA5ugZDNhIb3OjOGhVl4P+xci7QPo2AnJiySpu5Ar+mRCb62IJEMYsOgdQHJWggeH+cQ==
X-Received: by 2002:adf:a2d4:0:b0:2bf:cfb4:2e1 with SMTP id
 t20-20020adfa2d4000000b002bfcfb402e1mr15232951wra.45.1675188146121; 
 Tue, 31 Jan 2023 10:02:26 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:25 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 14/14] target/riscv: add a MAINTAINERS entry for XThead*
 extension support
Date: Tue, 31 Jan 2023 19:01:58 +0100
Message-Id: <20230131180158.2471047-15-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 18:02:32 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

The XThead* extensions are maintained by T-Head and VRULL.
Adding a point of contact from both companies.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..9dc0a2954e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,6 +295,14 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 
+RISC-V XThead* extensions
+M: Christoph Muellner <christoph.muellner@vrull.eu>
+M: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/insn_trans/trans_xthead.c.inc
+F: target/riscv/xthead*.decode
+
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
 L: qemu-riscv@nongnu.org
-- 
2.39.1


