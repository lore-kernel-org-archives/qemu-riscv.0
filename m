Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124BBC531FC
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:24:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woFga-0008UB-Kp; Mon, 27 Jul 2026 03:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flavien.solt97@gmail.com>)
 id 1woFgM-0008Qp-Na
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 03:23:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flavien.solt97@gmail.com>)
 id 1woFgL-0005qR-8k
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 03:23:26 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-848643382fcso2388329b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785137003; x=1785741803; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hQnhrc+B4ntfIfS7WFVE7RCkWpO+btWxjP4Q3NLZqQQ=;
 b=I1YWIazvTFm9YnK2TelNjxlduBK6viqnJr8dIprBoqfXe6Y0ZVfy7zy/UNmyrfRCU0
 1Q9whjWUI7c/71uHQ9I2SJ9cuNPnGlooGs6dIGaFM5Gd3Y6HfCRjvd5cFHVjQhV14J3y
 KUoBGk1NmV0JX7dVS9qJO2RvOXM7e3QkngvQxd59l7yZ0CWGZxf1jFl1a/OydYIlwTbV
 EC5ZZxz8y27XOn3M7XchvoMoN2MP521crAfImEfQVVkyQ6jWvE80gyrFiFryMj5/sAEy
 qiYkg1ImkWE7A4VGqkeiD+YViCjsvdHT8He+AQoJOXA1DZwYodu4BqjI5e+mzr9rgCwS
 RTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785137003; x=1785741803;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hQnhrc+B4ntfIfS7WFVE7RCkWpO+btWxjP4Q3NLZqQQ=;
 b=jDnSyubFgQ8PdEV9zO7DXOqTTpayXLQxF6+VAkRYUKVYEBw+sNVJ2LIAqhhihf+82Z
 nE4+9wZZVGOKqLmTiMbwZ2dJYf73UhK46UgFf6Q0Rh5EQTQASm1kLfShMo7WvhXV1NeY
 jH/3lapph2rs6Bnksl2p+n+o1q50IF4os1lYcsHlRKV64PNaocrEhEBH6EuHmpRSVzPi
 +yKQPNBnKUNWqeiV/r8tHc8iOM3lJ9e0jl7YamKcWOXfX1tB7uqkIYh8S1Co1Cs+cE/7
 rwfDa7yrmimTvYOVoWXhvl+nxJMmEdj/lFppq+W2EPuLHBCSfcnmmP6OsBCkwPWAvifo
 GkBA==
X-Gm-Message-State: AOJu0YwVZnQlsy1OIaBeUD8YPLzWNIBflDG0G1KHnfYjEIhydNmLXEEg
 IBod/ei+TqdeVY1djQPbU6oWDOb/gH9t1WVBthK8RKdcdeIJWlS2as+G
X-Gm-Gg: AR+sD13IDLA4Um+usqgbiq58JwTN5Fpkp/V1f79voXoA+eNPTD9EkicYHBZoymjaqj1
 bj+V40meN559P5se0OrZYKmq2voq4/ajDnvGXDvC7Q27boNyK10cPPZPP/4r/Z/5VvYF7jpRnDQ
 8MpRjzv2f8NoIhObafgePFt5wH8lg3RjX/aInIAwtzTWq+jBlxsggIPhxfoAHY+mUL2ra30rjHn
 yKRXdGgmHIaDy45epbxIh3VdveLQTl8iX6H1/J9XpUNhlySIdZu1cgW+YxvjHNboHOKV4iRikmI
 wA+R8LGvmq6rflwNYqK81yNskjXi4pFgtIzx02rbVJpcqequhGAbcLNauQbbk5vTVfommpV7wQw
 fYDJ6m4l3oSS/d3O2GZPgNUOsp1x2dKBJY7PCM8/129I2jZaW934x7Cn9Xl5SPnlwpp68gP5fII
 rDUdPZ6a/LNmBGM/ujrb8ZS8TxzIjZ4BoCdvud/PNj3bxNV5l7uSy9yRFI/2bQ77efOY1HJC4S/
 oEiPR4zEyS6SZ4=
X-Received: by 2002:a05:6a21:6005:b0:3c0:9c1a:8939 with SMTP id
 adf61e73a8af0-3c67e1422bbmr6777579637.65.1785137003349; 
 Mon, 27 Jul 2026 00:23:23 -0700 (PDT)
Received: from flavien-macm3.ddns.comp.nus.edu.sg ([137.132.220.135])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc419c52sm28481032eec.10.2026.07.27.00.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 00:23:22 -0700 (PDT)
From: Flavien Solt <flavien.solt97@gmail.com>
Date: Mon, 27 Jul 2026 15:22:58 +0800
Subject: [PATCH v4 2/3] hw/riscv/riscv-iommu.c: always send MRIF notice MSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-qemu-mrif-v4-v4-2-73e0890ad395@gmail.com>
References: <20260727-qemu-mrif-v4-v4-0-73e0890ad395@gmail.com>
In-Reply-To: <20260727-qemu-mrif-v4-v4-0-73e0890ad395@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Nutty Liu <nutty.liu@hotmail.com>, Flavien Solt <flavien.solt97@gmail.com>, 
 qemu-stable@nongnu.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785136991; l=1860;
 i=flavien.solt97@gmail.com; s=qemu-mrif-v4-gmail; h=from:subject:message-id;
 bh=AyhDitwqEMTLhlxlyQPXe6ylATgJ9+x3GdqYluglOUU=;
 b=4Ok61yc4C5AdfW6amsyCzxZweTU7B+B3UNZTbZYBxs2/L/yAQ8ctCgjRRgrQu6KHSvo8SN9bo
 EuVmKzjdZRTC30+dLE8x6Vkxp+dEYaiv1EcKIFw2uRX34SvvC5LxZOv
X-Developer-Key: i=flavien.solt97@gmail.com; a=ed25519;
 pk=wEVvqF5SMWVnTyKNb8WAo78S30Q6giJmU/VisghJRtI=
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=flavien.solt97@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The AIA specification requires an IOMMU to send the configured notice
MSI after storing an MSI to an MRIF, even when the corresponding
interrupt-enable bit is clear.

riscv_iommu_msi_write() currently reads the MRIF interrupt-enable
doubleword and suppresses the notice MSI when the matching bit is zero.
This makes notice delivery depend on a bit that AIA requires the IOMMU
to ignore.

Remove the enable-word read and send the notice MSI unconditionally
after updating the MRIF pending bit.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Cc: qemu-stable@nongnu.org
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Flavien Solt <flavien.solt97@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Tested-by: Chao Liu <chao.liu@processmission.com>
---
 hw/riscv/riscv-iommu.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index f6865d1..2bbac30 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -788,19 +788,6 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
         goto err;
     }
 
-    /* Get MRIF enable bits */
-    addr = addr + sizeof(intn);
-    res = dma_memory_read(s->target_as, addr, &intn, sizeof(intn), attrs);
-    if (res != MEMTX_OK) {
-        cause = RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
-        goto err;
-    }
-
-    if (!(intn & data)) {
-        /* notification disabled, MRIF update completed. */
-        return MEMTX_OK;
-    }
-
     /* Send notification message */
     addr = PPN_PHYS(get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NPPN));
     n190 = get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NID) |

-- 
2.54.0


