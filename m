Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC2FC02194
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 15:51:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tg49o-0001Fi-6W; Thu, 06 Feb 2025 10:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg49m-0001Ek-4C
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:51:10 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg49k-0005fI-EO
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:51:09 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e5b107c4346so857324276.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 07:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738857066; x=1739461866; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASDW0A2tZEwrvkv7i8MRxtiQwCq0H8EN+WLjmcNfDFM=;
 b=VLa4q/JigSAPLjAtP6BBtS6K8fal+6B/n9MTeOK2V/o4RlNdfSANP0IzkTi9OZQajN
 96D4JfuxtlNxeZ+vDKE0h5Q1571M0G/WXPCFVk2yBlOXkDT7dsgB8LXP7keJHPfSqRSh
 9PURKvDKqz+3hS5OKy6jxOzQLRl73ac4CaS6sylrm/BwWKhflVxSiIDfPWKsRoMjtyCd
 NY6UkRScvi4D1sGBA2KI6Hi6rSjloyQAxJP5+UckjjVSGn1Fsnt6XWM+5Mb29Q38JNSs
 d/q5LOu/oA5/zWjn4L7WUsARe9q6HLgUD2BWJZro5/96aJZBRnzb7mJtGXAziEo+hnQG
 B80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738857066; x=1739461866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ASDW0A2tZEwrvkv7i8MRxtiQwCq0H8EN+WLjmcNfDFM=;
 b=A5cYalIaLx6nMo6NhecKM9NXWbxfPb967jsOrBg6jH7zyXuk3Ud2vO24kkVwQbLzVM
 rWxz5ZWpigduW3fOmHG0UZjgEVRBuVFeCZHq3jD/ZOvHXVhn/SPIBh04Rxh5JiFJwsRj
 bmCb/hX7FlhMXBiopAdzngXJyVXs9F9XaKX0hkwydAO5JUtJQyE0KmSujbFlVgrjWTsy
 BLVq9eAmHxWa184V1RAq5Y6KE5WfwD2h07spMLdYIxescsxjO995UfEHYvJFzpkk34nm
 21NnJugWttWtECREbi8WUSwdMUUy0OI1mrWK8U+P/Q7yy5Jcq1Yf7Usel8lnJiau0Chl
 V2aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjwG9WHlqFZd2aktNzsgmFmfQTBLZ68JqR0jL67ChTBS/GGiZ0VnG+uwQzwgn2Bu3MXsuCgbhq8nF1@nongnu.org
X-Gm-Message-State: AOJu0Yzti7JgZm56yB6TpG2/d5X5hS2lZwOj8z7wamH3N2WXn2RTRPB3
 xIEU5z800SAeLxYMAMq5BiggDEkErWTEDtAWnTM5aE/EDFvzK9j9BpdN4k8Ku373tgz7cdN63IU
 Fhh7xbG6bQWxT/KfSA7C6HmNsxqT1X/tc/sxq1A==
X-Gm-Gg: ASbGncvPcKHQdBgV8j66CL1f18vnvyoXIbs54aVg+kYbGozQMEH3iu7B5gPAR16zgek
 6/Lk4Z7Dvq4cysvnrGUk/lpIn2/t9sOAVECcE+RN2l/u1UbdldTx5RcWU6nZTcdyrkaToatwJ1w
 ==
X-Google-Smtp-Source: AGHT+IEVply1qiNn7znAT8fQMFvgeU86wRbWjC73n9GgoJ6MafGCxRH+1m00cw4BFE1qriSGZOIZY/VTW8vN2rZ7ZSM=
X-Received: by 2002:a05:6902:2210:b0:e5b:1746:7fa3 with SMTP id
 3f1490d57ef6-e5b25bc6f9amr5963299276.23.1738857066557; Thu, 06 Feb 2025
 07:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
 <20250203144048.2131117-5-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:50:55 +0000
X-Gm-Features: AWEUYZmb9iLML0ZpPW3OB0h1I8Pz0Rcl4bMdig2uKDsyMoFyCdpxYC5JLddP9OM
Message-ID: <CAFEAcA-SRrdyeBExuCruVd-CuDdosyQKG98stELvkV-EM9q-Tw@mail.gmail.com>
Subject: Re: [PATCH 04/18] tests/qtest: simplify qtest_process_inbuf
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, 
 qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 3 Feb 2025 at 14:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Don't both creating a GString to temporarily hold our qtest command.
> Instead do a simpler g_strndup and use autofree to clean up
> afterwards.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

