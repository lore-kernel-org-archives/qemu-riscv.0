Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE81606A31E
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 02:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/2M73gW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWPKY-0002cT-65; Wed, 25 Nov 2026 21:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w1355457260@gmail.com>)
 id 1xWPKW-0002aU-Dq
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 21:35:24 -0500
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <w1355457260@gmail.com>)
 id 1xWPKT-0001ET-LS
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 21:35:24 -0500
Received: by mail-pj2-x09.google.com with SMTP id
 98e67ed59e1d1-3b3fa8df5c4so2959957a91.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 18:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795660519; x=1796265319; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FXR5fY9w0UwdiNAuY3odcVNzbKqwkmwUYZjUrNrGUFE=;
 b=e/2M73gWjYHMjr7SZkNPD3ya89MzTUveshS71cM4avbx2rzy/LjlD066TLn23nPHya
 xJApn0ZUGtDb265BfLaFJ1Rfz3bSbMhqIODLndtzavDnj4nC4bygo6hlifMauBwyo21Z
 0IH8bgNPJKEapmcRqxKIzxkhASdLUV0COqW6UXgjggXm+xWJBz0fE9uECp/Wmp/7WeI0
 9O/aNvh0F3i+PqRORVjEoaE7DMaZG2VHGnHlcwt+XPNXsSiJjLuY/7rVMbq3rksiTrfl
 BhPDwAcEzPu6G/MY0NpX20SkF8MBV7LGQCLFZAut6g/Vu+8ehKQb9/qYPHaeuj9tgDG8
 KDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795660519; x=1796265319;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FXR5fY9w0UwdiNAuY3odcVNzbKqwkmwUYZjUrNrGUFE=;
 b=lazzbsl+WlxL8pctXGTm17SD59J/eWsAVEjhqOCbJnDwIkeJNmFzAEGw5h6LYsA0hl
 w+Eru4qpuPaliHXb943FHzcwZs+SVV8sr4s86BpFei2+CnJDrXOVJKtffgxvYfic+I2Q
 jXyUGiAqAQyH4uRvCFySZr9N3ORQyKwXrrTvg02Vncaf+VA6j/6axuTDsS/PtUpTvf6v
 gth68GtlcjKFuaAGfi8yDYE/zre4cbP7dK2bWHDe8z46NolZAHoPrRHNNi5bF9eUOfKA
 p8MS68jA6SN9Es5ecPCUr9F2dstwQWhz2RwJ/oQdQpbXAKnMkr4d7tScFBZU/3zuSq6g
 A0pg==
X-Forwarded-Encrypted: i=1;
 AL+hErESh5FaHk+1z4/FkJuqJ008DnP7Z0qrMsHtkZUJjuMipy4umjX/uXluy3oelGig5OegP7s+JfjPCD9u@nongnu.org
X-Gm-Message-State: APuU4Z92/EVV9INh9ar6eenmxhjz5J37ej6wNo1z/3euWPAJBxvn3g7A
 MPMALH6qCfLKutfJdLW/GN9E6jx7s1TtW6F2fy3i7gp3HhuHNxW0ZxnD
X-Gm-Gg: AZFdTZfurmzMQ/OdKoRLVktpWi7uL0w2xTzQWEgm1oVUOZ3ynXcaMChkpQpvsgWj7pC
 Kc/sSCBEis5zNXncH/yMR/bvpKaJGwITpt60DC7gpsTx0q8xqkzJExZ1OETuO02tZJGaugu+0Xl
 FLJTtIWT/FYlyjTHyAg0XDpSkhzqkB/kukJp39KgTV1o8XGT5DTAVBwQ7F4GpBVcfZK1oebI7W9
 CgTrt2hCSo4wB9quBbSjFUzj8hzHRoGk+R0jWO+DB7FLd3Mrqyg1hrFlpEsiEu397qeMqTh4Jnu
 I632q5CoFV/dd6nPwvrlrqPrelabr0r/mY4cGb1K6U8x+J4xkh6vn+wxc7y9kgEFOdnfN/FAxtm
 rpvmsziyYbKfPPfA2B8zUw4c3JC1LWHC5E82gOHGIIgQUcb5Sa9r8AHvQttqhNsDrjWboMVSse0
 7K4HbmvHPtOffLK+RQHrQiTdYT9IGto1rRhRk78mX1vhlgD/P3ufM3V4xAxlsE+lC7PBNvXRfEu
 5fZjdYjh4+4dCJPe1nMycOzpMuc6icsSyB/oijfa1OdSoIgDse0M1nLHBBDLNmQ/n+KEKf2mkKe
 5Iauc86sr1Mxi1BXj5LEH1KpwnrK7c1oflNp4ZCH7I3wOw==
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id
 98e67ed59e1d1-3b41c96cde4mr20358979a91.47.1795660518643; 
 Wed, 25 Nov 2026 18:35:18 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:61d:93ac:f2c5:2564])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b41ad0a34asm29705417a91.3.2026.11.25.18.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 18:35:18 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: asrinivasan@tenstorrent.com
Cc: Zixin Wang <w1355457260@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] Add Spacemit K3 Machine
Date: Thu, 26 Nov 2026 02:35:01 +0000
Message-ID: <20261126023501.460848-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAEev2e9YBm-rA1+-mmw-qF-5dLw7uO0o=knHh30KAyDVepBsfQ@mail.gmail.com>
References: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
 <CAEev2e9YBm-rA1+-mmw-qF-5dLw7uO0o=knHh30KAyDVepBsfQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::9;
 envelope-from=w1355457260@gmail.com; helo=mail-pj2-x09.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anirudh,

Thanks, that makes sense. I will hold my own model and focus on reviewing
this series first; missing features and tests can be added after it is
upstream.

For the tests: I do not use tuxboot. The K3 SDK and image download entry
point is SpacemiT's resource download center:

  https://www.spacemit.com/community/resources-download

K3 resources are available under the SDK and image sections there. My
local test uses the K3 SDK Linux image and OpenSBI firmware from that
SDK, together with a small initramfs and a QEMU-specific DTB. I pin the
exact files with SHA-256 and boot them with:

  -bios fw_dynamic.bin -kernel Image -initrd ... -dtb ...

This avoids the tuxboot kernel/OpenSBI limitation entirely. The qtests do
not need firmware; they run with:

  -M k3-pico-itx -bios none

The DTB I use is prepared for the Linux-first QEMU machine. If your memory
map differs, we can adapt the DTB and boot command to your machine model.

For your NOR-flash test, the same K3 Image and DTB should be usable; you
mainly need to prepare the NOR image/layout. I can share the
qtest/functional test harness and help adapt it. I can also boot-test your
series with the K3 SDK images and provide a Tested-by tag if it passes.

Thanks,
Zixin

