Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EA1C5DF6D
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:40:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8n-0008M1-Pk; Sat, 15 Aug 2026 16:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8l-0008Im-6L
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008KV-MR
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:02 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-381b831d535so3359773a91.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826270; x=1787431070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MvJ7+F16DEpj7QIj1wZklJf2PY3H3pWuGHhmdxhy48A=;
 b=Itc/WKj+73pbZcozLr4FP9jzbcO+xybMs++VR/DSpmP5MRzcyjJtovcMM45b9LuPlo
 HmkzUtSB04QSzmGnnpLvrKb20YPkkPUig3BbkSTjxsWp9AFILOAJym/SG7iQMoGQgF7Y
 3biVyevImZkVEPWFiIHivpBazIHZu86d+GA3XUq8ELQApvXPVvhZZnXFZbvF9wze2vDu
 oVasB7IPf7lrcqeSQJNqQphFyxRPYs2IBeDQ68mzu0NVQa6A7fE68434Bm8H6X8+ivXN
 u3T83vlgpgZBpS/7EfsqqXx7ReS9d8V0952KbnX8N9uZKSflDE8hQ1cu3K5GYtffrRtf
 9/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826270; x=1787431070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MvJ7+F16DEpj7QIj1wZklJf2PY3H3pWuGHhmdxhy48A=;
 b=YcpQ3xfwoiBW0MuiyYbXy1DzZEOHd7zyyomGttvFxic7Gkl2BQ+3k53HJfHWTa0tCN
 Y0ltfduJESOAXfekdFf+YWhzIk1Dah/YbGuMTcS4cV9bAeZHbMUONDSn9RhLbYmxx5w7
 ogVlxtwd9oi5L+gOBKzoOXj4RLE4+BVmrSy6YKYVw60iYUDxwQ2tK71oZOGQotQ76VQq
 gsJHH69u7XVvJefMQl6r+B8IZ6r3YTK2OM37YnKGFj+fsoJTWi7jrYPaoLeyszGCuqpu
 WEI/yZg+z1yzBPeqkJ9+TsO4VeGlJ9jP1uA1XmdM2E1rmCVa72St2651gi4rpk8DgNPM
 joiQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9wPRnV23Jh+QZy9qGS+0p+AfoGZVbz4HMK+K1ld85w95orX0Ja+UMt4DEvWsEbx0hPn/DRr321LtH@nongnu.org
X-Gm-Message-State: AOJu0YwrP6m5v+UoVwnQrpsPoflSvP3TEnnXT0fm5yJ22DtmCKxcXU0J
 N0TtCSaNw6mRfm3dtk5jwdsFpldyKDz9VhOdZsN0lxiWfGfn1+TtOOxemhVev4rxMyY=
X-Gm-Gg: AR+sD13U4MSkOIGf+pooVY743v7wwwmAvTJjzWWtusxBPcBO41THlP3pgULP8gHQ6Jx
 f4UgRdtqFRZOLSAMB2PqQod+lHgK4yTNmlVdJ5KfMB06BWnQ/QPQnkWcblI7p8wUsfPjbhne099
 rYgeFxPdhcnFuRHp/mTYjNUNx6FJAV7rlPxcKkxcI5ur/6RIV+9a8EZqxFewq8keNCehzQPLsl/
 9K2yX8k3Mp3XE8jjgLK5h4EyDAQKhyVoLj4+PJiBmVFJGIGUMS5OW7q5k22ReYK96qOaO2Xo5n7
 IhXIHx7caRGWEqgUDKql0uVZe5k1FS6zRvoCx/4DCTxc/l7E0c4PqCXqAoEsGaoW/KEGjqG2HoY
 cD5P1iqB8HgKvtUp3z30jH+4w03EM2XZ9wGdte4NFMLUnMODhOvVYour6OSgjCk0wTDIs8jlEol
 et0xNTgPNIJ1pNnXEA7URQSii9Txz1hd8k5lTbuAuqirrQ0/bSbnSSfk4GPY8qTTwpO+MzsuJRS
 Hp8TZF7nSyXhmcE/Vk8
X-Received: by 2002:a17:90b:5745:b0:38e:49c0:75a7 with SMTP id
 98e67ed59e1d1-3933b7a6986mr18082879a91.8.1786826269652; 
 Sat, 15 Aug 2026 13:37:49 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 13/18] target/riscv: Move PMP_AMATCH_OFF check in
 pmp_hart_has_privs
Date: Sat, 15 Aug 2026 13:37:25 -0700
Message-ID: <20260815203730.1468365-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Check for region disabled before checking the region range.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/pmp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 41b55519a8..5bccc60527 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -415,6 +415,10 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
      * from low to high
      */
     for (i = 0; i < pmp_regions; i++) {
+        if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
+            continue;
+        }
+
         s = pmp_is_in_range(env, i, addr);
         e = pmp_is_in_range(env, i, addr + pmp_size - 1);
 
@@ -427,10 +431,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
         }
 
         /* fully inside */
-        const uint8_t a_field =
-            pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
-
-        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
+        if (s + e == 2) {
             /*
              * If the PMP entry is not off and the address is in range,
              * do the priv check
-- 
2.43.0


