Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C30CA0EED
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:07:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTIv-0003xz-2K; Fri, 22 Aug 2025 11:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGx-0001v6-KV
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:02:02 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGb-00050n-8A
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:41 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b4717543ed9so1436263a12.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874875; x=1756479675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=A7j4GvhCplGcL21yr5pbVeAdLmTc5Jprqb5cKkr7NkFoE6q7aEw284+thhUZg9FHUL
 aDvhfQ6EM+TEGCmzjLryff2wP+Gl44A9U7sR0KaLxZ04I4WEM9wfaJ53BMwouUezGhfa
 pkH/jVczOnWdHoU+BK8OVszUPdMvsAlAEOjDlBfvYnWo2q9/CkNgpc+Kn82f5rW7FJgT
 zwFqv1FzNJBNMU3VIBlFzRPovKxw3aFA4pYKP+wuERayxw/xMDtEP7kx0ichQRvCzn3g
 KW3jZHI3AGFMVCPpB/gF3L/iUHxlfIEApgoYYRy95ihCxmg/iYEwwegY9HSgvbvDMobt
 +d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874875; x=1756479675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=I96ER+lTW6Z6Ju8bhwTggVDGfFmWXwqlz3k1v2bnRVTVTEq0JE9JbNRQF6CAvHHy/3
 N5hWbf2YW4xtjzIQmBCg6TPCE4qMHUh/k00RydJArue7UqioyOB8DK3ghFKpTwZ527gG
 A2JMlVI6WE/ZPBZzxBaaG213wki4ftuufn4ZhVt2zDt9IlXshTktS09heY/YyEINbdVP
 RiwuVn4BEY3xx8/UCL5CHKDFeZzigOkHxbe/V4GeKYFk/nUZYiyg3NbKqjJWWQI07KrQ
 pfjGa7EyGPJIzFR78Pmd+BqZtnpzzf1BstJfZjynbqeUJHy9cYyRC4sJ5Axj4jUEyS1p
 HV7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsYrS13s4YE475OLW6mLql2P8qB7e0NkgPJ7U4+Ysrat95TdthnLEdVMwfYVZklLE65G0ZNUrSQJXX@nongnu.org
X-Gm-Message-State: AOJu0Ywf3RkhkNboBdt4O3e0BMua8IflqOaxyFJiehyvdhCztRTFUPOt
 R5IA3OwgPgqVNJcJ2IKNJQUsnk4C7tLomuJCclk57vupVFFiQ2Dnzxpa9YmyMsx+U5I=
X-Gm-Gg: ASbGncvJI/l3VjXK1XX7Exc9Fj/Oblk/RAcx5x3f6oIBReMIkah5Shw3FWm6UoIS8Y8
 7BPjh3devUsKNTfJ3tMHSWPQ9nHb7ls9heoLks3pP7RFAfWLXCMPSATlaM/CIiWkILZqweGLo+0
 MZbpUHRb4KvyW9AtXW3H2XFTmdxhHiC4jEKuqVEsA7hMSWTxUNNZSPt6L/aIygNIvyPxB99OKts
 vvQyqVvGpQ0ma5EvF7KDRYLMtU9ewZrWCFlu4THkrceqG0jy/hRaJE/4pPSmSi0Eu/r8mrRAnFw
 qV8xDl269yfx6/d/10DYeelLT+vw7uLSloBuJXqbx4XDr7mv2OGqErfXbnc0nqCTAD3TWPo44Dv
 m9x/BaqLL2RJljq9iK64WF21Z7oNMP5U/PJhugvApG7E=
X-Google-Smtp-Source: AGHT+IF7q0bRwpOzZzwRXFmYsbSxbpUMKDnD/N7VrfpdmIkl8MTLY6Pl7H/TaevBXbXYHJV8Vgkeng==
X-Received: by 2002:a17:902:d592:b0:240:3f3d:fd37 with SMTP id
 d9443c01a7336-2462ee80b64mr41071155ad.27.1755874874553; 
 Fri, 22 Aug 2025 08:01:14 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 08/12] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
Date: Fri, 22 Aug 2025 08:00:54 -0700
Message-ID: <20250822150058.18692-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

No semantic change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5877214c47d..c03096b253d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -786,7 +786,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
-        if (sizeof(target_ulong) == 8) {
+        if (is_64bit_semihosting(env)) {
             if (SET_ARG(0, elapsed)) {
                 goto do_fault;
             }
-- 
2.47.2


