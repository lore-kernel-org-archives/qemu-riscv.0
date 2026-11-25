Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ACD606A329
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM153vMv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW9tc-0002rR-Kt; Wed, 25 Nov 2026 05:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w1355457260@gmail.com>)
 id 1xW9tb-0002r9-Ah
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 05:06:35 -0500
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <w1355457260@gmail.com>)
 id 1xW9tZ-000293-M2
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 05:06:35 -0500
Received: by mail-pj2-x0b.google.com with SMTP id
 d9443c01a7336-2f042b6ef3aso40437745ad.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795601192; x=1796205992; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=01612jM2atsR1/GUpPpAsoE+njy80UF0HzZADHRQwGU=;
 b=uM153vMvlX2BJOuYzjIG2I/q7fGFfNc1cm+YOvOJEtCfp1mThia0bqQzgFjlJck0VO
 bQ0cTwA9CaorCs5/GjyEVdSzexw6GGVXJZsYungEgxuxOpcRwgRwgwFtnVzcPWseoGQ+
 l2T8wZJIKlVJglrK3EsILDF0glOCmsg2W2w9maycOryocS1eaMSG6/6Rl5QVxcbkEP1X
 o0puvDvvOgEEzOcCLp/kbggzHSy3uFDkOQEJJOVhddup2i8fDoB6qYXL6nR6ioFP+njH
 UocdRXb9fiiYu82ihhwmjmQ6AD5WHh3J2wPL6s4sR2Z3ho6DVDC8U/uWy/I+QNgOj17W
 3yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795601192; x=1796205992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=01612jM2atsR1/GUpPpAsoE+njy80UF0HzZADHRQwGU=;
 b=NV2tzw7Z2c0rudE4cDDm8yEiovq9PtBL0Euv4aOEhnEZkzwG0TTocfsmlEl2IacXot
 Zay5XLv1ULYN4b4+EEEU+hGqdEJQIrcsPX6fNX1MPo8gaXduJv/uANnOHmsId/TIeLS0
 sib7QZY+J8YBAzv2XKph6YMb5pKoUw0SKdamqYI0AEYcWD/nHyZ/o9Lc8Vt7qjw8FBXV
 VunDe9pxudvPGyjDEkD7UlOlBLakjgYlhx5Ft8UPY3bN3eQ7vYef+6BmPdN4O4ENX6zR
 6VPN7cWi1tJIr/I/lsF1ixYlpOzxZIx4hhc/4q2sKQT1S68TE/0yAuZ811kXlQjK2WPM
 f+aQ==
X-Forwarded-Encrypted: i=1;
 AL+hErG+8gyrQwrrv+fBf2p9vYLpefL9DbOVuectXjleanPcbWGuxS9+xoCpHrHLemKgtncqwckTYh7ZCiK0@nongnu.org
X-Gm-Message-State: APuU4Z+ZVEpkgdlt+T2LOn5t2oNWW1V00Ov4OEYG2iPWZAbOHWIFdHjd
 pVFAZA+jFVipYrLrx6ZEy8TC+07TtKxL6Q8ItI35MejjYz5Wg/f0p903
X-Gm-Gg: AZFdTZexrKccoX4NmhZ3hqThp5WzKAcM2Aj8sWZxGZcBzv8ROv5hIeMfr8I/nNYkOg/
 31H9c16/MBW2dqCpXOoHu20VSZ51kjwMYisKarBaWbNqF4trY/oSgdhhSaoVm2zxBFIqrc5II2e
 Gx4E0G0+bh7jkc2y9jT9cTRI/3QUei6towTLPl6sk+ZGHmYD1W/Elm6ZuY75CNVG6SLAPv/ltAU
 zTmakBckbKNQyHN6O3f0dieHfkQX+EsRSjSYGEPwNMtn7R9UFphMe4KxlToNyPQB0vl7+Pa6EIq
 qbfsI/84ZGiNw+r90EQniTL9K76BQSzIBlYUQcFAEJliYYIbUKrFUXLgIMXc7ulLeuul5lHYrrm
 ZSJN3m07MS+FSdhevHepQyO41wUY31xdWTlz00CcQ9gNVNMMczRLi/yZSRpLkZjWhTbH05C68KX
 SVqnNgil9oVH3XuXBML7VYDWC1unoKpZsLGn4WjEZ1+U0f8o0lTr5zO6/X6eWkCKbcvFQ9ohxwd
 uTXO/nJ2RHFmQCAjyNoH+xLDGACDx7dlsjpYWcIUKyyhHtkAClKXRNFMkLHfrBH3mNkDh0vBoq9
 82NWMi2ByKU+9KYiQFaT0U9x2A==
X-Received: by 2002:a05:6a20:2446:b0:3f9:6c37:4b3c with SMTP id
 adf61e73a8af0-401493a666cmr19885050637.1.1795601191567; 
 Wed, 25 Nov 2026 02:06:31 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8c872e456a7sm8688496b3a.29.2026.11.25.02.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 02:06:30 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: asrinivasan@oss.tenstorrent.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Zixin Wang <w1355457260@gmail.com>
Subject: Re: [PATCH 0/8] Add Spacemit K3 Machine
Date: Wed, 25 Nov 2026 10:06:04 +0000
Message-ID: <20261125100604.128764-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
References: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::b;
 envelope-from=w1355457260@gmail.com; helo=mail-pj2-x0b.google.com
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

Thanks for the series. I have also been working on a SpaceMiT K3 machine model for QEMU (a Linux-first subset that boots Linux through OpenSBI), and I have qtests and a functional boot test for it locally. Since your series already covers the K3 machine, I will hold my own version and not send it, to avoid duplicate review effort.

Would you like help with tests for this series, or do you plan to add them yourself? I would be happy to either contribute tests (I can share the qtest/functional-test setup from my model) or boot-test your series with the K3 SDK images and report the results, including a Tested-by tag if the tests pass.

Best regards,
Zixin Wang

