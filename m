Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47944C27C4F
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 16:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJc76-0006Nu-Po; Tue, 18 Jun 2024 12:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sJc75-0006Nd-Ls
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2024 12:55:19 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sJc73-0007gA-Eq
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2024 12:55:19 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-633629c3471so34220907b3.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jun 2024 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718729716; x=1719334516;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tl/Mj8rNH3nOY3YJIxVCHEsntKc7JBaLQligg3wy17Q=;
 b=VLec/1viZ+UOgxa19SC9CU/4E5zPIj+WuUqp3mWbN94RLFIvM9/bL+rLiNHb7NNLtF
 iA3LIBGtfX5HvQOG67kVCV7TaE5TJMbMMYas2L1y3SIaykIWmeJ4DT2PFG343vksJgqJ
 7rnice9cQD/lyBkCvdmk/WuIht7Q7eOTlZF22JVZEHpucRTfT9E8Nkm3lvdiYoVtjC7P
 F4EynXW1V7L18zl0pQ0LWwdotQx/4U0BWzcm6diYef90Hrmu/5fjA6zW6X5KAvwg0lbF
 WH2xE1X8L8CNSy/bC2CYRZS1QaovPBM8BCSE/RLTl7hLR1NBLzTvBXK17mlcWvu1uE+4
 18dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718729716; x=1719334516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tl/Mj8rNH3nOY3YJIxVCHEsntKc7JBaLQligg3wy17Q=;
 b=nSWyrDm+60WJV5vIkU/gGuBWrcp9ee6mUcwekOzl/KVd/+zqiLttR/40cLqS8/OEly
 dGEz77sVJSQbIN1mX3mc9iwN9Rc3LyVviH3QPONlIiD+C+hehwVhsrECrLEf+DGpHBCs
 JaU/DbdoYkOzcYs9qb+5Fs+bvygM3kWE00wPCuQpDczX0oNYaJphBW+FMvbBgYKYHMcR
 3Jd/YYNNP33a/1tB6YOAWJvFkAJfPQ3QI4Ix80phComyVnDVJixM+dfZM5CM9E+PaSeh
 d+edXcjSJJF0smy72rS3pS7tUaqQ590+mnCPMF3LFrIqHEtbG0qJJqju84MMJKrg8iMA
 PMmA==
X-Gm-Message-State: AOJu0YzF3KeEh5Afoop41GH1kjFazjTVMvW85pMQ5yN0AQsMiP3xl3zv
 BlIWBm/TZRLNEy1adimCfaXb6OA2DoArDseZt967sPhEZKpdqt+icHtmkM+4yztenV5uwLqUZXA
 v7QUMgI10bzavvgjtK+KUg7IDfZ3NrJtXtE1sgw==
X-Google-Smtp-Source: AGHT+IGVlRcsBnlClfQmXQALRw7/UvJ5xHs8u9HjNKMPDlRG3L8AiUYxHWwl8Ou/Ouk2mP1rak2UDVQKYhNK4R3ktSE=
X-Received: by 2002:a81:ae07:0:b0:628:c1f0:d8fd with SMTP id
 00721157ae682-63a903a43aemr3000147b3.52.1718729715799; Tue, 18 Jun 2024
 09:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
In-Reply-To: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 18 Jun 2024 09:55:00 -0700
Message-ID: <CAKC1njTWK0ceAagMErA0Pmnfc0WTeQrZsX=yz_cuWC=UQKdnjg@mail.gmail.com>
Subject: Re: Is there a way to check values of registers before and after
 running a program on qemu-system-risc64v?
To: Shobhit <shobhit32t@gmail.com>
Cc: qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=debug@rivosinc.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 18, 2024 at 9:50=E2=80=AFAM Shobhit <shobhit32t@gmail.com> wrot=
e:
>
> I am trying to run a very basic RISC V assembly program on qemu-system-ri=
scv64, is there a way to check/monitor the value of some particular registe=
rs before and after loading the program? I have tried passing -monitor stdi=
o flag to qemu-system-risc64v, but it doesn't give me the values of registe=
rs.

Try `-d cpu` option

-Deepak

