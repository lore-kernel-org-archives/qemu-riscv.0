Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxg-0000dF-NP
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxa-0000YQ-2x
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:58 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxY-0003e1-3f
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id q19so7703064pfl.4
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itebK8eni7VGJUolELi0pjh1+UQ72iE/GksJx8l51UA=;
 b=DOcCPdl3q4z3iN0cXJQCRNMskM22JbMiDhyRlDjSAieEN/kdaRMZRIbwIR1dHk4Nz6
 16fFhNLYGYUEcfdMTfnsqiw6rPRvY4dfUliRwr9u8Bfk/DXdS18AKXsrbC3Npc58AeqQ
 cfZSXO55FuWMurbK865QHS1aYBMFwGaBv0PDxFwYpcPrex6b6EbSCwNyVuKPb7uFxSMB
 uhZZPrIYtiWjSM0pGE6tq4zTYwtXa7yg4bWr/OHPUmECnsW4u9oLuIErc9XX0vwjSgvz
 V/Ei3gPLrptoPjaIthhndcwVDEcyBX3l5Zi2+kYuZLJ0Pv0wdkMyy/FMf95KgSR0kNsb
 Wkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itebK8eni7VGJUolELi0pjh1+UQ72iE/GksJx8l51UA=;
 b=cmPRWvaOK1C/+UlobpdDxXsFUwmE/di2U57Y2VQcyhYkZ0z0vTHTdIO3uTmhmUIQYl
 ZvwcRHZGhUHemelORICGxGbxox6P4uBwZXZT4QZK+PZm+uL8GRfxFEFCxEdb3T0mnRwt
 +smGmW5qC1D52y2bfbnOx80AM5jM9pob6V0QjsjE0J6Bx752MOTL6KRYzXHfXX4B6nI+
 jEV05B3e360SiuFAG3Ux84Z9T2MEG2TvJhZH2QZXOENZf6ErfK5F5kdujGhfG9HyI63R
 o+YbEkiyqQbLdLHb6fqzhe5GSxa0g7znUGvWpx5Qrt6guNosl7vAx1+Z2ZHyO23MMUaW
 G4Fw==
X-Gm-Message-State: AOAM530/1S/7uk4VWO4eRegQHkDBvNCcoRgghKxCNIkdlvRcOW/Nvv8x
 P9zbQQI9F3yEcgH93Hdh+q0F8OFUNIqdAAym
X-Google-Smtp-Source: ABdhPJy3RT661zqLoDkms31d8winPiJK6/Id3l6dzaBLZntKMs19nRJjny9wUlja0pCUzvLg+Vx9DA==
X-Received: by 2002:a62:ea04:0:b0:44c:7370:e6d8 with SMTP id
 t4-20020a62ea04000000b0044c7370e6d8mr10354443pfh.18.1634284133886; 
 Fri, 15 Oct 2021 00:48:53 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 33/78] target/riscv: rvv-1.0: element index instruction
Date: Fri, 15 Oct 2021 15:45:41 +0800
Message-Id: <20211015074627.3957162-41-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:48:58 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


