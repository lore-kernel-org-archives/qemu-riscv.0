Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxJ-0008S8-Q6
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxI-0008M8-6Y
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxD-0003MX-Jd
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:39 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so8775645pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=WpSzo4szljjrUcPqjdd/Kb5OmErKTt2VvA4YXZAl30uCa7oPQg5n2qnjDN0NZsyk1Q
 k3LzHZuQbv2e7wk47QniGHDDNcaG/r+gVPEbmYdlZ8ui0ccLAX8KyMW3tQRrtqR+f9Ui
 b3YUOHz2JfhASIATBf2PHIhn4wLhp6vFBf5VUUXrFXu5eQ3pgAk1Hoc/VJZiNzZftHON
 NYuzFm8Nwsf7Zs/7QCsZgNJGu6Wbp8BCJ+z1goLvlVI2LNSYHKLFwqZHEM4S9/hnzOmB
 pwz34FqBKekaTDb2dioBU7uNK/2hpONPAChJyeCOK9P9OJfMev2oFcFAdwWoWcOj+R7Y
 gbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=CS7rjavibWxPZj7BJxqXrh+CRK8DhzqJnMgqu5O+dBILcsaut3FKvboLm0iSe0PiF0
 KgwbHA3vI06xDV+tbnr8q1NXiwOTEwXUhAW9Mi8TP/9jFrv0hnFqJh21raLaBE5yR54R
 yJcx8u5vlnvspU+9/tf315GwgznzpUwv5ROyXprr7ADAkaqCihWYpeT6cQzJHSX316s7
 cPCAyhktbgqtM25E1zmOlu6V0egfgqViL42DmrkRf34RozCR057CeTazej2mwVnXLdNr
 OPtTqDTDWd4iczuJ/EX0KctkaRkAYGMWky4kDHPIXR6unQgfjEAy0Is1xKo2Smvv+x8j
 BmKA==
X-Gm-Message-State: AOAM533K596mgks2y8EsCUPdgA3OafnhrqHB52g7sZQCzn1Juol4r8L/
 nKyqU5YQ9e/xeHtycEf6ubVJlw==
X-Google-Smtp-Source: ABdhPJxQDtHaayknVSAz4rWQyb3g8+DMz2mqEgebOeMnkxetZBBRHVsOcNapzaO6BlakbI8u4YhaPg==
X-Received: by 2002:a17:90a:ad98:: with SMTP id
 s24mr26207705pjq.122.1634284114420; 
 Fri, 15 Oct 2021 00:48:34 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 28/78] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Fri, 15 Oct 2021 15:45:35 +0800
Message-Id: <20211015074627.3957162-35-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:48:40 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 92a0e6fe51e..f61eaf7c6ba 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -586,7 +586,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.25.1


