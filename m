Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D9CC4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 07:02:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1hVC-0006uv-Qz; Tue, 30 Apr 2024 03:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dchrist@rptu.de>) id 1s1hV9-0006uc-JD
 for qemu-riscv@nongnu.org; Tue, 30 Apr 2024 03:02:08 -0400
Received: from mailgw1.uni-kl.de ([2001:638:208:120::220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dchrist@rptu.de>) id 1s1hV7-0006Zb-Af
 for qemu-riscv@nongnu.org; Tue, 30 Apr 2024 03:02:07 -0400
Received: from dummy.faircode.eu (ip-185-134-130-125.ask4internet.com
 [185.134.130.125] (may be forged)) (authenticated bits=0)
 by mailgw1.uni-kl.de (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id
 43U72CPJ193288
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 30 Apr 2024 09:02:19 +0200
Date: Tue, 30 Apr 2024 09:01:54 +0200 (GMT+02:00)
From: Derek Christ <dchrist@rptu.de>
To: qemu-riscv@nongnu.org
Message-ID: <700484fd-54d7-470b-bd1d-23b0502e3814@rptu.de>
In-Reply-To: <mhng-c7940df3-4bfa-44cc-b0b4-14c365ed56a9@palmer-ri-x1c9a>
References: <mhng-c7940df3-4bfa-44cc-b0b4-14c365ed56a9@palmer-ri-x1c9a>
Subject: Re: RISC-V Floating Point Extension
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3_257368240.1714460514105"
X-Correlation-ID: <700484fd-54d7-470b-bd1d-23b0502e3814@rptu.de>
Received-SPF: pass client-ip=2001:638:208:120::220;
 envelope-from=dchrist@rptu.de; helo=mailgw1.uni-kl.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
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

------=_Part_3_257368240.1714460514105
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks, that was it!

------=_Part_3_257368240.1714460514105
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
 <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 </head>
 <body>
  <span dir="ltr" style="margin-top:0; margin-bottom:0;">Thanks, that was it!</span>
  <br>
 </body>
</html>
------=_Part_3_257368240.1714460514105--

