Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CC7EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBKyp-0005MM-Vw; Mon, 19 Jun 2023 15:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qBKyp-0005M9-59
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 15:56:03 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qBKym-00009I-0m
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 15:56:02 -0400
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-4f867700f36so2935975e87.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 12:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1687204551; x=1689796551;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Y/QFg65RpGTyfTu8dm0MuAGrlhx6RjLEM2hkZVGqrm4=;
 b=DYiIUEph+/RIcToCSjd6p8oBXwd1aBeL9UtvqH0pHl0/Itvh3BEOGPUsozqv1SEVBX
 zXPhSN2bgEl/w4g5YF/wdtrz2q2TauVUdooxvimc+7SWmUEHpfNbYYitKcEfxbhLVrhn
 T43tciuS65yTkK65umt/RkkgEcZO6Ftm5cYrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687204551; x=1689796551;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/QFg65RpGTyfTu8dm0MuAGrlhx6RjLEM2hkZVGqrm4=;
 b=CqnnGGoqOaY9y2e8XYN+hH8zEbmSfAoqoRjycnpbHCNzDsRDSj9mSY9TiyCT47mFmQ
 an1N5MPSnV3zE/hxsjCtWb4BIE5FhgsanNh5G4M70Zy843l3nT5QrYzbUmMmocVSRxwu
 988O4E2V80+RLz2whgUM+ccaPj7QWrPDf1MDrOj1s/SdjGDfKXL+ToXPcirx/GII197S
 9y4jKjJxorQNL/XHhEUnOpQRCpvRQFrlJbTwFsxj3YempOfj49S15+TngFv0LHwEW8Iz
 K7V0WXtpQWYeyv1rqYnQXTN8DtqQFbfc0X77gP2gxg1d8wKvfePslXKRWqZFbpHtpUQs
 rG5w==
X-Gm-Message-State: AC+VfDwR8xseXmwtwAW5/HSESUKvHbIpQ817acUPcFX57iuySGo1mLQI
 Um4ULE6vx5wVzoU9b6uJhCeiNENDLJTEuaxIRk50
X-Google-Smtp-Source: ACHHUZ69oBOCqKXI5GLDQUg4xZzhi6Avhk6e8F/zI4CFOhx48HK8SL7dXBiqtQbJiB+GyRCHphe/9K31ovX+Mw2Jq8o=
X-Received: by 2002:a2e:98d6:0:b0:2af:3141:a52b with SMTP id
 s22-20020a2e98d6000000b002af3141a52bmr6808924ljj.22.1687204550895; Mon, 19
 Jun 2023 12:55:50 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Jun 2023 12:55:39 -0700
Message-ID: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
Subject: CFP open for RISC-V MC at Linux Plumbers Conference 2023
To: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>
Cc: OpenSBI <opensbi@lists.infradead.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x142.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The CFP for topic proposals for the RISC-V micro conference[1] 2023 is open now.
Please submit your proposal before it's too late!

The Linux plumbers event will be both in person and remote
(hybrid)virtual this year. More details can be found here [2].

We will start accepting proposals after 15th August 2023 to avoid last
minute visa/travel hassles.
The conference registration sells out pretty quickly too. Thus, we
would prefer to sort out the schedule sooner than later.

The final deadline is 15th October 2023 though.

[1] https://lpc.events/event/16/contributions/1148/
[2] https://lpc.events/

-- 
Regards,
Atish

