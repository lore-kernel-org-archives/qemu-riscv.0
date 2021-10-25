Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf3tl-0000BP-Oh
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 13:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tY-0008V6-Hz; Mon, 25 Oct 2021 13:36:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tU-0001sy-Mv; Mon, 25 Oct 2021 13:36:24 -0400
Received: by mail-ed1-x534.google.com with SMTP id j10so2684621eds.12;
 Mon, 25 Oct 2021 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KIrYmD/+jqYxwxjugzy8laRQMng9maelmFxSGDOYKDM=;
 b=bB3dOIofVuwSz6vK4CuGLbsgAIUx1tCLnzEKIvSpDhgZsxm22Bi1Zx0wE7DGY09sy+
 t1sXsRwUaByyeR5qqLcktYDPYs8STuDPWHS8+p4Y/5vykYcJ0OO4nnkzZpNYzMb6MdXr
 +7HJhXeAjnxG0QP0fyyFgWJOCfxTlBwzXD1u5vw96ZvK0gq+vLlN+2lodJGIDVRgAvdM
 LBoZb0yzM3NBltMH61AlKtmTzNfmc+dAEmG+RZYr27DWp43mvcb06VkmDT2zZcbnVgiU
 laAbGHGB/NFqJtYuq2xGa1Xoou4wVRlQNUMLGskbpq1kYsuP6bS8gxGcK77szLtXy+c8
 q5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KIrYmD/+jqYxwxjugzy8laRQMng9maelmFxSGDOYKDM=;
 b=mFi0s4RPFHJerftGSBNZuXnqytE+eW9E5NluL2R+kVM7yxh1JYFTdXP/rSH8y9rmJe
 KmOo4BvPkgaBQJKtq5e5maxz4fGFZ0g3WELm6lGxO1e4h0UCXCu8taCevtPanau2F90L
 H8nVwbSdkSPSqIcbpkOgGSyUpt9nw10JYg7cI5wWq5kpRDspBC1ITy63Pn4wPa/ewyMw
 LzB6kVny0yJ+B0c8+CiEVfo4+7TcWAGY/LTo9l3TNIpvA4hD2uzTTYNSIiGKrQySW7pv
 YsjjwU1Y44VXPPDqfhps3IsQoOYohHERyzefvQtyThUpvxk6ZBr7y10IyHaty5DQF+Ch
 0QEw==
X-Gm-Message-State: AOAM53239FkgU7B3EVS1sWNEtyAooxocF+IpR1xmnF5COhhM9fVgPJKK
 P4pZ6CVRR2xdTwyvZV1Z0IY=
X-Google-Smtp-Source: ABdhPJzY2LzA5vjPDsD3WY5wmSQnpWilLDObYRCencDZKKw6yEehNkGfPUgZz+ZVlrAxnGG3UaDNTQ==
X-Received: by 2002:a17:906:d1d1:: with SMTP id
 bs17mr23130578ejb.198.1635183378724; 
 Mon, 25 Oct 2021 10:36:18 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id q14sm9718871edj.42.2021.10.25.10.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:36:18 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v17 1/8] target/riscv: Add J-extension into RISC-V
Date: Mon, 25 Oct 2021 20:36:02 +0300
Message-Id: <20211025173609.2724490-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
References: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 17:36:30 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a33dc30be8..1cfc6a53a0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -65,6 +65,7 @@
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
         bool ext_zba;
         bool ext_zbb;
-- 
2.30.2


