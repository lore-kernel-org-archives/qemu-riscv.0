Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md8hX-0004Bz-AZ
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 06:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hM-0003en-QQ; Wed, 20 Oct 2021 06:19:52 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hI-0002wS-NV; Wed, 20 Oct 2021 06:19:52 -0400
Received: by mail-ed1-x533.google.com with SMTP id r18so24454455edv.12;
 Wed, 20 Oct 2021 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAThpzEExEQywLhzKwYqOthFiPfhu8r+HsDpRlEN3LQ=;
 b=Nn4BX2oTBBc8Ac7Rh6h8wL+vrdJXK+WpRVt6F9j41VuJDOCYk1/HWHQI2jADvrjWXo
 R+YFcCKq4jUqfzqY1Qz1Oqtl/ddGjg7WZCDlrkR+ifPhsZU21s6aVePcRUBC7wnZltCf
 ClL5TEnUImmgrX73wrL1qvNWgHwdv0KewSrUtT6oSsvJAadSY9/ecXYnXSGUTwTeYsp3
 2XC/QxMw8xroIOmcDdmSquRHv+Ty9+arf5qKtU/8AGMLn7bedkImwF7IiCd4eblxseok
 z6kjqkD3ZxG2r6LWsL0phoZ55FrxeOWYjw6WsZISp4+GBpdrwaV8k1kipI2P+noupamt
 b+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAThpzEExEQywLhzKwYqOthFiPfhu8r+HsDpRlEN3LQ=;
 b=0P8NPUetQk5z6EcJ4hoADfGlfyyL1VaEQnfNy/KKtuE/ibMQdW59Cf8FlEhH5mBIWd
 9LYsuSkTm4NAySzu/qVmQBc3+oID5QSUERzPgoMhJH0Ufe271jinq5B9WqnXSUlGz7lz
 7OlqM6Q0/d/nTPbgaSHDYdwlFAPm7F8fIIpE/PzJeAoTi3aX5NXPMJaUysPaJAoiy+OY
 +DnBpq+ck6OlzxPD7Pm+AAi6bmbxA+7j4my9OSpqDX2CQZWzVHXfS+n+ZEkkVV5XYCGU
 cTi71hJgTy96LzRjAesKEYOp6CxJ7YWIluGTKfCXg2wL2tvQdx9S5xK6H/3IE9C8IyzS
 n5dg==
X-Gm-Message-State: AOAM530wRWOaMXe4yUPSYbFSMjPtIdu9sUh3HdRkng3fiiq9dLyEu2hb
 6SuC+NltUhhCG58j+XvQxFg=
X-Google-Smtp-Source: ABdhPJyUA7Lt/N0owajvNvWwS4Y+WiRR/7h+AVx4U803MlQRyTsSbfT+GLLZGLAoobJ28VLiWwC8XA==
X-Received: by 2002:a17:906:480a:: with SMTP id
 w10mr46484553ejq.262.1634725183947; 
 Wed, 20 Oct 2021 03:19:43 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id k19sm821284ejg.13.2021.10.20.03.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:43 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v15 1/8] [RISCV_PM] Add J-extension into RISC-V
Date: Wed, 20 Oct 2021 13:19:28 +0300
Message-Id: <20211020101935.1369682-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 10:19:53 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e55b2f5b1..3f28dc5f3a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -289,6 +290,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_zba;
         bool ext_zbb;
-- 
2.30.2


