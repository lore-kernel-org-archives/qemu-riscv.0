Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGdh7-0007yo-In
	for mharc-qemu-riscv@gnu.org; Sun, 06 Feb 2022 04:18:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh6-0007ux-5R
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:52 -0500
Received: from [2607:f8b0:4864:20::c29] (port=46696
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh3-00012f-Cb
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:51 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so10277196ooo.13
 for <qemu-riscv@nongnu.org>; Sun, 06 Feb 2022 01:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xsyBGPmuEohYbzq2IKhS66MWC7voJesO8CpZ+xmmjNo=;
 b=hSyXkGOJzdKXQhEEh87kxGadcnVRYqeVfm/bk0/4Z9EPZj/n9vXKpW9YXwwuirTMJP
 JKMMR7sfLcprgqUgyzMfxUBGHPcDCtoH/+yQt1h7f1W4u+i3QqfcmW4qR8ioUmw5iuKc
 NJFBDA2w+Kta/TSn9hPMQWCdCepy4LJ3OrbmrfWzBSwXt4je/p1XoNEJa/AJOri6DJpX
 MrTXAYEEQWdpsaALc1LJ6xGhjSC4EohMTGby6UK8PJA+Ca+xoJ+TPZ9wJua/Cvx+ng3z
 E7Clp3LoIdIk5AHKMnkA6Wpue010Bf9IGkmp4DXT9dHtEjAqUrkmywOcsI+37ifzzUwp
 6W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xsyBGPmuEohYbzq2IKhS66MWC7voJesO8CpZ+xmmjNo=;
 b=DmRflK7BbWoNbMk2hkcFV+yhP8ULhb0T7dtHRbv/uYS7wsH5TTbs7atEc0WafolJ0R
 VcqG/yfcZaRptlXlbspYqpJfDsJpTWJc2cDggRg3jlDYnyq6ihvJGqLFW9HxIMLuCCuC
 pP1tyQjpn/ui7tJ1tM3IfeO0CCkzTIkgL5DPpKrdPBvAnuTfPnEph+3EvKRPyinMTMoE
 MiHS+enW4q+GffkQCJtaB2JEOzUZYsjZxTIDwUI1uB7cgbGWEY8zdX1lBoY3tzOzQTFF
 0rlr0CwPrlUxycQ+vmbbgJQhp3o94Vj29ctABozmFiSVUU34l9FjFcSFcV8ThHHuGtfG
 fSkw==
X-Gm-Message-State: AOAM530aWNEe6fRgVCBMcQ4JAvh0xDOdjFZOHpb7oXu8noSk+FDCKF4l
 RRqVmEpKU8a8of2agFvZ5JLrVQ==
X-Google-Smtp-Source: ABdhPJy755QXDmopiMYggEWgYLiYXRKHa/bx2tStkhsg8C5kaaOg08fNOXEoliM2CfKVHzpUyuhZeA==
X-Received: by 2002:a05:6870:13ca:: with SMTP id
 10mr1929474oat.210.1644139128481; 
 Sun, 06 Feb 2022 01:18:48 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id 1sm1596841oab.16.2022.02.06.01.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:18:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 1/6] target/riscv: Define simpler privileged spec version
 numbering
Date: Sun,  6 Feb 2022 01:18:30 -0800
Message-Id: <20220206091835.1244296-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206091835.1244296-1-atishp@rivosinc.com>
References: <20220206091835.1244296-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 06 Feb 2022 09:18:52 -0000

Currently, the privileged specification version are defined in
a complex manner for no benefit.

Simplify it by changing it to a simple enum based on.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9d24d678e98a..e5ff4c134c86 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,8 +82,11 @@ enum {
     RISCV_FEATURE_AIA
 };
 
-#define PRIV_VERSION_1_10_0 0x00011000
-#define PRIV_VERSION_1_11_0 0x00011100
+/* Privileged specification version */
+enum {
+    PRIV_VERSION_1_10_0 = 0,
+    PRIV_VERSION_1_11_0,
+};
 
 #define VEXT_VERSION_1_00_0 0x00010000
 
-- 
2.30.2


