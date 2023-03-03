Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zC-00084T-VQ
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zA-00082o-Jj
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:52 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z8-0007sG-VK
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:52 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y2so1790853pjg.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832910;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dje010AVV2QeyT/FX8byAIDnwjz48KiaRt3orgmfVv8=;
 b=AG2+x8MM7CaNbBIWYD8C0jVL5biCj8aqVwEYTfszSxWvSGn64u3+xU21AE/kV1ydKh
 FdBSY9LsIaF6xYmfRaQHhZBGaXrKBsxjOG1vRs+41XbfB+kztEyaN3vkSPqpnvPRYKLW
 FVxdAXyuFyiL6iYU7N4RwFKbktNnHe0A7IAbiZHbQ72mNC3qU7IB2Z1C50PPmy6ABDMh
 ON2l56DsXYvyU0OuvLiXbEvOfAEHVHSynmis5P4Y1TeoZ9fBwXy34uiUXvbb3XuxtlLU
 crh64Vq0+692e6Y04mbs0ZXcWSfyNlJaAJ2r/GZXXMhtlD/Pp/urlhlQmrvw7fEwhxV4
 4RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832910;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dje010AVV2QeyT/FX8byAIDnwjz48KiaRt3orgmfVv8=;
 b=6C/Funo4Eo3XQX3a8BZoRvgYM6Acc0a0YSJ7ISBVl2xPPVlIbqWnf9+Zav07oBwYEW
 tV9ar8A79zTCLwhz8UKPTuNZlWoWrlmIxiLYp60GMA4C/2OX53CY9opl7RfyquPXgBMc
 1qIwuriku2PkFwhM7xfJqZuovoQyZRwzLGDYj9Geuoj/knAzXIgUDVNEbOXTlsnP+ti4
 9Wxf/lqdHTyfLnv+YQE+XEx+4AnpJdtWW7zj5GurFm8ABUDz6xjHyBlszpBlqtba/U+5
 F5Fap5+zx5gNgYRU6YcU3tNvquvzXP8YVja00vo1oTt5oy5l3Qe1ubm5m4AXYgZ9PDxb
 vAnQ==
X-Gm-Message-State: AO0yUKUm9+yoCpsQ5smc5gcYUU7+dI0+aWB4/olUstrgZ/c8XOlZfPIG
 roNJCU4wjqb53pJPvjoM+s+QyJlWVtO8r/OL
X-Google-Smtp-Source: AK7set/c8y9Vn/ZPgDHxB+vMXOhGvlNK/LN/FVUs8xh9ZoC3qAzRJQNbzly5tDtbhS3KBFA5Wi2stA==
X-Received: by 2002:a05:6a20:c510:b0:cc:ac05:88f7 with SMTP id
 gm16-20020a056a20c51000b000ccac0588f7mr1111818pzb.34.1677832909947; 
 Fri, 03 Mar 2023 00:41:49 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 m8-20020aa79008000000b005dae7d1b61asm1022277pfo.154.2023.03.03.00.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:49 -0800 (PST)
Subject: [PULL 23/59] target/riscv: Simplify check for EEW = 64 in
 trans_rvv.c.inc
Date: Fri,  3 Mar 2023 00:37:04 -0800
Message-Id: <20230303083740.12817-24-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:52 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Only V extension supports EEW = 64 in these cases: Zve64* extensions don't
support EEW = 64 in these cases as commented before the check.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-14-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5dbdce073b..fc0d0d60e8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1998,8 +1998,7 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2012,8 +2011,7 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
@@ -2230,8 +2228,7 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2242,8 +2239,7 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
-- 
2.39.2


