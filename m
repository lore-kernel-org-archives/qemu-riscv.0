Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbVqd-0006CU-Od
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 18:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqc-0006CK-P2; Tue, 27 Apr 2021 18:06:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqa-0002fo-Tt; Tue, 27 Apr 2021 18:06:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id u3so12942801eja.12;
 Tue, 27 Apr 2021 15:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5NCSBeXLLnQxRcsQBmTOFrJe1uMeKwEpgQvj+fl82v4=;
 b=T7kheJnPdbKDifHgaaQzgvOqGLXk85WkeUWZJhwG/efnfcoIy+8qZNpcuXD9a+y9ig
 0frhqhEbBu9ThXRbkFVx+3MGoCCKV5wpfdqLfnKL0u9B2duJ4vBbtXmH+LfoWSbF2inm
 9/MXMrsGDL7tj8drg6wBWT4YLLfAD+JQD5FDsyYvWGxv2lbYrVZU6RyJDUs0xfBKyA5I
 PABOQFvEB/52WXQ2r7MHXj7HSP/7Q10H7DeflfZnF/ZBQP0grxrqlh6gT4SYDKhyMSMq
 COmyBVCEu6NBh9mde2L757ZID1aIGcHloCyvf/9XoJ8temt3RzbTe5tm9NiTCpBo7lIE
 j04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5NCSBeXLLnQxRcsQBmTOFrJe1uMeKwEpgQvj+fl82v4=;
 b=QDvCKzraoAqPjlL3B6YVE6tlywDrGl4n6h6PHO3buyh0raRBWavYs4YAq4X7AgnlhE
 VJGl8687Fa9bttlUXmjfqGp1KgtH3Sek6bypF9dIUWgCxHgg3xx2ciEUsfsML4LGtYf5
 szubmnbppCFUN6SGLJ7gIQmrhq6zvhV3VHq6/Xm5FtfjhduynsAnrXoErZUZeL43QCtf
 CjpbAb3en9ZjtRqa3f8HHRg8Q/QRdIhwdedKud4BkQ++To8lzK/y76AQOuvIQ7ydGu1H
 Q8CbNaSBbH5OK7lnGuCMGRNL3ksxmZ0PhlxWPdkKC0njEyzx0R6ExQFcfd5HG9sHpWcE
 AUyg==
X-Gm-Message-State: AOAM53263TqxG2NnOt3pPS2/X+iZtUg+UXYQCplCsJKKTV0JOd/S1CGn
 de6fIEjVzpMCR7QqO9Qyus0=
X-Google-Smtp-Source: ABdhPJzdXCNd/+mJpq6azZaoTiXfNFjKiVVVhR+yDMH7izvMi6ICOjaqUW/8fX8IoXa6dZP3S8Z5Lw==
X-Received: by 2002:a17:907:397:: with SMTP id
 ss23mr8255581ejb.298.1619561182391; 
 Tue, 27 Apr 2021 15:06:22 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id r10sm640049ejd.112.2021.04.27.15.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 15:06:22 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 1/6] [RISCV_PM] Add J-extension into RISC-V
Date: Wed, 28 Apr 2021 01:06:10 +0300
Message-Id: <20210427220615.12763-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
References: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x634.google.com
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
X-List-Received-Date: Tue, 27 Apr 2021 22:06:27 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..0ea9fc65c8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -291,6 +292,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


