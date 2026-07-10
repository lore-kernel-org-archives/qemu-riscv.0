Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83C5C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:10:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wi4R1-0001Cj-38; Fri, 10 Jul 2026 02:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4QZ-00013Z-Tq
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:35 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4QX-0001sn-6h
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:34 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so5411375ad.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Jul 2026 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783663772; x=1784268572; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=XGA7lzMNiYE8g01AQjE3iUjEtTLpC1mZ0V4/zmcm3jhJPmx4UK4Sb7fxDmJkmMw6Vo
 I+SpKDNWb00+AXIWIukwb7fAYm2OyuxgD7nApenavbGI7x4YhaMQKD+0XFbkIql6/8el
 24+p3kXpTvtoKZH8W2tegmPKc2Nuw3FSJ8Wuxd1aoNGxdGGM8CaLjvyFdaBEXK14Kyje
 mG1DSYdRqTEgmkuEQNNvWxf+yJi+ud4VAQDlx07nRmnIr7jNspYW1vDeIPWlwpcBIgtR
 NsACCK76SSCAEMNxOa1kW7S/eWnW9U+WwcNfFqJEyMEK+IbcTG1bXgbMolqtewoHI8eq
 DxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783663772; x=1784268572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=Azw3lpYlIsJ0l7fnxzRf8OqnxR6qoKNryUpbr9YJ5Mu3PwDdvOBrqFPqXq/0Sp1aoG
 utL5s9745FF1YjRSJlKQPn4w0drso/qpulr3k+i69OxddvZsw3YyK8lGsB5r0PIr78Zj
 XKkk7xOCI9J71I93QJgw869Hc+bemvjrB4xjDHckWc4UvThIQtBbqCZ6HtiWX/M3PhdE
 Aqc+1MaxGgnT9/xhyRL6aA58LMSwzdKSZkjePpoXD9Wfldl6Pjo6T9ZlKeTYQelGtcD3
 PoOkrJaVc3yTbfjLhPLY83Lni2hCZSmaC1hHBTuJSKZfGakPvG+GVv7ERTqkKWOJFveE
 r66g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqxvSHzBggqIQKLaPt9uQdGX0NQKpxGAXt5NVbYLjl8syZWy3DCy6O1c4+kV36DHqjheRbK+ppGG+4U@nongnu.org
X-Gm-Message-State: AOJu0YwAFFarL+I9y9Ajfr6i2CPEdTqqWzlrGdwO7aoA2NReoMsivg8k
 ehglPVN+xj8Cifr7Y640zOj07IVgqA5ggcASlw4b66782R1q3IWJwoJzA7CpLrVikro=
X-Gm-Gg: AfdE7ckVCzpmM2VRfFAPFNUk2Q7bRhaUhihsZE6OkiCyrToYzXiTkotF4O9lI0CqXO8
 LculvYAgUppyPqN7QOkVHRpcGFfFxYCOboOUFgrIJI8bidjqhBQjTboU2T0DUdrFZQwwS9kQkBY
 H+oVdScHDECcrhpSULL9LT2WHi+fCea4phPPtvqR0iBQ68HtNBBFNf7o5sXoFjEVXLfIxmC9Ou+
 stWY6E6qCoMu0pSsgeWIQ5C/meV3qVOJR1m5lSu0tLIcFhzq35nbE7BMMNE6u37mdsPs2euvYSQ
 YB/LjZrjoeNsPw2hIA0X52DBCY4RJKkqkxXxMvAlbUIXh+JkaFQuKZ5+sJjM81H22ODnpSdDwP7
 fzk7gg/xnhn6gEe7/Zw9wZHbMcXRT3ylKI7bikgt/CaKszxQ5z3+QJRnmwldZmssrPLc+1ulTKV
 9yIt12S2biC3KrhO7GY6zAPnVMlu7LQYwqhKBxZXE=
X-Received: by 2002:a17:902:c408:b0:2ca:d172:7228 with SMTP id
 d9443c01a7336-2ccea38767dmr114367875ad.11.1783663771850; 
 Thu, 09 Jul 2026 23:09:31 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d59e33sm53344255ad.74.2026.07.09.23.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 23:09:31 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 1/7] target/riscv: Add Zicclsm CPU option
Date: Fri, 10 Jul 2026 14:09:08 +0800
Message-ID: <20260710060914.1227027-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710060914.1227027-1-frank.chang@sifive.com>
References: <20260710060914.1227027-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Add Zicclsm CPU option so that user can turn on/off misaligned loads
and stores support.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_cfg_fields.h.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 9eb47af0a76..f8c27a574f8 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -139,6 +139,8 @@ BOOL_FIELD(has_priv_1_11)
 /* Always enabled for TCG if has_priv_1_11 */
 BOOL_FIELD(ext_ziccrse)
 
+BOOL_FIELD(ext_zicclsm)
+
 /* Vendor-specific custom extensions */
 BOOL_FIELD(ext_xtheadba)
 BOOL_FIELD(ext_xtheadbb)
-- 
2.43.0


