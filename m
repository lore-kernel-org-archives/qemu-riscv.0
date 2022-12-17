Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6b0j-0002Ps-0f
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 12:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0h-0002Ka-Jn
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:30:07 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0g-0002dz-2G
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:30:07 -0500
Received: by mail-ed1-x52f.google.com with SMTP id m19so7663482edj.8
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 09:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwpytACtFTUC/RCCVxszHsHayCwwETpi4mznRsrQqmo=;
 b=q9rpfkmthKxxuW6rHaOnqVfiWvFgzK5PGeSUipRJV1QIqa3u0MAGQ6Qys66xPuxSZP
 H0jh1q15h+bWSfZwgb4+vFgyvIXMP5e1+Sx0AxjMXwC6XQKvSUQP+kSvHDLbDwFBTPk2
 3uU4lrSfWgQDRruRUcXgqquQzX4ufy3j1G6VBgt2xLdFuSv1Mm16od+7dcY9mhaiMmvV
 fz8BIpLUgjpLhtX1hCH0Otw5vSwRKxQMHlklmuRya8uZpRAjlSNeYfcCzFRpkq8ttg/V
 bIuWdRqlN3oJaxJstWjnMCTFiA2Op5aV4ywl1vd35ovRTML772QLPUywQ3vJ4wqywWK4
 SPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwpytACtFTUC/RCCVxszHsHayCwwETpi4mznRsrQqmo=;
 b=BBnyvvXwL/0Do1g6HRXnOyQPODxzDig8MNfn1O8oiG8q552cH4IBAQxfcgTLE4iEwO
 dWJCqjAFuNzAjf8+qvAifUvQAMuvXDLsbzXEJ+7EgsWh7N3nPqbn19Nz03qHeIuoIeif
 m36qMoEiinmzAG7Y1V/zwXlclDvte1pxMtt0DG20gzg5973ui4zAHcSoSlSyF/PCRxBb
 i3TgVi4fbrxkHoaUWqFS8AdIchy+OX0yTkYlbIqvnMGY4gS28q1DgR9N6Mv5UWL38LO3
 vnSv+kd28nh7KbZBlM2jhIh19inmSyv19Na9CTabte0TWoDu++PgmcPKsD9zJ8lgGHYY
 paiw==
X-Gm-Message-State: AFqh2kptNzOyQFk0lpfOJ3F/RwbUDfHG4Zc5MG0w+FfJdaAswYhAWFJQ
 yPRoDrQRcHWljLMZM6fTjAgjBw==
X-Google-Smtp-Source: AMrXdXuD74hen3gOMG0Mtx6HB8RJMosagqHCbiCmQb2DlBS8zHc7n0GDAt0b22b8j5MZRNaRaVx3Xw==
X-Received: by 2002:a05:6402:5299:b0:45c:835b:9461 with SMTP id
 en25-20020a056402529900b0045c835b9461mr8740204edb.29.1671298204723; 
 Sat, 17 Dec 2022 09:30:04 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q9-20020aa7d449000000b004677b1b1a70sm2161497edr.61.2022.12.17.09.30.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:30:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/9] target/riscv/cpu: Move Floating-Point fields closer
Date: Sat, 17 Dec 2022 18:29:04 +0100
Message-Id: <20221217172907.8364-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 17:30:07 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fc1f72e5c3..05fafebff7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -143,7 +143,6 @@ typedef struct PMUCTRState {
 struct CPUArchState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
-    uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
     uint64_t vreg[32 * RV_VLEN_MAX / 64] QEMU_ALIGNED(16);
@@ -158,7 +157,10 @@ struct CPUArchState {
     target_ulong load_res;
     target_ulong load_val;
 
+    /* Floating-Point state */
+    uint64_t fpr[32]; /* assume both F and D extensions */
     target_ulong frm;
+    float_status fp_status;
 
     target_ulong badaddr;
     target_ulong bins;
@@ -372,8 +374,6 @@ struct CPUArchState {
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
 
-    float_status fp_status;
-
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
     QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
-- 
2.38.1


