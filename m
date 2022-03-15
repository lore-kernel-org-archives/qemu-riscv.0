Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU16K-0000Ny-6s
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:56:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU16H-0000HY-3m; Tue, 15 Mar 2022 02:56:09 -0400
Received: from [2607:f8b0:4864:20::431] (port=41795
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU16C-00025H-0J; Tue, 15 Mar 2022 02:56:08 -0400
Received: by mail-pf1-x431.google.com with SMTP id p8so18125548pfh.8;
 Mon, 14 Mar 2022 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k03hqsrN3r2DAcpcEZo3Qmaha1XCoOaXcqqhAGM9cU0=;
 b=c7Gal8DI557IDAn7fC7jLhOGB31o7BknPQefKUSIWASKtYZ3wiud/sVngQCG7xv75e
 psNNvl2F+qmv445eR0iyn353P7Rj53O/mnuh2qRIwGYJBawhrA5XOODroeS9FcXSy95q
 9dn63upwBqGtVlyRj2aS3ct/MaNiGgTnmZlxdf+QOzsqEXicBVnUEvSQB/R4FMiipHL1
 JV1YGkhjy991deROESbU5jkjaciBcfGccvcftfgsWThAIyhjlTzVx+bLg4XDcH5eSgUz
 6aT6q+tisk0GRr9pnPGv56Pv0ck2PxTzNxX29Z5St7nX6wJ5Ak81YwPQ0kC3vepkCz6b
 4SeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k03hqsrN3r2DAcpcEZo3Qmaha1XCoOaXcqqhAGM9cU0=;
 b=iXXOu5nvIdrRpbpE6nURtDrOMivH4DOD+aH0jEtlEGPSTTFu26ni3k2ScyBAsRHwY5
 0grgyCsTNB8EP8w8tmFrxYgGzZBwnN2kUEBIBarlGJX3kBm9pQVQs6IwLXV2FKc9q7NU
 C5KFyiEnL1lpFHw65uLm6dyZI1JVWixvoay0SOOrZAeYXkfsKA7P+jIUItoDZxjl503c
 DShgSi3PGTy4UhfMsXzj5gz1Fh7P4z5AhL74aOLXQfVmn10fAzTRSJ+TqdIzRT2esCLu
 /Fsz4RyQQnFt78MKv/bxy9ro821h1xq+xDzedm4ydoMhdnXDcOaboqcrWiGFy4E0mwM1
 VWVw==
X-Gm-Message-State: AOAM531zOyHcopOBzVaFoIkBcUCer59RAkOJzD+1/xrdsCz3YBweosGS
 20XC+RHYJGjeJ9Yp2E9jjH6lM6xTI6DCjw==
X-Google-Smtp-Source: ABdhPJz4SRjh3K1lHVQaEubYk88LkkfmEkyeLX4rLdr9C6RBS2CnKoGatPxYiOUz3QctJnO959ISxg==
X-Received: by 2002:a63:2d05:0:b0:34b:3f1d:2fa8 with SMTP id
 t5-20020a632d05000000b0034b3f1d2fa8mr23200013pgt.447.1647327361892; 
 Mon, 14 Mar 2022 23:56:01 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm22970500pfv.69.2022.03.14.23.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 23:56:01 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 7/7] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Tue, 15 Mar 2022 14:55:29 +0800
Message-Id: <20220315065529.62198-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315065529.62198-1-bmeng.cn@gmail.com>
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 15 Mar 2022 06:56:09 -0000

From: Bin Meng <bin.meng@windriver.com>

This is now used by RISC-V as well. Update the comments.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/core/tcg-cpu-ops.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index e13898553a..f98671ff32 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -90,6 +90,7 @@ struct TCGCPUOps {
     /**
      * @debug_check_watchpoint: return true if the architectural
      * watchpoint whose address has matched should really fire, used by ARM
+     * and RISC-V
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
-- 
2.25.1


