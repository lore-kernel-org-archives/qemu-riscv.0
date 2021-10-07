Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYXUr-0004fC-9a
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 13:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUV-00043j-9C
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:39 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUP-0006se-Ur
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id k23so5501997pji.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Oct 2021 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=dYJQabiiOiy8WlfGMyJ7Hpy9wz6gMdnuucUOLUhfFSYVG64KwaGQB3limVpj7c2s4P
 86os2QRDbjK0Ymj5akuDuLQxhaSLKhsfCJbjEw008p7YFozebIIcuCKdbmibX6d4J+q5
 kTlOvH+Ppl4PfdiJ7PvxONjiY+dfazZTG43j1W6N+WIYwfDLzD4czyRkhpe72YHUlh2u
 ySvF6He5Jhx+3knuMI0PhJUwB0qzsbdykOSXD7x/oUGH1iH5jUtStwtNFXPdL1+0OleE
 I/yoWIGFK5IODHRDqTsG1RRhnFHxf8NBmNDxHvRb0IdyOY/EQKJW6HPY9Jv36tFilxR9
 a9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=0haZEneiRG8ueLl5YvwRGWA5n5JIWLnjhyLwowVAfEgtFabPExSAa6kL1dPn29B7wV
 fRm/Xq97zrZPBBZKmubObgRJnICQq+FLn8p7hzhYigX4Zpj8Q5wqFHxLWynAVVtZXat3
 ELGe41gRaZBaVtEgKicVrwGIfk9RT+ZfneFh+GTR2ZPKCuhASkMqkpTcqSfTGDgtwUze
 kQANMXfOjQgK6A2pKGSNwYZgSbJUOmQUDkNlmnGrP/YLfYfj/1VYvFqoRtXFpiXgn9FF
 UIG9SbKXiOcw+HtN9n1r7mqPqs0T9KQ5otYAGvCQAxDeC8a9ONvinHLcjIkePDVEd6u+
 1uKw==
X-Gm-Message-State: AOAM532q6zGDn7k9iUvBIvmvSesYufwYc4MoU4uMZYvLK6mbFS8+19Xu
 2tjUzfwQDDh9TzqyvFyeaGFVFA==
X-Google-Smtp-Source: ABdhPJzpyeRGk7U1fnJAoFYOkzTFFExJBjw6u3QuN+tUQPll9VD4XTVeOutKJNKC1/LMc23FHBw9eA==
X-Received: by 2002:a17:902:8d8c:b0:13d:be20:e279 with SMTP id
 v12-20020a1709028d8c00b0013dbe20e279mr5017960plo.5.1633628848591; 
 Thu, 07 Oct 2021 10:47:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
Subject: [PATCH 06/13] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Thu,  7 Oct 2021 10:47:15 -0700
Message-Id: <20211007174722.929993-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 07 Oct 2021 17:47:45 -0000

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..bbc5c93ef1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


