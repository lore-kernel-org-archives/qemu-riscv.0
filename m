Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLj-0008B7-A5
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLb-000860-Oy
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:44 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLZ-0003LJ-Ol
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:43 -0500
Received: by mail-ej1-x633.google.com with SMTP id u19so13511882ejm.8
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A091fo5W8PkEHGMIG03VCzd9hBQRXIHEyENCeV7AVKM=;
 b=J/QlgZlVubDO7nhpNxVvRSEwyz2rSdZ5V5sVf0nTeQo5tsjyhOEgmdYa/jkQLyds7X
 V9mvsZ0ZXhOnlybe4dyk6N5QqHLDrcgeZcTML1h8YsJdsmPyJs4kgn4q0XFObHSxTpTv
 w62PVrGTWiIR9fzgz7Gqqd898bbmhXMJ+tYtp1vIxEKPFJ988qr0ZwnphMTTjfz9kHLZ
 NjNNmbUNd+zYMBaG/vMtm1tlSWowNyudov5YwGMamHt/qe+H2ePNpgRFwa5Yl1D+7BBU
 y62RjSEXiV2E56YUjtAkb7hYCES+8vo/Xmgea8JwZ/2HyjMSKrXRDXK16i1hoE215R7S
 5SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A091fo5W8PkEHGMIG03VCzd9hBQRXIHEyENCeV7AVKM=;
 b=wuySRmqvgzbiVTW3FGjKWMPCeW3vKOXiltwVs4RNlLC96I5TAfOow+rml01AP0Qfnz
 LRreHbjzNc7ryvwtwM9tkHRpjBkowSRMmT3iRlrKIdf3FonRFI2b3aKYuR2bw99pevzk
 tWrlUi/V4+rVMM2Jp9+BperBmZrKO8lY2/lvgQ9CNz0CQOYsmfKWH3bQJKS0FwNoyV33
 RR2eWBrR3pJ/0Axuj9nIGJHyL8CQsm4TWAXD9RQXd+fK6c204WHlyRs4Flo4YQiJhZQJ
 m6TLRGtKoh6jLMZgsy+aHbqsyEIdPqRQwJ1Lk/qdXI8kIXosxZQwbRlZGoxRdJDT8BdI
 nyBQ==
X-Gm-Message-State: AFqh2kqzFSBJ8vEevYYjc6iocOGQ04gKzQpn01JRv6ihteykLEHv/dhw
 LhNmLagmUemp5+YJRyS94rWYTIg9oj73Z4z0
X-Google-Smtp-Source: AMrXdXuE3fQw21yjAGqwz57oBZNbSc36BvH8PlZMk9+egjP9LHKH+DxJIG7Q0jYXu/cPZFSAKZOOMw==
X-Received: by 2002:a17:907:20b0:b0:7d3:8159:f361 with SMTP id
 pw16-20020a17090720b000b007d38159f361mr8552914ejb.36.1671818440645; 
 Fri, 23 Dec 2022 10:00:40 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:40 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 15/15] target/riscv: add a MAINTAINERS entry for XThead*
 extension support
Date: Fri, 23 Dec 2022 19:00:15 +0100
Message-Id: <20221223180016.2068508-16-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 18:00:45 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

The XThead* extensions are maintained by T-Head and VRULL.
Adding a point of contact from both companies.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b270eb8e5b..38f3ab3772 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -294,6 +294,14 @@ F: include/hw/riscv/
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
2.38.1


