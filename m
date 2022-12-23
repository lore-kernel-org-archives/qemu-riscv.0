Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLl-0008DA-1t
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLX-00083L-I9
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:39 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLV-0003FA-NY
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:39 -0500
Received: by mail-ed1-x536.google.com with SMTP id m19so7989351edj.8
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e835tUOTw0674hyF7lfMR5M8ITOwu7+akRPZA19ciiY=;
 b=DtSHBu2Ybn39qrs6NzoYpNWLRt3KgF1DkDl+j02hDi1SkqY6lBepgnfrtmPkr688Q0
 c0AT/znldlSEu+d2Lutu2OsbmAA5sCmsCs1zx8IV/kE5ZM60yVDeC0LwC+ifAtm9+Cb2
 hcYNqgDECbctL1uhA4eTASmNSSQ5Bvbaj/fJ9L1JwXAuEZmbP9mE+xy6eFllNmYmkSHl
 jn1cBy7Z2XCsFbqdiosLXT6OKiiQ+7HIitdnZGE/YtRQEKSbjyp43iYxrlyfE5V9UjUt
 vrPqXSHqYUYoSkJraBDoPqecYSTAcz1U7bsvCsYh28do4MoXHp9JQcRQ4+ASbbBrS1lg
 9V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e835tUOTw0674hyF7lfMR5M8ITOwu7+akRPZA19ciiY=;
 b=3US3izE7ZIMxO2jkS1GcPdMJXe+lDAlD5usKkOOYXXRa4/+fnWw0bSBD1NMQE4719t
 jt/UgWHYuQOh8cOg3iTIsFCy2Jk3Mr/eTQlqYnbItj0HbiT2X7stqMjfxGckOpVAJ+AS
 ehx2GvRM7AO2u+FLlcFzZM59bkKGo+pZcEH0TlP1P84sgcuROZRCoZ3mg/Cadiy4NUQp
 ipUKYQQT/GzWQuxtyN2gnjK9a3e75EzmCXRJ3H9jjGESP8xuXdzaSXpBgXPvPq1kXBZc
 AGZi54pz6dSzRy5Nq36gPxlwYN1/nypTbdeHjtLd5qBEUBxo0MlSvyxTCoQCvBki0GQ9
 ET+Q==
X-Gm-Message-State: AFqh2koJVqNTw6iBc+YIbTFU1NlkTvZpKXhAvSqaDsQhL5Gg7+PD6jt3
 Qy9gvjZbwinWnN4cIBgVAvq2Li95zinXkIkg
X-Google-Smtp-Source: AMrXdXvlvF4mv7x5MzCJ2tRC5akMD/9L9DWCi6AnP69JkDYz8QUIuxsiCc/LXFqkCPHg3JwyG4SFsA==
X-Received: by 2002:aa7:c053:0:b0:482:e3b9:f46e with SMTP id
 k19-20020aa7c053000000b00482e3b9f46emr579088edo.39.1671818436537; 
 Fri, 23 Dec 2022 10:00:36 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:36 -0800 (PST)
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
Subject: [PATCH v2 12/15] RISC-V: Set minimum priv version for Zfh to 1.11
Date: Fri, 23 Dec 2022 19:00:12 +0100
Message-Id: <20221223180016.2068508-13-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 18:00:39 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

There are no differences for floating point instructions in priv version 1.11
and 1.12. There is also no dependency for Zfh to priv version 1.12.
Therefore allow Zfh to be enabled for priv version 1.11.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bb310755b1..a38127365e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -76,7 +76,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
-- 
2.38.1


