Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zE-00085C-3m
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zB-00083r-Re
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:53 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zA-0007m8-AI
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:53 -0500
Received: by mail-pj1-x102e.google.com with SMTP id kb15so1814123pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832911;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBFShlq0Mtiviu35cbAP5uhkLUId7RlJPqqDmZVwaNg=;
 b=xirFmfVUod07P7pa/XjEM8cMjT468Tgyyrd9rkdG3BGq2FKKGv8ypJR3QAvb8H0l/G
 8id1jZA/NDUcLXy7j/86dr6l52jXd+C7wbZuCouV3MqOw61tT/biwPjGHsKc6nhMblsb
 cLf4GLnWBmiy2eCGMyU1HU2m0oDHBkYh/fdKLPa4axowMkKUffvnsAHucSmRb7AC9Ey7
 QnD4INeihTIv9qetxHOlj0yDX4AiuWFY37sJo51vABEVD5EjTz6pvRrpbd5M8tUS82hw
 UFVjyGuGAV8JxM00RrWrKCdjoK7lTg2m6YHP8FNZ0RUDtO6ztnqFejMcjND1/NZptMgc
 UdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832911;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBFShlq0Mtiviu35cbAP5uhkLUId7RlJPqqDmZVwaNg=;
 b=4MP/WBGVC52hQaRs8G24BrLWNzRK0Ld4Toxls3iVVUscEb3S4xXXWJRxu7suMcOdwc
 QRVgqx1tXXmGJRSRBlvWiqNILMdj6wnCzw5QpY8UeGAOYNkU/f6qvSwZgcK+KdiEOesG
 97U33jjXd2IZBPMC6fYEU/uHqgSGul6qCSI9J5tXdhYBzvw21CL6B9UXQFLvSpXhE4fc
 ukRAs2p3GzXSaqK8VMJN1ePgJXcNYETQL+6MQZnNFKS+R3UHeUCATU4jC5XOXXFijHpz
 0lk+lx6hxFio3E50oe0JgQlYsxCeRZxIg4rQt7Q8tfBjdlPnvkrR6rwPhmaXCeDC0VVG
 d6/Q==
X-Gm-Message-State: AO0yUKV2IRzUgDyEU39rbw26Jbt7zGK4aqldmy2ESoPcfiMUIJVHbN8V
 xDS3zfYWII/yIJwAGujGZfkhm+0WKPPq0TDF
X-Google-Smtp-Source: AK7set8JLVsVYr9oI/lKgb+DcO4W+oSVT0pZlxlskrp0UHxki+YkU9cBvQ9ozjJypNKMydjzw2uVJg==
X-Received: by 2002:a17:903:11cc:b0:19c:eb50:88b9 with SMTP id
 q12-20020a17090311cc00b0019ceb5088b9mr1538220plh.29.1677832911260; 
 Fri, 03 Mar 2023 00:41:51 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kz14-20020a170902f9ce00b0019a733a75a2sm979406plb.60.2023.03.03.00.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:50 -0800 (PST)
Subject: [PULL 24/59] target/riscv: Expose properties for Zv* extensions
Date: Fri,  3 Mar 2023 00:37:05 -0800
Message-Id: <20230303083740.12817-25-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:54 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Expose Zve64d,Zvfh,Zvfhmin properties.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-15-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9b8747ab15..b7f212c59e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -101,6 +101,9 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
     ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
+    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_12_0, ext_zve64d),
+    ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
+    ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1126,6 +1129,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
+    DEFINE_PROP_BOOL("Zve64d", RISCVCPU, cfg.ext_zve64d, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
@@ -1185,6 +1189,9 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
+    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
+    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.39.2


