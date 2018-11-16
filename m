Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNlhp-0000Ot-G0
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 16:31:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhm-0000MZ-RS
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhj-0001j3-4t
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:10 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gNlhh-0001fy-Qi
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:06 -0500
Received: by mail-pl1-x642.google.com with SMTP id x21-v6so8993667pln.9
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 13:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=v8thlYChsOVWo1muMkMOtoqaVRzSIwN5qBNyohP/GZI=;
	b=bSzCpLkREpjYw/FAjuDeWoFmreejGhaZ/YKDWWiy6RwmMpR84RsvOWlV6z9hy2bnrW
	wte6lkFs2adkQ8JskipXZscdpBqG2CQMDp9/KkIZBFL/RtzGo/rYovw9wod3VSXHpxgX
	mv044FO3D3hYKMeC1qdcaNFMisecgj8/Wn3mw5g9GCThHxUNNdqkrPwWnN3ha1a0qm7E
	HkcZpqJcjaztxeRT5dV1dnRSkiE6PEGCZ/FZD6YctuFtsniF9Vy9JizOSJhUzMhxwPus
	Udc2lJ83Aq9fFUZtmDsUP/souqEOgLjrvDlqK/Xo6/2IMlrSGVrgXLwfhrNyQ7oMMsVd
	Pzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=v8thlYChsOVWo1muMkMOtoqaVRzSIwN5qBNyohP/GZI=;
	b=p1iHyShUu8wlJ8Un/X9fWpbumCG+Ps/f/z20E5fl9Jnr2CCbIxIouWcJAOcu4JntoN
	Pao1eHBP9tZms3cBzwQKqKbDCvjfgXUhV6ehoiWKs5M/s1vl8JSvi++r2PARj+M+RC5f
	ovls+WuoNG6qDUeryHaO3BiVIskwVcSwYBUJDVXdGsa5n9voYugncYwTpXOuXWuH8HJv
	nwYZSEkh4x1CvZIp5b+HFmq42SwpXTwrp/uytce6I+2Yi4rcU5wiacWbHv1ewW1KNXLn
	m98bxxHUkUTZC0N+DPOBV88UqiIKES7PqOmychbA8sHmKITPw6umeYn9eOWqJMjZUvxF
	6PPg==
X-Gm-Message-State: AGRZ1gL8xgJdAPtOH21dWzFydT2rJhJ2ShvNG3oE1zAjV86i4b9IH/gv
	I9ks3uH/RJt1Ym1hkOyRmwPa8w==
X-Google-Smtp-Source: AJdET5ejevUScU5COtn7bZt3r0z/mB+/gl++NJenrtjKkTiKIHZkpn6yY7k0Cl+TJCoZBT27I6zt4Q==
X-Received: by 2002:a17:902:9881:: with SMTP id
	s1-v6mr6298192plp.328.1542403860766; 
	Fri, 16 Nov 2018 13:31:00 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	b202sm15729094pfb.88.2018.11.16.13.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:30:59 -0800 (PST)
Date: Fri, 16 Nov 2018 13:30:43 -0800
Message-Id: <20181116213045.19825-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181116213045.19825-1-palmer@sifive.com>
References: <20181116213045.19825-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PULL 3/4] target/riscv: Fix sfence.vm/a both
 available in any priv version
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2018 21:31:11 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

sfence.vm has been replaced in priv v1.10 spec by sfence.vma.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5359088e24bc..f44eb9c41b48 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1292,10 +1292,14 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
 #ifndef CONFIG_USER_ONLY
     /* Extract funct7 value and check whether it matches SFENCE.VMA */
     if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
-        /* sfence.vma */
-        /* TODO: handle ASID specific fences */
-        gen_helper_tlb_flush(cpu_env);
-        return;
+        if (env->priv_ver == PRIV_VERSION_1_10_0) {
+            /* sfence.vma */
+            /* TODO: handle ASID specific fences */
+            gen_helper_tlb_flush(cpu_env);
+            return;
+        } else {
+            gen_exception_illegal(ctx);
+        }
     }
 #endif
 
@@ -1342,7 +1346,11 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             gen_helper_wfi(cpu_env);
             break;
         case 0x104: /* SFENCE.VM */
-            gen_helper_tlb_flush(cpu_env);
+            if (env->priv_ver <= PRIV_VERSION_1_09_1) {
+                gen_helper_tlb_flush(cpu_env);
+            } else {
+                gen_exception_illegal(ctx);
+            }
             break;
 #endif
         default:
-- 
2.18.1


