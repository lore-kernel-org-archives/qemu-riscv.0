Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E56C5DF9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:47:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSww-0001IH-Qf; Thu, 27 Aug 2026 01:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSwt-0001Hb-UX
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:46:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSws-0005PC-Gm
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:46:51 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c9aea40d799so1090295a12.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787809609; cv=none;
 d=google.com; s=arc-20260327;
 b=Or1SD5RbiurkJeffi0Py24aXBl7SSrw+z7B32IMepe4TSW8EJV8ht+sp5uh2DTYRWH
 lIPI/1ABWyuVHKA5ICdwB9apYj6I9/d5/kdm5cJCgqhCIIRLgOlFRP3z751utigUuvpY
 6MfkvVKu+el0dxv3MOMIvWeLUbx+/0UBQslvG76m70g55aiDAeefmJXXrC2744Wh+a+W
 m8qXsh2zEjN+m2ZzXOZyXohK9qQuEpdOT9tKc3eRtcwm8PEIrfXBogCQqvJZkFK8AaEl
 1mCACAFtQh/LzzX4QjmMTtB1yS3/QZj0XWNpRQjKqQXOna2z4pPWBJB0zISCriryEy2c
 FBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1dOySquZnaRcu2Tc4GwfYHtKNDq9HC6ufjQdTdUApGI=;
 fh=h8WlnXKTnE66DFQD3jycEWHWRj6OgPauvL1rEBJ/Dkc=;
 b=Ec1ubdUg+cGyixkT7JFwLGJLyxE67pnQWLNM+jatec0L+hCXYDWDCf3hJ1m0DZ7krs
 6V2cB15vq9leDd9HE5J/IjeOXSUoeFrQuPaIwSR2ziw0PXT+DgY4+Qa3bUTqaXDCYcYG
 s4erLcFMDx9qiRjfDK16PsHQhn4x88TPJScO7D2E3vRPNTXK9eM3SIBjtKyM3o3druCQ
 tttZllveqmWDl2PVyzaeqhJROKfljj9mHRBl7HbDfSz0N12KoCnRekL0GSibe90B2YvA
 K1mjmRmHHsF/xUmgZun0jVdR1HCSmxd7vhMAYyehQypET8DYFPaPKHMhxmi0jp44zqYR
 Z8Mg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787809609; x=1788414409; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1dOySquZnaRcu2Tc4GwfYHtKNDq9HC6ufjQdTdUApGI=;
 b=QDACbv3SCRqdTpKmfvcTLCFju0qPwKEje8RrRIqaxOQd+Xb92KnMNxbOh5BrrBvs8c
 VOSKOKg68PY/42uJ+/KEVRyHRJHR3UMngkLnGO0+OJ+vwsMohfhZkNGblcJIC3VKWcdm
 W4gY2xj2gUFNR2B7hW00A2b/lARXO5Q/p3uZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787809609; x=1788414409;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1dOySquZnaRcu2Tc4GwfYHtKNDq9HC6ufjQdTdUApGI=;
 b=mNkfuyMv5uNdcI4IgkXADEz1TAwddaeq4ppI2ztkoiCdJM2XEIUFMlfiyeCTtg+qUB
 ygAFaNEaPiDbf4b9a2rEKGBu9KP1NfBovjdDXYmHcI+XTFkQIEQaQTgYPKhqoW5AzjDT
 8TKYJGBIbfx5KPX/JExnX/GUfW3jK/kgiYFsqmJnIrlAyiYMmonN7QC12ruh0BpocOyw
 uMz1MQH7ReD0XJLIJHWxfTwNT1CmMRrheMr9ptCcl9Pw5jIER6p6gpyNS1vgQ+q8U4SN
 rsRNyHLh4YeqjORUQFwvTrkj3IMaGkNybdvtTeto4zBROUge0BeD2BUnZ66+ub1bUXbD
 n6gA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWNeo93BD1GX/POlbAyLMMQSQMoGLkhbYDDK2taXJXGTI8x5q+szKq6LdvQvyk+c1Mxm9/WCb743Ye@nongnu.org
X-Gm-Message-State: AFuF++nb3sKpOeZBSWXPKw0d52HqFroTpyLqctLMWcMI5M7R7MHQYngD
 ZKjD1v3guIRHOQmFZRtyvhWAzoz6rhNCL6aAo2s/9TpLrT01emyMgrV9JJJ/lJCTd5YeBJrryYh
 OfoYd56v8NBfhKR6iCjS/mD6slwyxuMs=
X-Gm-Gg: AR+sD13u73BlNA9+UKa1/lXSXYegS3nIBOrGGUiXCrNb7UkhMkQ4K3ZlugPmhzvTzaU
 mP13I62yo2EIQTYZrk8W3w7xJbVTiO82Q3ycfZraLBi05D8kRJ3CG7nHpuovpips5BQjHiSbDZ7
 F+QQwaEQN50ugYBTsGe3DW95UBByRqd6SasB0Nutj4d7Vo4FL18ZNJK7BL+eOhlRDXK7VhLg4Ct
 ohi75EVfnKsRdVrZSl3G+R3KgNDICQhHqQsTbdrP9XcNirkYXMsE/RpzamBxJdixm5+qEGWn7SQ
 GejCD93MrFpj7lUZXv1vly9LEiALHCrsD3rR0EKMfTg44CHYDNnE+9IfqpH8dZFiarulaLFdOX7
 YjRWmxEnVkWryX7pm3LWmXePMgWvMEIx+ePi6wvIZWuYuN/6mxwi7UZyVUDz/UeHpXCqFhsDwch
 N2d351kJvoJSFtjInJ
X-Received: by 2002:a05:6a20:430b:b0:3c3:6928:8b25 with SMTP id
 adf61e73a8af0-3cf84e51a6fmr20427296637.17.1787809608982; Wed, 26 Aug 2026
 22:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
 <20260826214643.122728-4-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260826214643.122728-4-daniel.barboza@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Aug 2026 15:16:34 +0930
X-Gm-Features: AcwNN1XXt83t0JB989tICpdk_xnw3R7q5OlnnK_r3HRhx3Dvq9_JNHwYGsWNaVo
Message-ID: <CACPK8Xf44J9SYKc+fXbr5P1S5AgTHzBxsD7pj+VXgmwYXiM=Bw@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_syscon()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 27 Aug 2026 at 07:16, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The soon to be added riscv-server-ref board will declare a syscon FDT
> similar to what the 'virt' board already does.
>
> It won't have a 'sifive,test0' and 'sifive,test1' compat string though,
> hence we'll add a flag to enable/disable these additional properties.

Is there a good reason to retain the test0 and test1 compatibles?
Seems like a good time to clean them up.

