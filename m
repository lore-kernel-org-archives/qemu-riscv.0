Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1x-0008Lg-L5
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1s-0008BN-Ov
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:28 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1n-0007iG-3V
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:28 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5002571pja.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71aFye+WP3h6iEWEabrVi+cTpkdhpONrYK9bA8dUw1w=;
 b=Q5n8RMLdumFshWYGiMjd5WBTB6KGLZ69qWxkM+c2EWG0yF7hUmXFZAlF2vIWg4iyMx
 2ixCOtF45dyF0iQRjJoFvANR9XzpXyL1Vn59O/OFVttdxrop/o9+i4j+rE96pVb9M1wS
 8cdKDcyyBrWLBZbnob5vmH62udbIen5b3SLnMddswwYWNpx51xSxczCFjCTGAKnDBxzC
 FAY4u2pIt1HXcYHFoEiuKqP5nXPUheQysia2eduLb6X+LWcLsjTk5OyizXrE3kKhSlzy
 zMtDuDIlglezchGyHyAViBFz3xCJePAaNeNTk32rI8fdhi+2kQ32by8OB7SqaAvtTnPL
 Vwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71aFye+WP3h6iEWEabrVi+cTpkdhpONrYK9bA8dUw1w=;
 b=AexFh8fxOQ8z71sFk65P3wV0r53wNdbgVc0m/eNucPvUcjEN/Kd23TbyNaRpMiJ+3D
 28F9lKyuq5Xi5dvORcNHG7sIwzE7ezoW0ewJbjYc3+2IlvmGSQg6xc3Khg06y4SnZ2Ky
 qF6l4AdFjODoD8N8zXe9ottldNFJj5hv0sfCElvhAhQd3uziUC/iP0EHeXcvnY/XRLKP
 TLJD2unM8xdz4JQhFMeALxSCg4iVI+MdSg058FGJlszE1UmwY7MYtCigXwbBtl8gXMr1
 I1zOiKtWOW3WPVIjtmc77KnOX5lO3oY77o44o5bzA03UjPdgV7c9SLuWuyfN9zh7iR8s
 0p5w==
X-Gm-Message-State: AO0yUKUXWJuze47OVgNfDyADSDb/rBgi5E6Vyl+yPUVf29A1ZOhHp2rW
 8X8vREsJ5LEhd1mocs3n0KweRQ==
X-Google-Smtp-Source: AK7set8AT/VgbXVU2hREkJKYMdSkadtOgUSaGhvr+oE68s3Miqln+VCK3hTs5NbgPZgL4auC8URlgw==
X-Received: by 2002:a17:903:2908:b0:19d:135:2013 with SMTP id
 lh8-20020a170903290800b0019d01352013mr3812096plb.26.1677475581659; 
 Sun, 26 Feb 2023 21:26:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 26/76] target/hexagon: Drop tcg_temp_free from
 gen_tcg_funcs.py
Date: Sun, 26 Feb 2023 19:24:15 -1000
Message-Id: <20230227052505.352889-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:29 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg_funcs.py | 79 +--------------------------------
 1 file changed, 1 insertion(+), 78 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index dfc90712fb..02cb52c21e 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -26,10 +26,7 @@
 ## Helpers for gen_tcg_func
 ##
 def gen_decl_ea_tcg(f, tag):
-    f.write("    TCGv EA = tcg_temp_new();\n")
-
-def gen_free_ea_tcg(f):
-    f.write("    tcg_temp_free(EA);\n")
+    f.write("    TCGv EA G_GNUC_UNUSED = tcg_temp_new();\n")
 
 def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
@@ -269,73 +266,6 @@ def genptr_decl_imm(f,immlett):
     f.write("    int %s = insn->immed[%d];\n" % \
         (hex_common.imm_name(immlett), i))
 
-def genptr_free(f, tag, regtype, regid, regno):
-    if (regtype == "R"):
-        if (regid in {"dd", "ss", "tt", "xx", "yy"}):
-            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
-        elif (regid in {"d", "e", "x", "y"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        elif (regid not in {"s", "t", "u", "v"}):
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "P"):
-        if (regid in {"d", "e", "x"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        elif (regid not in {"s", "t", "u", "v"}):
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "C"):
-        if (regid in {"dd", "ss"}):
-            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
-        elif (regid in {"d", "s"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        else:
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "M"):
-        if (regid != "u"):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "V"):
-        if (regid in {"dd", "uu", "vv", "xx", \
-                      "d", "s", "u", "v", "w", "x", "y"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_temp_free_ptr(%s%sV);\n" % \
-                    (regtype, regid))
-        else:
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "Q"):
-        if (regid in {"d", "e", "s", "t", "u", "v", "x"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_temp_free_ptr(%s%sV);\n" % \
-                    (regtype, regid))
-        else:
-            print("Bad register parse: ", regtype, regid)
-    else:
-        print("Bad register parse: ", regtype, regid)
-
-def genptr_free_new(f, tag, regtype, regid, regno):
-    if (regtype == "N"):
-        if (regid not in {"s", "t"}):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid not in {"t", "u", "v"}):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "O"):
-        if (regid != "s"):
-            print("Bad register parse: ", regtype, regid)
-    else:
-        print("Bad register parse: ", regtype, regid)
-
-def genptr_free_opn(f,regtype,regid,i,tag):
-    if (hex_common.is_pair(regid)):
-        genptr_free(f, tag, regtype, regid, i)
-    elif (hex_common.is_single(regid)):
-        if hex_common.is_old_val(regtype, regid, tag):
-            genptr_free(f, tag, regtype, regid, i)
-        elif hex_common.is_new_val(regtype, regid, tag):
-            genptr_free_new(f, tag, regtype, regid, i)
-        else:
-            print("Bad register parse: ",regtype,regid,toss,numregs)
-    else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
-
 def genptr_src_read(f, tag, regtype, regid):
     if (regtype == "R"):
         if (regid in {"ss", "tt", "xx", "yy"}):
@@ -578,7 +508,6 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
 ##           <GEN>
 ##           gen_log_reg_write(RdN, RdV);
 ##           ctx_log_reg_write(ctx, RdN);
-##           tcg_temp_free(RdV);
 ##       }
 ##
 ##       where <GEN> depends on hex_common.skip_qemu_helper(tag)
@@ -692,12 +621,6 @@ def gen_tcg_func(f, tag, regs, imms):
         if (hex_common.is_written(regid)):
             genptr_dst_write_opn(f,regtype, regid, tag)
 
-    ## Free all the operands (regs and immediates)
-    if hex_common.need_ea(tag): gen_free_ea_tcg(f)
-    for regtype,regid,toss,numregs in regs:
-        genptr_free_opn(f,regtype,regid,i,tag)
-        i += 1
-
     f.write("}\n\n")
 
 def gen_def_tcg_func(f, tag, tagregs, tagimms):
-- 
2.34.1


