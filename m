Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2737BC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 09:32:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVqPZ-0005BV-3W; Tue, 15 Aug 2023 05:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>)
 id 1qVqPY-0005B9-02; Tue, 15 Aug 2023 05:32:24 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>)
 id 1qVqPV-0003sO-Ki; Tue, 15 Aug 2023 05:32:23 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AE23F1F8C1;
 Tue, 15 Aug 2023 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692091938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cRmiKExOLEOAGnXZCJMC3GxMPp5K+TGo5rojuPpXvfc=;
 b=iWQ5EfPWBAjVCu7iHjHhyDgwQFW1H1IFC8RTxrBb7X2uYFf0nXFScPASxGJxcL+nEGrb0r
 ixEiLn9UqauzG80eOSxGaf28FRCpviatI38uVk9hCQPXu4CHlx6Rs2AfGVPG7FeH0DUIf3
 MZfztXVD1RuucCGWcbyoF2OFof5oXhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692091938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cRmiKExOLEOAGnXZCJMC3GxMPp5K+TGo5rojuPpXvfc=;
 b=7b3yCnCA7/WucALrCvId6Ws6HTdrJ+vOu5zMv9C1HFSVBzqBV7s5LtdXPrJCy9esep7u8Q
 A5U2ls/lmn1M6xCg==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id A07862C143;
 Tue, 15 Aug 2023 09:32:18 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
 id 4BAD24AB2BC; Tue, 15 Aug 2023 11:32:18 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: qemu-system-riscv64 -cpu host uses wrong privilege spec version
In-Reply-To: <ef194137-0843-78fb-4b99-4b52fd84a444@ventanamicro.com> (Daniel
 Henrique Barboza's message of "Tue, 15 Aug 2023 06:22:17 -0300")
References: <mvmmsytdc1i.fsf@suse.de>
 <ef194137-0843-78fb-4b99-4b52fd84a444@ventanamicro.com>
X-Yow: By MEER biz doo SCHOIN..
Date: Tue, 15 Aug 2023 11:32:18 +0200
Message-ID: <mvmwmxwbqhp.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=schwab@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Aug 15 2023, Daniel Henrique Barboza wrote:

> This was fixed in 8.1 by eddabb6b88 ("target/riscv: skip features setup for KVM CPUs").
> Which QEMU version/branch are you using?

Thanks, this was tested with 8.0.4.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

