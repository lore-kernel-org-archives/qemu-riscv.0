Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EFFC0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 16:02:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUUay-0006zF-KD; Fri, 11 Aug 2023 12:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qUUax-0006wv-8n
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 12:02:35 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qUUav-0008Ny-QF
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 12:02:35 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1bed90ee8b7so1654801fac.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691769751; x=1692374551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bELTQOSRFedgf0WtUQI+fgm52Htgwg6Mv8iNQNz6RfI=;
 b=M1caMnAQpLmuJaTxG1EA+Foh+o+eH9kR51jDR6tWyWcNGUXlL4CtMDh4axyBPx3sgS
 VYsN20+6wTn1hyDcEvliL9LG9bF5KyqGzyMAIijai+BCbg1vmQkcIIwZN3JbnF7fUsA3
 YH/95DuhzI68cWFWvjicAySsoUyJHdi8dtuGMW5Y+nW132JRyiluwZO6Y4we0TMj4ZXr
 qYNHV1aJWtC0jycfzL4JSz8E0voQWmsRmanYRwiZZZY8EKgN3sH+ZTcI3fGBdc0rzMaZ
 txxK/MDk6jkfuuN6XpgAmlSla92RzBkl7KYsbWJhhL8I8uBOwhzRevcGJ6Rdwcbb9hQx
 Zt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691769751; x=1692374551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bELTQOSRFedgf0WtUQI+fgm52Htgwg6Mv8iNQNz6RfI=;
 b=Nc9Sttovx2T57yNjayd0Lhm2EoTXExGXipqoNZcrgVj1xFXHEDAdJD05TGDsVawZEt
 pI4HksStUN6P5NwgwMrlW/CWJuBTbfWnxyf/5KOHgoY43H9syqXTcIdAw9ilVuJg1ZNE
 ozj7mKQGnOXxnF9O4/AJAjk3iIisysjcuplUD53WLp3YBE6FtDdhYWt7p4sBL4zkaWME
 ldY03A51Ax7UCHkO1MyKZ5C5Wa3YUkEUVUVlS8qe5pWht+7CaMVQg8cSD6F5y1mHDTW6
 FBhpT/6/Mgnass0ZK2T7Qnrv3AeyOrCSWBwGcPOWlw8Lli5DiXAog2pYDkYhZTqzcFoZ
 0V2w==
X-Gm-Message-State: AOJu0YxJ9pEitOyd/SuTqBjNnt+pXE5gZP5NyMCiwDRq4KNZbbnz8iS4
 19P+0GZQhDJY8KeZT0pjEgyLVw==
X-Google-Smtp-Source: AGHT+IHCyfQHJIUnv7/cTVq22qo3i7Y6d20AZLqQdioAVvjUF0pIoelD4hc+P0+k54tStthOGPxP2Q==
X-Received: by 2002:a05:6808:11c2:b0:3a5:a884:eceb with SMTP id
 p2-20020a05680811c200b003a5a884ecebmr2516187oiv.57.1691769751413; 
 Fri, 11 Aug 2023 09:02:31 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 bj32-20020a05680819a000b003a43759b9cdsm1834823oib.29.2023.08.11.09.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 09:02:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 0/1] hw/riscv/virt.c: fix 'aclint' prop regression
Date: Fri, 11 Aug 2023 13:02:23 -0300
Message-ID: <20230811160224.440697-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Richard, Alistair,

I came across this gitlab bug earlier today. The bug itself was opened
yesterday:

https://gitlab.com/qemu-project/qemu/-/issues/1823

And turns out that this is a regression in the 'aclint' option that was
introduced in 8.1.

I'm aware that we're already in rc3 and kind of late, but even so I
marked this patch as 8.1 to let you decide whether it's worth spinning
rc4 or not.

Daniel Henrique Barboza (1):
  hw/riscv/virt.c: change 'aclint' TCG check

 hw/riscv/virt.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.41.0


