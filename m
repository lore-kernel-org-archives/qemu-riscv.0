Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617D4E77170
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 13:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIpGz-0001nr-RH; Wed, 04 Dec 2024 08:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tIoWl-0002NM-LI
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:30:48 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tIoWj-0003Wd-PI
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:30:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4349e1467fbso59413135e9.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1733315443; x=1733920243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FWhpyYBZDQdDYQfU/TGfuVVfj2aHCagzAjvFcry1nyQ=;
 b=ZdAczzeP2ZLUmy6oPK/feKxe8mfErMJDbRzeKpmPER13pzaQoQO3ygYjz1eGGH/85i
 CApEwyL+H8Pwcqfpk5JT+gGlIVOmbWzoBaS5EGynpemQINWzgI8FIt5hHyFsEvWh5x2F
 bNosB91Wj39EKRWcKK3/6MVZ4FbFB8AJUGyLyIHerbzvkih7PBsjHjNAGkoHdwFjNaVY
 jnbHGIH1elZCvezVlU+bppwflAuQ8SBZsQxwXH06l7YQ8PVw4U8HxTZtP7HZxNGsmulX
 +t8/jCHwhAsAGOLKnjgRk/7kIHInuW48eoVm3aSIz+bAXPe2fkwLm9eV/fibUMkpyyhE
 H2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733315443; x=1733920243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FWhpyYBZDQdDYQfU/TGfuVVfj2aHCagzAjvFcry1nyQ=;
 b=MF8GvYtIKqeo9OGwixwgcXJxnRi5hicezvvIMqz3vcLhKd2Gw++XFJ1EwqnMIlf4VU
 BrIiZREqNcyB1ePSnNR4AaWUmEeWzkefOKlsfFpG/Cq4J8atprmoBy+SfFu5db49SwwH
 wq7BD/yIpKHfvFlXTVVS6gh2omcVYaei/+C6wxLQdaY19rT5CD8AQ3MrpnTrGNFT0Utt
 Wqu/40/D5wvjskYIK3A6u5nreyo+y0P+zwTvawOH2FbXXD0G6KvfE0wem7RKdfXRAWqE
 mPFKh296pBOdGcszynuWxsQpyR0jaZiCxw64iwJh1DPqBqfL0Gzs+vIHFSoM+2UlSHbL
 NOqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXurCO9xnhNT6jV9HGHdi5wV+1k76Zt14MAU4O8hngcoO2EbxVgXqoh1YUHIeCz/sH4Sbc82HgAkIfN@nongnu.org
X-Gm-Message-State: AOJu0YwgE4hu+o9mxmkEuEgIjMEv+BDPl/N2FUaycXObGlMgaVrZZzXo
 gvKqHHS029g/Nsqi6e61jaMnDrJJmoIw2vo2fhd+v6oySE4poxlLxkj9hpMD1AM=
X-Gm-Gg: ASbGncudbv60W8tGVYdZ1zx8LaQaqDkgaylUueRuBzvKvhcv4zN2JplcdZWb8KPm+WT
 WShoye1O2JSVgRF4IdhqDrieejVj1GDDVm/XS5tzf/cIV1wRGmSrXhF3EUc5UKSvEIf2aWEPk4H
 lbUHRIosEcu3a+vQ8OnenylyhmOOcW+LKEwkt/MXYfLl6fBaRvzpaOxP+AXTVUs3j/wISlv4tPr
 KJHIOwpDLDhC3R7uSIWAdXpDVnpLqjA336JYeALoiRDwMIebSpKFGv4Ehu63+43ThczAI4fg6S+
 65dzIMG314mjRDtPNN08a9sBeUxLfADaIhNjjK2lsg==
X-Google-Smtp-Source: AGHT+IGAF30q0VvJEk8hstG7gKrHsazZRBFNw6c2175UTQPzegEz80GJ8QDtxRnRRa5o/LFJwikFxw==
X-Received: by 2002:a05:600c:45c7:b0:434:a902:97cd with SMTP id
 5b1f17b1804b1-434d09c0675mr54829115e9.12.1733315442221; 
 Wed, 04 Dec 2024 04:30:42 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5206649sm23324415e9.0.2024.12.04.04.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 04:30:41 -0800 (PST)
From: Craig Blackmore <craig.blackmore@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Craig Blackmore <craig.blackmore@embecosm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
Subject: [PATCH v6 0/1] target/riscv: rvv: reduce the overhead for simple
 RISC-V vector unit-stride loads and stores
Date: Wed,  4 Dec 2024 12:29:51 +0000
Message-ID: <20241204122952.53375-1-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 Dec 2024 08:18:32 -0500
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

Changes since v5:
- Update vstart after each access.
- Fix formatting issues.

Previous versions:
- v1: https://lore.kernel.org/all/20240717153040.11073-1-paolo.savini@embecosm.com/
- v2: https://lore.kernel.org/all/20241002135708.99146-1-paolo.savini@embecosm.com/
- v3: https://lore.kernel.org/all/20241014220153.196183-1-paolo.savini@embecosm.com/
- v4: https://lore.kernel.org/all/20241029194348.59574-1-paolo.savini@embecosm.com/
- v5: https://lore.kernel.org/all/20241111130324.32487-1-paolo.savini@embecosm.com/

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Helene Chelin <helene.chelin@embecosm.com>
Cc: Nathan Egge <negge@google.com>
Cc: Max Chou <max.chou@sifive.com>
Cc: Paolo Savini <paolo.savini@embecosm.com>

Craig Blackmore (1):
  target/riscv: rvv: reduce the overhead for simple RISC-V vector
    unit-stride loads and stores

 target/riscv/vector_helper.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

-- 
2.43.0


