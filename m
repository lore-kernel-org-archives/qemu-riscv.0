Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaoC-0006M9-SG
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvao1-0006DO-3b
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:02 -0500
Received: from [2607:f8b0:4864:20::1029] (port=52123
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanz-0006uO-2X
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:00 -0500
Received: by mail-pj1-x1029.google.com with SMTP id gt5so6283585pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FpDAFQ9VhGfEqzrsyL1IUBrPTf1Mfsv/b6eAB28Wq7A=;
 b=cg35nr6ZJN8N/CR9ryTYww4E1FRztXWNY2KurLeed1SKhxyuQgNAckBL0z/wh81ngX
 0IiSkrFcp46IxM7zs2BwsBWJd2KmPINwQPhWqPnmDPeg4ZFlMYHMgVBFs8Qn4bJRc+D/
 9W5j67GCoULrdSaWIklJbhiZkF5hNCgY2yDZ7Qhccmq0uhLw86xeUzUwe32XkJjyK73k
 TA/8ODe1vzc9xHFfmiBiUqsInCMbw3iFxCKyBdx2/0rkb7wEt7UfI3W5A/wrJmfv3pnD
 /kiNzjTaFRa/+ijV7JnjdejCJH0JBt8FmdHOr3ZCQ8yyDup2lIzjK4okVUqqmh3KSEDw
 wdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpDAFQ9VhGfEqzrsyL1IUBrPTf1Mfsv/b6eAB28Wq7A=;
 b=gYbAqn7xCikGMaehKRsFd3ibvDMAnz9TiIlzHxjpU7bGBmJZTJnM+nhYOkPv+jPpfQ
 VyNzM4O6/lgy6C7CaAjoTpb1pxqZM/5DueCraXtV9iUW0V6CJshJPM+p9iUIbASisDAY
 sI2TVbjR/FNxbyAQCUSSQcicIdOQYXXpO77B4k+CZINJAl16ScJNPSfmScq45WLgEQF3
 8g9QSLE6df8YDDwZHIqXH2tZ9KsgCd0sHfGpERsWB9YNkyPOSnXrSGCeLcYqSLdUTh6q
 I2VEGGrSKDSV+RDvH/sIlFMCbbxcpKIF8CmDyR6qB0ONlT57UD4Nl/ejeSYwdpdp+/GZ
 NRDw==
X-Gm-Message-State: AOAM531jkHfzA2OBXdtQTgN83IAZ7ZgaJNUN1jWGhK3MngwK1tYkXNCq
 rOlk77eT9yL9VNdg3GVXSCqcMg==
X-Google-Smtp-Source: ABdhPJy5XcPsqPbmkoVQ2D8pyarsEZr6VFzaLoumVX5bX5UqzV8oE5KmRPogZGlRt+CspSiAsCLj9Q==
X-Received: by 2002:a17:902:7c8a:b0:143:bb4a:7bb3 with SMTP id
 y10-20020a1709027c8a00b00143bb4a7bb3mr74440193pll.46.1639123137776; 
 Thu, 09 Dec 2021 23:58:57 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:57 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 33/77] target/riscv: rvv-1.0: element index instruction
Date: Fri, 10 Dec 2021 15:56:19 +0800
Message-Id: <20211210075704.23951-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3ac5162aeb..ab274dcde1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -633,7 +633,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-- 
2.31.1


