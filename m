Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVVGD-0001DB-Ce
	for mharc-qemu-riscv@gnu.org; Thu, 22 Oct 2020 03:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVG6-00014r-3q; Thu, 22 Oct 2020 03:43:38 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVFr-0007eb-8g; Thu, 22 Oct 2020 03:43:37 -0400
Received: by mail-lj1-x243.google.com with SMTP id i2so894145ljg.4;
 Thu, 22 Oct 2020 00:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+goKHHTPNQf+byU52c8msGIZZ/A616sN7JzkzNgsEM=;
 b=PRVMlwH3p9cdDtK/AJjNTto6KpeLjgX0dzV39nTWtIGeQQBLVi65h5aun2g4RA8nhf
 lRW4AmyV1C2HDSn7t+oqfo0mVRpCfTUIfWseFi9YAsY9aZh2j2/RJ4XJWguOthgxw51r
 9NL7u0VspkU+pxFuCq+gsvdM10aUiEvZSZe50ZIrCoHDCHNvC835qYXanB4fsVKo4t+b
 C0+zy9nlN/OVThqggR6JHQ+RuTIu8d26Myyrp6kBWxreHmMX10ep1jDtDzsI5XFJqQpl
 zrG5aPo5vFXepnMjYkl+6CmIK8Kev60HMUkjbkS5532VVW87B55OudRXcYyREzlr2GpE
 ePPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+goKHHTPNQf+byU52c8msGIZZ/A616sN7JzkzNgsEM=;
 b=b6ILhd0Mmjraenu/mgas4+14kRAkDEsJXU2jx7Cs38vHah/Tz25MXvLkrF/FODErMd
 gkW4MXHOi1u3xhbPxdrwud8QXIJK07qp8OYmdCh1gXpsLqySiaIUCvXoKySOcjnvNDKo
 6K8XtMvza6Ik+E7P3qwowHjBGNmBysTmg2560f8hvjhzS8M3jGGVnta2j60hJlgax/wC
 J8rMW9qxNrk0jib6Sdffrao3rsZsmeW4h5eEuFoEj0qO3Q5Bu9C9kfrmoekBAKYYwo2y
 l6NpZXD4KAw1eFSTFS1v8k4oYEmYGCImr84V6IAPYKSioAqyRYJRuffi//SrES3/yInw
 oJfw==
X-Gm-Message-State: AOAM5323X6kv5CR5Gw7nxSSuAK0iV39IIV8Ir1DH2o3I744Ol2us5FQn
 psHD6CtUDtmq5HpG437e7EU=
X-Google-Smtp-Source: ABdhPJxTOrqgaVLzeKl/VvMQW/Bc2T5j2fVDZFWAjonNuJ+3L1Yyj3kEKpNOjivNK47y6+8HDzHwbQ==
X-Received: by 2002:a2e:9d3:: with SMTP id 202mr518428ljj.449.1603352601388;
 Thu, 22 Oct 2020 00:43:21 -0700 (PDT)
Received: from neptune.lab ([46.39.229.104])
 by smtp.googlemail.com with ESMTPSA id n19sm138887lfe.142.2020.10.22.00.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 00:43:20 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Thu, 22 Oct 2020 10:43:09 +0300
Message-Id: <20201022074309.3210-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022074309.3210-1-space.monkey.delivers@gmail.com>
References: <20201022074309.3210-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Thu, 22 Oct 2020 07:43:39 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1c00d9ea26..56633c14eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -465,6 +465,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
         if (cpu->cfg.ext_j) {
             env->mmte |= PM_EXT_INITIAL;
+            target_misa |= RVJ;
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
-- 
2.20.1


