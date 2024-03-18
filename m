Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A66DC54E58
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 05:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rm5Va-0003D6-At; Mon, 18 Mar 2024 01:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rm5VC-00038P-Qk
 for qemu-riscv@nongnu.org; Mon, 18 Mar 2024 01:25:40 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rm5VB-0002id-AU
 for qemu-riscv@nongnu.org; Mon, 18 Mar 2024 01:25:38 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1dca3951ad9so25620765ad.3
 for <qemu-riscv@nongnu.org>; Sun, 17 Mar 2024 22:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710739535; x=1711344335; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VbVdj6D/b4iE8YW38lmRZRkiSX17/mQ8glm3MWlFbbM=;
 b=YZGUoGjDv2/GGYYikrBx6BS0m3yL+i177sMNvR0TLP0vMnyGjUxZqvE77/0yoy1GXr
 kp1yarlXXkklikShpMlvlgFbt3N2IXj01CoKTLtBfv212ShnPEXf2VTBLjoDZ+M0m71x
 Wef9VmZtvX2KVvlk2K4178EB+qa9qV8wz9/4y6JaerMHzuhg35dg0/dnwIDdlIC9D/Sl
 2jvVOudEqJopNxV4L8FHZbAceM6DiF5kD05dZEZJsk3fi0BNUmmS4Yx7O7GAz2Gk+sGZ
 0jBPjj0iHstkueAbZnrfOvYuF9MVi2LcJie3f0cpxjylmeXPxDnkNDENikc6MeCicLwJ
 naKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710739535; x=1711344335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VbVdj6D/b4iE8YW38lmRZRkiSX17/mQ8glm3MWlFbbM=;
 b=YJ7UR5A92JBWSTMLGs/Ttgnva5HnMHPBTM/eEKT7+k7UePMIM1FBEV3s+hjd0n2fRE
 CHXmBi2cqsX5a2B7fmDjgt571DOD1cCvi8HpsNqmaC6dXemgKA5q5m42oOHFbz2SNOZ1
 1dmO8Uojm3cS1r+tlUE4E0DtOhGyJNAzIxhouJorpJH3REDbN69u+TNh9Wj0RAn66id/
 SBPb806tgveFdZ8ecF2PTg0qF2NjGnJa06Mvxtbn7xJDBFacmL2meF7jtDewnH7moG5j
 HPpWlS5hq5ZIbvi8WvIkuJwfC9LlN0fazSwQbG0DcJiZqbfApS1zCQv9+FRd4gq1lmpT
 4FrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUjI1reeCIM0Ep2GBgplKotfEEUlwd6hm7lQ3rgRAZpCh5mGOpr0JeqOMx1mLzRaejg4Iu1tFZ9tVFPqDo8qC4HaGI7kg=
X-Gm-Message-State: AOJu0YzSte3/waup2kOJVRu50MMSbTcXlkutmul7UGpTUJhHChIOytbo
 kdW8mo+yc3U0lAv71lgXA4iR4wZqlZI3PPEURN7a1nQsE/6y5BqsxAf1V6n3ONs=
X-Google-Smtp-Source: AGHT+IHDQFug/yzUjvZl7Hs1NDJvFGIo9EfOEzYePvcYOZd0fyO6UtTgo1GL6S9ZpxjDttHNghKCsw==
X-Received: by 2002:a17:903:1249:b0:1dd:cef5:2b27 with SMTP id
 u9-20020a170903124900b001ddcef52b27mr14516341plh.1.1710739535050; 
 Sun, 17 Mar 2024 22:25:35 -0700 (PDT)
Received: from sunil-laptop ([106.51.185.90]) by smtp.gmail.com with ESMTPSA id
 n2-20020a170902e54200b001dd67d69848sm1913454plf.82.2024.03.17.22.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 22:25:34 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:55:26 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH 03/12] uefi-test-tools: Add support for python based
 build script
Message-ID: <ZffQRvmha4iUEsmO@sunil-laptop>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
 <a425xsrezixamz7zo6cswvgawvv3swkfem73dod5ummkpol27i@orq5xdpzond7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a425xsrezixamz7zo6cswvgawvv3swkfem73dod5ummkpol27i@orq5xdpzond7>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x633.google.com
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

On Fri, Mar 15, 2024 at 03:17:19PM +0100, Gerd Hoffmann wrote:
> > +Build/bios-tables-test.%.efi:
> > +	$(PYTHON) ../../roms/edk2-build.py --config uefi-test-build.config
> 
> Adding '--match $*' will build one arch instead of all.
> 
Thanks Gerd. Good suggestion. Let me update in next revision.

Thanks,
Sunil

