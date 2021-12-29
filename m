Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OnL-0003zV-4I
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnJ-0003u9-FS
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:25 -0500
Received: from [2607:f8b0:4864:20::435] (port=35536
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnH-0004e5-T3
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:25 -0500
Received: by mail-pf1-x435.google.com with SMTP id v11so17584802pfu.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaewoL+pQeacrjgH2M0YD+Yq4KGUykd58jmJ9cpH35g=;
 b=XlrwDQZnSk8ECns/6XQixEsNCkxAg2t9NOEskYGiWk63eZ9JJf6cIoCYxO7r6qDmL5
 YCZ6AFSSnb0U4SLIAmjN26ZEXjCL6q36LpQPpzoQqNqiwMqfaroWuoZUePbtAn1/rpGD
 YjUNOdVmOzXbi4H/8HSAeBJPS3gdHJ2WVXLxabOcE0pa4pZ6dP74rP5Oi1synvqmy/Ve
 QDGciup4oeENSAcfItJvfuK2hOpsWjWOS4+2pGKt991i+rsjAGoyENs3Vksyvgmv1kmS
 saItF9FidGpye15lu0MqptJgRz6hYuyuQQPj4TWotKdW5XCK/b5jWYAA2frU59ZanhBA
 GwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaewoL+pQeacrjgH2M0YD+Yq4KGUykd58jmJ9cpH35g=;
 b=ygyEKhwkic1LyHF451/1DyhaKYcJQ7YnISVmh9XP/W+Lz0Qf62zxeBmLAKf5P+rZ07
 PJ2UtNzqluOG5vjC/rLKUwfdWuEAmfh61BH6mn4wsX+VI7xs+ylPrvAhCdTcgMf/diZ5
 8wn6hFZg2ERFFGOC2igKEtYKYTygewv9xRnn1lz5lC31tUrP+NytI+6KdR5AfbwmKixg
 /o3QuO5/w1k1VFbarh53viNlm0zJ/LJilikUKi0B+O51pjLBANljXWbM907Z5CGXH7tg
 6sOeM8ZdGXeXpsDzmFt2dyLQy3hBEUdRmbqnWLfEm1+W1gFCrLV+UUAB261E3ow15KNo
 ncrw==
X-Gm-Message-State: AOAM532ebVjwUN6IM6BJbxPx8XlavgvfV8UREbOLZcDzdhTt9lAsCSLV
 a+8FwQSbbVxfEtBrWov/gZtitw==
X-Google-Smtp-Source: ABdhPJwI8KBpMtnOoWisg2cZUZ5JdNJMVSsvNOfZ/YLNnO1y3s3Qf/knMXYPtrfhQ9jjpsOUcdVBEg==
X-Received: by 2002:a63:b54d:: with SMTP id u13mr20504695pgo.62.1640745262744; 
 Tue, 28 Dec 2021 18:34:22 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 09/17] target/riscv: rvv-1.0: Add Zve64f support for narrowing
 type-convert insns
Date: Wed, 29 Dec 2021 10:33:36 +0800
Message-Id: <20211229023348.12606-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:25 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector narrowing conversion instructions are provided to and from all
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9ca8d502b2..230c475d6c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2824,14 +2824,16 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
-           (s->sew != MO_64);
+           (s->sew != MO_64) &&
+           require_zve64f(s);
 }
 
 static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           (s->sew != MO_8) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
@@ -2880,7 +2882,8 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
-           vext_check_sd(s, a->rd, a->rs2, a->vm);
+           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
-- 
2.31.1


