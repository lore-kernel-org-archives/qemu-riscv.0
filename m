Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNm5-0006Ty-CW
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlF-0005w4-89
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:18 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlD-0005w1-Qs
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:16 -0400
Received: by mail-pg1-x535.google.com with SMTP id q187so9352064pgq.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=JkJyl0h73b8+Hs2MigF7wWQT8qFskY3RcdssvVksn+4jttFs76oiBTsHPnA16HTnNG
 oF+/dG9lLHe2mWteBJQoXPz/3VcUUuptVYhnP07LKshK4iKyxCr8aoF1y7B79JJeE9Fo
 xEVg9FjxqgPBnQB9Hkzbb7Zu57KnCNAxm7Bccjq/NjLkrhz1Y17rjimY6VKhkiVxSj9z
 mI+4W+33t2SILW+yaW9Z4q2CMQFXSIq97FTcu5vq2R0wYXoDgTO5nfbShsz0GHX9bg7P
 iYCJkTCig35xfwD9GhM2TxHNpxJgXr+N+Q3l1G/hpD5O209PIsI5QKaE3OC6tsyL/1E4
 upDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=spp0fl2Z+noq9YARZ7hVAtu078K8Yyild0FhfXMYa5X+GKXLEX4hzOU7oQW9JQuoog
 XtUBWjoZaLOYerDhr0Rc4vDBasrRifIkP3mY6XGKRGhP9mhu5DNOU+eYaN1kcaC8Dv/P
 Xe9jl2/VYI/gj6MRSIATpbSSzGETLpOB2NBUDCknMIOpopyGuPZK+nLggDW9OtYXsMsg
 nHqChe4k+F4e7MSLXA4paAG6+D/pzS+AZV9F1tHyhcXBgWZ4up0yGsdZlzSZeZtZXdrF
 Ge/uVV5lUvpsP1/sgljBxtbn/CXpwor+ND7n1pZow5vy4DJu/ZQdIHHPa5JgRV3JIa8K
 h7GA==
X-Gm-Message-State: AOAM531rB3VdzO4YETcmF968AEqJZf8F0WZ6InTqiSCF5jjDEc2oMDir
 N4tb7Ei0uJPWt9DsdeH/IanFUA==
X-Google-Smtp-Source: ABdhPJzE33YLy/xa5JyQ+Db8gZHB5qWwWHLnFNASPUPfGtmqjAcGEUdvB9GLx1sWbDy6VyAG+gVvqA==
X-Received: by 2002:a05:6a00:a23:b0:43d:e856:a3d4 with SMTP id
 p35-20020a056a000a2300b0043de856a3d4mr9715115pfh.17.1635498072806; 
 Fri, 29 Oct 2021 02:01:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:12 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 27/76] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Fri, 29 Oct 2021 16:58:32 +0800
Message-Id: <20211029085922.255197-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:18 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d8441d1f21..92a0e6fe51e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,7 +563,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.25.1


