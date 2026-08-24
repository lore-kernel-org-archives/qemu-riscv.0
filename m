Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD086C5DF97
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 00:45:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyIo6-0002jS-2c; Sun, 23 Aug 2026 20:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wyIo3-0002jD-Nx
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 20:44:55 -0400
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wyIo2-0004Y6-0O
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 20:44:55 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id 35596130008E;
 Sun, 23 Aug 2026 20:44:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Sun, 23 Aug 2026 20:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm3; t=1787532290; x=1787539490; bh=Gt
 TlyMEbbwxyLkDNL04J079vxHuHWrg7Ley02BReHYw=; b=QnggX+vWJ+DrA36k7O
 o9GNk+ayxNdh84bShTuBL720C323oOYMMzvEeqnZYCzTIt2rFLXiFKtyXPSx+XEi
 p09YjXGFbNWo9OdVP+qECFk5YI/mAwvVh3wpFRa9C185bmhmgc4nC7TNTODG/muT
 4MMnMJ+JpeSyxP6jRByOrBpwUgPU5ejCA4Efhg99P9o6Au+HhPHnj+Y5+5/+fAuW
 4hXgpyhlGb0DArlMzK9dCuLQ/4Qc/ixaod14ucok6rg9Df3CSsJd9yuH974932I/
 mz2dMDnVqAKiiUT6H2MkYsopUEafn/PGbX5o07k3YpZ5Gh4E+27ND2ijhGODqsP5
 bEbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1787532290; x=1787539490; bh=GtTlyMEbbwxyLkDNL04J079vxHuHWrg7Ley
 02BReHYw=; b=VgD37MxR0pbxB5G1ao77PM+4aZ9qONgc3tkphMXgZ7sH7YIRWYg
 jYstW8AgfZqaQmg2pT3pgyJDL3KPNwGUYkdJADLehbMdivVkhIi3TLiVHe8YP+7f
 hlV6Z3pQaUysVHR1Z17PKWDAileE5a+8DjcsvL27yEsk1DC1pXNG2eorzOMWz3Nc
 RuvVj5U37UAN++hWlLIGoe7ADECmI8CSuX9Qk0oqyEmw39fGck3NEsCrmJUkI6aQ
 s3/uFOCMbpJDdJrfzbQW6nBwTmzJ5b+1xREIJScdC636fFwJhMCPV6hFAcRa1uJr
 Eq77sz47xiXd79x4rdkCIaSxJSjtManvlTA==
X-ME-Sender: <xms:_ZOLapaFiEh2ttSeriwKvZT9_HhGD_Vkiu3CGvaHYYWf-C3EWM6d9Q>
 <xme:_ZOLasIO8N5bWaMfxThAhmzPDR0HoGiOeTE1JB6hVTy2FSyfljDu-ELoKtcpB4Cva
 g7_50EUGOx07F3FcEi1QDVCjzR5_F7GXuDNskCVpYYbzK7eL-6kajwW>
X-ME-Received: <xmr:_ZOLakgUf3C1Vw2fOx417ezjeVUxHpFniOoYAW5ykGsOWSqdaMMxItINH80oEX3ZHVMEMA-hCBA0HZldYYqzWBOWsR0>
X-ME-Proxy-Cause: dmFkZTGYmrGHNnSMYQ+CxF3ibo9Kb6yuqNFi2YvCC4h99NXlVHuPmE6CMKB5XMm0gBnocp
 FGvRsUSeoFzcGhGM0A7nGiZ4ZeUbtQJVhmzC1h2+eaTwPCl3zu1cbXfqdJFZ+035qtxGKY
 +zEd8kudG0a+5J7KJ64E2IdIxNOUYAIawulHaqHGpHaQInQVwywCwPPlZUQgWZR7hJmw6k
 Tr9J/6P3N9IeDFDNa3r3hZDKwfOddKiXJtcXS7Gkd4YV1F9QqP9VXBW+gVet1IYwqlnZO2
 0LNa4J2fhL4ef0yiH2iL74MBs4lzd1Vn/p2UhfHGXHTVKOVwPWNURtSM8iYztQP9HnkeWB
 alZOwkF6UKnd3Ca9arnEdUvy1gIpKJ9JmUiH1SF9OoMeBTTktvh2Zh3kuakv9TKgPDPT9V
 6BqiwPEyXjiZ3Ra2kOx8sVX1FojIDj2LlYEP4sqiR7cwpDqcF0TqWtJv6uHa2ajsWkWxxN
 L1TBrzl8Q2BaMIxNpfBAowftYbYvGm7p0WT3oxNAhTWUqohXkhDHFW6ako7BSdnCz6+i5I
 LXKfJCUL0ExN5hhLWFghmSlmCg5Cz/ZPrYUa/jhk/piYo3JAKZfxDvUF/9BqVfKy3v44/C
 2s0Nn+7G0o21ZZZ5BuXofbZTcADrSk8DS2f8ZoMEAWTzy4AmX2WdqdsInRxg
X-ME-Proxy: <xmx:_ZOLaoyIQjEav7lNLzQYDj9q61BYxSsmen5gs-VLqVVMbuiIGPtZdA>
 <xmx:_ZOLau28f6iiBk3v8W_yIIgzyC-5-AVrmhkW0OMfCUjZLHqhe1HMdA>
 <xmx:_ZOLarRdgiKULSgQCncG2vYVi1qWDN6R2tXTBGEJOdq_f9yrXT3yoA>
 <xmx:_ZOLari7g9SZ_0syny7qaMfpIHkRyldBxionw8kbzIti1kABoagb5Q>
 <xmx:ApSLamD2hHovmy-oKUxgbeCdj8woiwLgoroTYrxKbJ2hBP7l_c5NPKI2>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Aug 2026 20:44:33 -0400 (EDT)
Message-ID: <8c1a5c069853873258553840a37a54c87c40d2ed.camel@alistair23.me>
Subject: Use of AI Generated Content
From: Alistair <alistair@alistair23.me>
To: palmer@dabbelt.com, liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org, 	dubdublan1987@gmail.com, xinxie908@gmail.com,
 ahshehab24@gmail.com, 	nendensu@ispras.ru,
 daniel.barboza@oss.qualcomm.com, caojunze424@gmail.com,
 wzy15515798875@gmail.com, wxchen0913@gmail.com,
 christianslima@proton.me, 	dingtao0430@163.com, xb@ultrarisc.com,
 heavenlydev01@gmail.com, 	leo-cheng@vip.qq.com, guochun.wang@foxmail.com,
 frank.chang@sifive.com, 	max.chou@sifive.com, fritchleybohrer@gmail.com,
 chao.liu@processmission.com, 	flamboyant.h.01@gmail.com,
 mayuresh.chitale@oss.qualcomm.com, 314abh@gmail.com,
 ilya.chichkov.dev@gmail.com, subrahmanya.lingappa@oss.qualcomm.com,
 liuxu@nucleisys.com, asrinivasan@oss.tenstorrent.com, vvisaev@gmail.com,
 0860734llx@gmail.com, marcandre.lureau@redhat.com, rao232328@gmail.com,
 vsementsov@yandex-team.ru, joel@jms.id.au, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, cp0613@linux.alibaba.com,
 xiangwencheng@lanxincomputing.com,
 frederic.petrot@univ-grenoble-alpes.fr, 	philmd@oss.qualcomm.com,
 visitorckw@gmail.com, wangyang25@otcaix.iscas.ac.cn, luoyonggang@gmail.com
Date: Mon, 24 Aug 2026 10:44:31 +1000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (by Flathub.org) 
MIME-Version: 1.0
Received-SPF: pass client-ip=202.12.124.141;
 envelope-from=alistair@alistair23.me; helo=flow-b6-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

Hey everyone,

This is an email going out to:
 - the QEMU RISC-V list
 - the QEMU RISC-V Maintainers
 - the last 40 people to submit patches to the QEMU RISC-V list.

I just wanted to remind everyone that AI generated code and AI
generated commit messages are not allowed in QEMU.

The current QEMU policy states:

"""
Current QEMU project policy is to DECLINE any contributions which are
believed to include or derive from AI generated content. This includes
ChatGPT, Claude, Copilot, Llama and similar tools.
"""

You can see the entire policy here:
https://www.qemu.org/docs/master/devel/code-provenance.html#use-of-ai-gener=
ated-content

Just make sure you keep that in mind when working on QEMU code.

Alistair

