Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWzt-0005dg-Ot
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:06:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzr-0005bd-0e
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:27 -0500
Received: from [2607:f8b0:4864:20::630] (port=41767
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzp-0000Wd-3Y
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:26 -0500
Received: by mail-pl1-x630.google.com with SMTP id k4so10976732plx.8
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWgD4UVQ2TdjrIF+P3KQ6I8xUCtdROW+Zd/TKCzCFU0=;
 b=jGiNDUkoIEzd942ng73LqRf4HrP+HyfLwlDigBG+F6vht3XJFvAsmxTXs3VtbWc+PL
 FfgeCyQS89JGZJb1s5xw8utCEY4r/tC6syN/9D91tmTlOEBETvGfFOzWAMQUookaHoen
 QnIRkZWH6PqTTMsyCbxCGCOLZkFkjbM7ula5XVdE98y6jcCK37WhrNwHcZaf8BA9tCuf
 NteN8ruxAPfq7cEVNb791LFjI+DcTvMprusxlp4RgYD9qlR00E094CspinaloBW/qjXH
 LzAg/4FmJpIxJfUJeIQ0SYP8c1Y+U2ejay6TVQxYZ+8IC1XgPILhw/MYQB1HeyoMLgaU
 5s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWgD4UVQ2TdjrIF+P3KQ6I8xUCtdROW+Zd/TKCzCFU0=;
 b=0blNB/4JABdhHfX5DYjj6r7WH6f08pRUlrshi+qqIdgKkFIqVg32au8d/28az55Tnd
 xDFh2daxV3iooHo5dtof0rV9qr7a8aFyyZx3o7Ob5Y1fPZTHVFc4taG2pnF2Gl44DIlN
 RjOoSPYwLCBu++tga/dwelgEBBfVXYOwujABjH0DRT3FR9OHW0Tzj4igqOpuItLqEk8F
 +lkXxuYECqrmxuHHZjGrqGWNQLChzWlNV2NdVsoNfRAca9ocmU7klzGLZJn3aFNWT0JA
 qeepPSQ21Nx/F6c/i+LCyxT8LPQMNh+e1JF1+m87fC3KwO6dGwkDHMACs1Bb4Z0kAXwB
 IkCg==
X-Gm-Message-State: AOAM531za2rXZ87DuRKMFVJH1U52Jo/WX5JFgDxUEOBeUDL03g+ikhbe
 8t+gGbwDPonx43KVE/4LHAKL7g==
X-Google-Smtp-Source: ABdhPJyDdqAb0Rn2+NvyxdSJ7jy4XqZ3viaa8XsH2WSG5CFkCRngtxA+riLE0sdx7WXDTKZoo5liZw==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id
 mw10mr35415164pjb.89.1638155182966; 
 Sun, 28 Nov 2021 19:06:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 33/77] target/riscv: rvv-1.0: element index instruction
Date: Mon, 29 Nov 2021 11:02:53 +0800
Message-Id: <20211129030340.429689-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:06:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3ac5162aeb7..ab274dcde12 100644
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
2.25.1


