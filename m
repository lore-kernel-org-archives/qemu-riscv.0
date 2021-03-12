Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKeub-0000Qu-Af
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 05:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuU-00007i-Vw
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:47 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuL-0005FW-1l
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:46 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bm21so52317802ejb.4
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 02:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUuSdxHLrrklPAPPgMtY5hAbAYZJd9t8CTN4SQZzksI=;
 b=IGY723lYV6BJ5ogec7fCbCfRC/Px7tE14Z3MOCI27I1eD/kmk8qrOGqEyam11P8Izf
 +7tbPBPls08zrzbu0E0qMDsXuuaNdoNkoCRmSQewh1ORX0v+iHnzHrXR3ci7Mis893tF
 0JK3ahHZlVg+2+9PsA03g7Spnj3BJF1J5fXV5qszN7aEaWEUu9+pvmP/OsOL6L5p81Rk
 DoHYHrMypPAwInVuEs17+rTPly53YyDVjATIsUzuxOJzvWxH2CpIzeSuED4ML46trRUQ
 5N+V+QR0pUCaxsADlwK8Eqc6rY/7ibQMrdNQUetGYYljiVy8FkdTDqfA1/Izsz/lr8xC
 VpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUuSdxHLrrklPAPPgMtY5hAbAYZJd9t8CTN4SQZzksI=;
 b=MWvNpyOZVNByaHJJ3Hh4wLZ2Al9barxjgtus9GaKSrZOmp1LRFsiPT5Pwq3AaZ8fNl
 Gt/HDUJ1DVAVKPf83ZI1t+7szU+3u1oitoQYkyHTAXfWc0z00FPEFe4qdjvwsML6mPyH
 thuh2rEchd/9YHDtXE+EEKZNoSl6vICEPZpfDv4Mpva4CB9f9cqpXBuWoxhI0InqCDoz
 9zNwQQoI4ibyPbXuqxFJd7Gn6Ofx1qkO3cFKmHroMqcKadG8dlqUYXep9xF58qDDdNik
 dsHBnvOCyTEtyH6WoKpdZvgHQwatAVVEDlpIZXU6zCdhcTfcmsWW579VWK+Mt5aUvtbS
 LHHw==
X-Gm-Message-State: AOAM531Ju+f5dAuS9mkUFUFVJGyw4J8JJF1PnHjSJhxPlhTfpLGU2JIF
 zId+aWfwub/f9OacqgLxRW9GmgxX8wOLfw==
X-Google-Smtp-Source: ABdhPJyEci/JMY0YkWdM/vJVOy8PUeDew2CmH9VFdGIaN+YV4Y2YGYW1L7YnM2J1Vz9xPHLOULNmnA==
X-Received: by 2002:a17:906:5d12:: with SMTP id
 g18mr7579546ejt.246.1615544434468; 
 Fri, 12 Mar 2021 02:20:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t15sm2730249edw.84.2021.03.12.02.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:20:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5C3E1FF8C;
 Fri, 12 Mar 2021 10:20:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 2/5] semihosting/arm-compat-semi: unify GET/SET_ARG helpers
Date: Fri, 12 Mar 2021 10:20:26 +0000
Message-Id: <20210312102029.17017-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312102029.17017-1-alex.bennee@linaro.org>
References: <20210312102029.17017-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Mar 2021 10:20:47 -0000

From the semihosting point of view what we want to know is the current
mode of the processor. Unify this into a single helper and allow us to
use the same GET/SET_ARG helpers for the rest of the code. Having the
helper will also be useful later.

Note: we aren't currently testing riscv32 due to missing toolchain for
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>

---
v3
  - consistent #ifdeffery
---
 semihosting/arm-compat-semi.c | 56 ++++++++++++-----------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 94950b6c56..0f0e129a7c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -767,15 +767,28 @@ static const GuestFDFunctions guestfd_fns[] = {
     },
 };
 
-/* Read the input value from the argument block; fail the semihosting
- * call if the memory read fails.
+/*
+ * Read the input value from the argument block; fail the semihosting
+ * call if the memory read fails. Eventually we could use a generic
+ * CPUState helper function here.
  */
-#ifdef TARGET_ARM
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+#if defined(TARGET_ARM)
+    return is_a64(env);
+#elif defined(TARGET_RISCV)
+    return !riscv_cpu_is_32bit(env);
+#else
+#error un-handled architecture
+#endif
+}
+
+
 #define GET_ARG(n) do {                                 \
-    if (is_a64(env)) {                                  \
+    if (is_64bit_semihosting(env)) {                    \
         if (get_user_u64(arg ## n, args + (n) * 8)) {   \
             errno = EFAULT;                             \
-            return set_swi_errno(cs, -1);              \
+            return set_swi_errno(cs, -1);               \
         }                                               \
     } else {                                            \
         if (get_user_u32(arg ## n, args + (n) * 4)) {   \
@@ -786,41 +799,10 @@ static const GuestFDFunctions guestfd_fns[] = {
 } while (0)
 
 #define SET_ARG(n, val)                                 \
-    (is_a64(env) ?                                      \
+    (is_64bit_semihosting(env) ?                        \
      put_user_u64(val, args + (n) * 8) :                \
      put_user_u32(val, args + (n) * 4))
-#endif
 
-#ifdef TARGET_RISCV
-
-/*
- * get_user_ual is defined as get_user_u32 in softmmu-semi.h,
- * we need a macro that fetches a target_ulong
- */
-#define get_user_utl(arg, p)                    \
-    ((sizeof(target_ulong) == 8) ?              \
-     get_user_u64(arg, p) :                     \
-     get_user_u32(arg, p))
-
-/*
- * put_user_ual is defined as put_user_u32 in softmmu-semi.h,
- * we need a macro that stores a target_ulong
- */
-#define put_user_utl(arg, p)                    \
-    ((sizeof(target_ulong) == 8) ?              \
-     put_user_u64(arg, p) :                     \
-     put_user_u32(arg, p))
-
-#define GET_ARG(n) do {                                                 \
-        if (get_user_utl(arg ## n, args + (n) * sizeof(target_ulong))) { \
-            errno = EFAULT;                                             \
-            return set_swi_errno(cs, -1);                              \
-        }                                                               \
-    } while (0)
-
-#define SET_ARG(n, val)                                 \
-    put_user_utl(val, args + (n) * sizeof(target_ulong))
-#endif
 
 /*
  * Do a semihosting call.
-- 
2.20.1


