Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVILd-0003rG-K3
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 15:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILW-0003hB-Mn; Tue, 28 Sep 2021 15:00:54 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILU-0000ua-IW; Tue, 28 Sep 2021 15:00:54 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ba1so29175663edb.4;
 Tue, 28 Sep 2021 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFBG85A/bxkc4cgssKypjfQTM8t7ELRlcncf1RBkjus=;
 b=lkL+TZ0Xt9RyMrNpKQ0TtL2r7s84SWpO0kcLvQEyeto2m6ovvSgGoIyx5nufNN3T6l
 4+kHRMNwdSC2/w2Hb4eA8tUT+//t9YfHVwHx1AnNuVRD9dlDrpLOdShbO+xz1NaGnpTj
 R18Jxj7xPrSXr7NhCPCSp0aJUKQVVsnZcjJ5dD4xXQzm7ltBE+U8s5j+dTD/Zo7WkAwz
 q13/79SYcKOLZdIDjxuH2EYCPvPU4i0ky7Vx7ABYs5ChPJQC0s1E89x7wYQxykOJWS42
 oUXty8SzQZEG7BhkAgnft0qYCPkXCJWVokERE92nQOL0SU4kdwA/9F76lbVDqfqISsO5
 ySbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFBG85A/bxkc4cgssKypjfQTM8t7ELRlcncf1RBkjus=;
 b=hd+qIW1bDKiVl8peP7D3AE4LhmrRY6tCXwi9lHVYM5QyQSiY7gDFhJocWPbHSuUq3K
 JYt6OfAjayiPT2inVrsdp+HZAm/X3snYJP6cco9QZWsTWYQrWb4ImZz41rNdbOoJD/ne
 bWeFKzkTa3WArinKC9gDGfs5CtbBy9hf/hhjatJ+HuuX+KupVhiO/bUTC8vTcXsgpV11
 4M01vA+JtKhSvl8sOmwUchxL88YUQYFJ1g02wkXW1TQXYGWPMmoWMr6A0igP+qge/7yC
 84/v1gYQw3fzqh/xFKLwaCipSe2xqMKFDc+idOTdAyaywYA7nJNxEFYL7ZnIN9b4sT9O
 1KsQ==
X-Gm-Message-State: AOAM5302b9BCptA+NxO2wcPgj/QuqRl74nvovfvwvrqZe11NV6bL4WkV
 irzzITcT8oPgsNLcJYSm8vQ=
X-Google-Smtp-Source: ABdhPJxDUL0S7UIJAg1z4f3Q6JCR50MnxutKEPC6/c0XLDi521FQR2O9P1xYaQUDGvPjzV9Psw8xjA==
X-Received: by 2002:a17:906:901:: with SMTP id
 i1mr8438042ejd.234.1632855648298; 
 Tue, 28 Sep 2021 12:00:48 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id f10sm4500330edu.70.2021.09.28.12.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:00:47 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v12 1/7] [RISCV_PM] Add J-extension into RISC-V
Date: Tue, 28 Sep 2021 22:00:30 +0300
Message-Id: <20210928190036.4114438-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 19:00:55 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5896aca346..cd86f5422f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -68,6 +68,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVB RV('B')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -292,6 +293,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.30.2


