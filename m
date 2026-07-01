Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F98C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:30:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wemaH-0005IY-I8; Wed, 01 Jul 2026 00:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wemaF-0005I6-5I
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 00:29:59 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wemaD-0005Py-DZ
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 00:29:58 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-664b3831a20so207314d50.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 21:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782880196; cv=none;
 d=google.com; s=arc-20260327;
 b=FRZWj2e1LFV4AaDFiDzpekuPGwkLPv/EpiONubIS7EfvdMmXGVxSMzibnroPl1gGZe
 yfs5BZQItg9h2kN3P7iFLWBq16rWZOHA2NmNoEf2kBzZOEstwaXg3dHXX6E0AosxAVuZ
 SkG7QideeVMWr55P1poXQvgKfnH+pwuqyGXC7WUiURGeHGBp4Ms5Hjaf3Vw227pTZY4o
 r3RLTHwCYTp2zgW0c0c4DlOxg5Sh4XP+EG3rFbHUQ9JXcEElQbd1BAyxHG3Pd1zBv2aI
 sdoTE3dZOTUSb1EbHiLxQE2TSulsMu4CweOuiQD5+nIkx2fCQb98cS4T3SJnmEOU1XH8
 5Uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NkA89hQKgBW8RKe455wjGc4VzEyzFdTmOegKbWYXtQ4=;
 fh=IfhPglmjl3EflN7uWI5haj5dLjaqrlICLYcXUM5F0Oo=;
 b=IEf4rjX7r80r75jqYhwztcYHklcQmpSA2qSp+Sp6l0i1vP9mNPvUEfUTBJe8DUC3su
 /NqWrACO21nuFSUjOwT+zBvEhgmP6lf8OsME0KNotnYrf/0ebRBBv5Yl6n1fll6KOpLa
 xT5pSkQG4X2fxxN3pmLddl9fou87wIybL+HZ2B52NZZM0N5WFU5E+6mhOMkSFtwgAub6
 3VyfkzMyBYWFZIs3JW5HdA1yO+f0GkQf3MqOqk9djRApoKWWPaiG5/v4Qz/BmwYljtw9
 kMez5HWvMLHV47snRT3pXUHpJfXJqG8YE7dUTPTTfvbw7MBT8/vcdB2Honp/iwzWyjWw
 hN3Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1782880196; x=1783484996; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NkA89hQKgBW8RKe455wjGc4VzEyzFdTmOegKbWYXtQ4=;
 b=kZL5O0viJauqH0YQy0w58p9YEaPr4x2ChiU2zMNQzyQLi2PfYJ8sfnSr5gbUDNt6qf
 SGkvur7BJth1xKPXUWCw0VltLK1PnxJgSvgdsnZ7siSTC/8DDxO+O48r8PybHeW4IXTm
 WJWwOk5r0IspN/ElpveZpSRGc4XsUxqGJ3J94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782880196; x=1783484996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkA89hQKgBW8RKe455wjGc4VzEyzFdTmOegKbWYXtQ4=;
 b=JBTr7XjxSUgimgwH/UJn1zMk1BrpJMYeqNv/7tNHLgRFZa3Tstvffp1DEJu+FfqBIU
 AbI4N/hCndNzCU5fxqz6Ad28Rpc37XttbBO3H+s34MeSoKZs7YUMYt3MDCMvbPOFYdyW
 ptHnr0n1JGnRMY5zh4qAB4BoIL7p/WZ1nvONfACSDZbG7LYBA6nB3aJdpgvSbiiOzlEk
 Os7ZeWmUNw60nZ2v1rpqDZF5GZjrH0YMS9jSEHvNgdBBpvJnu72Kc1DMGw8+SdmQ/jPO
 o9LNFMJ06MdeHqEZyihoSJCMyjpWd4+r8hMH4+IXa7ZHTLLmWyxWRdDLdOt4R5MWeldT
 t0cA==
X-Forwarded-Encrypted: i=1;
 AHgh+RobI0wzzVkjKYdld7BCwOpn9FgP1q6QVQeCFZoe1gOtaiQeL2rYlwDM/zlFkzhyDFy+eZYbkPgKKvm/@nongnu.org
X-Gm-Message-State: AOJu0YxUvcZePmqFv4Rw11kHEUoW23mpEr6ATGnBQAx8ZawJwLGf7Tbm
 zkhkgSvY1qz0Q7uryD6XI7BGAPpRNu8vVxIaTlhCmsLSsTrULDXHOgehDJd9W3A4/jdxMjXkFiG
 Wa9ffNKCK9jY6iSFUFt9bPsBHs9V8S80=
X-Gm-Gg: AfdE7cnnrIyS1EUjhXicrqOJrOkz+kKAwdTHtfCpJdupFUxhBIShQoEBrRbHel77TAA
 oPYYO0h1WcdtOMfNfxIkyomNDAem1ghmnJTclCVavRekgVM4FE42VA84lT8AMbtjxiYegqXsabb
 aqOUvQsZ7A1pfxpakFW8Q++m9x9imDZH8lHYRy09iEbGo7n6p4LuUd5Ckc+wsb1VWqFkxGE7dqE
 FRTBXyDZ1JOnrIgsB4qyR9TaiJPkhHGVFt58CTIT8cd8KwctoZRmJgDHjmTu2PErINa9tD2b+wK
 ZulqOGdXugDxHyzaTPBPR2oBauY9KViqCKAT21vPuY5bar5/2sEZodLixseUQaiExIllD3aIP1e
 HXTQTLWeOOhI5zwfwg7/sQgla
X-Received: by 2002:a05:690e:484f:b0:662:551d:b987 with SMTP id
 956f58d0204a3-6652196979cmr31110d50.12.1782880196316; Tue, 30 Jun 2026
 21:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260610214133.1882563-2-daniel.barboza@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2026 13:59:45 +0930
X-Gm-Features: AVVi8CdJsOpeHLO2sqRcWf7JZmfLsV6KCqBXcRTkerrIhb-5qjq35Keb_txflJs
Message-ID: <CACPK8Xf9sT_Pyc20zpLnpo+32RNRjS29VP86RhmF0ufoNd8kxQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] target/riscv/cpu.c: remove 'bare' condition for
 .profile
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com, uwu@icenowy.me, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 11 Jun 2026 at 07:11, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We want to configure other CPU types to use profiles as an alternative
> to adding every profile extension explicitly, i.e. a profile is nothing
> more than an extension bundle.
>
> This means that a vendor CPU can set .profile=rva23s64 while having the
> same handling as any other vendor CPU. Same thing with all other CPU
> types.

+1000

>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

