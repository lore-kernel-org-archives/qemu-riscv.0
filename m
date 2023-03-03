Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z9-00080w-VA
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z7-0007wW-Qx
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:49 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z6-0007nk-5w
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so2053342plf.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832907;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BeHJ2jhqa6PgNXmb8JHZiMAIH3RrdZhAiRe7UlrIlc=;
 b=LEzgM+2c6NMWribnQiZQnWhYvvYpyQfLrZYvUFawmjv/rHI616hjYylC690DlTtEsZ
 xAXzL04YxWcyqPjKPmhMtN29QZYtn/dcgjmGaZ9r8dtR7ncYsANRqaPQklQ8vM7/xFnL
 JOFsMCIo2iLN8dWnFsEjOhfRJxDS+pvO+nNaFayF4FIYS2NICT8k4k6wT5Y4Al5Bak0J
 23/C8m93GW3oBC9aMoDy4yXaLw2Ei7iZIQglB3F0K3fHh+0DrZNhFf4un/aga4Sc+nkO
 okKUouVcnU3BGX0DFK8yYoHL12eFiJtdTt7vPkE81E8YvcFNOxq+EuwTKCkEnoV3Xmvw
 mt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832907;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BeHJ2jhqa6PgNXmb8JHZiMAIH3RrdZhAiRe7UlrIlc=;
 b=sG8FUH3v927GHKMSMMa/ViuOuRxw3ZoBw7voY7QQT4l5I7mF2rDKwpkkfoYGXb0xiK
 sRWyZwUuNupq3NzltPjNCOyJtiE8/7aVA+l6DVKBWx96Dt+bRc5YadyJvTsOuo5L9uo3
 mKaos8dkwYuC7zkXBPGHpDfV2gI7IyKOXtKVv9mzOMuelzAf1mHy0i2foZglNMY3Vclr
 VEeb3qqAroyhfV4mmO8MlMUGoYNnLZzkeV1ErnwWjRzHIX/mHJ1d8EgCpMXUONghZwKD
 siEfGO/ULhGVCia4cn5QQpQHwJra8NTOiyfbuhbO45/qbuWJ40PlKfTTp96V8xhY37jc
 eyiA==
X-Gm-Message-State: AO0yUKUj0g/FI1lUfeBzbgx7jFvdCs/o9yAGZp9nF9+8koXAC0JhcaBr
 thM/XSAdE5Jfr0bKY3wZfwz+L9MTQTmv0ex3
X-Google-Smtp-Source: AK7set8v6HNkj3e7G1j9Q0HDdRBChHZxW3FRIjhT3NJIp5WNR84S8k6D/q8v5BdvMTuvMkeMB5iqUg==
X-Received: by 2002:a17:902:e842:b0:19a:b4a9:9ddb with SMTP id
 t2-20020a170902e84200b0019ab4a99ddbmr1482741plg.49.1677832907114; 
 Fri, 03 Mar 2023 00:41:47 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902aa4a00b0019e8915b1b5sm976094plr.105.2023.03.03.00.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:46 -0800 (PST)
Subject: [PULL 21/59] target/riscv: Add support for Zvfh/zvfhmin extensions
Date: Fri,  3 Mar 2023 00:37:02 -0800
Message-Id: <20230303083740.12817-22-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:50 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Zvfh supports vector float point instructions with SEW = 16
and supports conversions between 8-bit integers and binary16 values.

Zvfhmin supports vfwcvt.f.f.v and vfncvt.f.f.w instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-12-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 31 +++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9053759546..9b2c5c9ac0 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -40,6 +40,7 @@ static bool require_rvf(DisasContext *s)
 
     switch (s->sew) {
     case MO_16:
+        return s->cfg_ptr->ext_zvfh;
     case MO_32:
         return s->cfg_ptr->ext_zve32f;
     case MO_64:
@@ -57,6 +58,25 @@ static bool require_scale_rvf(DisasContext *s)
 
     switch (s->sew) {
     case MO_8:
+        return s->cfg_ptr->ext_zvfh;
+    case MO_16:
+        return s->cfg_ptr->ext_zve32f;
+    case MO_32:
+        return s->cfg_ptr->ext_zve64d;
+    default:
+        return false;
+    }
+}
+
+static bool require_scale_rvfmin(DisasContext *s)
+{
+    if (s->mstatus_fs == 0) {
+        return false;
+    }
+
+    switch (s->sew) {
+    case MO_8:
+        return s->cfg_ptr->ext_zvfhmin;
     case MO_16:
         return s->cfg_ptr->ext_zve32f;
     case MO_32:
@@ -2798,7 +2818,7 @@ static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
-           require_scale_rvf(s) &&
+           require_scale_rvfmin(s) &&
            (s->sew != MO_8);
 }
 
@@ -2909,6 +2929,13 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
 }
 
 static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_narrow_check(s, a) &&
+           require_scale_rvfmin(s) &&
+           (s->sew != MO_8);
+}
+
+static bool opffv_rod_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
@@ -2952,7 +2979,7 @@ GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, opfxv_narrow_check, vfncvt_f_x_w,
 GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
                       RISCV_FRM_DYN)
 /* Reuse the helper function from vfncvt.f.f.w */
-GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
+GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_rod_narrow_check, vfncvt_f_f_w,
                       RISCV_FRM_ROD)
 
 static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
-- 
2.39.2


