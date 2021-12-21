Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mziqL-0007DN-1P
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 12:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mziq7-0007Av-Rx
 for qemu-riscv@nongnu.org; Tue, 21 Dec 2021 12:22:15 -0500
Received: from [2607:f8b0:4864:20::436] (port=41816
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mzipv-0003X5-SL
 for qemu-riscv@nongnu.org; Tue, 21 Dec 2021 12:22:11 -0500
Received: by mail-pf1-x436.google.com with SMTP id m1so11307582pfk.8
 for <qemu-riscv@nongnu.org>; Tue, 21 Dec 2021 09:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AX5Uqk/UbIV8+j2aDXYKoqRM56uXBf9Z77XSisGhMfo=;
 b=QnOx5ReVrPkxcVI+GFFdF7S/T9jQzvdkMgQ6djUlZAXrroTc6GrBYfl1dVTGK9ilcV
 RtmttfXR/MG/+CKrIdbPx7GtAO9Cpr/qJ9kyDWhpkrL2O3AaxJzB8DqhqqbvqKyxRrzJ
 dFo1f0sKm4fu7j4aMBEOaQr3o7rOVg45Hoi8IfiWG1rDhjKDJcEgPQNbt/RxJf0buHWN
 lO1/PFsDBcWVJGtCGrilhcsBz6KsgfvEbm+7MtAan5CAnFSzViFgAc2lGR3HckuVN4m1
 ghldJVZHCccmW0+1FzpL0Bkk8krSo7t+1vLZdCLo9keKJwZHz3FIbBlQVrn3p5MxrPIk
 JeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AX5Uqk/UbIV8+j2aDXYKoqRM56uXBf9Z77XSisGhMfo=;
 b=8EtOIs8Dqj/5tIwPsxaJLPrOTOc3VeaJXyKFBYq/I7aNUH6R5cPvwrU71CxoIWfo5T
 EMBJg3Y3d3L6FcIxSf3m85BvaI56MXBros6yJcfbKOZVcMOndwNh0Yco1XV6UgXHYytj
 Imwg1DEtnSya6b5+zORnHhQUnB2wBLGx2yw3u0nCayUInMvdE9RRn9iMLrpTicHUNutv
 GxN1OOrB3WbPKl9vbk2goszBlQnkw//sT+jLsk1AkYz4q5yMPqYLlS+Bl6sffodVUmIT
 LsrE1fKcZCuRaktP81D5RmInyB0yPObEUpck06IH7W9JEq/4yM4IXQMjRhvcAfe6T+Ff
 tKJg==
X-Gm-Message-State: AOAM531QUk4UY+PVG3wTTF57mPV11LiiTmP52nl0UumNSOiktU5VcONS
 RheW7d1C5msu9gx9jt/jXxGeow==
X-Google-Smtp-Source: ABdhPJz1yoKU0BnENtSipkbaveKTsBMgV/rPC9/GmO43YFn0raAaawwlsSV4etlQITH+4nXCVGYlTg==
X-Received: by 2002:a63:606:: with SMTP id 6mr3828307pgg.359.1640107321871;
 Tue, 21 Dec 2021 09:22:01 -0800 (PST)
Received: from vineetg-ThinkPad-X1-Carbon-Gen-9.ba.rivosinc.com
 (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id k6sm3347964pjt.14.2021.12.21.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 09:22:01 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH] target/riscv: make H-extension non-experimental
Date: Tue, 21 Dec 2021 09:21:57 -0800
Message-Id: <20211221172157.2572503-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=vineetg@rivosinc.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 21 Dec 2021 17:22:16 -0000

H-ext v1.0 was ratified recently as part of Privileged Spec 1.12.
So move it out of experimental.

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bced8..a582179b1773 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -640,12 +640,12 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
-    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
+    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-- 
2.30.2


