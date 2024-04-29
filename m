Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7763BC4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 14:49:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1SJX-0004R0-TB; Mon, 29 Apr 2024 10:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dchrist@rptu.de>) id 1s1Rb9-0002Mq-D0
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 10:03:15 -0400
Received: from mailgw1.uni-kl.de ([2001:638:208:120::220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dchrist@rptu.de>) id 1s1Rb6-0005c0-49
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 10:03:15 -0400
Received: from uni-kl.de (mail.uni-kl.de [131.246.120.212])
 by mailgw1.uni-kl.de (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id
 43TE3HMq112976
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 29 Apr 2024 16:03:17 +0200
Received: from [185.134.130.125] (account dchrist@rptu.de)
 by rptu.de (CommuniGate Pro XIMSS 6.3.11)
 with HTTPU id 278650002 for qemu-riscv@nongnu.org;
 Mon, 29 Apr 2024 16:02:59 +0200
X-Mailer: Samoware HTML5 6.3.6509139
Subject: RISC-V Floating Point Extension
MIME-Version: 1.0
From: "Derek Christ" <dchrist@rptu.de>
To: qemu-riscv@nongnu.org
Date: Mon, 29 Apr 2024 16:02:59 +0200
Message-ID: <ximss-278650015@mail1.uni-kl.de>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:638:208:120::220;
 envelope-from=dchrist@rptu.de; helo=mailgw1.uni-kl.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Apr 2024 10:49:04 -0400
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

Hello,

I'm currently trying to run a RISC-V bare-metal kernel on QEMU that uses the 
floating point extension F.
It seems like this extension, besides D, is enabled automatically in QEMU. 
In fact, the floating point registers can be examined successfully using 
GDB.
However, when the first floating point instruction is reached in the program 
execution (in this case flw), an illegal instruction trap is raised. The 
kernel itself is compiled using these flags: -march=rv32imaf -mabi=ilp32f
Is there something I am missing? Perhaps, the FPU needs to be enabled in 
some way?

Thanks for your help!

Best
Derek

