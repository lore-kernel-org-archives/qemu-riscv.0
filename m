Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMdJc-0005oM-V0
	for mharc-qemu-riscv@gnu.org; Tue, 22 Feb 2022 17:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJX-0005lE-KH
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:20 -0500
Received: from [2607:f8b0:4864:20::c35] (port=42682
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJV-0005Lh-3K
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:19 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so19648114oos.9
 for <qemu-riscv@nongnu.org>; Tue, 22 Feb 2022 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fDRU9fUV36kn4c3Xnw7jDoaNqJ76Gr20/A1kgalcYo=;
 b=dsa03m3hZRLah1dzxEvl17QOvRfgGEydYfVu3pZjcMShMYygQOVtPNFU1+6FxLKRHA
 ILFQqGzWbbaBx8dwOj/I558xAhWzszLg46B3e/6EWOBEe2NAnyPhW8KqdaugFHtdLbt6
 fD/+6cHcgazUdQLWkxw7Gr75lO2CHDLFoY7UyGzk02QRE9MwupQbQWQ3eJlWadqeJ+GU
 7a0GCLmHbcJ3WvGdu//kfPo8VvTyQaixdyyOCAbHK1bDVPGrmavsUIPeD1PspXhgLx22
 I0/fZbudiOCrnxYDjbFo2EXfzsZtaj+TwtyzH3aUwovfAgP6SKfcYnEppAhYD4dZW2jZ
 lc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fDRU9fUV36kn4c3Xnw7jDoaNqJ76Gr20/A1kgalcYo=;
 b=Ii7WwofttwflK7CUoLFtALmCRo9ZJ85V6f6y8d64TaSz8Rv/+O1ee+hNGbPWkSn8G0
 u1QSFin385Fqu8gKn/FzjKhSmL+KNSrxA58KHPCy6TQkAIoGYMSNhc9tJVwP2ovmObAC
 XOEtHcwpHQHYuOO1CQbuVdZGC0eXKVYF4WchlhxpITv+r20e/Iy9QHA+DG5kDDdOr1Yv
 byMn17HgqWpKqKtHFmh1GK1PUcP5T/6EYtqggQoChUOadoWJdWS7WpZgjXnxYLIa2nLa
 qJEOhJeWYpZOp+Zwzzs5cPzSgfei7BW96aord76sDcWNIwoE6teXwAdlczFPJ3Hn2FaI
 ZWrA==
X-Gm-Message-State: AOAM533sAFEW1+tAaRD59b8NWK9xuROF5/rvXrZEU8Xpq1JZQ8WnYaMX
 4ViLwKM8fUrTi0tjB7PFTfa8Aw==
X-Google-Smtp-Source: ABdhPJwbR/XWxaGT4SN+/Nj4k0PFHF1hJUrmVuV8OBwj49r1BkU/F406ib1zgoUoGNiHekLIBU5Hdw==
X-Received: by 2002:a05:6870:da0b:b0:d2:c66b:2e27 with SMTP id
 go11-20020a056870da0b00b000d2c66b2e27mr2757157oab.142.1645567630974; 
 Tue, 22 Feb 2022 14:07:10 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n25sm4901913otq.78.2022.02.22.14.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:07:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 2/6] target/riscv: Add the privileged spec version 1.12.0
Date: Tue, 22 Feb 2022 14:07:00 -0800
Message-Id: <20220222220704.2294924-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222220704.2294924-1-atishp@rivosinc.com>
References: <20220222220704.2294924-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Tue, 22 Feb 2022 22:07:21 -0000

Add the definition for ratified privileged specification version v1.12

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e5ff4c134c86..60b847141db2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,7 @@ enum {
 enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
+    PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.30.2


