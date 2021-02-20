Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDTYk-0007Br-OA
	for mharc-qemu-riscv@gnu.org; Sat, 20 Feb 2021 09:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYi-00078H-Ug; Sat, 20 Feb 2021 09:48:36 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYd-0003aP-Mw; Sat, 20 Feb 2021 09:48:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id s23so2687288pji.1;
 Sat, 20 Feb 2021 06:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yl3FmSMqUOceM2edicTwk98MpA8ZTg1Y4GvnyWg9pt8=;
 b=RMDAoKmo5YivtDwabZNy30r4kZBN4j/NYkwBza05RZcJ1hU/uvcaq8j6kZXEiGAoQE
 t3VSnmVFu+MvCUESdzJdHEUULcehIxzB8EzvOT5EZZhij1YofXKNTG9otZeh1fkZ4akX
 rFmwfgkq8Nn8q0gaYEGDs4TlFWUJbiNKui3xZF9fzVcMbKbdA/kJdiX5JptgzYs3SEaI
 UoKvq315ecpZRJAOMKbHtCVqzfhJA08S9+sHNtLkO6L3pH6pKUDVstSj9HTQ8qHFAoJd
 AuKj5FxLcb4zitCs2RqGjjQYdzKIuS2l1cwZMv4RI20158beTNKzeQNUbbHwj5HYwmzD
 v5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yl3FmSMqUOceM2edicTwk98MpA8ZTg1Y4GvnyWg9pt8=;
 b=WPeCAU7fkV1CRRv4qfXFbdYnqNOz0D5+Dom8REIG54VIlMCOagn2z+rzk6fhAf28It
 pRnmI8vJkoUChj8p8eg8s3mqXy7fJzHTpXXRqD1SuIJAvcFC2uuo5aTCeJwOmz44eUma
 i1ejoQUf4UhpvyMa8WaPedrSb0CQ6ImHQ2/Y+NLGHZwMjNlq0ssGjx4+8+LkSA/+ikUb
 Kv1tst1Bsdgxg5zwPasZkHYKe9eh4uXcUcq/CCNKFO3AB/ONQv/2vHB2P+1b5wKB8s5X
 PBycMy1KSMr3SEXY5zY4kUSERTrOaWq4epJ9GwVJDAxUv7BLxWNSQnZTiCyNf9eyI4j4
 9XoA==
X-Gm-Message-State: AOAM531YKpb+BkqwVI8I5EVpE+xNtN3tDUdpSSM/rgic0a324YYOE0S/
 JY8c1GkGI6jXMJRwp0U1IvQ=
X-Google-Smtp-Source: ABdhPJwrBLDfJVS+sS4La4ay6kgcaE8RMd0J8sDv2zNhwm8DzWaowGJAw0/wmgZWm2LSDWu5NdGs6w==
X-Received: by 2002:a17:902:f2d1:b029:e2:86d3:128 with SMTP id
 h17-20020a170902f2d1b02900e286d30128mr6727350plc.63.1613832510201; 
 Sat, 20 Feb 2021 06:48:30 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d16sm3100480pgb.12.2021.02.20.06.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 06:48:29 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 3/4] hw/riscv: virt: Limit RAM size in a 32-bit system
Date: Sat, 20 Feb 2021 22:48:06 +0800
Message-Id: <20210220144807.819-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220144807.819-1-bmeng.cn@gmail.com>
References: <20210220144807.819-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Sat, 20 Feb 2021 14:48:37 -0000

From: Bin Meng <bin.meng@windriver.com>

RV32 supports 34-bit physical address hence the maximum RAM size
should be limited. Limit the RAM size to 10 GiB, which leaves
some room for PCIe high mmio space.

For 32-bit host, this is not needed as machine->ram_size cannot
represent a RAM size that big. Use a #if size test to only do
the size limitation for the 64-bit host.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- Fix the typo (limit) in the commit message and codes

Changes in v2:
- Use a #if size test to only do the size limitation for the 64-bit host

 hw/riscv/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1d05bb3ef9..c4b8f455f8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -590,6 +590,16 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    if (riscv_is_32bit(&s->soc[0])) {
+#if HOST_LONG_BITS == 64
+        /* limit RAM size in a 32-bit system */
+        if (machine->ram_size > 10 * GiB) {
+            machine->ram_size = 10 * GiB;
+            error_report("Limiting RAM size to 10 GiB");
+        }
+#endif
+    }
+
     /* register system main memory (actual RAM) */
     memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
                            machine->ram_size, &error_fatal);
-- 
2.25.1


