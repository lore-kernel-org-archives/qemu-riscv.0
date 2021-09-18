Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbu-0003N6-Uh
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTr1-0002zn-Vr; Sat, 18 Sep 2021 02:29:39 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTr0-0003uC-Mf; Sat, 18 Sep 2021 02:29:39 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so11543536pjr.1; 
 Fri, 17 Sep 2021 23:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qAxIjuayNeVCLSsxLHRPwSTdeZ6cUP55LCrxE6uZ700=;
 b=V46oFwIeJ8lpJRKOZTCFF//DlHC/qMNj4oyyoCKlabZcgSq28y0kcmnWoZNMqckpoP
 i3TDR9qd+60gg0rsQHOwe4QdbeSrXVR3Z4suoU6ASrGKRzeSi5Au0wngn/PB8wtPR08r
 GEDJU36MaeRAfsjSUie2M2tHH0ndTldZCqOD57xQleZmUm9RvD5+j9FdaMQuO2hF+852
 lDdVtO3MCSAe5fZ64eWJKDRIA7SmXRQzraJFbMoW/FkzgApDRKWwiD8MavhR5U28U9hx
 kVUnU181YcvO1hy87YUC6/FhMKSVJRj8lQSgoLt2jDNE56nHxNVRTN/inP65+IxPu/lh
 485g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qAxIjuayNeVCLSsxLHRPwSTdeZ6cUP55LCrxE6uZ700=;
 b=EOd5s34SkDu8j6l54hRB81lvNjS1tuVdlPSgrz7+FwqNSzCwOQLRBxk4np6zhRvMha
 +hB/yR1VJYHHYBLYojjtwI2jyZHpR+uqfLDwaG9QqX9UBo9Gs1FvxPDLm1FdZUvlaYnf
 o13sbYQ2vVism3plG+hdGp3TIBWb1DCx0BTJc97EqlwZfRpCXYTIPYMak2QarRLd6GGl
 MESmrNLXFDF7D7vDeFVZNiZ+KkC4lnonGaQnqkkfKthslTGfFDynGo14MMY0CdPs7PZm
 r9r+ghbJQWWSUOMxOomieOgNvAvo8YemQ//mguIUkkShR3c0H7e7sp6cDaB7sMZiPBAi
 JxXA==
X-Gm-Message-State: AOAM533IwIfXq7w2hpUOKQGy52YjNUtDuNfLYP450sQ+CSqx3L//P9PJ
 gLOmXX+AKHemcRAm7TzDZtUo/lUzSW+oQRzA
X-Google-Smtp-Source: ABdhPJx5QOte7oubAtZc+upbcT+hXjaJ5T6U9SNlvEQuFqMIwHG1RuLjRmS7wENiPVnw6zwQaEW1zA==
X-Received: by 2002:a17:902:c948:b0:13a:345c:917c with SMTP id
 i8-20020a170902c94800b0013a345c917cmr13086291pla.61.1631946576957; 
 Fri, 17 Sep 2021 23:29:36 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:29:36 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 09/10] target/riscv: rvb: fixed an issue about clzw instruction
Date: Sat, 18 Sep 2021 14:28:15 +0800
Message-Id: <20210918062816.7546-10-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:22:09 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:29:40 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 39ca5a573f..4523a5cd4c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -456,7 +456,7 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_clzi_tl(ret, arg1, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
 
@@ -464,6 +464,7 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
+    ctx->w = true;
     return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
 }
 
-- 
2.17.1


