Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjZ-0007JF-7y
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj0-00068e-8e
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:17 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqip-0002tO-F9
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:12 -0500
Received: by mail-pj1-x102a.google.com with SMTP id kb15so1447157pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgLKFnmS08d59nAAlckVp6By00CbIN6BRDR8pm/wMZM=;
 b=qfa8VejOx6/v9i6BKnDnEWnTQnmvRn0uz+SxPgUXBuR5dj7mDoRSYr351xkI2KVFT/
 JAojqxktSUNrLUweOffKNLJq7ObmPp5JY6T4LJ4hdmKjxLu+JwH0QYui890N/hTTaO+6
 GWl8SKhn0M7D9QQchB1vTU+PvX9ROnVFuJs6ex573UYauaF0dEWx/9TYA+n2SXC/poJO
 /bDpDbSetj18w0uin5VE90zi9vWiIek6FDuyN5LQnMkDkb1UrjhihkDRfCsg6I7Vq+Qd
 B6s/9oJhiUkZjCLShEaBRzXTxxyKXBESl1BMRNA5KghG+owozQO6ih3YDvG00yCqjU/T
 L6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgLKFnmS08d59nAAlckVp6By00CbIN6BRDR8pm/wMZM=;
 b=WXGTQFWrvWYI1WQSe9dpyC6GJlVOoEmHezrl1rVi+QRlJJZHVHdFLhT4o6/TZZdc73
 4L2nFCf6FhbmOqW6CmVPkc36cY8Vkl+/LkVw4gKrhvtBKlirJccy6Ol4vgSuUmhARqou
 oTrRlpgUUlwrpDx6Mvi6yvz1vLmAw/H6p/UwF2jyBtERYdxLU0e6vt5gqhD7o3Ve+1yX
 L7cJRvePRY9OAeXOWsmcN6HadBdYip8uI0R9oPjt5jqgdrONDVIQYWPW2yiePqt3oLlx
 +fJZy3d/KhAj5N4xeuWPlW8CPC6hHjg4UJREXJvBR66PbG6czv1a6t/axxDwXnintpwg
 ddLg==
X-Gm-Message-State: AO0yUKU3SYsfcGAT3MAwM6atnkYUyLvQ54XrVL3x0OfCwBgB5qxwh6BZ
 HALPPqt42DTkREdfzermpozPpw==
X-Google-Smtp-Source: AK7set8/ffI7XLszllDBr0sGm6Qq51pq97qRvp2baxMLXoU5h9gPWhwKl/UNkgoHNh3vYPoRkvNfaA==
X-Received: by 2002:a05:6a20:1441:b0:c7:4bf5:fa0a with SMTP id
 a1-20020a056a20144100b000c74bf5fa0amr21202441pzi.48.1677316801487; 
 Sat, 25 Feb 2023 01:20:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 57/76] target/s390x: Use tcg_constant_i32 for
 fpinst_extract_m34
Date: Fri, 24 Feb 2023 23:14:08 -1000
Message-Id: <20230225091427.1817156-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:18 -0000

Return a constant or NULL, which means the free may be
removed from all callers of fpinst_extract_m34.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f2f2ea06eb..811049ea28 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1790,7 +1790,7 @@ static TCGv_i32 fpinst_extract_m34(DisasContext *s, bool m3_with_fpe,
         return NULL;
     }
 
-    return tcg_const_i32(deposit32(m3, 4, 4, m4));
+    return tcg_constant_i32(deposit32(m3, 4, 4, m4));
 }
 
 static DisasJumpType op_cfeb(DisasContext *s, DisasOps *o)
@@ -1801,7 +1801,6 @@ static DisasJumpType op_cfeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1814,7 +1813,6 @@ static DisasJumpType op_cfdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1827,7 +1825,6 @@ static DisasJumpType op_cfxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1840,7 +1837,6 @@ static DisasJumpType op_cgeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1853,7 +1849,6 @@ static DisasJumpType op_cgdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1866,7 +1861,6 @@ static DisasJumpType op_cgxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1879,7 +1873,6 @@ static DisasJumpType op_clfeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1892,7 +1885,6 @@ static DisasJumpType op_clfdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1905,7 +1897,6 @@ static DisasJumpType op_clfxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1918,7 +1909,6 @@ static DisasJumpType op_clgeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1931,7 +1921,6 @@ static DisasJumpType op_clgdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1944,7 +1933,6 @@ static DisasJumpType op_clgxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1957,7 +1945,6 @@ static DisasJumpType op_cegb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cegb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1969,7 +1956,6 @@ static DisasJumpType op_cdgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cdgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1981,7 +1967,6 @@ static DisasJumpType op_cxgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cxgb(o->out_128, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1993,7 +1978,6 @@ static DisasJumpType op_celgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_celgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2005,7 +1989,6 @@ static DisasJumpType op_cdlgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cdlgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2017,7 +2000,6 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cxlgb(o->out_128, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2486,7 +2468,6 @@ static DisasJumpType op_fieb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fieb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2498,7 +2479,6 @@ static DisasJumpType op_fidb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fidb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2510,7 +2490,6 @@ static DisasJumpType op_fixb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fixb(o->out_128, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2785,7 +2764,6 @@ static DisasJumpType op_ledb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_ledb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2797,7 +2775,6 @@ static DisasJumpType op_ldxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_ldxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2809,7 +2786,6 @@ static DisasJumpType op_lexb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_lexb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


