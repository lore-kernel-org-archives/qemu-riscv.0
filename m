Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A860EC001DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 12:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVX0v-0005hA-5V; Mon, 14 Aug 2023 08:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>)
 id 1qVX0l-0005QA-Si; Mon, 14 Aug 2023 08:49:37 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>)
 id 1qVX0a-0007Bv-DL; Mon, 14 Aug 2023 08:49:28 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5F3B121986;
 Mon, 14 Aug 2023 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692017354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=uLDmnHhM1DbVG7FZKTfR4+3INuv0lz1bVcDwsNUU9dU=;
 b=XTmVlpdRBKlzh1H845c922FOP97OWbLiX0xyYvrT3G5yB+DShwp2PeQ3ujUDHajVUh7g8M
 KSHGJttOLBkKuT8gZnMPWd6c5nVBqpsxhBJINa179ZnR7IiH9GGfOjpNRtb0dyPcDOAJpq
 9h5+TMeDIOk+vbhDFSdRnZ3LdRrnOUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692017354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=uLDmnHhM1DbVG7FZKTfR4+3INuv0lz1bVcDwsNUU9dU=;
 b=YnbFu6MldnmpC/pNtfrD6lutORcsLLxPoohh9bIVu9/kixch3upTlVREkutnl44R+CsyqC
 OXtQ43HqUgnAfnBw==
Received: from hawking.nue2.suse.org (unknown [10.168.4.181])
 by relay2.suse.de (Postfix) with ESMTP id 52EEE2C143;
 Mon, 14 Aug 2023 12:49:14 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
 id 172634AB2CC; Mon, 14 Aug 2023 14:49:13 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: qemu-devel@nongnu.org
Subject: qemu-system-riscv64 -cpu host uses wrong privilege spec version
CC: qemu-riscv@nongnu.org
X-Yow: Hello, GORRY-O!!  I'm a GENIUS from HARVARD!!
Date: Mon, 14 Aug 2023 14:49:13 +0200
Message-ID: <mvmmsytdc1i.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=schwab@suse.de;
 helo=smtp-out1.suse.de
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

When running a KVM enabled qemu inside a qemu instance, I get these warnings:

$ qemu-system-riscv64 -cpu host -machine virt,accel=kvm
qemu-system-riscv64: warning: disabling h extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zicbom extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zicboz extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zawrs extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zba extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zbb extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zbc extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zbs extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling sstc extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling svadu extension for hart 0x0000000000000000 because privilege spec version does not match

The qemu instance is running openSUSE Tumbleweed with -cpu rv64,h=on,sv48=on.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

