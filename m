Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX0It-0001Ot-Bl
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Ig-0000uc-0s; Tue, 28 Feb 2023 08:45:50 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Id-00030O-DM; Tue, 28 Feb 2023 08:45:48 -0500
Received: by mail-pl1-x636.google.com with SMTP id y11so6322575plg.1;
 Tue, 28 Feb 2023 05:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JQ8rEzvJy2Hr5RXjOLFBE9vHB7yL2eNsfyaqnmJxNA=;
 b=eoCpnsHO0L0n8035E9IvdDG9FHFeyEbTdosQxw2ytM3XWdUiwyBjF5qGcUsxjirU2s
 Vjf8l5RSgDRmwsrp7whB1HVTOm18ynUAJU2NNE/LHBj/lYsafILU5ZUedpZOqj9cjOR5
 6XvMEbGan6613WWqp3m5fb68c9yhMgE2VlHUYMQyzwhuS/6e42iUmtD8jke8l4MTQgBt
 AyYm9vj+URlK9DHpjzx7cPVXGw9cvQGDo8mmotNSLe5VZh0Iizzwh24wBqbiivXPiAzb
 uEQiDf0ylDqwofTlivV3KZo42/SJ/AVC+fs+zlrqAaMP+hFzzroL2vHGBCaDOL8XUutD
 xmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JQ8rEzvJy2Hr5RXjOLFBE9vHB7yL2eNsfyaqnmJxNA=;
 b=G0IDJUTEUL715TrepAODqB8wY3PQK6tWBajXL+CXvngAd2LrW9n+S/3gEu2intmKxG
 VVipTBr2WDEvPED/TLSFIiX+C1dnW53BDqEfuJFHK54vBxrH4x1yJ8EN7j37ueabCvx3
 T+0B19oN+pvu/VwKy+WdE4gCnjVmd4Pmv6aE6eJ2FnsSN5RGditmLObUM6lsiuoDuqAG
 U34xfc+kvRRf+S4kghNUxpznZPrlG8eVQdsWb3t8uYx3UmipuQf5o4JOnn5XHRW5fzHm
 Q9kR9AbYzjYcRqNou5/qJ+ORdDvBZuuN/taA6Qoh7LT5kt9PhSgaRslxNZwalurjgQtj
 apyA==
X-Gm-Message-State: AO0yUKWudrVdxEZX7k6MGR855GnPZgVK8HBVvaC/xtfdqePqvZk6cRSn
 aBXs9bxZliPIE1EbAAxTE+8UOx0IicE=
X-Google-Smtp-Source: AK7set+GtsH07DwCd2HZkr8Dcy5sljZ8Nn3x4a8+vVfKzPShsp0JqBdxjpvRc2a7DKhpH0WNe5oQFQ==
X-Received: by 2002:a17:902:e888:b0:19c:df17:b724 with SMTP id
 w8-20020a170902e88800b0019cdf17b724mr3186049plg.58.1677591944665; 
 Tue, 28 Feb 2023 05:45:44 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0019b06263bcasm1556896pll.247.2023.02.28.05.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:45:43 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 13/18] target/riscv: Allow debugger to access user timer
 and counter CSRs
Date: Tue, 28 Feb 2023 21:45:30 +0800
Message-Id: <20230228104035.1879882-14-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-13-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 13:45:52 -0000

From: Bin Meng <bmeng@tinylab.org>

At present user timer and counter CSRs are not reported in the
CSR XML hence gdb cannot access them.

Fix it by adding a debugger check in their predicate() routine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

 target/riscv/csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7284fd8a0d..10ae5df5e6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -131,6 +131,10 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 
 skip_ext_pmu_check:
 
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M && !get_field(env->mcounteren, ctr_mask)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.25.1


