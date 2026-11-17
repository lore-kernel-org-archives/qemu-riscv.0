Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630A606A323
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJCy9f2V
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTJ3s-0006Ve-A2; Tue, 17 Nov 2026 08:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kmehltretter@gmail.com>)
 id 1xTByr-0000Iv-4W
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 00:43:45 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kmehltretter@gmail.com>)
 id 1xTByp-0006NO-F7
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 00:43:44 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so34593365e9.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 21:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794894221; x=1795499021; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=92vnorFbr3vOHfrN1G11rwU37DCe/opDQJz3fRlDtrE=;
 b=PJCy9f2VCtOHpr+ZliF2yQ0E1V8+1sdI6KivYtl7TcGjw6npkBY5dYF7MPrGU8qwm9
 TdjhRe0ug7kw9s7mzd1/n90l8jDzWNJ+F/KIP1xdBYVuv7LPTV420Uz6fTeOzhjkzlAc
 /3cqPwzZnbvJ41qTx6d+NVnagQZZR+J/AR4wOs0Ra/4RQEY1dg/qik5i3tBpOgdvyV9i
 JC3wzBrUSTIgtqv4XMPkJ6h1rGVtDSAd+nxmvb4YJJNSAeQtvTWRyqJnlTUhg7IJYe1c
 Zjtu+4UbDLN9durvTS7RyegmzeMKn29xZMIfy19KpPL8JcoyVNedcmKiUrJjS9s5m6M1
 T3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794894221; x=1795499021;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=92vnorFbr3vOHfrN1G11rwU37DCe/opDQJz3fRlDtrE=;
 b=xZa+6JY2Y7ntLAeN842X1/Sc0T2hGo5jXoBrrdiVEXh54T9eKZ8Z6L+5peUCp+gaM/
 pE+U+xNM3nPsUoassEibioCst3JmuFj3+XdGfEgwauVW8MmlK1L7VIJFhxMXZxHB66CB
 w9bY/92TVmv76JoPi5hSmqSugGAGWPDVqpkOZDIRDd+MOTuHPTmE4OCiZCE253JxijXZ
 fxVkrsir1CBw0FPfcia5M+e00KJ2Qn7iYzZCC3yr7XRn10Y/pBZLivNFSUb5Rt1hCYCV
 tvYmdf+yNq/STaFIjK/Ur2a8tbI52a5Bk9R80654tKAunkmy3LH0xR2BMx4GmqoNts6F
 YVUA==
X-Forwarded-Encrypted: i=1;
 AL+hErEuJyL/5qZHBoBteN5rrPWhG/t0+zub3BEM2zJ+T7jBh4LhV1hk1fDAB6HPu01rq2smsjWihbPzk0YW@nongnu.org
X-Gm-Message-State: APuU4Z/lTV3630+Ewh/eJk4JCaHgzkt66GChc9WWlosx+oZQEv5T7Y8F
 /ppxPT9R9kdJbmi0iIp5HFRP6BVF1sguyiDiTmhJFUbMV4M5uPi8w9kO
X-Gm-Gg: AYBFou0zNR6jFIKm4xQCjEElY5r4VPtLW6hS0ZOHUfig2JWDeDA1rQqR2wxocYgZknW
 DYaeKBX/VSZRzA1UDUonnQM3TOiiMU+4ffWGcj0kVCVh6W0Y8VpeCZfE3+L0PeodTEtbUMGN1RY
 59awMDECxUxr8yWGdlKyNMCf3xMQADOtF2ocK7hZ3ChM5OxAaSQ653aYUVGmc4HAMqzBs19M6Dp
 yQ2UkPnmnUuzbZKuK7EiZn/jMgYsvvQleS/SdqkBIHMnIm8v/RpQpDuCZNjjGeFsoxuCzINbuyl
 haXLgO5W6eCqlnCGymEduLJ2PIDgiaxPAlurzkQmHEr2vDJFq+uC88AMSvrbmn/O1q72XvV9+p2
 LnGozio1XzYbIaNK6lGieVJFw/lFa8udsu+JecykqebkyN89ewomp5pD/tT7pUUtMKVrkQVdt3e
 brxwlN7yRyHHpwXa7tQLcQP9TuQ/t39TCLXU0wAu9MxDObKOdf8mybtCtS8+P4vQbMdiTjiUSIB
 oaBQGtwaUSRKdekyY1hu8gIY6pu7cD7orDOzL6lg8G2g9LPdUcIqJSDEcbgcS2Usayo8Vaj6nGz
 5XKzDQG7Pk+uE7B2Fb2FppIsnwbWhuUYgTQtStIoQk3TNiy3E19Z0NTushrBGVNErN5LYDaqFMY
 9guu0P+A7Rd4RempVrhhdK3q8x2rtkwcorYsvw43QRLBSxHKQnNGOJdpiz4a5PJUU++7xxJ3Mjj
 ITIXEEvNlcmmKGs5/wa01K4qsprcR7cg4FFKI3mM5VrIqEvuU=
X-Received: by 2002:a05:600c:3113:b0:4a1:d537:1c8d with SMTP id
 5b1f17b1804b1-4bb55aabda0mr268344195e9.19.1794894221262; 
 Mon, 16 Nov 2026 21:43:41 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain
 (dynamic-2a02-3100-b014-0b01-69e0-6cd4-9e72-ec17.310.pool.telefonica.de.
 [2a02:3100:b014:b01:69e0:6cd4:9e72:ec17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb68c00b10sm125424745e9.0.2026.11.16.21.43.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 16 Nov 2026 21:43:40 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Abhigyan Kumar <314abh@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>
Subject: Re: [PATCH] target/riscv: make Zicfiss CBO checks independent of TLB
 state
Date: Tue, 17 Nov 2026 06:43:30 +0100
Message-Id: <20261117054330.85494-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261114215908.260568-1-314abh@gmail.com>
References: <20261114215908.260568-1-314abh@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=kmehltretter@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 Nov 2026 08:17:16 -0500
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 15 Nov 2026 at 03:29, Abhigyan Kumar <314abh@gmail.com> wrote:
> This commit introduces CPUTLBEntryFull.extra.riscv.sstack as
> a marker for shadow stack pages inside TLB entries. When riscv.sstack is
> set, check_zicbom_access falls through it to probe_write.
>
> With this commit, the now-redundant special case in get_physical_address
> for probe is removed. is_probe in a call to get_physical_address is
> replaced with is_sstack_page. As a side effect non-fault probes of
> shadow stack pages no longer see them as unreadable, matching what a
> usual load does.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4789
> Fixes: 669b4867495c ("target/riscv: mmu changes for zicfiss shadow stack protection")
> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>


With this patch on master (97c88c61d45d), the reproducer from #4789 passes and
exits 0.

Tested on Debian 13 x86_64 (riscv64-softmmu and riscv64-linux-user build).

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl

