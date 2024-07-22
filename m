Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2876C3DA5D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 00:29:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVgvW-0007rs-Lm; Sun, 21 Jul 2024 20:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1sVgvU-0007fd-7r
 for qemu-riscv@nongnu.org; Sun, 21 Jul 2024 20:29:16 -0400
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1sVgvQ-0007mw-5F
 for qemu-riscv@nongnu.org; Sun, 21 Jul 2024 20:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1721608144; bh=LyERTDlLU7zSa9W4GD3zmtCPZAUrDMLT67LiG50Lsm8=;
 h=From:To:Subject:Date;
 b=sxIykbFpW0TjaJrIpa84xqekBvHWviI0KYQPJdCOW5JEz3/6CrcIk9cCOxuYnqLEc
 E66lDLaHibzywFpIDRWMaDNsRfo6tj3FNkJM3r85rMactQuqc9Uuc6StQfagFU71jK
 fYUJ4n9mzTKB5UVrPpH0BawUkiZdeNFeJ0b/5Gxs=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-XMAILINFO: M2pBd1R7V2XaMWrqQGkn/nGdp8O51JuawgOUzLhPsoFQ2Tl3JYwzahoLs7S0Uq
 7wwsEUdn4OJDXaL/K/CZ81jz7zD0RJg8vhKmfxMtSttlllwLtauk5iK6AJd1pi/s7URDa/FfIfZBC
 gKqyUvydZ4zd3hAeywG6qinvJ7ag/v8hkGYLHAp+hltDSQngSpntg1LdyI+DKCYVd+U9xZv+jHPfU
 gepTMcl4PEbXW2k6vsUSaTQNJmshnUUmXLdM7il7OmAdLwqDav6bRCT08KgA0a9cs6Cc6UJbmd5Zz
 w+3HHprKFYRS99pVk1/FJgtcv2nqcNR7mJw2bOe1uTBfi6tWQ5k0832lPz+aHGdDYocwmhJ5FBjRK
 +3XELmFsp8oTSJXBsuaaVqgSFc2AfRlPlDJmdRtmt5nQuvDXnxjw7duGAmjVBARV4088byfoDOuoh
 0N6swK848O9iQa7pOp0wCzFwbO2QChi9QkN1OYVA7fYh3eDGzOEeqJJCFusi+F3FYt3XDY1x+HiAn
 LlsXuQWBHN6B910tifZzuc2+XaoJp8rE9lE0iVfII6DLYUv0PRo661eL2ezvwK3iMbkE+I3d+zFF5
 K/rRH75VN+OTYw+UoizdJTtbXj6/tMp1bY+KQR2ti8qALBGeTRiyq20p45yi3QpOSU1RUMB4Jg6NT
 yy7BzDGODMSLktD2PLoKtrWibN9Ygb5fOaxsFD4Zt77qlp5K+2RfKC02wpvv7jZv8ZEwC3vHBgIcK
 ivkBg2sgpdsvmz8vGqS+6i8zbadUsUhWVZNopLnnaHq6tY5Ba99SnaN3sEU6t27QbSJp8DjjMlZO+
 ndIgAX9VL3tDBNpYeLlaEvZg2LHsh5He7zUJCyRLBu0U7iIM58XZCnbBh9Z7i5bGcdZD6xhy8OhZ1
 rzVG/T+xw7WR+Z+K3XSy7sB6lEECcj9DRQjMb5SxiqNr/Tz6iM3v/Ofv4HvrNUUnoKsQ78RvRQ+0n
 5Xx4gOrw==
From: "=?utf-8?B?eWZsaXUyMDA4?=" <yfliu2008@qq.com>
To: "=?utf-8?B?cWVtdS1yaXNjdg==?=" <qemu-riscv@nongnu.org>
Subject: usage question
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 22 Jul 2024 08:21:46 +0800
X-Priority: 3
Message-ID: <tencent_9B09697D9EC1EF8E6CD97DF881432A612D05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmseszc7-0t1721607706tkul6fzmw
Received-SPF: pass client-ip=162.62.57.210; envelope-from=yfliu2008@qq.com;
 helo=out162-62-57-210.mail.qq.com
X-Spam_score_int: 25
X-Spam_score: 2.5
X-Spam_bar: ++
X-Spam_report: (2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, FROM_EXCESS_BASE64=0.001, HELO_DYNAMIC_IPADDR=1.951,
 PYZOR_CHECK=1.392, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
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

RGVhciZuYnNwO2V4cGVydHMsPGJyLz48YnIvPkkmbmJzcDtoYXZlJm5ic3A7YSZuYnNwO3Vz
YWdlJm5ic3A7cXVlc3Rpb24mbmJzcDtoZXJlLCZuYnNwO2FzJm5ic3A7SSZuYnNwO2NhbiYj
Mzk7dCZuYnNwO3JlZ2lzdGVyJm5ic3A7aW4mbmJzcDtHaXRsYWImbmJzcDt0byZuYnNwO2Ny
ZWF0ZSZuYnNwO2lzc3VlcywmbmJzcDthbmQmbmJzcDt0aGUmbmJzcDtHaXRodWImbmJzcDty
ZXBvc2l0b3J5Jm5ic3A7ZG9lc24mIzM5O3QmbmJzcDthY2NlcHQmbmJzcDtpc3N1ZXMuPGJy
Lz48YnIvPk15Jm5ic3A7cXVlc3Rpb24mbmJzcDtpcyZuYnNwO2hvdyZuYnNwO3RvJm5ic3A7
dXNlJm5ic3A7JnF1b3Q7cWVtdS1zeXN0ZW0tcmlzY3YmcXVvdDsmbmJzcDtmb3ImbmJzcDth
Jm5ic3A7bWFjaGluZSZuYnNwO2xpa2UmbmJzcDsmcXVvdDstTSZuYnNwO3ZpcnQmcXVvdDsm
bmJzcDtidXQmbmJzcDt3aXRoJm5ic3A7dHdvJm5ic3A7Q1BVcyZuYnNwO2FuZCZuYnNwO2Nh
biZuYnNwO3J1biZuYnNwO3R3byZuYnNwO09TJm5ic3A7KG5vdCZuYnNwO2ZvciZuYnNwO1NN
UCkuJm5ic3A7T25lJm5ic3A7Y29yZXMmbmJzcDtjYW4mbmJzcDtldmVuJm5ic3A7ZGlmZmVy
Jm5ic3A7b24mbmJzcDtmZWF0dXJlcyZuYnNwOyhlLmcuJm5ic3A7b25lJm5ic3A7d2l0aG91
dCZuYnNwO3ZlY3RvciwmbmJzcDt0aGUmbmJzcDtvdGhlciZuYnNwO3dpdGgmbmJzcDt2ZWN0
b3ImbmJzcDtleHRlbnNpb24pLjxici8+PGJyLz5SZWdhcmRzLDxici8+eWY=


