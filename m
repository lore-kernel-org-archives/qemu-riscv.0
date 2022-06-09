Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz6e5-0006Fc-2b
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 21:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6e3-0006Em-MK; Wed, 08 Jun 2022 21:07:31 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6e2-0003vE-BK; Wed, 08 Jun 2022 21:07:31 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g205so19757676pfb.11;
 Wed, 08 Jun 2022 18:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHcmEsakeCZlslxgbgX5SfRpLAh3w58Fl6RLeUaqs8Q=;
 b=U637VaTplb4xNq/s6xlYgV54EgO9PuzOwmD0td//YhxT75CaFzCZR3jhQeW5wueFYc
 lYt7URHkCoehD4FZseju8w1CkCbb3vKhx/r8ZyzdXhzJ7MGh46t9IyZ/UvR3ZlldAMht
 OLHWMcgPGhw8YyPg7FqNT7wdierDXFOE5Ii6zRweEoj7spTozZhMjca/YfMvhhc0lVbk
 AUyE7U/SgVQo5409Ui4gtdoXsRQptxDwjCNcF2FYs9Qd3r/5ZRby3WmLCUpIFmOCzqQW
 gI8R9lgIxSgtp9I3Fs6ZhgowgDWr0RccxEY0hdraP69nYrVaeqj6TvnY4n4uBxszMh+B
 AY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHcmEsakeCZlslxgbgX5SfRpLAh3w58Fl6RLeUaqs8Q=;
 b=uyFShzp7ADERp041QFCXOXB+Xgn9XEcGfjCmVZi1I6xzCD2qI6DtuhF+swjojRbRnz
 qJ26Aw76fUUaMcxuRHz77QYhWpD40AHK8teV+GthzYLKo/clcwULfF46JNWieEXWmcCg
 Dn77NYaP8pOg1Op4bygMS6krsTe0gdpSExajoCV4bxkuupnAj6BdTriUTXFJ+XrD2x8o
 oqPxeMMAJNUnwV8PZ+igyVzJ98GwKIZT5qGIh7KBq9z3X3qq7SOlRlasO+7wkwtWbr8r
 eyGLp9thhXtsL3UW7pC+/UexcL0fmJfRTqwYGUBDFXm+p3yTeTSUkF/pxA1liXzYGV8s
 ydtQ==
X-Gm-Message-State: AOAM532qz9wWpLNT09K2us+16j8syk6uGqQ+gcwnrOGp4QmqgY21xyDC
 JiysPTq95JlclJb9DioOVu8=
X-Google-Smtp-Source: ABdhPJzv+LhXQRoziVDs3EOQiKC0Hwh80ZfqPtyaUohVuwtXIoTQOdieaZbanTA5r2Uro0TmcZC+sQ==
X-Received: by 2002:a63:84c3:0:b0:3fc:8c46:2447 with SMTP id
 k186-20020a6384c3000000b003fc8c462447mr31760523pgd.285.1654736848341; 
 Wed, 08 Jun 2022 18:07:28 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902f15500b001640e9f638esm15283402plb.51.2022.06.08.18.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 18:07:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 1/3] target/riscv: Remove the redundant initialization of
 env->misa_mxl
Date: Thu,  9 Jun 2022 09:07:22 +0800
Message-Id: <20220609010724.104033-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Jun 2022 01:07:32 -0000

env->misa_mxl was already set in the RISC-V cpu init routine, and
validated at the beginning of riscv_cpu_realize(). There is no need
to do a redundant initialization later.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a91253d4bd..61d1737741 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -752,7 +752,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             ext |= RVJ;
         }
 
-        set_misa(env, env->misa_mxl, ext);
+        env->misa_ext_mask = env->misa_ext = ext;
     }
 
     riscv_cpu_register_gdb_regs_for_features(cs);
-- 
2.34.1


