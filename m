Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97BAC25B47
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:16:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfai-0005J6-H1; Wed, 25 Oct 2023 11:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfah-0005HJ-UW
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:39 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfag-0003eJ-Bu
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:39 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6b201a93c9cso4727254b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246877; x=1698851677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28soGqZ4hmvdB2DBr+8fDTCxvQalUe0nHRzFfVeJIWI=;
 b=OSBEF9wVIo4XnQfvtUkkqfifwigQrUJql8cBHu/wyMew1CnBaQy3N5ZJU/SECR3xpb
 Q1JgkMHzz4tdf27GzylovroCUnsiXgnYetnvDQlpArOxKvGWgd1rL4/E8rRlSvMDcvLM
 jS2sasd09gyDTmRdKxbojRjlzZN/+vx3cP8Hn4K8gWFDBdbcajryOWxXka0vpeeUOUSi
 6vN4HagN/Xf7yR6rKQglo8ogkvUg0jIil5182kugwzeIJiN2rMTsC27os7yWFyJ6xRVq
 IwXiBGZ8eHrI5uh/Rb4p1mdGNz5V+aiZ1ifmjHf2qV8pXuTIMZWhO2S/nsm8qQFT9RjF
 obGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246877; x=1698851677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28soGqZ4hmvdB2DBr+8fDTCxvQalUe0nHRzFfVeJIWI=;
 b=NhzJCZAgaltzRhrBCIg1RAEyyZu5zy30mYpEh27eeTZFjjxHfbHdj76AmQe74dNXte
 Dy+D5QlfDIwlBIiD3yg7xNhhtGg34zRLUSOX57S5UbNuQD8IR27dG2GxA89EzmxojYtz
 iaASSddzyVHzlNiLnl6NZfJBzR4d5b0kOsviRLQPNil1VJoFWMRk/9eI/WvBYh0jUhGm
 VYpdrCb1wr+4GQx3IWYEmsRtwAlusXi6EP1rjbgzj06UgNVxA5jhqDhjSHURL4/0jXC9
 cL9Eq+xXSd17DZwXEbpUVhdeU0RW0Dib/0SuaeGn44iTvNe37RDn625704/i1UyoKPTo
 07Qw==
X-Gm-Message-State: AOJu0Yz+8wNl5O6vJZhqT4zPEMdOwRFOWyp3Iyt/aDHpPtbTSd8dtKxH
 7Mzvo4zQ4QWCs5aUeGwo3g+KByflKhP0r8xBlzmCig==
X-Google-Smtp-Source: AGHT+IGxcCCnBFT2tnBh2OPHcsWBjFpMJruTMgDQckfw3odXjYS2sxLVkvZmB7dqTYIYIwJMU8eByw==
X-Received: by 2002:a05:6a20:1609:b0:165:2969:9328 with SMTP id
 l9-20020a056a20160900b0016529699328mr6555685pzj.22.1698246877224; 
 Wed, 25 Oct 2023 08:14:37 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:14:37 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 07/14] target/riscv: Expose Zvkn[c|g] extnesion properties
Date: Wed, 25 Oct 2023 23:13:31 +0800
Message-Id: <20231025151341.725477-8-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42f.google.com
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

Expose the properties of NIST Algorithm Suite related extensions (Zvkn,
Zvknc, Zvkng).

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 992f8e0f7b0..8eae8d3e59c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,7 +127,10 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
     ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
     ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
+    ISA_EXT_DATA_ENTRY(zvkn, PRIV_VERSION_1_12_0, ext_zvkn),
+    ISA_EXT_DATA_ENTRY(zvknc, PRIV_VERSION_1_12_0, ext_zvknc),
     ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
+    ISA_EXT_DATA_ENTRY(zvkng, PRIV_VERSION_1_12_0, ext_zvkng),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
     ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
@@ -1379,6 +1382,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
     MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
     MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
+    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
+    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
+    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.34.1


