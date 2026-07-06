Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4725CC43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 14:46:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgkaa-0005VC-Gm; Mon, 06 Jul 2026 10:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fustini@kernel.org>)
 id 1wgkaY-0005Up-MS
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 10:46:27 -0400
Received: from sea.source.kernel.org ([172.234.252.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fustini@kernel.org>)
 id 1wgkaW-0005Zv-UH
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 10:46:26 -0400
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E23DE402E8;
 Mon,  6 Jul 2026 14:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08B81F000E9;
 Mon,  6 Jul 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783349175;
 bh=brx/0pjLPbIrtsCLKJMRSdKrfuPAmeeDj45TYZzCsts=;
 h=Date:From:To:Cc:Subject;
 b=GRPq8zRwdkOW2eJBU6A7QeKlcffOXU1DX1xaza+0LosuToaFcnIkkMEGkqSdvoM7+
 Y+Z5hDHWTp2y6DKnOJs2FeQboaNF59wGIXyQaCrlmFl76eZVomgy1x0pJYD2rBlzHj
 o+0vX2o8oJ9958leBdXSC+27RoclU6HxXWqyPH5h+86FS5oVj87SsoApDM8dgZR00T
 QijldAFHZzb7d7e0/j5zi3nIT9DI7ub/hLqoI4+rqGjwQ5AP0RbnHpqbZBRJpkjPQt
 OweeEOYVV4p8VZYcW3jhDYbzvjkXoHpMw4MYKwYedf6fezxNrMlwz/6cbrSWUopqjN
 SWyRyV7+EUiXQ==
Date: Mon, 6 Jul 2026 07:46:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 opensbi@lists.infradead.org, u-boot@lists.denx.de, qemu-riscv@nongnu.org
Cc: Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Conor Dooley <conor@kernel.org>
Subject: CFP for Plumbers RISC-V MC          
Message-ID: <aku/tckAJ71i952o@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=172.234.252.31; envelope-from=fustini@kernel.org;
 helo=sea.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all,
 
The RISC-V microconferecnce has been accepted for Linux Plumbers 2026 in Prague
this October 5-7:
https://lpc.events/event/20/contributions/2333/

The Call For Papers is currently open. The microconference is composed of
sessions between 15 to 30 minutes for a total of 3.5 hours of technical  
discussion:
https://lpc.events/event/20/abstracts/

Please remember to choose "RISC-V MC" as the track. It is ideal to submit your
proposal before Friday, July 10.

Thanks,     
Drew
~
~


