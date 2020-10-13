Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSFXw-0004zz-Je
	for mharc-qemu-riscv@gnu.org; Tue, 13 Oct 2020 04:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kSFXu-0004zJ-Tu; Tue, 13 Oct 2020 04:20:34 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kSFXt-0002xa-CX; Tue, 13 Oct 2020 04:20:34 -0400
Received: by mail-pj1-x1043.google.com with SMTP id g16so246015pjv.3;
 Tue, 13 Oct 2020 01:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=wKFYkhJpAYNqbu2bwWb8/jbhulnEVAwhrxk5jHK3GOI=;
 b=PlBbxQo0oemU8VpkdNKRNexUj/g8SyxkhHTDO6006nnX5HtHUp3nPkLhLXmGFophPH
 p+GZgfdqBsR6qFaEeQ2xUewRRrzg9ppxDcm6sGOVAX3yzsFptcBH7w3UfM4kZn0lnat9
 7suh0CVSP455Nzgbrfj+CWC6A2tsUvcBBoMH1nxKXUndKWTX1ehLZwIm1vfLgvM9Zd8Q
 RPdMoMe+riYEirWslzodVl4I+8PDXZgY2f+mNpEV/6b6sd7G4bVrMRFOJoZcl8B1pKaF
 vwAOcsh+dwU297U2p2GsV+lRRV0BMKJS9RrM+mQalMzZAmpAWwug7cQXURLWMUh2Jn9L
 5eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=wKFYkhJpAYNqbu2bwWb8/jbhulnEVAwhrxk5jHK3GOI=;
 b=d8YftX9m8PxA6344CPoW0+mGaaDrkDpljAP46HbZyq1V3e4UTgVBRo2ov343X9Rhft
 3s+FIbODXon7sXvqliBVM+p+3bS0zPQwoglJ7MCVux3x+aJGrFGVxFCUjQBW5z1JX8Zn
 CwGjigioExAAMzxyNGbzZDkS78F5ZD4dVpwSp5Vr0MPXLmPmrjBJvrQiq5NUaLhAsuIK
 8QQBQ+zqLYJsfbo4E9+/t5kWqb/0Cc554LitW6sxZnCFQdrvQBVwtrhn081jhjP+demr
 FerkzPv7yzGKUILXGN6aiGhhzqUomvq791J7AUejx5KqbHtUCkCNkJFQrY/6UWWCvVMz
 eBDw==
X-Gm-Message-State: AOAM532XBv/XIn2RyiscBjPpSLmA98WkGzs4KFkCIHTiCiaAomGUX9lW
 1SfpmuvIO10VHWDVFzuPuoU=
X-Google-Smtp-Source: ABdhPJz1HClqJi+r44SgOOwCycdyoSxu3CzZpu0pP9Zu7stPop3uT/WBTykXXotISU7aoqAzUIz/mg==
X-Received: by 2002:a17:90a:d345:: with SMTP id
 i5mr18909012pjx.150.1602577231316; 
 Tue, 13 Oct 2020 01:20:31 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l2sm27660387pjy.6.2020.10.13.01.20.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Oct 2020 01:20:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] hw/intc: Move sifive_plic.h to the include directory
Date: Tue, 13 Oct 2020 16:19:16 +0800
Message-Id: <1602577156-66090-1-git-send-email-bin.meng@windriver.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1043.google.com
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
X-List-Received-Date: Tue, 13 Oct 2020 08:20:35 -0000

sifive_plic.h should be put in the include directory.

Fixes: 84fcf3c15111 ("hw/riscv: Move sifive_plic model to hw/intc")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 {hw => include/hw}/intc/sifive_plic.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {hw => include/hw}/intc/sifive_plic.h (100%)

diff --git a/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
similarity index 100%
rename from hw/intc/sifive_plic.h
rename to include/hw/intc/sifive_plic.h
-- 
2.7.4


