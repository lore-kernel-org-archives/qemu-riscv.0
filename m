Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYMyu-0004C1-10
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMyr-00049W-O7
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 02:01:58 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMyk-00043W-FU
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 02:01:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id nk8so4113420pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 18 Apr 2021 23:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hI6diI03YN0gzsP1zG7SKXRSFTBjgNgh2fgUlPSLQb0=;
 b=TtD6G8PlN+UjSivWpXHjZTEg/27kXJsnDyCxNvW1+QHouWwVL9D8uHR+n3OSV10YTp
 BMv2NZoxjnkGFOW3mUz0UR74t9rw7kfyZOStixkzXm8UUie2qG7hjhj7gz+UIQQwz3/R
 Dra74kRjYjQ4EKP1EXETYqo6TrfY8oAJ2oL/ImA6TNw8e5chE+6/4Iel61nEdfnjPZ+Q
 jbVOr7/V95o6WTKC6WY4/YMXngCSDoXEqv3+YrVXLQPmXGuu09ymqqYoFgxpJUePgPlk
 jm0Dle01lAzQfcuNe57TJbz8mtMARTuNuTxRIGcM8+g5jt7k2JC1/6gM7alYo/2RMZEy
 8lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hI6diI03YN0gzsP1zG7SKXRSFTBjgNgh2fgUlPSLQb0=;
 b=ZxDNTPk4Xv7G1aI4u/2L+2c2Z5+LWrGoNMs5mXkvbtFY0r+5P9BIBSKL9xaXr7RfFN
 jAWFRJp1yuKXs4o1NMXhQvhxkfTjpWrzKviXaK3s9fr/fUtdH99NcRHrcjZ2323/sE+s
 ZcU02TrE9nw4Y4wwlFSK7+vAUDEPFAX6ORM4wHPlFMkPSgB7YNqX75ndkD0YB7g9H2Yb
 pLWX4XtKK2pp1YnCkIXwg2Mq5lt9UvnEE15kNv/8or7sejE8W+DSG2ZkOKoqHSVRrxy/
 d2Hv4RD4wyIKWqbObhc2sQu9pBkarXev+DKUsuKOBcdCmTAXgIo2fBhmlZmB0jZK6utq
 iaMQ==
X-Gm-Message-State: AOAM530pl0rxmafF8DzWvfrKrV15e4ZhmnoajPs6jdDvXtPpEeP1+YKP
 EPqRxA2dI5FTqso0JyveuCu++Q==
X-Google-Smtp-Source: ABdhPJxALzSb/fRjFn8vxojaley5kI/If7nqtKMeYv8HNXrc4NUZrkDaKjMnRAdHhpVOM7t7lZEFHQ==
X-Received: by 2002:a17:90a:f3cf:: with SMTP id
 ha15mr22864257pjb.214.1618812108381; 
 Sun, 18 Apr 2021 23:01:48 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v1sm11162911pfu.6.2021.04.18.23.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 23:01:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH] target/riscv: fix vssub.vv saturation bug
Date: Mon, 19 Apr 2021 14:01:44 +0800
Message-Id: <20210419060145.11152-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Mon, 19 Apr 2021 06:01:58 -0000

From: Frank Chang <frank.chang@sifive.com>

Doing a negate (0x0 – 0x80000000) using vssub.vv produces
an incorrect result of 0x80000000 (should saturate to 0x7fffffff)

Fix this bug by treating zero as a positive number.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..356cef8a090 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT8_MIN) {
-        res = a > 0 ? INT8_MAX : INT8_MIN;
+        res = a >= 0 ? INT8_MAX : INT8_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
-        res = a > 0 ? INT16_MAX : INT16_MIN;
+        res = a >= 0 ? INT16_MAX : INT16_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
-        res = a > 0 ? INT32_MAX : INT32_MIN;
+        res = a >= 0 ? INT32_MAX : INT32_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
-        res = a > 0 ? INT64_MAX : INT64_MIN;
+        res = a >= 0 ? INT64_MAX : INT64_MIN;
         env->vxsat = 0x1;
     }
     return res;
-- 
2.17.1


