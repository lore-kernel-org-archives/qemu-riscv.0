Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2ADD3C938
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 03:05:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t2iiL-0004zP-R3; Sun, 20 Oct 2024 23:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1t2iiJ-0004yY-Mj
 for qemu-riscv@nongnu.org; Sun, 20 Oct 2024 23:04:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1t2iiH-00074R-PW
 for qemu-riscv@nongnu.org; Sun, 20 Oct 2024 23:04:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2e30fb8cb07so2891255a91.3
 for <qemu-riscv@nongnu.org>; Sun, 20 Oct 2024 20:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1729479848; x=1730084648; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlLGdc5fIPn5eaknq6/MET9nRw789lZrt09kcp9138w=;
 b=HMQX2e5IIY/yO7K8cfglbFXMsrhWOJBRqBEaF2ArXjVCUd0Hs580XeIhWFnFFEX5Sc
 hdl8/Bhzr3txPNHhbNFiLNscXcUh0pvn/tLqKDGB4y8Gam9ZljvwjKsVUKlKsc50MRcC
 gnSWiCd0ulduypmUvMA175pZBvr/PxXiO84sCepb2kjXDXHEwpX4ac2UakfmhDBuKuWb
 C+0EHuqUjjAU3yWerh7xudOcW6/hAIZStXL/KqDnN6v2UGHlAQYZ70Zl/0JnAqUUQyy5
 QJqbq8rEtayocNBaPeVOeZTHVc6WL7btvxI7phuQ5+G2ReG5P5tR/+Q4uGxwbJigZmcq
 BOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729479848; x=1730084648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlLGdc5fIPn5eaknq6/MET9nRw789lZrt09kcp9138w=;
 b=tMOP1NipD/Q09B16QvAvLVV/dn2raLlTsJJWZkEZTzF8J69Z0KG3IIJzSSs0OPXxcF
 SMzOfGIJDSKQGLLnRrEKRB6Qm5nB1ArXYK6evrYLuof+qXwLdWokU+419hXHVtaEANWC
 343/wjzgNqj/hcX41Jr4ZDE4p5pJqSy2G/BxMxs/2+klFeeAUb/hSqTSqJszAkk+HjuN
 XUVJ61f+Pv7D7suUQuKnwzgwT+z62Wz8/MiARSspRCfxWqmJltpex62D89IQtHVtJCtJ
 905SdNbvXbtyVtDgVdq4FqK6lCodpf0iPAs4GAfBAqwyozm5+n6vjH7DOJaWOSeOBY4l
 idxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWimNVsNuEzMaKBUiwqpZNYFN+NFvA6ru+KUctjnS9U7wxQmTDt3jhJz3ZKTac642iZ4oxMQyg0QLnB@nongnu.org
X-Gm-Message-State: AOJu0Yxww5xbESjSwc212KmSIZzQ36HtO9LkcFIl6JoPjqnD65WYOq7t
 mDXuPuA/M41w5mVU4o/gPGRclOI6HQFunKnCVOLBRUfOi7dVKucGvmTKyZcAGe0=
X-Google-Smtp-Source: AGHT+IHwchW//LRjffYqpbmWDHk9Gb8drNRRIThjZ/1kv51L72i4PcFee28mqIyhkykNFa6sK3ZorQ==
X-Received: by 2002:a17:90a:c08d:b0:2e2:bbcd:6cbb with SMTP id
 98e67ed59e1d1-2e5616db70dmr10571635a91.6.1729479848001; 
 Sun, 20 Oct 2024 20:04:08 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e5ad368b25sm2348846a91.24.2024.10.20.20.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 20:04:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Tommy Wu <tommy.wu@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 1/5] target/riscv: Add 'ext_smrnmi' in the RISCVCPUConfig
Date: Mon, 21 Oct 2024 11:03:54 +0800
Message-ID: <20241021030358.12454-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241021030358.12454-1-frank.chang@sifive.com>
References: <20241021030358.12454-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Tommy Wu <tommy.wu@sifive.com>

The boolean variable 'ext_smrnmi' is used to determine whether the
Smrnmi extension exists.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_cfg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 355afedfd3..092744360e 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -126,6 +126,7 @@ struct RISCVCPUConfig {
     bool ext_ssaia;
     bool ext_sscofpmf;
     bool ext_smepmp;
+    bool ext_smrnmi;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
     bool rvv_vl_half_avl;
-- 
2.43.2


