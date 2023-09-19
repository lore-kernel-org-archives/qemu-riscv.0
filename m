Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A457CD5BBC
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 13:24:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiai5-0003Uk-8Z; Tue, 19 Sep 2023 09:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qiai2-0003Ub-Hw
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 09:24:12 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qiahy-0004AD-B0
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 09:24:08 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-578b4981526so548628a12.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Sep 2023 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multicorewareinc-com.20230601.gappssmtp.com; s=20230601; t=1695129842;
 x=1695734642; darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zIv8Yg/F5hjw8krJLnsfOQqxfRDGAl+gJ5kdeo0J0VY=;
 b=FvHzAJCIjjtzLO7ikXRrHyLFsvD3RXt8ItKX0MyuIJrzrDldoiFqVFOZLoLGWk2heZ
 fKAJCeAaDKt/PGDh95roQZnNpGKUW7tmgwFgG4/RFyEYNDTD/1rD9zcWBReWS7EfHtQo
 YIZKBvmzfyueyDpvQpG1gyroAGF6vYiLMzsBjXL2j5+T7cPUDC98YQNqc8N/Bf0nEVWq
 IOnuG/QGuOTuPVXAD/72WvWqjCjAKZ1/bGuTRa+UHId4Fv4A4i8cK2Hb2n90PY/2F+L4
 Yo/gyIHlP04tGXHpeYob9yBgBqlVjYKVXK8ZNu1yiso2MhZLDPhAEdOaRdAgFG4xc7YV
 ufdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695129842; x=1695734642;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zIv8Yg/F5hjw8krJLnsfOQqxfRDGAl+gJ5kdeo0J0VY=;
 b=xPi0ph8BkxkAD53oRZlMuzlffHR3FVJqGjVu/3vv/iMt/bfHzqIjy4XrPbxxGc0JN5
 /SQJa0hh4JnJxvB7kgZHMPbt3AMIXt9Hs/rdagmM/Tb88CWIbtLrPNh+RD2WHRQGALqK
 jR9boT6zl7QjXiXQx31HoMvTiGMqbRsKipyy7ovndpF2Gi4Sff0QhyaSguVrGr+nm/7/
 WsTYQh1yBpZMCghtp3TzzoD6Jnj/9AoP71iDLpWLzTnrGrHUqQwawoG/H4plrMtkmrvB
 gPNhQPaIooLKD4SYzxPy4d+MaMPJY1NZS1xwjm9Oh6nv288OBZ/wybtCWy5pbSW80cuB
 qNeg==
X-Gm-Message-State: AOJu0YzMv0FfxaP1l28zPxnk2lex97AMeipkg8tKEqQCelRpckqT4E56
 uUz0OBMXNnG65QkyY8lgmDo6kRKUYjSCvOXWVajLYg==
X-Google-Smtp-Source: AGHT+IFKteCc/mQdTfUWX1ZrSw22ohiTMB8yxEynswW7heBXchu9sdBBv9NSHjjrOQCmHlS6NEB2PK1OwMQ4slXvRR8=
X-Received: by 2002:a17:90b:3142:b0:274:7b6a:4358 with SMTP id
 ip2-20020a17090b314200b002747b6a4358mr9189503pjb.6.1695129842606; Tue, 19 Sep
 2023 06:24:02 -0700 (PDT)
MIME-Version: 1.0
From: Sivachandran S <siva63@multicorewareinc.com>
Date: Tue, 19 Sep 2023 18:53:51 +0530
Message-ID: <CAL==hzHC2hA_m38NNpALjOdpFsEqpDp6Za0Rmw52ZW+aYTSOOA@mail.gmail.com>
Subject: GPIO emulation in QEMU RISCV
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org
Cc: Deepak LS <deepak34@multicorewareinc.com>, 
 Pandian Ayyar Karuppaswamy <pandian.ayyar@multicorewareinc.com>, 
 Balaji Viswanathan <v.balaji@multicorewareinc.com>
Content-Type: multipart/alternative; boundary="0000000000001dfa060605b62cf2"
Received-SPF: softfail client-ip=2607:f8b0:4864:20::532;
 envelope-from=siva63@multicorewareinc.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

--0000000000001dfa060605b62cf2
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

We are working to generate device interrupts via GPIO.But the problem here
is by default the QEMU doesn't have any GPIO device emulated. (QEMU 8.0.0)

1. How to emulate the VIRT GPIO device or any other GPIO device in QEMU?
The device models listed in QEMU don't have any of the GPIO devices listed.
Any idea how to enable any of the GPIO device emulation in QEMU RISCV?
2. Also whether a software patch is required for the QEMU to enable it? If
so, please point to it.

Thanks,
SIva.S

--0000000000001dfa060605b62cf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Daniel,</div><div><br></div>We are working to gene=
rate device interrupts via GPIO.But the problem here is by default the QEMU=
 doesn&#39;t have any GPIO device emulated. (QEMU 8.0.0)<br><div><br></div>=
<div><div>1. How to emulate the VIRT GPIO device or any other GPIO device i=
n QEMU? The device models listed in QEMU don&#39;t have any of the GPIO=C2=
=A0devices listed. Any idea how to enable any of the GPIO device emulation =
in QEMU RISCV?</div><div>2. Also whether a software patch is required for t=
he QEMU to enable it? If so, please point to it.<br></div></div><div><br></=
div><div>Thanks,</div><div>SIva.S</div></div>

--0000000000001dfa060605b62cf2--

