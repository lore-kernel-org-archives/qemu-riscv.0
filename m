Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2853C35FFA
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 07:59:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuoKz-0006jL-KL; Wed, 19 Mar 2025 03:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1tuoKo-0006hZ-J1
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 03:59:32 -0400
Received: from xmbghk7.mail.qq.com ([43.163.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1tuoKk-0003oL-P8
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 03:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1742371155; bh=Ks4VgP0YLCS9XLo/JUKW1RfOSuklGjF/qbZwoK8uYys=;
 h=Subject:From:To:Date;
 b=BZl6Y7y64ZX8ikdWB/UN0MGzmUqJ6r3O17gOwr2QY/uPXzwEY63XjkDUlL7CJqdrY
 oPjErG/ZnlGOM4Wl6MGy8rgwoTwCrzTYQQrEpm/Ip6fVvf9tRcgldkgPHLV0htActG
 v/DzTu7vXIhgRqUuqlrsmBvZb14Tfw7ZYsvdCXm8=
Received: from [192.168.1.13] ([218.89.199.104])
 by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
 id DFBA6621; Wed, 19 Mar 2025 15:55:59 +0800
X-QQ-mid: xmsmtpt1742370959tmvkpgr9r
Message-ID: <tencent_B08E6CCE1DE2E1580A782D03697B9EC40F05@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XnSBU+/id8Bz1sqzmst0Y2Eo6Qnf1SS9YgXSXutdz8wOWU0QBQYt
 cTL2B6f2Ju6fn4lljtSOl83v6D0mSB2bCqJwQIB3LRKCcG78RyOxSY+0fd2XcqQq/FvIU8nEQN4+
 vGx78scTIKSzeL+TyvLFzWPRIXm+KQ4AghuLmCu6utjzgauzaWRkzdDTQYNCtxU0AjOI6XMwm5vT
 diH0ReVPCSLqm/O+TfXNz845AuYeJvXcUH67juyY/boAKwADdqT9tqelRVLqZWgwib9dIv7WL15K
 lDIVw2E/jtm7JcMuMuI1xtEBge0eeF4DLqSgNmk8TftFw/I3fT85IRlzLsjUGqIW3/ktB0U6v8Sv
 QggF2HHV1WiM8TumAmWIMhwQQzk1dcbQwVjvJACNETyUKpdyeq1+PcZAV99kkB1qcpqWXhvpijBf
 DzQkj/KyGMdXnKHP3cj0Xaoz2PrFCRKxwceiw/q5uoEbLR18PGotj+RjU+61mEOl09O4WXX2F7+I
 9tiOrnsG6pR3IxYNvKMtjIo0tcaoXP9Kr5bnaZ9xwYdQsfJ0oLo9J3hxao2n2LxcJxBElyyj3x7p
 NDe6+9KE2aNbN13vug4YyB3bqoRobieYSyuaqK0Fgvh2Y1sskprPQPzIVpYYxYRQP52/CW2iZdjh
 ljkK+RCvzcyZR2B7hRMmeHoFU3b1wDudGXD5JoCHCa8Y9fmEglHp9bEeIaiWNRTuifpHTF64ni97
 fE1VGOglVj5CV8HGO/8NunGyLLO/BAkZX/16GIGz3T9vtxWMadx17QJTymWiWONLMTPeveKKjghd
 uNuRonOggQGoU2k8xjhW8txVxzYJkEI6nn8ZGXWTrrlTqhB2UrnrhUimLBGI0me0X52xnuVckD10
 6FQyv39fQGLF+mDYgWe9RInxxA7I0QI+CFCxRVvLCTatn5QgqnpkMSAPHnJidUw6EeyxW92QHZBu
 M0OMcvPZI=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-OQ-MSGID: <24082f5040d11761204292e0710172b4b0676fb9.camel@qq.com>
Subject: emulated riscv PLIC
From: Yanfeng Liu <yfliu2008@qq.com>
To: qemu-riscv <qemu-riscv@nongnu.org>
Date: Wed, 19 Mar 2025 15:55:59 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Received-SPF: pass client-ip=43.163.128.43; envelope-from=yfliu2008@qq.com;
 helo=xmbghk7.mail.qq.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_PBL=3.335,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Dear experts,

I am wondering the emulated riscv PLIC in QEMU allows triggering an interru=
pt by
writing directly to the memory mapped pending register?

For example, to trigger PLIC interrupt 12, I wrote uint32_t (1 << 12) to
0xc001000. But with QEMU v6.2 this seems has no effect.

Regards,
yf


