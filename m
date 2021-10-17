Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9wj-0001Zq-8h
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wi-0001Zd-6J; Sun, 17 Oct 2021 13:27:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wg-0003BE-9i; Sun, 17 Oct 2021 13:27:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id w19so60910810edd.2;
 Sun, 17 Oct 2021 10:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAThpzEExEQywLhzKwYqOthFiPfhu8r+HsDpRlEN3LQ=;
 b=luoBRFez5Ndp0E1jgzYwwwYVSWxQSsZ9AgYC5gfMOgSjId3if4qqrXQdb0WJ5ljNWv
 nKchpFjKMibnW4T6fBtxr3cCmdfqckeP1C4TRtagkIFeXVPZSOFUs+AV9VGnzPe07U9G
 vDMQRbIt3mNWlxnRZETODSwerqd/3VVOmGbuDTVQjTNpgohYbxQwx+eeSvnDq1yiU9UX
 u6MqADeiwtQOwjd2H9PBAFy79DXp5wdwJpGQglP+OX4RFjJS3FsfYJvw6ZNg5nr8TYKE
 AxFuqrH+HlKJ4FwQbOcxYvfYKlhBKDcTKDURabWb3J+qgZRYBt7dUhjP4t22k2cq5Y43
 VGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAThpzEExEQywLhzKwYqOthFiPfhu8r+HsDpRlEN3LQ=;
 b=RQLSSJSrnH5v1knfqxuRPJUG8M43A6V93uqus5NNeCdOUUCD6dlEvCjgusQllglDWv
 r7uoYE4MwddogxucTq3iSGWJ1u/3SkqEuFQ/qkjEHgrpjZMsrw81wNXzacvfsTw7ZyZ8
 1KRWIuIuHohgLIGRKohUKfbOD+OAlIMw5YNkX1Cd+Ki4g4A0IoTkOhurPg/0jqpF+urk
 qq/K7CM2knQ1XZ5/RskkEYAJOeV9NqbGaZWNKdI58CLUayrkyyYZYPm1arcSSrtBJKbj
 xjARYs2Y/ixRJcz56Qf0a/cgoK4XPJaprUep44O0vz8/rO9TEajyGOf19+/uuVnhhgPt
 +0vQ==
X-Gm-Message-State: AOAM533wZR0QYyrYmMUIq0HtqH5sxlVALn7EVjUiEJyhV5RT3Az3WEx8
 fhe963w+unmFGVmgcoOYdZ4=
X-Google-Smtp-Source: ABdhPJz+IWppVVOA59vs2SUweHpWkMQj0H08WL08uAPjd4ARX9q7woXpCRNudTyK4KJcCHKXrAXDYA==
X-Received: by 2002:aa7:cb96:: with SMTP id r22mr33551093edt.87.1634491655638; 
 Sun, 17 Oct 2021 10:27:35 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:35 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v14 1/8] [RISCV_PM] Add J-extension into RISC-V
Date: Sun, 17 Oct 2021 20:27:21 +0300
Message-Id: <20211017172728.759687-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:40 -0000

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


