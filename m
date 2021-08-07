Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCN2A-0006sK-Ff
	for mharc-qemu-riscv@gnu.org; Sat, 07 Aug 2021 10:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mCN28-0006nH-Fn; Sat, 07 Aug 2021 10:10:40 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mCN23-00051C-HY; Sat, 07 Aug 2021 10:10:40 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so13212659pjy.0; 
 Sat, 07 Aug 2021 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n1i7yb3sgyTW4blKIhGbZu52BsapXAydzf9xe+NZo1k=;
 b=ZBJE7OQwUGG1m9AmfuS2bAxG9pKcvfrdqF+bwR9QCZNw47/O2uxUnrqtrguY5Xr2Kj
 LRla3DMdM7iDMdgw3Vv0aJ8lxyN3pVvfvRappMDrRPP4VQc20FULeW0lbqmliQtO3IOU
 BzT3r7PyedGnYEogh3WfrP48TusUelpja7Zkv1QySqA83CJt2acZlLk69khCOncnXmIk
 nBAzKssyMQMzM9DLCr8pO8ugANz9zCh5GVmqSc1l5bExWpTFM9IP93bkGiSs+nYmfyEm
 kaSGSb99s3+kR5jZxzKrBRIh0tOa4kDpwDj6ROWS2J8S6jSWoC4S0RK5g2UeFetDnR7b
 DwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n1i7yb3sgyTW4blKIhGbZu52BsapXAydzf9xe+NZo1k=;
 b=g8ij4BrKmP3MBxmWlaNFvTZdXG5PjE49lfQy0GyeFLW6ORbz7Zy9EYUSf3DxVf+Wzd
 UFZ2xAkT/t4WwHdHiS/9LnRYeAoizlYG+CVRV6PQozCD0GnZTTrtK7dDGS/nIJik3K5F
 cWeZNuCGz+0sVQBQl9Ano4duASyFMjTdNaybs2ceKPkkZyw8f23hAtPo187dR3JjbE/V
 mUY/XcmoGHSSwmx3MEirGHI7aJgGpZNffrY1tUG337BD0sTPJeqAWClIbq+29HuNd0KX
 zbej/Y1CITPazeeWZqRP+rJKp/gyFiuMD4nKxgbKQAaSEByFIOYuP3tAuCtbd1WTFFqP
 kz6g==
X-Gm-Message-State: AOAM531pIaUOvwcKZxTIpVXETFvVuCICtapIa0FPO5SSxVsdN6jAJB9n
 Tgo6WgxYGFIJSkiAJmH8tV4=
X-Google-Smtp-Source: ABdhPJwxgFZDWGV2wzCXJSqqdczisy+CQRVUiByyF0bLUbuodYNSN/4auE0C77BlzcKelYoxYv/YSg==
X-Received: by 2002:a62:7c4d:0:b029:3b0:b284:fd9c with SMTP id
 x74-20020a627c4d0000b02903b0b284fd9cmr10012853pfc.11.1628345433170; 
 Sat, 07 Aug 2021 07:10:33 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b3sm14152928pfi.179.2021.08.07.07.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 07:10:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Correct a comment in riscv_csrrw()
Date: Sat,  7 Aug 2021 22:10:25 +0800
Message-Id: <20210807141025.31808-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Sat, 07 Aug 2021 14:10:40 -0000

When privilege check fails, RISCV_EXCP_ILLEGAL_INST is returned,
not -1 (RISCV_EXCP_NONE).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac5..e747fbe0e9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1423,7 +1423,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
 
-    /* check privileges and return -1 if check fails */
+    /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
     int read_only = get_field(csrno, 0xC00) == 3;
-- 
2.25.1


