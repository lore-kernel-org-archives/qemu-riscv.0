Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG94V-00022n-5n
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 19:36:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94T-00021a-CW
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 19:36:57 -0500
Received: from [2607:f8b0:4864:20::22c] (port=43715
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94R-0001mG-2a
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 19:36:57 -0500
Received: by mail-oi1-x22c.google.com with SMTP id t199so10406363oie.10
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 16:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EyU4+THqr3Y8pJWma7DCKWkG8X88FhKyF8Z3F935mXk=;
 b=UGCeGcxXtXrmlrdCUG7Sl6m2cxxhrzzxTNkW50mpaueHrLLbIPa76eYHpQRL4rwbPC
 WvavkOJdC4TBpBXYIgqHyOWyEo565pdhYr/u37yYts4jN2T0d8tnZWF751u/WfxQKvBX
 6vs27bsYrxfrOFBqoVfwy/HGxnpj5X5r+KlwOQ7DOW6Uri37mwTx5uMdmZ515mzp+EHV
 T5oKU03Plwlrh0DqbnENixDdxNnaLf1DS78l9OP1X3CPGZnFZvnyMmVT5YWN77JEzkRb
 L+4uV+tmahT6uLRKBzxbxeJhL92UOd7k/e8EgfZai7Rb1srXFItIJ/i67nq2t7Xs4oxm
 fP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EyU4+THqr3Y8pJWma7DCKWkG8X88FhKyF8Z3F935mXk=;
 b=ePP99Q4zjkkeYw9YdVBbOnHnhxDi1Ma+5n/Hb7/7YP9xueczwSmqpOb6h9mJNDFYmV
 dZkzByfxP3xFW6aRo6XELqiNBG0gj+Xs0r86dU4p66OO12FWc3W+e0XB4Gabbi3hcMOD
 yETK2xEyJgFOUwaitLvm7DTxv5aVbVlTI5u3Yj8RCRD1EplL0/eGMJ7PbDcOfVEYAlBc
 UFEHJijMwQV8o+31adL06sxh5jhnNnEKjkM43xVoTXI0aXbYpO23MuJnjc+YDNHkgKH0
 vPS6cBMEpcSdBvoNKPMuWXvEpe5kdi34h+x6T4FSwlVFqYMkoLrYfqfyg4pRZyX5JUC9
 FznQ==
X-Gm-Message-State: AOAM532+WkQfloTKR0dV1g6M171KUTqMKJbRD1GAgMMBIf4uzKbaql8j
 BR+zPrO+ziP0gElM+czSPEGmNg==
X-Google-Smtp-Source: ABdhPJwTxYCnpx3iOYhsArZVHvbjddAVL0IrzlcpiUi05NgH8OqXJTtkKlT7wAgel5l418D2437YhA==
X-Received: by 2002:aca:5e55:: with SMTP id s82mr2507034oib.109.1644021414207; 
 Fri, 04 Feb 2022 16:36:54 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c22sm1148888oao.43.2022.02.04.16.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:36:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 2/6] target/riscv: Add the privileged spec version 1.12.0
Date: Fri,  4 Feb 2022 16:36:01 -0800
Message-Id: <20220205003605.1150143-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205003605.1150143-1-atishp@rivosinc.com>
References: <20220205003605.1150143-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22c.google.com
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
X-List-Received-Date: Sat, 05 Feb 2022 00:36:57 -0000

Add the definition for ratified privileged specification version v1.12

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


